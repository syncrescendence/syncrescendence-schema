# Write-Scope Governance Patterns for Multi-Agent AI Orchestration Systems

## Executive Summary

Write-scope governance answers a single question with high operational stakes: *which agent is authorized to mutate which part of a shared repository or filesystem, and how is that authorization enforced?* The field currently operates across four distinct enforcement layers — filesystem abstraction, tool-layer allow/deny rules, process isolation (git worktrees/containers), and cryptographic delegation chains — each with different guarantees. A fifth layer, natural-language instructions (AGENTS.md, SOUL.md), provides *policy declaration* but not enforcement; empirical testing has demonstrated that prompt-based guardrails vary significantly across model families. The interaction between these layers is where constitutional governance either holds or leaks.

***

## 1. Claude Code Permission Architecture

### 1.1 Settings Hierarchy and Precedence

Claude Code evaluates write permissions through a five-tier settings hierarchy, where higher tiers override lower ones unconditionally:[^1]

1. **Managed** — `managed-settings.json` (endpoint or server-delivered via admin console); cannot be overridden by any user or project setting[^2][^3]
2. **Command line arguments** — session-level overrides
3. **Local project** — `.claude/settings.local.json`
4. **Project** — `.claude/settings.json` (committed to repo, shared with team)
5. **User** — `~/.claude/settings.json` (personal defaults)

The critical architectural property is that `managed-settings.json` is the only settings file that cannot be overridden at lower levels. This makes it the correct home for organizational-grade write-scope policy — including per-path deny lists, MCP server allowlists, and the `allowManagedPermissionRulesOnly` flag, which prevents users from adding new allow rules entirely. Server-managed settings (configured via the Claude.ai admin console) occupy the same precedence tier as endpoint-managed settings and take final precedence when both are present.[^4][^3]

The deny-before-allow evaluation order means that a `permissions.deny` rule in a lower-tier settings file will still override a `permissions.allow` rule at the same tier: **deny → ask → allow**, first matching rule wins.[^5]

### 1.2 Permission Modes as Write-Scope Postures

Permission modes are coarse-grained write postures that apply to an entire session or subagent:[^5]

| Mode | Write Behavior |
|------|---------------|
| `default` | Prompts for confirmation on first use of each write tool |
| `acceptEdits` | Auto-approves file edit/write tools for the session |
| `plan` | Read-only; cannot modify files or execute commands |
| `delegate` | Coordination-only tools; restricts lead from implementation work |
| `dontAsk` | Auto-denies writes unless pre-approved via `/permissions` or allow rules |
| `bypassPermissions` | Skips all permission checks (dangerous; for isolated environments only) |

The `delegate` mode deserves special attention for orchestration architectures. It was designed to prevent a lead Claude Code session from doing implementation work directly, enforcing the invariant that *all writes flow through spawned teammates*. However, a known bug (as of early 2026) causes all spawned teammates to inherit the lead's `delegate` mode restrictions, making them also coordination-only and unable to perform any filesystem operations — effectively breaking agent teams when `delegate` mode is active. This is an important unresolved defect for any orchestration system that relies on the lead-plus-teammate topology.[^6]

### 1.3 PreToolUse Hooks as Write Filtering Gates

`PreToolUse` hooks are the primary programmatic mechanism for write filtering at call-time. They fire before any tool execution and can return three decisions:[^7][^8][^9]

- **`allow`**: Proceed without prompting (bypasses the permission prompt, but not deny rules)
- **`deny`**: Block execution entirely, with an optional reason fed back to Claude
- **`ask`**: Require human confirmation

Hooks support regex matchers for tool names, enabling write-specific gates:[^10]

```json
{
  "PreToolUse": [
    { "matcher": "Write|Edit|MultiEdit|Delete", "hooks": [{ "type": "command", "command": "path_guard.sh" }] },
    { "matcher": "^mcp__", "hooks": [{ "type": "command", "command": "mcp_audit.sh" }] }
  ]
}
```

The `additionalContext` field in the hook output can inject domain-specific governance context into Claude's context window immediately before tool execution — a pattern used to enforce per-directory conventions without bloating the system prompt.[^11]

**Critical security defect (v2.1.84):** A `PreToolUse` hook returning `permissionDecision: "ask"` silently overrides any matching `permissions.deny` rule in `settings.json`, causing the deny rule to be completely ignored and the command to execute without a prompt. This constitutes a critical security bypass of the deny-first evaluation order. Any constitutional system relying on hooks *and* deny rules must audit this interaction carefully until the defect is patched. A separate earlier defect (v1.0.93) caused all deny permission rules to be non-functional entirely.[^12][^13]

A secondary limitation for agent teams: the `PreToolUse` payload (as of early 2026) includes `session_id` and `tool_name` but does not expose which teammate triggered the hook. This means write-filtering hooks cannot apply differentiated policy across teammates — a safety gap when different teammates have different intended write scopes.[^14]

### 1.4 Subagent Frontmatter as Structural Write Scope

Subagent definition files (`.claude/agents/<name>.md`) declare write scope structurally via YAML frontmatter:[^15][^16]

```yaml
---
name: code-reviewer
description: Reviews code for quality
tools: Read, Grep, Glob, LS, Bash(git diff:*)
permissionMode: plan
isolation: worktree
---
```

The `tools:` field is an explicit allowlist: only listed tools are available to the subagent. Omitting the field inherits all tools from the parent session. The `disallowedTools:` field provides a denylist approach for broad-trust subagents that should be blocked from a small set of destructive operations.[^17][^15]

`permissionMode: plan` is the correct declaration for a read-only analysis agent (e.g., an orchestrator that should not directly write), while `permissionMode: dontAsk` combined with a tight `tools:` list creates a headless execution agent with a fixed, auditable tool surface. The `isolation: worktree` field is discussed in section 4.[^18]

**Known defect**: Subagents spawned via the `Task` tool may not correctly inherit the `permissions.allow` allowlist from `.claude/settings.json`, causing unexpected permission prompts for commands that should be pre-approved. This makes automated pipelines unreliable without explicit `tools:` declarations in subagent frontmatter.[^19]

***

## 2. AGENTS.md: Policy Declaration vs. Enforcement

### 2.1 What AGENTS.md Is and Is Not

AGENTS.md is a vendor-agnostic markdown file — a "README for machines" — that provides natural-language instructions to AI coding agents. It was formalized in August 2025 through collaboration between OpenAI, Google, Cursor, Factory, and Sourcegraph, and had been adopted by over 60,000 repositories by early 2026. The standard is intentionally schema-free: no required structure, just plain Markdown.[^20][^21][^22]

The critical architectural distinction for write-scope governance: **AGENTS.md is policy declaration, not enforcement**. A rule like "never modify files under `/infrastructure/terraform/`" is a semantic instruction. The agent's compliance depends on model family, prompt placement, and whether competing instructions exist in the conversation. Empirical testing across models in a real multi-agent OpenClaw deployment found that GPT-family models respected SOUL.md/AGENTS.md write restrictions while a Gemini-family model ignored the same instruction and read a forbidden config file — and further, that the Gemini model complied when a *user* asked directly but ignored the restriction when another *agent* issued the same request via agent-to-agent communication. This is not a failure of the AGENTS.md spec; it reflects the fundamental limitation of prompt-based governance.[^23]

### 2.2 Hierarchical Discovery and Write-Zone Scoping

All major agent runners implement AGENTS.md with hierarchical directory-based loading:[^24]

1. **Global scope** — `~/.codex/AGENTS.md` (Codex), `~/.gemini/GEMINI.md` (Gemini CLI) — user-level defaults applied to all projects
2. **Project root** — `AGENTS.md` at the repository root (Git root)
3. **Subdirectory** — `AGENTS.md` files in nested directories, concatenated root-downward; closer files take precedence over parent files[^25]

This hierarchy enables write-zone scoping in monorepos: a root-level AGENTS.md declares organization-wide standards, while a `packages/billing/AGENTS.md` can declare billing-specific write restrictions without affecting other packages. Hermes Agent in a monorepo walks the entire directory tree and concatenates all AGENTS.md files it finds with path headers, giving it awareness of which instructions came from which directory.[^26][^27][^28]

Codex enforces a 32KB byte limit across all concatenated AGENTS.md content. For systems with large multi-module governance documents, this is an architectural constraint that may require hierarchical splitting.[^29]

### 2.3 The Proposal for Structured Permissions in AGENTS.md

Recognizing that natural-language write constraints are non-deterministic, GitHub issue #105 on the `agentsmd/agents.md` spec repository proposed a structured YAML frontmatter `permissions:` block:[^30]

```yaml
---
version: 1.0
permissions:
  files:
    read: allow
    edit: ask
    delete: deny
  shell:
    allow: ["ls", "npm test"]
    default: deny
---
```

This would allow agent runners to programmatically enforce write constraints at the tool-execution layer before the LLM even attempts an action. As of March 2026, this proposal has not been ratified into the AGENTS.md standard, and no major runner enforces it. It exists as an acknowledged gap between what the spec provides and what write-scope governance requires.

### 2.4 AGENTS.md and Claude Code Hooks: Complementary Layers

In Claude Code specifically, AGENTS.md (or `CLAUDE.md`) and PreToolUse hooks operate at different layers and should be understood as complementary rather than redundant:[^8]

- **AGENTS.md/CLAUDE.md** — semantic context: declares intent, behavioral conventions, and policy at the model level. Subject to prompt-based compliance variation.
- **PreToolUse hooks** — structural enforcement: intercepts every write tool call with a shell script that can block unconditionally based on path patterns, tool type, or external policy service.

A robust write-governance design uses AGENTS.md to *declare* the write-zone map (which directories belong to which agent roles) and hooks to *enforce* it. The hook reads the file path from `tool_input` and checks it against an authoritative scope table, returning `deny` with a reason if the calling agent's scope does not include that path. This is analogous to the hardware/software privilege separation in operating systems: the OS kernel (hooks) enforces what the user-space application (AGENTS.md instructions) declares.

### 2.5 Interaction with GitHub Copilot's agents.md

GitHub Copilot's `agents.md` (note: lowercase, different spec) supports agent persona definitions with frontmatter, allowing scope boundaries declared as "never modify source code" or "only write to `tests/`". An analysis of over 2,500 agents.md files found the most common effective constraint pattern to be explicit "never touch" declarations for secrets, vendor directories, and production configs — combined with agent persona specificity ("you are a test engineer who writes tests... and *never modifies source code*"). These are still semantic constraints but are more reliably honored when they are precise, role-anchored, and placed early in the file.[^31]

***

## 3. Git Branch Protection as Merge-Layer Write Governance

### 3.1 Mechanics

Git branch protection rules operate at the merge layer, not the write layer. They do not prevent agents from *creating* commits in feature branches; they govern what can *merge* into protected branches. The key write-governance mechanisms are:[^32]

- **Required status checks** — CI pipelines (linting, tests, security scans) must pass before merge; agents cannot bypass by committing directly[^32]
- **Restrict who can push to matching branches** — named users, teams, or GitHub Apps; this is the tool that directly controls which identities (including agent app identities) can write to protected branches[^33]
- **Required pull request reviews** — all changes to `main` must pass human or CODEOWNERS review[^33]
- **Do not allow bypassing settings** — applies rules even to repository administrators[^33]

In the context of multi-agent systems, branch protection creates the *merge contract*: agents may write freely to their feature branches but cannot merge to `main` without passing the quality gate. This provides a checkpoint between agent writes and production-affecting writes.

### 3.2 CODEOWNERS as Write-Authority Declaration

CODEOWNERS files define path-pattern-to-reviewer mappings:[^34]

```
/src/core/         @core-team
/infrastructure/   @platform-team
/.github/          @devops-team
```

When paired with "Require review from Code Owners" in branch protection, this creates indirect write-authority zones: any PR containing changes to `/infrastructure/` must be approved by `@platform-team` before merge. For agent-generated PRs, this means an agent writing to `infrastructure/` will trigger a human review requirement, while an agent writing only to `src/features/` (with no CODEOWNERS assignment) can merge through automated checks alone.[^35][^32]

CODEOWNERS does not prevent the agent from *making* the commit — it gates the *merge*. This distinction matters for systems where speed of iteration on feature code must coexist with high review requirements on infrastructure or configuration code.

### 3.3 GitHub Agents HQ and Agent Identity

GitHub Agents HQ (launched early 2026) introduced administrative controls allowing enterprise administrators to define which agents and models are authorized across the organization. Claude, Codex, and Copilot can now operate within structured sessions inside GitHub repositories with session monitoring and comparative output review. This gives branch protection rules a meaningful agent identity to enforce against — previously, an "agent" was just a commit from a human-owned service account.[^36]

***

## 4. Git Worktrees as Structural Write Isolation

### 4.1 The Isolation Primitive

Git worktrees solve the most fundamental write-conflict problem in multi-agent systems: two agents writing to the same file simultaneously, silently overwriting each other's changes. A worktree gives each agent a *physically separate working directory* while sharing the same git history and object store. Agents can execute concurrently without any coordination protocol for file access — conflicts only become visible at merge time, where they are explicit, toolable, and resolvable.[^37]

A peer-reviewed study on asynchronous software engineering agents (arXiv, March 2026) conducted an ablation comparing worktree isolation against soft isolation (instruction-level separation via manager prompts). Key findings:[^38]

- Soft isolation failed when task decomposition was imperfect, since shared workspace amplified miscoordination
- Worktree isolation "stabilizes parallel execution" by making concurrent edits physically separated
- The study concluded: "For open-ended long-horizon tasks, 'worktree isolation' becomes necessary to prevent execution instability"[^38]

Claude Code makes this declarative via the `isolation: worktree` field in subagent frontmatter:[^39]

```yaml
---
name: feature-implementer
isolation: worktree
tools: Read, Write, Edit, Bash
---
```

Every invocation of this subagent receives a fresh worktree, preventing any file-level collision with the orchestrator or sibling subagents. Worktrees with no changes are automatically cleaned up; worktrees with changes persist for orchestrator review and merge.[^40][^41][^39]

### 4.2 Worktree Architecture for Multi-Agent Repos

The conventional pattern emerging from practice:[^42][^43][^37]

- **One concern per agent, not one task**: Agents scoped to distinct *domains* (e.g., `teams/devto/output/`) rather than tasks eliminate most cross-agent file collisions by design
- **Worktrees at `.trees/{TASK_ID}/`**, with branch named after the task identifier[^43]
- **Lead/orchestrator merges** results from subagent branches after each round
- **`isolation: worktree` as default** for any subagent that writes files; opt out only for confirmed read-only agents

This pattern can be viewed as operationalizing CODEOWNERS ownership at the filesystem level: the worktree boundary *enforces* the write-zone declared by CODEOWNERS *at write time*, not at merge time. If the orchestrator's AGENTS.md declares "the billing agent writes only to `src/billing/`," the worktree ensures that even if the agent drifts, its writes cannot affect `src/auth/` in a way that corrupts the main branch before review.

***

## 5. OpenClaw Workspace Permissions

### 5.1 Per-Agent Workspace and Tool Restrictions

OpenClaw's multi-agent model provides the most granular write-scope configuration of any production system surveyed. Each agent receives its own isolated workspace directory and a declarative tool-level allow/deny configuration:[^44]

```json
{
  "id": "jim",
  "workspace": "~/.openclaw/workspace-jim",
  "tools": {
    "allow": ["read"],
    "deny": ["exec", "write", "edit", "apply_patch", "browser"]
  }
}
```

Configurable tool categories include: `read`, `write`, `edit`, `apply_patch`, `exec`, `browser`, `gateway`, `sessions_list`, `sessions_send`. This allows fine-grained role-specific postures:[^45]

| Agent Role | Allow | Deny |
|-----------|-------|------|
| Read-only analyst | `read` | `exec`, `write`, `edit`, `apply_patch` |
| Safe executor (no file mutation) | `read`, `exec`, `process` | `write`, `edit`, `apply_patch`, `browser` |
| Communication-only | `sessions_list`, `sessions_send` | `exec`, `write`, `edit`, `read`, `browser` |
| Development agent | `read`, `write`, `apply_patch`, `exec` | `browser`, `gateway` |

Sources:[^46][^45]

The `workspaceAccess` property in sandbox config controls whether agents operate against their host workspace or a sandboxed copy under `~/.openclaw/sandboxes`. The critical distinction: the workspace directory is the *default* CWD, not a *hard sandbox*. Absolute paths can reach outside the workspace unless sandbox mode is explicitly enabled.[^47]

### 5.2 Per-Path Access Control (Requested Feature)

A GitHub issue in the OpenClaw repository documents an important gap: despite per-agent tool-level restrictions, there is no enforcement of which *file paths* a given agent can access. In practice this means that all agents running as the same OS user can read each other's workspace directories and sensitive config files. The issue author tested three models against SOUL.md prompt-level restrictions:[^23]

- GPT 5.3-Codex: respected the write restriction ✅
- Gemini 3 Flash: ignored the restriction and read a forbidden config file ❌
- Gemini 3 Flash: when prompted *by another agent* via A2A, complied despite apparent user-facing refusal ❌[^23]

The proposed solution is a per-agent file path allowlist/denylist enforced at the tool execution layer (not the prompt layer). This has been acknowledged but not yet shipped as of March 2026.[^23]

### 5.3 Known Bug: Minimal Profile Exposes Filesystem Tools

A documented defect: `tools.profile: "minimal"` is specified to expose only `session_status`, but in practice the agent still receives filesystem tools (`read`, `write`, `edit`) unless `deny: ["group:fs"]` is explicitly added. This is an example of a fail-open default — where the documented security posture is stricter than the implemented behavior — which is particularly dangerous in write-governance contexts because operators may believe they have restricted writes when they have not.[^48]

***

## 6. Hermes Agent Skill Boundaries

### 6.1 Five-Layer Security Model

Hermes Agent (Nous Research) implements write-scope governance through a five-layer model:[^49]

1. **User authorization** — allowlists and DM pairing; controls who can instruct the agent
2. **Dangerous command approval** — human-in-the-loop gate for destructive operations
3. **Container isolation** — Docker/Singularity/Modal sandboxing with dropped capabilities and process limits
4. **MCP credential filtering** — environment variable isolation preventing MCP subprocesses from inheriting all agent credentials
5. **Context file scanning** — prompt injection detection in project files and AGENTS.md content

### 6.2 Dangerous Command Pattern Matching

Before any shell command executes, Hermes checks it against a curated pattern list. Write-destructive patterns include:[^49]

- `rm -r` / `rm --recursive` — recursive delete
- `chmod 777` — world-writable permissions
- `mkfs` — filesystem format
- `dd if=` — disk copy
- `DROP TABLE/DATABASE`, `DELETE FROM` (without WHERE), `TRUNCATE TABLE`
- `> /etc/` — overwrite system config
- `find -exec rm`, `find -delete` — find with destructive actions

Approval options escalate from `once` → `session` → `always` (permanent allowlist) → `deny`. The "always" option writes the pattern to `config.yaml` — a persistent write-scope expansion that should be treated with the same review rigor as a code change.[^50]

**Container exception**: When Hermes runs in Docker, Singularity, or Modal backends, all dangerous command checks are *skipped* because the container boundary is treated as the security primitive. This creates an important governance assumption: that the container image is properly hardened and that the blast radius of any write within the container is acceptable. For multi-agent systems using Hermes as an execution agent, this means container configuration *is* write-scope governance.[^28][^50]

### 6.3 Skill Trust Boundaries

Hermes skills have three trust tiers:[^51]

- **Official/bundled skills** — builtin trust; no warning
- **Third-party skills** — third-party warning panel shown before use
- The `--force` flag overrides `caution`/`warn` scan verdicts but cannot override a `dangerous` verdict

A skill trust signing proposal (STSS — Skill Trust & Signing Service) highlights a supply chain concern: a compromised skill runs inside the agent with the agent's filesystem access and environment variables, not merely as an external library. This distinguishes skill-based write-scope risk from library-based risk.[^52]

***

## 7. Cryptographic Write-Authority and Trust Chains

### 7.1 Delegation Capability Tokens

The most formally rigorous approach to write-scope governance surveyed is cryptographic delegation via capability tokens (implemented in DelegateOS). The pattern:[^53]

1. A root authority (human or orchestrator) holds an Ed25519 keypair
2. An assistant/agent receives a `DelegationCapabilityToken` (DCT) defining exact namespaces, actions, and resources it may access, with expiry and budget limits
3. The assistant can *attenuate* (narrow, never expand) its DCT when delegating to sub-agents — sub-agents receive strictly less authority[^53]
4. MCP plugin integration checks every tool call against the caller's DCT before execution

```
Root authority → DCT(web:search:*, docs:read:/home/**) → Assistant
Assistant → attenuateDCT(web:search:*.edu/**) → Researcher sub-agent
```

The researcher sub-agent cannot access non-.edu URLs or send email, even if it attempts to, because the MCP plugin rejects calls outside its DCT scope. Tokens can be revoked mid-flight — including cascade revocation of all downstream delegations from a single parent token. This provides the "blast radius" containment that pure prompt-based governance lacks.[^53]

### 7.2 Agent Action Receipts

Agent Action Receipts (AAR v1.0) address the observability dimension of write governance — proving *what was actually written, when, and by whom*:[^54][^55]

- Ed25519 signatures over canonicalized JSON
- SHA-256 hashes of inputs and outputs — integrity verifiable without exposing content
- Each agent action produces a signed receipt appended to an immutable Provenance Log
- Separate Audit Agents watch the Provenance Log for anomalies, with authority to block tool access or pause the writing agent[^55]

This architecture (proposed in an arXiv paper, December 2025) treats write observability as a first-class concern: "Every time the agent performs an operation... that action goes through an Action Attestation Layer. The AAL automatically creates a small signed record called a receipt". Feature requests have been filed for this pattern in CrewAI and MetaGPT, with the AAR TypeScript SDK (`botindex-aar`) published as MIT-licensed open source.[^56][^54][^55]

### 7.3 Zero-Trust Agent Mesh

The zero-trust agent mesh pattern extends DCT-style authority to all inter-agent communication:[^57]

- Agent identities cryptographically asserted (Ed25519 key pairs per agent)
- Mutual trust handshakes before any request is accepted
- Delegation tokens carry signed scope, TTL, and parent authority
- Every request evaluated as untrusted until identity, authorization, and delegation lineage are verified
- Policies enforced per-hop, not just at the network edge

This operationalizes the OWASP zero-trust principle ("never trust, always verify") at the agent coordination layer. For a system where one agent (Hermes as learning runtime) is consuming outputs from several execution agents, zero-trust mesh prevents a compromised Gemini CLI session from injecting instructions that appear to come from the Claude Code orchestrator.[^58]

***

## 8. The Constitutional Grammar Layer: Semantic vs. Structural Governance

### 8.1 The Enforcement Gap

The most important distinction in write-scope governance is between *semantic governance* and *structural governance*:

| Type | Examples | Enforcement | Reliability |
|------|----------|-------------|-------------|
| Semantic | AGENTS.md write restrictions, SOUL.md, system prompts | Model compliance | Variable — model-family dependent[^23] |
| Structural | settings.json deny rules, tool allowlists, worktree isolation | Runtime enforcement | Deterministic (when correctly implemented) |
| Hybrid | CODEOWNERS + branch protection | Review process | Deterministic at merge; bypass possible at commit |
| Cryptographic | DCT delegation tokens, AAR receipts | Mathematically enforced | Formally verifiable |

Kore.ai's description of constitutional enforcement captures the design goal: "What agents cannot do is architecturally impossible, not just discouraged". The Constitutional Multi-Agent Governance (CMAG) framework formalizes this as a two-stage selection mechanism: hard constraints (inviolable red lines) applied first, soft penalized-utility optimization applied second.[^59][^60]

### 8.2 How AGENTS.md Fits an "Operational Constitution"

In a constitutional governance model, AGENTS.md serves as the *declared policy layer* — the authoritative statement of which agent has write authority over which path. It is the governance document that human operators review and version-control. However, for an AGENTS.md write-scope declaration to be *enforced*, it requires a companion structural mechanism at each layer:

- **PreToolUse hook** reads path from tool_input, checks against AGENTS.md-declared zone map, returns `deny` if out of scope
- **Subagent frontmatter** encodes the same zone map as a `tools:` allowlist (declarative enforcement at spawn time)
- **Git worktrees** physically isolate agent writes to declared zone (enforcement at filesystem level)
- **Branch protection + CODEOWNERS** enforces zone declaration at merge (enforcement at integration layer)
- **DCT delegation tokens** encode zone declaration cryptographically (enforcement at protocol level)

The governance gap exists where AGENTS.md declarations are not backed by a structural enforcement mechanism. A monorepo with a well-structured AGENTS.md but no accompanying hooks, subagent `tools:` restrictions, or worktree isolation has policy without enforcement — visible to auditors but penetrable by a sufficiently instructed or compromised agent.

### 8.3 Module-Level AGENTS.md as Ownership Contract

AGENTS.md at the module level (e.g., `src/billing/AGENTS.md`) should be maintained by the engineers responsible for that module, with changes reviewed as rigorously as code changes. This creates a governance contract: the module-level AGENTS.md is the canonical declaration of which agents are permitted to write to that module, what conventions they must follow, and what operations are prohibited. Instruction drift in AGENTS.md is as dangerous as code drift — it silently degrades the constitutional layer without breaking any tests.[^21]

***

## 9. Confirmed Defects and Governance Risks (March 2026)

The following defects, confirmed in public issue trackers, directly affect write-scope governance in production multi-agent systems:

| System | Defect | Severity | Status |
|--------|--------|----------|--------|
| Claude Code v2.1.84 | `PreToolUse` returning `"ask"` silently overrides `permissions.deny` rules — critical security bypass[^12] | Critical | Open |
| Claude Code | Subagents via Task tool do not inherit `settings.json` allowlist[^19] | High | Open |
| Claude Code | `delegate` mode propagates restrictions to all spawned teammates[^6] | High | Open |
| Claude Code | Agent teams: teammate identity not exposed in PreToolUse hook payload[^14] | Medium | Open |
| OpenClaw | `tools.profile: "minimal"` exposes filesystem tools unless `deny: ["group:fs"]` explicitly added[^48] | High | Open |
| OpenClaw | No per-agent file path access control (only workspace-level isolation)[^23] | High | Feature request |
| AGENTS.md spec | No ratified structured `permissions:` block; enforcement is model-discretionary[^30] | Architectural | Open proposal |

***

## 10. Synthesis: Recommended Governance Architecture

A write-scope governance design for an eleven-agent orchestration system should layer mechanisms from structurally strongest to weakest, treating each layer as a defense-in-depth complement rather than a standalone solution:

1. **Filesystem isolation first**: Assign each write-capable execution agent (Codex, Gemini CLI, Grok CLI) its own git worktree via `isolation: worktree` in subagent frontmatter. The orchestrator (Claude Code in `delegate` mode — when the delegate bug is resolved) merges results.

2. **Tool-layer deny lists**: Encode write scope in subagent `tools:` frontmatter for read-only agents (Hermes analytics, web chat surfaces). Use `permissions.deny` in `managed-settings.json` for org-wide write prohibitions (secrets directories, constitutional config files).

3. **PreToolUse path guards**: Implement a hook that reads the calling agent's declared write zone from a central scope registry and returns `deny` with reason for out-of-zone writes. Audit hook behavior against the `ask`-overrides-deny defect until patched.

4. **CODEOWNERS + branch protection**: Map AGENTS.md-declared ownership zones to CODEOWNERS patterns. Enforce review for writes to the constitutional layer itself (`.claude/`, `AGENTS.md`, `managed-settings.json`, hook scripts).

5. **AGENTS.md as policy declaration**: Maintain module-level AGENTS.md files that declare write authority, kept as version-controlled ownership contracts. Changes require the same review as code changes.

6. **Cryptographic receipts for observability**: Implement AAR-pattern signing at the agent action level — minimally for Hermes Agent (learning runtime) since its writes to shared memory structures are the highest-risk mutation surface.

7. **Natural language as last-resort context**: Treat AGENTS.md behavioral instructions as advisory context that improves compliance probability, not as enforcement. Do not rely on prompt-based write restrictions for security properties.

---

## References

1. [Claude Code settings - Claude Code Docs](https://code.claude.com/docs/en/settings) - When the same setting is configured in multiple scopes, more specific scopes take precedence: Manage...

2. [Claude Code managed-settings.json Ultimate Guide](https://managed-settings.com) - The ultimate guide to settings.json or managed-settings.json claude code policy files, including a o...

3. [Configure server-managed settings (public beta) - Claude Code Docs](https://code.claude.com/docs/en/server-managed-settings) - Centrally configure Claude Code for your organization through server-delivered settings, without req...

4. [Claude code security: enterprise best practices & risk mitigation](https://www.mintmcp.com/blog/claude-code-security) - The managed-settings.json configuration file provides organization-wide policy enforcement that indi...

5. [Configure permissions | Claude Code Guide | Unofficial Claude ...](https://claudecode.jp/en/docs/claudecode/permissions)

6. [delegate mode breaks agent teams — teammates inherit restricted ...](https://github.com/anthropics/claude-code/issues/25037) - Delegate mode sets the lead's permissions to coordination-only tools. Since teammates inherit this, ...

7. [Configure permissions - Claude Code Docs](https://code.claude.com/docs/en/permissions) - Claude Code hooks provide a way to register custom shell commands to perform permission evaluation a...

8. [Claude Code Hooks: PreToolUse, PostToolUse & All 12 Events (2026)](https://www.pixelmojo.io/blogs/claude-code-hooks-production-quality-ci-cd-patterns) - The complete reference to Claude Code hooks. All 12 lifecycle events, three hook types, working exam...

9. [Claude Code Hooks: The Deterministic Control Layer for AI Agents](https://www.dotzlaw.com/insights/claude-hooks/) - A CLAUDE.md instruction says “always run the linter.” The agent usually complies. A PostToolUse hook...

10. [Intercept and control agent behavior with hooks - Claude API Docs](https://platform.claude.com/docs/en/agent-sdk/hooks) - Subagents do not automatically inherit parent agent permissions. To avoid repeated prompts, use PreT...

11. [Hook-Based Context Injection for Coding Agents : r/ClaudeCode](https://www.reddit.com/r/ClaudeCode/comments/1s15sdl/hookbased_context_injection_for_coding_agents/) - Been working on a hook-based system that injects domain-specific conventions into the context window...

12. [PreToolUse hook permissionDecision 'ask' silently overrides ...](https://github.com/anthropics/claude-code/issues/39344) - Any PreToolUse hook that returns "ask" for a command that matches a deny rule will cause the deny ru...

13. [Critical Security Bug: deny permissions in settings.json are ...](https://github.com/anthropics/claude-code/issues/6699) - Title: Critical Security Bug: deny permissions in settings.json are not enforced Labels: bug, securi...

14. [[FEATURE] Expose teammate identity in hook input and support per ...](https://github.com/anthropics/claude-code/issues/24505) - Agent teams spawn multiple independent Claude Code sessions that all inherit the lead's hook configu...

15. [Create custom subagents - Claude Code Docs](https://code.claude.com/docs/en/sub-agents) - Subagents inherit the permission context from the main conversation and can override the mode, excep...

16. [What are SubAgents in Claude Code? What You Need to Know](https://www.cometapi.com/what-are-subagents-in-claude-code/) - Sub-agents (often written subagents or sub-agents) are one of the clearest practical advances in age...

17. [Subagents - Claude Code Best Practice - Mintlify](https://www.mintlify.com/shanraisshan/claude-code-best-practice/concepts/subagents) - Custom agents with specialized tools, permissions, and models for task execution

18. [Configure permissions - Claude API Docs](https://platform.claude.com/docs/en/agent-sdk/permissions) - Control how your agent uses tools with permission modes, hooks, and declarative allow/deny rules.

19. [Subagent (Task tool) does not inherit permission allowlist ... - GitHub](https://github.com/anthropics/claude-code/issues/22665) - When using the Task tool to spawn a subagent, the child agent does not appear to inherit the permiss...

20. [AgentMD — Make Your Repository Agent-Ready](https://agentmd.online) - Parse, validate, and execute AGENTS.md files. The CI/CD platform for AI agents.

21. [The Agent-Native Repo: Why AGENTS.MD is the New ...](https://www.harness.io/blog/the-agent-native-repo-why-agents-md-is-the-new-standard) - Learn why AGENTS.md is becoming the standard for agent-native repositories and how it creates consis...

22. [Agents.md best practices · GitHub - Gist](https://gist.github.com/0xfauzi/7c8f65572930a21efa62623557d83f6e) - Start with a single AGENTS.md. When it exceeds 150-200 lines, split into subdirectories with nested ...

23. [Per-agent file path access control (allowlist/denylist) · Issue #12202](https://github.com/openclaw/openclaw/issues/12202) - Problem In multi-agent setups, all agents run as the same OS user and have unrestricted filesystem a...

24. [Using AI as an Agent Workspace Instead of Just a Chat](https://zenn.dev/imkohenauser/articles/agents-md-context-configuration?locale=en)

25. [Format Specification | openai/agents.md | DeepWiki](https://deepwiki.com/openai/agents.md/5.1-format-specification) - This document provides the technical specification for the AGENTS.md format, including file structur...

26. [A Complete Guide To AGENTS.md](https://www.aihero.dev/a-complete-guide-to-agents-md) - Learn how to optimize your AGENTS.md file for AI coding agents. Master progressive disclosure, keep ...

27. [Improve your AI code output with AGENTS.md (+ my best tips)](https://www.builder.io/blog/agents-md) - Stop re-prompting. Put the rules in AGENTS.md: do and don’ts, file-level tests, and real examples so...

28. [Things I learned trying to push Hermes-Agent to full autonomy](https://x.com/TAYL0RWTF/status/2033270984141320295) - In a monorepo, Hermes walks the entire directory tree and concatenates every AGENTS.md it finds, wit...

29. [OpenAI Codex — AGENTS.md Guide - The-Prompt-Shelf](https://thepromptshelf.dev/rules/codex-agents-md-guide/) - How Codex discovers and uses AGENTS.md files. Three-tier precedence (global → project → override), 3...

30. [Proposal: Structured Tool Permissions · Issue #105 - GitHub](https://github.com/agentsmd/agents.md/issues/105) - Introduce a permissions block in the YAML frontmatter of AGENTS.md files. This allows agent runners ...

31. [How to write a great agents.md: Lessons from over 2,500 repositories](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/) - Learn how to write effective agents.md files for GitHub Copilot with practical tips, real examples, ...

32. [Governance Layer Best Practices in GitHub](https://theaiops.blog/2025/07/07/GitHub-Governance/) - 1. Branch Protection Rules. Enable on Critical Branches: Protect main and release branches. Availabl...

33. [Managing a branch protection rule - GitHub Docs](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule) - You can create a branch protection rule to enforce certain workflows for one or more branches, such ...

34. [About code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners) - You can use a CODEOWNERS file to define individuals or teams that are responsible for code in a repo...

35. [A Comprehensive Guide to CODEOWNERS in GitHub](https://dev.to/eunice-js/a-comprehensive-guide-to-codeowners-in-github-22ga) - This article will provide an in-depth look at how to effectively use CODEOWNERS to streamline code r...

36. [GitHub enables multi-agent AI coding inside repository workflows](https://www.helpnetsecurity.com/2026/02/05/github-enables-coding-agents/) - GitHub enables coding agents letting developers run new AI tools like Copilot, Claude, and Codex ins...

37. [How Git Worktrees Let Claude Code Agents Run in True Isolation](https://dev.to/klement_gunndu/how-git-worktrees-let-claude-code-agents-run-in-true-isolation-1m4d) - How Claude Code's --worktree flag gives each AI agent its own isolated checkout — and why this matte...

38. [Effective Strategies for Asynchronous Software Engineering Agents](https://arxiv.org/html/2603.21489v1) - In Table 3.6, we compare the results of single-agent, multi-agent (CAID) with “worktree isolation” (...

39. [Git Worktrees & Subagent Delegation | Claude Code Guide](https://patrykgolabek.dev/guides/claude-code/worktrees/) - Parallelize development across isolated git worktree branches using built-in and custom subagents wi...

40. [Desktop App: Automatic Isolation](https://claudefa.st/blog/guide/development/worktree-guide) - Claude Fast | Use Claude Code git worktree support to run parallel AI sessions. Guide to the --workt...

41. [Claude Code Worktrees in 7 Minutes](https://www.youtube.com/watch?v=z_VI51k-tn0) - Anthropic has released Git Wortrees in Claude Code, bringing a feature previously available in the C...

42. [Running Multiple AI Agents on Same Codebase: A Code Structure ...](https://www.linkedin.com/posts/scott-paulin_people-keep-asking-me-how-i-run-4-to-5-ai-activity-7426338536448020480-9Tu6) - People keep asking me how I run 4 to 5 AI agents at the same time on the same codebase. No git workt...

43. [Using Git Worktrees for Multi-Feature Development with AI Agents](https://www.nrmitchi.com/2025/10/using-git-worktrees-for-multi-feature-development-with-ai-agents/) - When you create a worktree, Git: Creates a new directory for the working tree; Checks out the specif...

44. [OpenClaw multi-agent setup with multiple AI assistants - LumaDock](https://lumadock.com/tutorials/openclaw-multi-agent-setup) - Configure persistent agents, bindings and sub-agents in OpenClaw to run multiple assistants in one G...

45. [Multi-Agent Sandbox & Tools - OpenClaw Docs](https://docs.openclaw.ai/tools/multi-agent-sandbox-tools)

46. [OpenClaw Agent Configuration: Add, List & Manage Agents - 超智諮詢](https://www.meta-intelligence.tech/en/insight-openclaw-agent-setup) - Complete guide to OpenClaw agent config in 2026. Learn agents add, agents list, agent.md setup, mode...

47. [Agent Workspace - OpenClaw Docs](https://docs.openclaw.ai/concepts/agent-workspace) - The workspace is the agent's home. It is the only working directory used for file tools and for work...

48. [[Bug]: tools.profile: "minimal" exposes read/write/edit unless group:fs ...](https://github.com/openclaw/openclaw/issues/42165) - Steps to reproduce. Configure an agent with tools.profile: "minimal"; Do not allow group:fs or alsoA...

49. [Security | Hermes Agent - Nous Research](https://hermes-agent.nousresearch.com/docs/user-guide/security/) - This page covers every security boundary — from command approval to container isolation to user auth...

50. [Tips & Best Practices - Hermes Agent](https://hermes-agent.nousresearch.com/docs/guides/tips/) - When the agent triggers a dangerous command approval ( rm -rf , DROP TABLE , etc.), you get four opt...

51. [Skills System | Hermes Agent - Nous Research](https://hermes-agent.nousresearch.com/docs/user-guide/features/skills/) - The agent can create, update, and delete its own skills via the skill_manage tool. This is the agent...

52. [Agent Skill Trust & Signing Service - by Ken Huang](https://kenhuangus.substack.com/p/agent-skill-trust-and-signing-service) - Skills give AI agents superpowers. They also give attackers a backdoor straight into your filesystem...

53. [How to add trust boundaries to your multi-agent system](https://dev.to/jnycode/how-to-add-trust-boundaries-to-your-multi-agent-system-gic) - MCP handles tool access. But none of them answer the delegation trust question: when Agent A hands a...

54. [Feature: Cryptographic action receipts for multi-agent crew audit trails](https://github.com/crewAIInc/crewAI/issues/4754) - What inputs each agent received; What outputs each agent produced; Whether any output was tampered w...

55. [[PDF] Provable Observability and Lightweight Audit Agents for Controlling ...](https://arxiv.org/pdf/2512.17259.pdf) - Each receipt is a compact, tamper-proof record summarizing the action's essential de- tails. These r...

56. [Feature: Verifiable action receipts for multi-agent software company ...](https://github.com/FoundationAgents/MetaGPT/issues/1958) - Each role's output gets a signed receipt with SHA-256 content hashes; Receipt chain = complete audit...

57. [awesome-agentic-patterns/patterns/zero-trust-agent-mesh.md at main](https://github.com/nibzard/awesome-agentic-patterns/blob/main/patterns/zero-trust-agent-mesh.md) - Problem. In multi-agent systems, trust boundaries are often implicit: agents communicate by conventi...

58. [Zero Trust Architecture - OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/cheatsheets/Zero_Trust_Architecture_Cheat_Sheet.html) - Zero Trust means "never trust, always verify" - you don't trust anyone or anything by default, even ...

59. [LLM Constitutional Multi-Agent Governance](https://arxiv.org/html/2603.13189v1)

60. [AI agent governance: a practical guide to risk, trust, and compliance](https://www.kore.ai/blog/ai-agent-governance-a-practical-guide) - AI agent governance refers to the set of structures, both organizational and technical, that enable ...

