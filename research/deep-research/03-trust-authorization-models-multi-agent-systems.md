# Trust & Authorization Models for Multi-Agent AI Systems

## Executive Summary

Multi-agent AI systems face a structural trust problem that differs categorically from traditional software security: agents inherit, delegate, and sometimes self-modify permissions in ways that no classical IAM model anticipated. This report examines five concrete implementations — OpenClaw's exec-approval and permission manifest system, Claude Code's PreToolUse hook pipeline, Hermes Agent's skill model, the AAIF Agentgateway, and Google A2A v0.3 security cards — and maps them against the core escalation vectors they are designed to prevent. The findings reveal a spectrum from ad-hoc in-process controls (OpenClaw, Hermes) to protocol-level signed contracts (A2A v0.3) and out-of-process policy enforcement (Agentgateway). A unifying conclusion: **authorization must be enforced by systems external to the agent, not by prompts or in-process code**, because the agent itself is the attack surface.[^1]

***

## 1. OpenClaw: Exec-Approvals and the Permission Manifest Problem

### The Advisory Landscape

OpenClaw's open-source AI agent platform accumulated a severe security record in a compressed timeframe. A GitHub CVE tracker documented 156 total advisories as of March 2026, with 28 published CVE numbers and 128 still awaiting assignment. A first-party security audit surfaced 512 total vulnerabilities, 8 of them critical. Among the named CVEs:[^2][^3]

- **CVE-2026-25253 (CVSS 8.8):** One-click remote code execution via WebSocket token hijacking and exfiltration, affecting all versions before 2026.1.29. Belgium's Centre for Cybersecurity issued a "Patch Immediately" advisory. Censys documented 21,639–42,000+ exposed public instances.[^4][^3][^5]
- **CVE-2026-27566 (CWE-78):** Allowlist bypass in the exec-approvals analysis module. The validation logic failed to unwrap `env` and shell-dispatch wrapper chains, allowing attackers to route execution through `env bash -c 'malicious payload'` past an allowlist permitting `env` but not direct shell access. Patched 2026.2.22 by adding `unwrapEnvInvocation()`, `basenameLower()`, and `isEnvAssignment()` functions.[^6]
- **CVE-2026-22172 (CVSS 9.9):** Critical authorization bypass via WebSocket handshake scope declaration. The server trusted client-declared scopes without server-side binding, letting any authenticated user self-elevate to admin. Patched 2026.3.12.[^7]

A supply-chain attack placed 341 malicious skills (credential theft, payload delivery, data exfiltration, privilege escalation) in the ClawHub marketplace. Meta banned OpenClaw from corporate devices; the project creator began transitioning it to OpenAI.[^3][^8][^4]

### Exec-Approval Architecture

OpenClaw's exec-approval system is a companion-app guardrail for allowing sandboxed agents to run commands on real hosts (gateway or node). It is described as a "safety interlock": **commands are allowed only when policy + allowlist + optional user approval all agree**. The system supports three security modes:[^9]

| Mode | Behavior |
|------|----------|
| `deny` | Block all host exec requests |
| `allowlist` | Allow only explicitly allowlisted commands |
| `full` | Allow everything (equivalent to elevated; skips approvals) |

The `ask` behavior is configurable to `on-miss`, `always`, or `never`, with `askFallback` defaulting to `deny` — meaning if the approval channel is unreachable, execution is blocked rather than permitted. Crucially, per-agent allowlists are isolated — approvals for agent "main" do not bleed into other agents. Unauthorized senders physically cannot issue `/exec` commands; the approval chain only processes requests from authorized senders.[^9]

`security=full` is a session-level convenience intended for authorized operators that bypasses approvals by design. The platform's security audit surface flags `tools.exec.security_full_configured` as a `warn/critical` condition. `autoAllowSkills` (trusting skill bins implicitly) is separately flagged as a warning.[^10]

The platform's documented threat model explicitly assumes a **personal assistant deployment with a single trusted operator boundary**. Shared gateways for mutually untrusted users are not a supported security boundary. This architectural constraint — invisible in default documentation — is the root cause of most of the observed escalation paths.[^11]

### Permission Manifest RFC (Proposed, Not Shipped)

RFC #10890 and Issue #12219 document OpenClaw's recognized gap: skills currently run with **full user privileges** — unrestricted `exec`, full filesystem, full network, no sandboxing. A top-ranked ClawHub skill was found to contain malware.[^12]

The community-proposed `skill.yaml` manifest format (reference implementation `@ellistevo/openclaw-secure`) would declare:

```yaml
permissions:
  network:
    allow: [api.openweathermap.org]
  filesystem:
    read: []
    write: []
    deny: [~/.ssh, ~/.gnupg]
  shell:
    allowed: false
  credentials:
    - OPENWEATHER_API_KEY
```

The reference npm package includes Ed25519 signing and verification, trust scoring with A–F grades, and attestation chains allowing auditors to cryptographically vouch for skills. **This proposal is not yet merged into OpenClaw core.** It would plug into `openclaw skills install` (show permission prompt), `openclaw skills audit` (display trust scores), and ClawHub (trust badges).[^13]

The gap between the RFC and the shipped product is itself a meaningful data point: even where the community has designed a correct permission model, deployment lag creates windows of unauthorized escalation.

***

## 2. Claude Code: PreToolUse Hook Pipeline

### Hook Lifecycle and the Blocking Gate

Claude Code exposes 12 lifecycle hook events. **PreToolUse is the only event that can block a pending tool call**. PostToolUse, Notification, Stop, and SubagentStop can observe but not intercept. The PermissionRequest event is a separate hook for dialogs.[^14][^15]

PreToolUse fires before any tool execution. A hook handler returns a JSON object with `permissionDecision: "allow" | "deny"` or exits 0 without JSON to pass through to the normal permission flow[^15]. MCP server tools appear as regular tools in tool events, so the same regex matchers and decision logic apply uniformly across native and MCP-sourced tools[^15].

A layered hook stack is the recommended pattern for write filtering:

```python
options = ClaudeAgentOptions(
    hooks={
        "PreToolUse": [
            HookMatcher(hooks=[rate_limiter]),
            HookMatcher(hooks=[authorization_check]),
            HookMatcher(hooks=[input_sanitizer]),
            HookMatcher(hooks=[audit_logger]),
        ]
    }
)
```

A `.env` file guard, for example, registers a `"Write|Edit"` matcher and returns `permissionDecision: "deny"` when the target path matches `*.env`[^16].

### The Silent Bypass Footgun

A significant and under-documented design hazard exists in the interaction between PreToolUse hooks and the native permission system. **Returning `permissionDecision: "allow"` as a default fallthrough completely replaces the native permission system** — the "Allow / Always allow / Deny" prompt is never shown for any tool call that passes the hook's checks.[^17]

A security hook pattern that says "block dangerous commands, let everything else reach the normal permission flow" actually produces "block dangerous commands, explicitly approve everything else, skipping the permission prompt entirely." This root cause was linked to multiple filed bugs in the Claude Code repository. The platform documentation as of early 2026 did not prominently warn about this behavior. The practical implication for a multi-agent orchestration system: any PreToolUse hook whose fallthrough path returns `"allow"` rather than omitting `decision` silently degrades from an audited gate to an implicit whitelist.[^17]

### Subagent Hook Integration

Claude Code's Agent handler type can spawn verification subagents with their own tool access during hook evaluation. This creates a recursive trust verification capability: before a write executes, a subagent can inspect the target file, check it against policy, and return a decision — all within the hook lifecycle before the write lands. This is the architectural pattern closest to an "out-of-process" policy decision point within the Claude Code model.[^14]

***

## 3. Hermes Agent: Skill Permission Model

### Architecture and Trust Posture

Hermes Agent (Nous Research) organizes its capability surface as a skill library of on-demand knowledge documents stored in `~/.hermes/skills/`. The system follows a **progressive disclosure** pattern: skills are shown or hidden based on toolset availability, not user identity or authorization level.[^18]

The visibility gating uses `fallback_for_toolsets`, `requires_toolsets`, `fallback_for_tools`, and `requires_tools` fields. These are **capability routing controls, not security controls**. When a web search toolset is unavailable, a DuckDuckGo fallback skill auto-activates — this is convenience logic, not access restriction.[^18]

The agent can create, update, and delete its own skills via the `skill_manage` tool, described as the agent's "procedural memory". External skill directories are read-only for discovery; writes always go to the local `~/.hermes/skills/` directory, which the local version wins on name collision. The skill library is human-readable, enabling human audit, modification, and deletion.[^19][^18]

### Key Permission Gap

Hermes Agent has **no formal permission manifest system** comparable to OpenClaw's RFC proposals or A2A's security scheme declarations. There is no declared permission boundary on what a skill can access: filesystem paths, network targets, or credential stores. The agent's self-modification capability (creating and improving its own skills) means a compromised or misled agent can encode new behavior into persistent storage without an explicit security gate.

A third-party implementation inspired by Hermes added human approval before commits are integrated into the permanent skill brain. This is not a native Hermes feature — it is a design pattern layered on top. For operational constitutions requiring typed trust boundaries, this gap means Hermes skills must be governed by an external policy layer (such as Agentgateway or a PreToolUse hook on the `skill_manage` tool) rather than relying on Hermes-internal controls.[^20]

The skill system is compatible with agentskills.io as an open portable standard, which enables cross-system portability but also means skills developed in other agents carry whatever permissions the originating system granted.[^21]

***

## 4. AAIF Agentgateway: Enterprise MCP Security (Linux Foundation)

### Provenance and Governance

Solo.io donated Agentgateway to the Linux Foundation in August 2025. In December 2025, the Linux Foundation announced the Agentic AI Foundation (AAIF), bringing MCP (Anthropic), Goose (Block), and Agents.md (OpenAI) under neutral open governance — with Agentgateway as the security and governance infrastructure layer. The explicit framing: "Enterprises can confidently adopt MCP knowing there's production-grade infrastructure".[^22][^23][^24][^25]

### Authorization Architecture: Layers

Agentgateway enforces authorization at the tool call level through multiple complementary mechanisms:

**1. JWT Validation + CEL-Based RBAC**

The client sends a JWT in the `Authorization` header. Agentgateway validates it against a JWKS server defined in `AgentgatewayPolicy`. If RBAC rules are present, claims are evaluated using CEL (Common Expression Language) expressions:

- `mcp.tool.name == "add_issue_comment"` — hide all other tools
- `jwt.sub == "alice"` — only Alice's tokens access any tools
- `jwt.sub == "alice" && mcp.tool.name == "delete_file" && jwt.scope.contains("files:delete")` — combined identity + scope + tool check[^26][^27]

**2. Cedar Policies**

The enterprise tier supports Cedar (Amazon's policy language) for fine-grained RBAC at the tool level. Cedar's formal semantics allow policy as code with explicit allow/deny semantics rather than implicit whitelist logic.[^28]

**3. OAuth 2.0 On-Behalf-Of (OBO) Flows**

When an agent acts on behalf of a user, token delegation is explicit and auditable. Agentgateway handles OAuth 2.0 OBO flows and token exchange patterns, ensuring agents carry proper authorization context through MCP interactions. This is the structural mitigation for **confused deputy attacks**: an agent cannot be tricked into performing actions its user isn't authorized for because the user's identity flows through the delegation chain.[^22]

**4. Step-Up Authentication**

Not all MCP tools require the same trust level. Reading data may use a standard token; executing a financial transaction requires fresh, high-assurance credentials. Agentgateway enforces step-up auth at tool-invocation time, not session-establishment time.[^22]

**5. URL Elicitation for Credential Isolation**

For MCP servers calling upstream APIs (GitHub, Slack, Google), Agentgateway manages credential acquisition through a secure authorization portal. API tokens never pass through the MCP client or server — they are injected at the gateway layer only when needed. This prevents token exfiltration via a compromised MCP component.[^22]

**6. AI Guardrails**

Input validation, output filtering, prompt injection detection, URL allowlisting for outbound HTTP, and behavioral constraints are applied before requests reach MCP servers or LLMs.[^22]

### MCP Authorization Spec Compliance

MCP's authorization spec evolved across three revisions:[^29]

| Date | Change |
|------|--------|
| March 2025 | OAuth 2.1 introduced; Dynamic Client Registration |
| June 2025 | MCP servers formalized as OAuth Resource Servers; Resource Indicators (RFC 8707) mandatory |
| Ongoing | Structured audit trails, enterprise SSO, gateway patterns with authorization propagation |

Agentgateway implements the MCP server-side of the Authorization spec via configuration: clients trigger `WWW-Authenticate` / Protected Resource Metadata flows automatically. Resource Indicators (RFC 8707) bind tokens to specific server URIs — a token issued for server A cannot be replayed against server B.[^30][^31]

***

## 5. Google A2A v0.3: Security Cards and Cryptographic Trust

### v0.3 Capability Additions (July 2025)

Google released A2A v0.3 in July 2025, introducing three security-relevant additions: gRPC support, **the ability to cryptographically sign AgentCards**, and extended Python SDK client support. The signed card capability is the critical new trust primitive: it allows agents to cryptographically verify that a capability declaration hasn't been tampered with before acting on it.[^32][^33]

The A2A proto schema includes a `repeated AgentCardSignature signatures = 17` field. The MAESTRO threat modeling framework lists "M3.4.6 Agent Card Signature Verification: Agents should cryptographically verify the Agent Card using the server's public key or DID" as a required control.[^34][^32]

### AgentCard Security Schema

The AgentCard is the A2A trust anchor. Its security fields form a declarative contract:

```
security_schemes: map<string, SecurityScheme>  // Available schemes: OAuth2, API key, mTLS
security: repeated Security                    // OR of ANDs requirement logic
skills[].security                              // Per-skill override of agent-level requirements
supports_authenticated_extended_card: bool     // Whether auth unlocks extra capabilities
```

The `security` field uses OR-of-ANDs logic: "callers must use OAuth OR (API Key AND mTLS)". Per-skill security overrides allow a single agent to offer different authentication requirements for different capability surfaces — a read-only skill may require only a standard token while a write skill requires OAuth with specific scopes.[^35][^34]

The `supportsAuthenticatedExtendedCard` field exposes a two-tier disclosure model: the public card at `/.well-known/agent.json` shows minimal capability information; authenticated clients can request an extended card at `/agent/authenticatedExtendedCard` that reveals full tool surfaces, custom metadata, and risk assessments. **Extended cards must be protected by the authentication schemes declared in the public card's `security_schemes`**.[^36][^37][^35]

### Authorization Enforcement Operations

The A2A spec mandates authorization checks at individual operation level:

| Operation | Requirement |
|-----------|------------|
| `ListTasks` | MUST return only tasks visible to authenticated client[^35] |
| `GetTask` | MUST return `TaskNotFoundError` (not `AuthorizationError`) to prevent info leakage[^35] |
| `SendMessage` | MUST validate client has permission to create/send[^35] |
| `CancelTask` | MUST verify client owns or has permission to cancel[^35] |
| Push notifications | MUST validate client can configure notifications for specified task[^35] |

Returning `TaskNotFoundError` for unauthorized `GetTask` requests (rather than `AuthorizationError`) is a specific information leakage mitigation — it prevents an attacker from enumerating which task IDs exist before attempting escalation.[^35]

### Enterprise Transport Requirements

A2A treats remote agents as standard enterprise HTTP applications:[^38]

- All production A2A communication **MUST** use HTTPS[^38]
- TLS 1.2 minimum, TLS 1.3+ recommended, PQC cipher suites as available[^39]
- Server identity verified via TLS certificate against trusted CAs[^38]
- **No in-payload identity**: credentials belong at the HTTP transport layer, never in JSON-RPC message bodies[^38]
- Credentials obtained out-of-band; must **not** appear in the AgentCard[^39]
- MFA required for critical operations (MAESTRO M3.4.7)[^32]

Auth0 partnership with Google Cloud enables OAuth client credentials flows directly against A2A servers, with scopes declared in the AgentCard and token URLs bound to specific skill surfaces.[^40]

***

## 6. The Escalation Problem: Confused Deputy and Delegation Chain Security

### Structural Root Cause

The confused deputy attack in multi-agent systems follows a predictable pattern: a low-privilege agent (Agent A) is compromised via prompt injection or a malicious tool result. It then forwards crafted instructions to a higher-privilege agent (Agent B). Because the request originates from within the trusted system, Agent B executes it. Most agent frameworks do not track how permissions are inherited between agents.[^41][^42]

An email summarizer processing a phishing email can forward instructions formatted as a task to a finance agent that trusts any task from the email agent, thereby triggering an unauthorized payment — purely through trust inheritance and absence of inter-agent authorization checks.[^42]

### The Least Privilege Union Rule

The foundational mitigation is the **least privilege union rule**:

> **Effective permission = intersection of user privileges AND agent privileges**

This prevents privilege inheritance by design. If the user cannot access a document, the agent cannot retrieve it on their behalf even if the agent technically has broader access. This requires identity-aware authorization at both the retrieval layer and the tool invocation layer — not just inside the model or as a prompt instruction.[^43]

The corollary is that agents must not self-authorize: an independent **Policy Decision Point** (PDP) external to the agent must evaluate whether an agent can call a specific tool, in what scope, and under what context. **Tools must never execute a privileged action just because the agent asked nicely**.[^43]

### Token Delegation Standards

RFC 8693 (OAuth 2.0 Token Exchange) formalizes delegation. A delegation token carries both a Subject Token (the user/principal being acted for) and an Actor Token (the agent acting). The critical subtlety: **a delegation token does not automatically enforce the scope restrictions of either the subject or the actor** — it may exceed either party's individual permissions if additional constraints aren't explicitly added.[^44]

Practical mitigations add structural attenuation:

- **Scope attenuation at each hop**: Sub-agents add signed, append-only caveats that narrow the token's scope. Tokens can never be expanded — only narrowed. Macaroon/UCAN-style formats enable offline attenuation without re-contacting an auth server.[^45]
- **Chain depth limits**: Tokens carry `maxChainDepth` fields preventing unbounded delegation (e.g., `maxChainDepth: 2`).[^46]
- **Time-bounded tokens**: Short expiry (e.g., 24 hours) prevents long-lived delegation abuse.[^46]
- **Cryptographic lineage**: Without cryptographic proof of delegation lineage, malicious agents can forge delegation claims. By the third delegation hop, a conventional OAuth token has no cryptographic link back to the initiating user.[^45]

The Decentralized Identity Foundation's Trusted AI Agents Working Group frames the architectural requirement: "Trust cannot rely on the token alone. Establishing trust requires a verifiable trust chain that validates both the token and the identity of the entity that forwarded the request".[^47]

### In-Process vs. Out-of-Process Enforcement

A critical architectural insight: **in-process guardrails fail because the agent is the process**. An agent that can modify its own configuration files (as OpenClaw agents can via filesystem access) can escalate privileges by rewriting its own policy. Cross-agent escalation turns one compromised agent into infrastructure-wide compromise through shared filesystem config files.[^1]

The required architectural pattern is:

1. **Runtime least privilege with short-lived, single-use, per-action tokens** rather than static RBAC grants
2. **Policy enforcement at the gateway layer** (Agentgateway, MCP auth server) rather than inside agent code
3. **Behavioral anomaly detection** with automatic credential revocation — an agent requesting financial data when it normally processes marketing copy triggers immediate review[^48]

***

## 7. Comparative Trust Model Analysis

| System | Permission Granularity | Escalation Prevention Mechanism | Out-of-Process Enforcement | Cryptographic Integrity | Status |
|--------|----------------------|----------------------------------|---------------------------|------------------------|--------|
| OpenClaw exec-approvals | Per-command allowlist, per-agent isolation | Deny-by-default, authorized senders only | No (companion app on same host) | No (bypass via CVE-2026-27566 wrapper chains) | Shipped but bypass-able |
| OpenClaw skill.yaml RFC | Per-skill: network, fs, shell, credentials | Install-time consent + Ed25519 signing + trust scoring | No | Yes (Ed25519 + attestation chains) | RFC/proposal only |
| Claude Code PreToolUse | Per-tool-name regex | Deny return from hook; layer chain | Partial (can spawn subagent verifier) | No | Shipped; silent bypass footgun documented |
| Hermes Agent skills | Toolset availability (capability routing, not security) | None native; human audit of skill library | No | No | No formal permission model |
| Agentgateway (AAIF/LF) | Per-tool JWT claims + CEL + Cedar | OBO flows, step-up auth, prompt injection filtering | Yes (external gateway) | JWT/JWKS; token bound to server URI (RFC 8707) | Shipped; production-ready |
| Google A2A v0.3 | Per-skill security scheme override | OR-of-ANDs scheme requirements; per-operation auth checks | Delegated to HTTP/OAuth layer | Yes (signed AgentCards, TLS 1.3+) | Shipped; v0.3 adds signing |

***

## 8. Synthesis: Architectural Gaps and Design Principles

### Where the Current Models Fail

**Gap 1 — Trust Surface in Shared-Context Systems**: OpenClaw and Hermes both assume a single trusted operator. When multiple agents share a filesystem, MCP gateway, or config store, the trust boundary collapses. No current system offers filesystem-layer isolation without an external sandbox.

**Gap 2 — The PreToolUse Fallthrough Problem**: Claude Code's hook architecture creates an invisible security regression when hooks return `"allow"` as a default. This means intent (security gating) and effect (whitelist bypass) diverge silently. A multi-agent system using Claude Code as orchestrator needs explicit hook discipline: fallthrough paths must omit `decision` to preserve the native permission layer.

**Gap 3 — Hermes Self-Modification**: An agent that can modify its own skill library without an external approval gate can encode escalated behaviors persistently. For an "operational constitution" system, the `skill_manage` tool should be treated as a privileged tool subject to either a PreToolUse deny-by-default policy or an Agentgateway-style external approval gate.

**Gap 4 — Delegation Chain Opacity**: RFC 8693 tokens don't automatically carry cryptographic lineage. The Okta/Aembit analysis confirms that by the third delegation hop, there is no verifiable link to the original principal. Systems that spawn sub-agents (Claude Code subagents, Hermes isolated workstreams) without cryptographic delegation tokens have no way to verify that the initiating authority actually authorized the sub-agent's actions.[^45]

**Gap 5 — Supply Chain Trust**: ClawHub/agentskills.io skill marketplaces present a supply-chain attack surface. A malicious skill published under a benign name carries whatever host permissions the agent runtime provides. The signed skill manifest RFC (OpenClaw) and A2A signed AgentCards both address this — but skills in production systems today (Hermes, Claude Code MCPs) largely lack this protection.

### Design Principles for Operational Constitution

For a system formalizing typed contracts and trust boundaries across eleven agents:

1. **External PDP as constitutional authority**: Authorization decisions must live outside any agent process. Agentgateway (or equivalent) is the enforcement plane; agents are petitioners, not decision-makers.

2. **Attenuation-only delegation**: Delegation tokens for sub-agents must be strictly scoped to the initiating task's permissions or narrower. A GitHub-repository-governed constitutional grammar should embed attenuation rules as typed contracts.

3. **Signed receipts as observable trust chain**: Each tool call should produce a signed audit receipt binding the caller's identity, the token lineage, the specific action, and the result. This enables post-hoc attribution in a shared repo without requiring real-time human arbitration.

4. **Capability-based trust tiers rather than agent identity alone**: A Codex execution agent performing a write operation should be authorized based on the specific write target and task context, not merely on its identity as "Codex CLI." Task-scoped tokens with `maxChainDepth` and expiry are the correct primitive.

5. **Hook discipline for Claude Code orchestrator**: The constitutional grammar layer must specify which PreToolUse hooks return `decision: "deny"` (never `"allow"` as a fallthrough) so that the native permission system remains active for anything not explicitly intercepted.

6. **Separate discovery from authorization in A2A**: The public AgentCard surface should be minimal. Capability-revealing extended cards should be behind authenticated endpoints, consistent with A2A v0.3's `supports_authenticated_extended_card` field. This prevents capability enumeration by untrusted principals.

---

## References

1. [The privilege escalation kill chain: how AI agents self-grant ...](https://www.arunbaby.com/ai-security/0001-agent-privilege-escalation-kill-chain/) - AI agents autonomously escalate privileges, bypass security controls, and persist via config file mo...

2. [9 OpenClaw CVEs in 4 Days: The March 2026 Security Breakdown](https://www.tryopenclaw.ai/blog/openclaw-cve-flood-march-2026/) - Nine CVEs hit OpenClaw in 4 days — including a critical 9.9 scope escalation and RCE. Every vulnerab...

3. [OpenClaw Security Advisory: CVE-2026-25253 Exploits ...](https://www.linkedin.com/posts/wrenbjor_cybersecurity-aiagents-openclaw-activity-7430727572952485888-iAjG) - CrowdStrike just issued a security advisory on OpenClaw. Let that land for a moment. Not a patch gui...

4. [CVE-2026-25253: How 42,000+ OpenClaw Instances Got Pwned ...](https://dev.to/tiamatenity/cve-2026-25253-how-42000-openclaw-instances-got-pwned-and-why-your-ai-assistant-is-a-security-23mo) - TL;DR OpenClaw, an open-source AI assistant platform with deep system integrations, has...

5. [Critical vulnerability in OpenClaw allows 1‑click remote code ...](https://ccb.belgium.be/advisories/warning-critical-vulnerability-openclaw-allows-1-click-remote-code-execution-when)

6. [CVE-2026-27566: Openclaw Allowlist Bypass RCE Vulnerability](https://www.sentinelone.com/vulnerability-database/cve-2026-27566/) - The core issue lies in the exec approvals analysis module, which is designed to validate executed co...

7. [Critical Authorization Bypass in OpenClaw Affects Multiple Versions](https://www.reddit.com/r/pwnhub/comments/1rzbzg4/critical_authorization_bypass_in_openclaw_affects/) - A severe authorization bypass vulnerability in OpenClaw prior to version 2026.3.12 enables attackers...

8. [OpenClaw Went from Viral AI Agent to Security Crisis in Just Three ...](https://www.adminbyrequest.com/en/blogs/openclaw-went-from-viral-ai-agent-to-security-crisis-in-just-three-weeks) - Over 135,000 OpenClaw instances were publicly exposed with zero authentication. A supply chain attac...

9. [Exec Approvals - OpenClaw Docs](https://docs.openclaw.ai/tools/exec-approvals) - Exec approvals. Exec approvals are the companion app / node host guardrail for letting a sandboxed a...

10. [Security - OpenClaw Docs](https://docs.openclaw.ai/gateway/security)

11. [OpenClaw Security Audit, What Actually Breaks When an AI Agent ...](https://www.penligent.ai/hackinglabs/hi/openclaw-security-audit-what-actually-breaks-when-an-ai-agent-can-touch-your-files-tools-and-accounts/) - OpenClaw's published advisories already show that permissions and logged URLs are not theoretical is...

12. [RFC: Skill Security Framework — Permission Manifests, Signing ...](https://github.com/openclaw/openclaw/issues/10890) - What's needed for OpenClaw integration: A hook in the skill execution path that routes exec calls th...

13. [Skill Permission Manifest Standard (skill.yaml) · Issue #12219 - GitHub](https://github.com/openclaw/openclaw/issues/12219) - Problem Skills currently run with full trust - there's no standard way for a skill to declare what p...

14. [Claude Code Hooks: PreToolUse, PostToolUse & All 12 Events (2026)](https://www.pixelmojo.io/blogs/claude-code-hooks-production-quality-ci-cd-patterns) - PreToolUse hooks block actions that require review, PostToolUse hooks run quality checks, and Stop h...

15. [Hooks reference - Claude Code Docs](https://code.claude.com/docs/en/hooks) - MCP server tools appear as regular tools in tool events ( PreToolUse , PostToolUse , PostToolUseFail...

16. [Intercept and control agent behavior with hooks - Claude API Docs](https://platform.claude.com/docs/en/agent-sdk/hooks) - In TypeScript, these are on the base hook input and available to all hook types. In Python, they are...

17. [[DOCS] PreToolUse hook permissionDecision "allow" silently ...](https://github.com/anthropics/claude-code/issues/28812) - The hooks documentation states that PreToolUse hooks can "approve or deny in place of" the permissio...

18. [Skills System | Hermes Agent - Nous Research](https://hermes-agent.nousresearch.com/docs/user-guide/features/skills/) - Skills System. Skills are on-demand knowledge documents the agent can load when needed. They follow ...

19. [Hermes Agent: Self-Improving AI with Persistent Memory | YUV.AI Blog](https://yuv.ai/blog/hermes-agent) - Hermes Agent is a self-improving AI agent with cross-session memory and autonomous skill creation ca...

20. [Learning loop for your agent inspired by Karpathy's post ... - Reddit](https://www.reddit.com/r/SideProject/comments/1ruf7l9/learning_loop_for_your_agent_inspired_by/) - So, heavily inspired by Nous Research's Hermes Agent, I built Self-Improve Agent — an open-source, f...

21. [Hermes Agent Documentation - Nous Research](https://hermes-agent.nousresearch.com/docs/) - The self-improving AI agent built by Nous Research. The only agent with a built-in learning loop — i...

22. [Why the Agentic AI Foundation (AAIF) Changes Everything for MCP](https://www.solo.io/blog/aaif-announcement-agentgateway) - Learn how to close the major security gaps in Model Context Protocol (MCP) with a proper AI Gateway....

23. [With the addition of Agentgateway, the Linux Foundation is ...](https://fastforward.boldstart.vc/with-the-addition-of-agentgateway-the-linux-foundation-is-becoming-a-hub-for-agentic-ai-infrastructure/) - Solo.io released Agentgateway to the Linux Foundation this week, adding security and governance for ...

24. [The Linux Foundation Launches the Agentic AI ... - WorkOS](https://workos.com/blog/the-linux-foundation-launches-the-aaif) - The Linux Foundation unites MCP, goose, and AGENTS.md under open governance. WorkOS breaks down what...

25. [Linux Foundation Announces the Formation of the Agentic AI ...](https://www.linuxfoundation.org/press/linux-foundation-announces-the-formation-of-the-agentic-ai-foundation) - The AAIF provides a neutral, open foundation to ensure agentic AI evolves transparently and collabor...

26. [Tool access - MCP connectivity](https://agentgateway.dev/docs/kubernetes/latest/mcp/tool-access/) - Control access or route traffic based on verified claims in a JSON web token (JWT). About tool acces...

27. [End-to-End Agentic AI Security with kagent & agentgateway | Solo.io](https://www.solo.io/blog/agentic-zero-trust-architecture-and-configuration) - Learn how to implement end-to-end security for agentic AI using kagent and agentgateway. Covers OIDC...

28. [Understanding AgentGateway: The Security Gateway for MCP and ...](https://shanedeconinck.be/explainers/agentgateway/) - AgentGateway is an open-source gateway built specifically for agentic AI. Solo.io contributed it to ...

29. [Everything your team needs to know about MCP in 2026 - WorkOS](https://workos.com/blog/everything-your-team-needs-to-know-about-mcp-in-2026) - This article covers everything your team needs to evaluate, adopt, and build with MCP: how the proto...

30. [MCP Authorization the Easy Way - agentgateway](https://agentgateway.dev/blog/2025-08-12-mcp-authorization-following-the-spec/) - In June 2025, the MCP community updated the specification to alleviate some of the concerns from the...

31. [MCP Authorization: How to Manage Permissions for AI Agents ...](https://www.gravitee.io/blog/mcp-authorization-how-to-manage-permissions-for-ai-agents-services) - Learn how MCP Authorization uses OAuth 2.1, scopes, and Gravitee to enforce least-privilege permissi...

32. [Threat Modeling Google's A2A Protocol | CSA](https://cloudsecurityalliance.org/blog/2025/04/30/threat-modeling-google-s-a2a-protocol-with-the-maestro-framework) - MAESTRO, an AI-centric threat modeling approach, can be used to identify potential risks in implemen...

33. [Agent2Agent protocol (A2A) is getting an upgrade | Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/agent2agent-protocol-is-getting-an-upgrade) - Google Cloud tools help developers build, deploy, and sell collaborative Agent2Agent (A2A) systems t...

34. [Agent2Agent (A2A) Protocol Official Specification](https://a2a-protocol.org/v0.3.0/specification/) - The Agent2Agent protocol is an open standard that allows different AI agents to securely communicate...

35. [Security and Authentication | google-a2a/A2A | DeepWiki](https://deepwiki.com/google-a2a/A2A/2.8-security-and-authentication) - This document describes the security and authentication mechanisms in the A2A protocol, including ho...

36. [A2A Protocol Explained](https://huggingface.co/blog/1bo/a2a-protocol-explained) - A Blog post by YANG MING on Hugging Face

37. [Extending the Google Agent2Agent (A2A) Protocol with the Agent ...](https://www.tavro.ai/extending-the-google-agent2agent-a2a-protocol-with-the-agent-metadata-specification/) - Sunil Soares, Co-Founder & CEO, Tavro AI Sanjeev Varma, Co-Founder, President & COO, Tavro AI

38. [Enterprise-Ready Features for A2A Agents¶](https://google-a2a.github.io/A2A/topics/enterprise-ready/) - An open protocol enabling communication and interoperability between opaque agentic applications.

39. [Agent Card security](https://developers.redhat.com/articles/2025/08/19/how-enhance-agent2agent-security) - The Agent2Agent (A2A) protocol is an open standard enabling seamless communication between AI agents...

40. [Secure A2A Authentication with Auth0 and Google Cloud](https://auth0.com/blog/auth0-google-a2a/) - Production-ready AI agents need to be secure, and auth is a big part of security. Auth0 is partnerin...

41. [The confused deputy problem in multi-agent AI systems: a privilege ...](https://www.reddit.com/r/cybersecurity/comments/1rty805/the_confused_deputy_problem_in_multiagent_ai/) - Multi-agent AI pipelines have a privilege escalation problem that mirrors the classic confused deput...

42. [Multi-Agent AI Security: Enterprise Risks, Compliance, and Mitigation](https://www.augmentcode.com/guides/multi-agent-ai-security-risks-compliance-fixes) - Per arXiv:2503.12188, the most dangerous propagation type is control-flow hijacking via the confused...

43. [AI Privilege Escalation in Agentic Systems: Risks and Practical ...](https://www.synlabs.io/post/ai-privilege-escalation-in-agentic-systems-risks-and-practical-mitigations) - AI agents are moving from “chatting” to doing. They can search internal docs, call APIs, update tick...

44. [Zero Trust for AI Agents: Delegation, Identity and Access Control](https://developer.cyberark.com/blog/zero-trust-for-ai-agents-delegation-identity-and-access-control/) - A standard solution is delegation tokens, scoped credentials that let agents act on behalf of a user...

45. [Control the chain, secure the system: Fixing AI agent delegation - Okta](https://www.okta.com/blog/ai/agent-security-delegation-chain/) - AI agents delegating tasks can lead to Session Smuggling, where a compromised agent executes unautho...

46. [How to add trust boundaries to your multi-agent system](https://dev.to/jnycode/how-to-add-trust-boundaries-to-your-multi-agent-system-gic) - You create a root Delegation Capability Token (DCT) for your assistant. This token defines exactly w...

47. [Authorising Autonomous Agents at Scale](https://blog.identity.foundation/building-ai-trust-at-scale-4/) - It breaks down completely with hundreds of autonomous agents crossing multiple security boundaries, ...

48. [4 Types of AI Agents and What They Mean for Identity Security](https://aembit.io/blog/ai-agent-architectures-identity-security/) - A customer service agent should not be able to delegate to a financial operations agent regardless o...

