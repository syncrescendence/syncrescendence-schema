# Skill Promotion Ladders in Self-Improving AI Agent Systems

## Executive Summary

No single production system among Hermes Agent, DeerFlow, Claude Code AutoMemory, or OpenViking implements a fully explicit four-stage promotion ladder (observed pattern → candidate skill → validated skill → authorized/active skill) with hard gates between every level. Instead, each system collapses or skips stages in ways that create distinct governance risk profiles. The most complete promotion architecture found in the surrounding ecosystem is AceForge, an OpenClaw plugin explicitly designed as a skill lifecycle engine with 12 stages, maturity tiers, dual-model validation, and mandatory human approval. The four systems under review vary enormously: Hermes Agent writes agent-created skills directly to the active directory with no human approval gate; DeerFlow uses skills only as authored inputs, never auto-generating them from behavior; Claude Code AutoMemory can silently override authored project rules; and OpenViking advertises git-like versioning without publishing the specific promotion gates. This report maps what each system actually does, what gates exist, and what the shadow governance risk is at each stage.

***

## Background: The Skill Promotion Problem

In a self-improving AI agent system, "promotion" refers to the path a learned behavior must travel before it gains authority to influence future agent actions at scale. The canonical four-stage model is:

1. **Observed pattern** — the system detects a recurring tool-call sequence, correction, or successful workflow during execution.
2. **Candidate skill** — the pattern is materialized as a draft artifact (typically a SKILL.md file or memory entry) but not yet deployed.
3. **Validated skill** — the draft is evaluated against quality, security, and behavioral criteria.
4. **Authorized/active skill** — the artifact is committed to the active skill directory or memory layer and becomes available to influence future runs.

Without explicit gates between these stages, learned behaviors can accumulate governance authority (shaping future agent decisions) without any human having reviewed or authorized them — the definition of **shadow governance**. This is structurally analogous to shadow IT, but with higher stakes because the "rules" live inside the agent's context rather than in a visible IT inventory.[^1][^2]

***

## The agentskills.io Open Standard (Substrate for All Four Systems)

All four systems use variants of the **Agent Skills open standard**, originally developed by Anthropic and published in December 2025. A skill is a folder containing a `SKILL.md` file with YAML frontmatter (name, description, version, metadata) and Markdown instructions. Progressive disclosure is the core architectural primitive: at the **Discovery** tier (~50 tokens), only the name and description load; at the **Activation** tier (~500–5,000 tokens), the full instruction body loads; and at the **Execution** tier (2,000+ tokens), bundled scripts and reference files load on demand.[^3][^4][^5]

The standard explicitly delegates governance to the host system: "Skills are plain text files in your Git repository. Review changes in pull requests, track history, roll back, require approval." The spec itself has no built-in promotion ladder, no approval hook, and no rollback mechanism — these are implementation responsibilities. This means the governance strength of any particular system is entirely a product of how each vendor layers authority controls on top of the common format.[^5][^3]

The open standard is adopted by 30+ agent products as of early 2026, including OpenAI Codex, GitHub Copilot, VS Code, Cursor, Gemini CLI, and LM-Kit.NET. Skills directories differ by platform: `.claude/skills/` for Claude Code, `.agents/skills/` for Codex, `~/.openclaw/skills/` for OpenClaw, `~/.hermes/skills/` for Hermes.[^6][^4]

***

## Hermes Agent (NousResearch)

### Architecture

Hermes Agent is described as "the only agent with a built-in learning loop — it creates skills from experience, improves them during use, nudges itself to persist knowledge, and builds a deepening model of who you are across sessions." The learning runtime runs on Hermes-3 (Llama 3.1–based), fine-tuned with the Atropos RL framework for tool-calling accuracy and long-range planning.[^7][^8]

The persistent memory hierarchy uses Full-Text Search (FTS5) with LLM summarization for cross-session recall, combining procedural memory (Skill Documents) with a Honcho dialectic user model. All skills live in `~/.hermes/skills/` as the single source of truth, with external directories configurable as read-only scan targets.[^8][^9]

### Promotion Stages: What Actually Happens

**Observed pattern → Candidate:** The agent triggers skill creation after completing a complex task (5+ tool calls) successfully, after navigating errors to find a working path, after the user corrects the agent's approach, or after discovering a non-trivial workflow. There is no threshold count or frequency filter — a single successful complex task can produce a new skill proposal.[^9]

**Candidate → Active (no validation gate):** The agent uses the `skill_manage` tool with actions `create`, `patch`, `edit`, or `delete`. When the agent creates a skill, it **writes directly to `~/.hermes/skills/`** — the active directory. There is no intermediate quarantine for agent-created skills, no mandatory quality score, and no human approval step in the documented workflow.[^10][^9]

**Hub-installed skills (different path):** Skills installed from external registries (skills.sh, ClawHub, LobeHub, GitHub repos) go through a security scanner that checks for data exfiltration, prompt injection, destructive commands, and supply-chain signals. Trust tiers are: `builtin` (ships with Hermes) > `official` (optional-skills/ in repo) > `trusted` (openai/skills, anthropics/skills) > `community` (everything else). The `--force` flag can override non-dangerous policy blocks but **cannot override a `dangerous` verdict**. A `.hub/quarantine/` directory and `.hub/audit.log` exist within the skills directory structure.[^9]

### Versioning and Rollback

SKILL.md supports a `version` field in the YAML frontmatter metadata map. `hermes skills check` reports which hub-installed skills changed upstream; `hermes skills update` reinstalls changed skills. For **agent-created** skills, however, no documented version history or rollback mechanism exists. The `patch` action is preferred for updates (more token-efficient than `edit`), but no prior version is archived before overwrite.[^5][^9]

The `hermes skills snapshot export` command exports current skill configuration, and `hermes skills tap add` adds custom GitHub sources, but these address distribution rather than rollback.[^9]

### Shadow Governance Risk

The central risk is that the agent can modify or delete any skill autonomously. A skill the agent writes based on a single session's pattern immediately becomes an active instruction that shapes all future behavior in that domain. If the pattern was learned from a corrupted task, an adversarial input, or a user correction that was itself incorrect, the erroneous behavior becomes persistent with no review barrier.[^10][^9]

The external read-only directory feature offers a partial mitigation: if the organization keeps a governance-controlled skills repo mounted as an external directory, locally authored agent skills shadow it by local precedence, but the external directory cannot be overwritten by the agent. This creates a two-tier system: governed external skills + ungoverned local agent-created skills.[^9]

***

## DeerFlow (ByteDance)

### Architecture

DeerFlow 2.0, released February 27, 2026, is a "super agent harness" built on LangGraph that orchestrates sub-agents, memory, and sandboxes through extensible skills. The primary orchestrator plans, delegates, and monitors sub-agents; each sub-agent receives a trimmed context window, executes its task, and returns structured results. Memory updates happen asynchronously through a debounced queue.[^11][^12][^13]

### Promotion Stages: What Actually Happens

DeerFlow has **no documented mechanism for auto-generating skills from agent behavior**. Skills are manually authored Markdown files placed in the `skills/` folder. This represents a deliberate architectural choice: DeerFlow treats skills as authored inputs to the system, not outputs of the system's self-learning. The long-term memory module stores user preferences and accumulated knowledge in a vector database, but this memory is not materialized into SKILL.md artifacts.[^14][^12][^13][^11]

**Observed pattern → None:** No automatic detection or crystallization of recurring patterns into skill candidates.

**Candidate → Validation:** Users or developers write SKILL.md files and add them to the skills directory. There is no built-in validation pipeline for contributed skills.

**Skills are loaded progressively** — only when the task needs them, not at startup. This keeps the context window lean and avoids bloating the orchestrator's context with irrelevant capabilities.[^14][^11]

### Versioning

Skills are plain SKILL.md files in the repository, meaning Git history natively versions them. DeerFlow's TIAMAT cloud memory backend suggests ByteDance is moving toward enterprise-scale memory persistence, but specifics about version control of that memory layer are not publicly documented.[^12]

A known open issue requests "Named projects" and "Project history / timeline" — a first-class project abstraction that persists across sessions — indicating that cross-session skill evolution is considered future work rather than a current feature.[^15]

### Shadow Governance Risk

Because DeerFlow does not auto-generate skills, the shadow governance risk is lower at the skill layer. The main risk is the **long-term memory module**: it stores preferences, writing styles, and recurring workflows in a vector database with configurable retention policies. If this memory layer influences orchestrator behavior without an explicit approval gate, behavioral drift can accumulate across sessions without being captured in any versioned artifact. The memory is stored locally and stated to stay "under your control," but the mechanism for reviewing or rolling back memory state is not documented.[^13][^14]

A secondary concern is **ByteDance provenance**. Organizational policy in some sectors triggers additional review for software from this source, independent of any technical concern about the code itself.[^16][^12]

***

## Claude Code AutoMemory

### Architecture

Claude Code has two complementary memory systems loaded at the start of every conversation:[^17]

- **CLAUDE.md files**: Instructions written by the developer or operator. Scoped at project (committed to version control), user (global, not versioned), and local levels.
- **Auto memory**: Notes Claude writes itself based on corrections and preferences, stored in `~/.claude/projects/.../memory/`.

| Level | File | Scope | Versioned | Priority |
|-------|------|-------|-----------|----------|
| 1 | `./CLAUDE.md` | Project (team) | Yes | High |
| 2 | `~/.claude/CLAUDE.md` | User | No | Medium |
| 3 | `~/.claude/projects/.../memory/` | Project + user (auto) | No | Low |

[^18]

### Promotion Stages: What Actually Happens

**Observed pattern → Candidate:** Claude identifies implicit rules from two signals: (a) the user correcting a Claude Code behavior, and (b) a recurring pattern applied multiple times. The implicit criteria the agent applies are recurrence, non-obviousness, stability, and project specificity.[^19]

**Candidate → Active (minimal gate):** The agent checks whether MEMORY.md already contains the information. If not, it adds a concise entry. There is no quality score, no human approval prompt, and no security scan. The agent does have documented restraints from its system prompt: it avoids writing negative judgments about the user, and the system prompt contains more text about restraining memory usage than enabling it.[^20][^18]

Claude Code documents explicit categories of things it should **not** save: ephemeral task details, information the user asked to remember within a session but not permanently, and anything that would duplicate existing CLAUDE.md content.[^20]

**Conflict resolution:** "In case of contradiction, the last loaded instruction prevails. Auto-memory can therefore technically override a project rule." This is a documented governance vulnerability: a bad auto-memory entry can silently override team-authored project conventions. In practice, 62% of memory problems originate from MEMORY.md containing outdated information that overrides a project CLAUDE.md rule.[^18]

### Versioning and Rollback

The project `./CLAUDE.md` is committed to version control and can be rolled back via Git. Auto-memory files are **not versioned** by default. The `/memory` command lists all CLAUDE.md and rules files loaded in the current session, lets the user toggle auto-memory on or off, and provides a link to open the auto-memory folder. Users can disable auto-memory entirely and manage CLAUDE.md manually.[^17][^18]

Subagents can also maintain their own auto memory, which compounds the governance surface: in a multi-agent Claude Code setup, each subagent may be independently accumulating unreviewed behavioral modifications.[^17]

### Shadow Governance Risk

The core risk is the **authority inversion gap**: CLAUDE.md instructions are described as shaping Claude's behavior but "are not a hard enforcement layer." Settings rules are enforced by the client; CLAUDE.md instructions are context fed to the model, not contractual constraints. This means auto-memory entries (which carry no more formal authority than CLAUDE.md instructions) can in practice override them if loaded later in the context window.[^18][^17]

In a constitutional grammar architecture, this creates a critical weakness: if the constitutional rules are delivered via CLAUDE.md, and auto-memory subsequently modifies the agent's implicit understanding of how to apply those rules, the constitution can be eroded without any explicit override event.

Mitigation paths include: (a) auditing MEMORY.md files periodically using `/memory`, (b) placing high-priority constitutional rules early in the context window or in enforced Settings rules rather than CLAUDE.md, and (c) turning off auto-memory for agents where behavioral stability is a governance requirement.

***

## OpenViking (volcengine/ByteDance)

### Architecture

OpenViking is an open-source context database initiated and maintained by ByteDance's Volcano Engine Viking team. It provides a filesystem paradigm for organizing agent context into three primary namespaces:[^21][^22]

- `viking://user/memories/` — user experiences
- `viking://agent/skills/` — agent capabilities
- `viking://resources/` — data assets

The full URI scheme supports session, queue, and temp scopes as well. Tiered loading uses three levels: L0 (~100 tokens, one-line summary), L1 (~2K tokens, key details), and L2 (full context, loaded only when needed). This is functionally identical to the agentskills.io progressive disclosure model but applied to all context types, not just skills.[^23][^24][^25]

### Promotion Stages: What Actually Happens

OpenViking's session directory structure includes a `checkpoints/` subdirectory and a `summaries/` subdirectory, with the agent described as "self-evolving by extracting learnings at the end of every session". Media coverage describes "git-like versioning" where "previous states are recoverable and every update is auditable," but the OpenViking public documentation does not specify the formal promotion gates or authorization steps for moving a skill from session-extracted candidate to `viking://agent/skills/` permanent storage.[^26][^24][^25]

**What is confirmed:**
- Session checkpoints exist and provide snapshot versioning[^25]
- Auto-session management is a documented feature[^26]
- Skills are addressed at `viking://agent/skills/` path[^22]
- The system "learns from every conversation automatically, improving over time without retraining"[^23]

**What is not confirmed:**
No public documentation specifies (a) what criteria trigger promotion of a session-extracted learning into permanent `agent/skills/`, (b) whether a human approval step exists between session extraction and persistence, or (c) the exact rollback mechanism beyond the session checkpoint structure.

OpenViking is also positioned as a context store for other agents rather than as a standalone agent runtime. AceForge, for instance, explicitly integrates with OpenViking for "context-enriched challenge generation" in its skill validation pipeline.[^27]

### Versioning and Rollback

The `checkpoints/` and `summaries/` directories within each session provide version snapshots and compression history. The git-like versioning claim from LinkedIn coverage suggests recoverable prior states, and a developer commentary notes that "in regulated industries, that's often the difference between a demo and a production deployment." However, the rollback mechanism's specific commands or API are not documented in publicly available sources.[^25][^26]

### Shadow Governance Risk

The self-learning capability — "the system learns from every conversation automatically, improving over time without retraining" — is OpenViking's principal governance surface. If this learning path deposits data into `viking://agent/skills/` without a human review gate, every conversation becomes a potential vector for behavioral modification.[^22][^23]

The filesystem paradigm itself is a governance asset: it makes context navigable and debuggable, and the tiered loading means operators can inspect L0 summaries of skill state without loading full content. The deterministic path-based retrieval also enables audit logs and policy enforcement at the filesystem access layer in ways that traditional vector search does not.[^28][^26]

***

## AceForge: The Reference Architecture for Skill Promotion Ladders

AceForge is an OpenClaw plugin explicitly designed as a skill generation and lifecycle engine. While not one of the four systems under analysis, it represents the most complete published implementation of the promotion ladder model and integrates directly with OpenViking. It is included here as an architectural reference point.[^27]

### The 12-Stage Pipeline

```
1. Observe → 2. Detect → 3. Generate → 4. Validate → 5. Score → 6. Approve
→ 7. Deploy → 8. Evolve → 9. Retire → 10. Propagate → 11. Compose → 12. Validate
```


**Observed pattern** corresponds to Stage 1–2: every tool call is logged with full context (arguments, results, success/failure, timing, corrections). A tool must cross a crystallization threshold — 3x occurrences, escalating to 5x at 20+ deployed skills — before becoming a generation candidate.[^27]

**Candidate skill** corresponds to Stage 3: a dual-model LLM pipeline (Generator LLM writes the SKILL.md from trace data; Reviewer LLM critiques it with structured criteria — APPROVE / REVISE / REJECT) produces the draft.[^27]

**Validated skill** corresponds to Stage 4–5: a 23-attack security validator runs before the human ever sees the proposal (checks for prompt injection, credential exfiltration, path traversal, SOUL.md/MEMORY.md write attacks, etc.). A quality score (0–100) is computed, and skills scoring below 40 auto-trigger an upgrade proposal; the 40–70 zone uses an LLM judge; above 70 is left alone.[^27]

**Authorized/active skill** corresponds to Stage 6–7: human explicit approval via `/forge approve <n>`. Nothing deploys without the human's say-so — with one bounded exception: correction-driven micro-revisions (anti-pattern appends, instruction notes) self-apply without approval; full rewrites always require approval.[^27]

### Maturity Tiers

Skills progress through: **Proposed → Deployed → Committed** (50+ activations, 75%+ success rate, 14+ days since deployment) → **Mature**. Apoptosis detection flags skills with sustained low activation or degraded success rates for retirement.[^27]

### Versioning and Rollback

Every event — deploy, upgrade, micro-revision, rollback, retire, reinstate — is recorded with the full SKILL.md content. `/forge history` shows the timeline; `/forge diff` computes a unified diff between versions using a zero-dependency LCS-based engine. Rollback safety requires retired versions to pass validation before the active version is deleted.[^27]

***

## System Comparison: Promotion Stages

| Dimension | Hermes Agent | DeerFlow | Claude AutoMemory | OpenViking | AceForge (reference) |
|-----------|-------------|----------|------------------|------------|---------------------|
| **Auto-generates skills from behavior** | Yes | No | Yes (memory entries) | Yes (session learning) | Yes |
| **Crystallization threshold** | 1 complex task (5+ tool calls) | N/A | Recurring pattern or correction | Undocumented | 3x occurrences (5x at 20+ skills) |
| **Intermediate candidate stage** | No (writes directly active) | N/A (manual) | Check for duplicates only | Undocumented | Yes — pending proposals queue |
| **Security/quality gate** | Hub installs only | N/A | None | Undocumented | 23-attack validator + quality scoring |
| **Human approval gate** | None for agent-created skills | N/A | None | Undocumented | Mandatory (except micro-revisions) |
| **Versioning of auto-learned skills** | No documented rollback | Git (manual) | No (auto-memory unversioned) | Session checkpoints | Full version history per skill |
| **Rollback mechanism** | Hub: reinstall prior; Agent-created: none documented | Git revert | Toggle off; manual delete | Undocumented | `/forge rollback` with validation |
| **Maturity tiers** | Trust levels (builtin/official/trusted/community) | None | CLAUDE.md > auto-memory priority | None documented | Proposed → Deployed → Committed → Mature |

[^14][^25][^17][^9][^27]

***

## Gates Between Levels: Cross-System Analysis

### Gate 1: Observation → Candidate

The weakest gate in most systems. Hermes activates after a single successful complex task. Claude AutoMemory activates on recurring pattern or first user correction. AceForge requires a crystallization threshold with escalating counts. DeerFlow has no auto-observation. The threshold design matters: a too-low threshold produces false positives (low-signal patterns crystallized into permanent procedures); a too-high threshold misses genuinely novel patterns worth preserving.[^14][^18][^9][^27]

### Gate 2: Candidate → Validated

Hermes provides a full security scan for hub-installed skills but **nothing** for agent-created skills. Claude AutoMemory has no validation gate — the agent checks for duplicates and adds the entry. AceForge runs a 23-attack security validator before the proposal is even surfaced to the human. OpenViking's gate at this stage is undocumented.[^18][^9][^27]

For constitutional grammar systems, this gate is where **prompt injection prevention** becomes critical. A corrupted task trace can produce a SKILL.md containing embedded instructions that hijack future agent behavior. AceForge detects this with adversarial mutation testing (23/23 variants caught); Hermes only applies this to hub installs; Claude AutoMemory has no comparable check.[^27]

### Gate 3: Validated → Authorized

The most important governance gate. AceForge requires explicit human approval (`/forge approve <n>`) for all full deployments. Hermes has **no human approval gate** for agent-created skills. Claude AutoMemory has **no human approval gate** for auto-memory. OpenViking's authorization model for `viking://agent/skills/` promotion is undocumented.[^25][^18][^9][^27]

This gap is the principal source of shadow governance risk. A behavior the agent learned from a single session, a hallucinated correction, or an adversarially crafted input can become permanent system instructions without any human review event in the Hermes and Claude AutoMemory architectures.

***

## Versioning, Rollback, and the Audit Trail

Across all four systems, the versioning model for **authored** artifacts (CLAUDE.md, DeerFlow SKILL.md) is well-handled by Git. The governance gap is uniformly in **agent-generated** artifacts:[^3]

- Claude AutoMemory files are not versioned[^18]
- Hermes agent-created skills have no documented version archive[^9]
- OpenViking session checkpoints exist but rollback commands are not publicly documented[^25]

The Milvus engineering blog identifies the principle: "every component of a Skill — its code, configuration files, prompt templates, and any associated models or data — should be meticulously versioned in a VCS like Git. When a new Skill version is deployed, the deployment pipeline should retain access to previous stable versions." This principle is met by AceForge's per-event version recording and by Git-based SKILL.md management, but it is not met by auto-memory or agent-created skills in the four primary systems.[^29]

For multi-agent systems where a shared GitHub repository is the coordination substrate, the practical governance approach is: **require all SKILL.md changes (including those proposed by agents) to be committed as PRs with a required human review**. This converts the git history into an append-only audit log and the PR review into the mandatory Gate 3. Agent proposals become PRs; human approval merges them.[^30][^3]

***

## Preventing Shadow Governance

Shadow governance occurs when learned behaviors accumulate decision-making authority over future agent actions without having passed through the constitutional review layer. Seven categories of prevention apply across these systems:[^31][^1]

**1. Read-only external directories.** Hermes supports external dirs scanned for discovery but never written to. This creates a governance-controlled tier where sanctioned skills live, while agent-created skills occupy a separate, auditable local directory.[^9]

**2. Constitutional CLAUDE.md as enforced settings.** The distinction between `CLAUDE.md` instructions (behavioral shaping, context-level) and **Settings rules** (client-enforced, not context-level) is critical for constitutional grammar architectures. Rules that must not be overridable by auto-memory should be placed in Settings rules, not CLAUDE.md.[^17]

**3. Trust tier enforcement.** Hermes's trust tier system (builtin > official > trusted > community) with `--force` overrides blocked for `dangerous` verdicts establishes a verification chain for external skills. Applied to a multi-agent system: orchestrator-approved skills carry a higher trust tier than agent-generated skills.[^9]

**4. Mandatory approval gates.** The AceForge model demonstrates that human approval can be structurally enforced at Stage 6 without becoming a bottleneck — automated pre-screening (security validator, quality scoring, dual-model review) handles the high-volume filtering, leaving humans to review only proposals that pass automated gates.[^27]

**5. Version immutability and rollback safety.** Append-only version history (where every version is archived before being superseded) combined with validation-before-delete prevents rollback from becoming a governance bypass.[^29][^27]

**6. Structural Limitation Kernels (SLK).** The AI Governance OS constitutional model proposes that the SLK "constrains system architecture itself" — specifically preventing escalation of operational scope beyond defined limits and blocking architectural modifications that weaken constraints. For skill systems, this translates to: skills cannot modify their own trust tier, skills cannot write to protected identity or memory files, and skills cannot authorize other skills.[^31]

**7. Behavioral monitoring and circuit breakers.** Google Cloud's agentic AI governance guidance recommends "infer and interrupt" monitoring that detects behavioral patterns and triggers automatic halts across multi-agent systems. For skill systems: if a newly deployed skill produces a statistical deviation in agent behavior (unexpected tool call patterns, new external endpoints contacted), the skill should be automatically suspended pending review.[^1]

***

## Contradiction: Autonomy vs. Safety in Self-Improvement

The four systems reveal an unresolved tension. Hermes Agent's design philosophy — "creates skills from experience, improves them during use, nudges itself to persist knowledge" — maximizes learning velocity by removing friction from the observation→active path. Claude AutoMemory's design explicitly acknowledges that auto-memory can override project rules and treats this as an acceptable trade-off for reducing manual documentation burden.[^8][^18]

The contrasting view, represented by AceForge, holds that "Nothing deploys without your say-so" is the correct default, with bounded exceptions for micro-revisions. AceForge cites SkillsBench research finding that "16 of 84 benchmark tasks showed **negative performance** from poor skills" — meaning an ungated skill library can actively harm agent performance, not just fail to improve it.[^27]

Neither position is universally correct. The right default depends on the trust boundary of the agent. For agents operating inside low-stakes personal workflows (Hermes on a personal VPS), immediate skill persistence with retrospective review may be acceptable. For agents operating with authority over shared codebases, organizational data, or multi-agent coordination contracts, every behavioral modification should traverse an explicit approval gate before acquiring active status.[^32]

For the multi-agent system described in this query — where a constitutional grammar layer governs eleven agents coordinated through a shared GitHub repository — the appropriate default is the AceForge model: observation and candidate generation are automated; validation and authorization require traversal of the constitutional layer. Agent-generated SKILL.md proposals should be treated as PRs against the constitutional repository and must be merged (approved) before they gain active status in any agent's skill directory.

***

## Conclusion

The four systems — Hermes Agent, DeerFlow, Claude Code AutoMemory, and OpenViking — do not uniformly implement explicit promotion ladders. Hermes collapses the observation→active path for agent-created skills; DeerFlow has no auto-generation; Claude AutoMemory has authority-inversion risk between auto-memory and authored project rules; OpenViking's promotion gates are not publicly documented.

For a constitutional AI orchestration system entering operational constitution, the recommended posture synthesizes these findings:

- Treat all agent-generated SKILL.md artifacts as **proposals**, not deployments, until explicitly authorized via the constitutional governance layer.
- Maintain authored CLAUDE.md / SKILL.md files in the shared GitHub repository as the **ground truth** for agent behavior; auto-memory and session-extracted skills are candidates subject to review.
- Apply Gate 3 (human or constitutional approval) structurally, not probabilistically — use Settings rules rather than CLAUDE.md instructions for behavioral constraints that must not be overridable.
- Implement append-only version history for all agent-generated artifacts, with rollback requiring validation before the prior version is deleted.
- Treat the gap between auto-memory's ability to override CLAUDE.md rules and the constitutional grammar layer's authority as the most acute shadow governance risk in the current toolchain.[^18]

---

## References

1. [These 4 AI governance tips help counter shadow agents](https://cloud.google.com/transform/these-4-ai-governance-tips-help-counter-shadow-agents) - It's not easy to stop employees from using shadow agents, but these 4 tips on robust AI governance c...

2. [Shadow AI is the New Shadow IT: Why Governance Can't Wait](https://www.avepoint.com/shifthappens/blog/shadow-ai-governance-risks-strategies) - Explore the rise of Shadow AI, its risks, and why proactive governance is vital for balancing innova...

3. [Turn Any Agent Into an On-Demand Specialist with SKILL.md - LM-Kit](https://lm-kit.com/blog/agent-skills-explained/) - Version control and governance. Skills are plain text files in your Git repository. Review changes i...

4. [Agent Skills: A Portable Format for Teaching AI Agents How to Work](https://ylanglabs.com/blogs/agent-skills) - Agent Skills are a portable, version-controlled format for packaging domain expertise that agents lo...

5. [Specification - Agent Skills](https://agentskills.io/specification) - SKILL.md format. The SKILL.md file must contain YAML frontmatter followed by Markdown content.

6. [skill-creator - LobeHub](https://lobehub.com/en/skills/volcengine-openviking-skill-creator)

7. [Nous Research Releases 'Hermes Agent' to Fix AI Forgetfulness ...](https://www.marktechpost.com/2026/02/26/nous-research-releases-hermes-agent-to-fix-ai-forgetfulness-with-multi-level-memory-and-dedicated-remote-terminal-access-support/) - Nous Research Releases 'Hermes Agent' to Fix AI Forgetfulness with Multi-Level Memory and Dedicated ...

8. [Hermes Agent Documentation - Nous Research](https://hermes-agent.nousresearch.com/docs/) - The self-improving AI agent built by Nous Research. A built-in learning loop that creates skills fro...

9. [Skills System | Hermes Agent - Nous Research](https://hermes-agent.nousresearch.com/docs/user-guide/features/skills/) - Skills are on-demand knowledge documents the agent can load when needed. They follow a progressive d...

10. [Hermes Agent memory/learning - I don't get it : r/LocalLLaMA - Reddit](https://www.reddit.com/r/LocalLLaMA/comments/1s43ts3/hermes_agent_memorylearning_i_dont_get_it/) - These agents still fail a lot, they overthink, retry constantly, and can burn tokens fast if you're ...

11. [DeerFlow: ByteDance Open Source SuperAgent Harness](https://jimmysong.io/ai/deer-flow/) - DeerFlow is an open-source SuperAgent harness from ByteDance that handles different levels of tasks ...

12. [DeerFlow 2.0: What It Is, How It Works, and Why Developers Should ...](https://dev.to/arshtechpro/deerflow-20-what-it-is-how-it-works-and-why-developers-should-pay-attention-3ip3) - DeerFlow started as an internal deep-research framework at ByteDance, essentially a tool for automat...

13. [ByteDance DeerFlow 2.0: Next-Gen Agent Orchestration Framework](https://www.aicerts.ai/news/bytedance-deerflow-2-0-next-gen-agent-orchestration-framework/) - Discover how DeerFlow 2.0 elevates Agent Orchestration with multi-agent planning, sandboxed executio...

14. [README.md - bytedance/deer-flow - GitHub](https://github.com/bytedance/deer-flow/blob/main/README.md) - An open-source SuperAgent harness that researches, codes, and creates. With the help of sandboxes, m...

15. [Project-based workflows for long-running, iterative tasks ... - GitHub](https://github.com/bytedance/deer-flow/issues/1114) - Building a production-ready app end-to-end with DeerFlow: Day 1: Plan architecture, scaffold project...

16. [What is DeerFlow 2.0 and what should enterprises know about this ...](https://venturebeat.com/orchestration/what-is-deerflow-and-what-should-enterprises-know-about-this-new-local-ai) - DeerFlow 2.0 is designed for high-complexity, long-horizon tasks that require autonomous orchestrati...

17. [How Claude remembers your project - Claude Code Docs](https://code.claude.com/docs/en/memory) - Use CLAUDE.md files when you want to guide Claude's behavior. Auto memory lets Claude learn from you...

18. [The CLAUDE.md Memory System - Deep Dive - SFEIR Institute](https://institute.sfeir.com/en/claude-code/claude-code-memory-system-claude-md/deep-dive/) - CLAUDE.md is a Markdown configuration memory file that Claude Code automatically loads at the start ...

19. [What Is Claude Code Auto-Memory? How Your AI Agent Learns ...](https://www.mindstudio.ai/blog/what-is-claude-code-auto-memory) - Claude Code's auto-memory feature lets the agent accumulate knowledge across sessions without manual...

20. [Claude Code's Memory Model | Raj Rajhans](https://rajrajhans.com/2026/03/claude-codes-memory-model/) - I've found that reading Claude Code's system prompt has now become a hobby of sorts. There's so much...

21. [OpenViking/docs/en/about/01-about-us.md at main - GitHub](https://github.com/volcengine/OpenViking/blob/main/docs/en/about/01-about-us.md) - OpenViking unifies the management of context (memory, resources, and skills) that Agents need throug...

22. [Bytedance open sources ai memory database - Facebook](https://www.facebook.com/groups/1364459958209699/posts/1608061670516192/) - ByteDance just open sourced a "brain" for AI agents. It's called OpenViking. A database that gives a...

23. [ByteDance just open-sourced a “memory layer” for AI agents. It's ...](https://www.facebook.com/thanhhm/posts/-bytedance-just-open-sourced-a-memory-layer-for-ai-agentsits-called-openviking-a/10164646794643126/) - It's called OpenViking — a database designed to give agents persistent memory, reusable skills, and ...

24. [Fixed the issue with the AI agent memory. Open-sourced ... - Facebook](https://www.facebook.com/0xSojalSec/posts/fixed-the-issue-with-the-ai-agent-memoryopen-sourced-openviking-a-framework-that/1469169491404116/) - Fixed the issue with the AI agent memory. Open-sourced OpenViking, a framework that treats context l...

25. [OpenViking/docs/en/concepts/04-viking-uri.md at main - GitHub](https://github.com/volcengine/OpenViking/blob/main/docs/en/concepts/04-viking-uri.md) - OpenViking unifies the management of context (memory, resources, and skills) that Agents need throug...

26. [Volcengine Launches OpenViking Context Database for AI Agents](https://www.linkedin.com/posts/thenextgentechinsider_volcengine-openviking-contextdatabase-activity-7439354094810591232-aAmM) - With visualized retrieval paths and auto-session management, it delivers smarter, more transparent l...

27. [Aceforge · Plugins - ClawHub](https://clawhub.ai/plugins/aceforge) - Every proposed skill, upgrade, and retirement requires human approval. Not a context engine. Compati...

28. [Document AI Shifts to Stateful Interactions with Gemini API - LinkedIn](https://www.linkedin.com/posts/anujsadani_ai-genai-gemini-activity-7431888128174379008-5VhH) - Instead of treating context like flat chunks in a vector database, OpenViking organizes memory, reso...

29. [How do I roll back a broken Skill deployment? - Milvus](https://milvus.io/ai-quick-reference/how-do-i-roll-back-a-broken-skill-deployment) - The primary mechanisms for rolling back a Skill deployment include leveraging version control system...

30. [CI/CD for Skills: Branching, Approvals, and Safe Rollouts - Skywork.ai](https://skywork.ai/blog/ai-agent/ci-cd-best-practices-skills-branching-approvals-rollouts/) - Expert guide to CI/CD best practices for skills: actionable branching models, approval workflows, an...

31. [[PDF] AI Governance OS — Full Constitutional Version - PhilArchive](https://philarchive.org/archive/LEEAGO-3)

32. [Imagine an AI that learns from every conversation, refines its skills ...](https://www.instagram.com/p/DWOyY9bDmAS/) - Hermes, the self‑improving agent from NousResearch, runs on a $5 VPS, works via Telegram, and lets y...

