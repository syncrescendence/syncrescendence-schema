# Agentic Coding Harness Primitive Taxonomy
### Unified & Platform-Idiosyncratic Analysis Across Six Systems
*Triangulated from directives for: Aider · Claude Code · Gemini CLI · OpenAI Codex · OpenClaw · OpenHands*

---

## Section 1: Unified Primitives
*Primitives present across five or more of the six platforms, constituting the emergent consensus architecture of agentic coding harnesses as of March 2026.*

---

### Cluster A — Configuration Architecture

**Layered Precedence Hierarchy.** Every harness implements a multi-tier config resolution chain, typically: global/user defaults → project-level overrides → local/sub-project overrides → runtime CLI flags. Higher specificity always wins. The exact tier count varies (Codex uses three TOML levels; Claude Code uses four scopes including a managed enterprise tier), but the structural invariant—cascade with explicit override semantics—is universal.

**Root and Dot-File Surface.** Each harness defines a canonical set of files it reads at initialization: a human-readable instruction file, one or more machine-readable config schemas, an ignore file, and a history/cache directory. The exact names differ (`.aider.conf.yml` vs. `~/.gemini/settings.json` vs. `.codex/config.toml`) but the surface topology is identical across all six.

**Environment Variable Interpolation.** All harnesses support injecting secrets and environment-specific values via `.env` or OS environment variables, resolved at load time. This is the universal boundary between checked-in config and machine-local secrets.

**Schema Validation.** Config schemas are formally typed in all platforms—Pydantic (OpenHands), TOML with declared fields (Codex), JSON Schema (Gemini CLI settings.schema.json), or YAML with documented field semantics. Invalid config fails explicitly rather than silently degrading.

**Ignore File Scope Algebra.** A dedicated ignore file governs what content is visible to the agent's context and repo-map. Ignore files support glob semantics and have inclusion/exclusion algebra. This is the primary mechanism for preventing context overflow on large codebases. Platforms: `.aiderignore`, `.geminiignore`, `.aider.model.settings.yml` exclusions, Codex project scope limits, OpenClaw workspace scoping, OpenHands environment filtering.

---

### Cluster B — Memory & Context Architecture

**Persistent Instruction Files.** The single most universal primitive: a special-purpose markdown file at repo root that the agent reads every session and treats as standing operating instructions. Names: `CLAUDE.md`, `GEMINI.md`, `AGENTS.md`, `CONVENTIONS.md`/`LESSONS.md`, `SKILL.md` (context-dependent). These files constitute the agent's persistent, human-editable personality and project-specific knowledge layer.

**Hierarchical Instruction Cascade.** Instruction files form a cascade: global user-level → project-root → sub-directory → local override. Deeper files append to or override shallower ones, never replace wholesale. This enables per-directory behavioral specialization within a monorepo.

**Context Compaction / Summarization.** All harnesses implement some form of context window management when conversation or task history exceeds model limits. The mechanism ranges from simple truncation to LLM-based summarization (OpenHands LLMSummarizingCondenser), prompt caching (Aider), and dual-tier static/dynamic memory (Claude Code). The *invariant*: compaction happens automatically at a threshold, and the compressed representation must preserve enough causal fidelity to continue coherently.

**Dynamic vs. Static Memory Tiers.** A two-tier distinction—stable invariants that change rarely (instruction files, project conventions) vs. session-derived inference that updates continuously (conversation context, recent decisions)—appears in all six harnesses, even when not explicitly named as such.

**Checkpoint and Rewind Semantics.** All platforms support some form of state rollback: git-level undo (Aider's test-commit-undo, Codex parallel worktrees), conversation checkpoint/rewind (Gemini CLI `/memory`, OpenHands event-log replay), or session forking (Claude Code session forking). The invariant is reversibility: no agent action is permanently unrecoverable.

**Self-Mutation of Instruction Files.** Every harness includes mechanisms—explicit or emergent—by which the agent edits its own persistent instruction files as a result of postmortem analysis, reflexion, or explicit user command. This closes the self-improvement loop at the memory layer.

---

### Cluster C — Core Execution Loop

**Plan → Execute → Verify Pattern.** The universal agent loop, with naming variations: Aider's ask/code + architect/editor passes, Claude Code's explore → plan → implement + verify → commit/PR, Gemini CLI's ReAct state transitions, Codex's Plan → parallel-tools → verify, OpenHands' perceive-Action-Observation cycle. The structure is invariant: deliberate planning precedes action, and action is followed by verification before committing state.

**Max Iteration Guards.** All harnesses enforce an explicit cap on agent loop iterations to prevent runaway execution. The value is configurable. This is a safety primitive, not a performance one—it defines the boundary of autonomous operation before mandatory human intervention.

**Verification Gates (Test / Lint / CI).** Verification is not optional on commit; all harnesses integrate test execution, linting, or external CI checks as gates. An agent that generates code cannot commit it without passing verification. The strictness is configurable but the gate is universal.

**Commit/Rollback Atomicity.** The agent's interaction with the version control system is atomic: work is committed as a coherent unit, and rollback restores to a known-good prior state without partial corruption. Aider's test-commit-undo cycle is the most explicit formulation; others implement equivalent semantics via git worktrees, session forking, or deterministic replay.

**Non-Interactive / Headless Mode.** All harnesses support a flag or mode for running without any human input, suitable for CI/CD pipelines and automated batch tasks. Claude Code's `-p` flag, Codex's `--autonomy` mode, Gemini CLI's non-interactive invocation, OpenHands' API endpoint—all expose this primitive.

**Reflexion / Self-Critique Loop.** Distinct from verification (which tests the output), reflexion tests the *reasoning*: the agent critiques its own plan or output, identifies gaps, and iterates before producing a final artifact. Named explicitly as "reflexion appends" in Aider, "Ralph-Wiggum micro-iteration reset" and "rubric-driven critique" in Claude Code, "Ralph self-healing loops" in Gemini CLI, "/self-reflect" in Codex.

---

### Cluster D — Multi-Agent Orchestration

**Sub-Agent Spawning.** All harnesses support creating subordinate agent instances with scoped context, scoped tool access, and bounded scope of authority. Mechanisms: architect/editor split (Aider), `/spawn` and `--agents JSON` (Claude Code), Maestro dispatch (Gemini CLI), parallel worktrees + Agents SDK (Codex), `sessions_spawn` (OpenClaw), `delegation tool` (OpenHands).

**Isolated Context per Sub-Agent.** Sub-agents receive a purpose-built context slice, not the full parent context. This is both a cost optimization and a coherence guarantee—sub-agents cannot be confused by irrelevant parent state. The degree of isolation varies (Codex worktrees are fully isolated git trees; Claude Code sub-agents share MCP state).

**Parallel Execution.** Multiple sub-agents run simultaneously on independent tasks. All harnesses support this; the coordination mechanism is the differentiator (file locking, git merge arbitration, lead-agent arbitration, task queues).

**Lead/Merge Arbitration.** A designated lead or orchestrator agent aggregates outputs from parallel sub-agents. The merge semantics are tool-specific (Claude Code TeammateTool + git-merge arbitration, Codex adversarial reviewer gate, OpenHands delegation tool, Gemini CLI Maestro Complete phase, Aider diff chaining).

**Dynamic Model Selection per Agent.** Orchestrators can route different sub-agents to different underlying models based on task class—e.g., a cheaper/faster model for boilerplate and an expensive model for architecture decisions. Present in all six, though Codex and Claude Code make this most explicit.

---

### Cluster E — Self-Improvement Loops

**Postmortem / Trajectory Analysis → Instruction Mutation.** The canonical self-improvement loop: after a session or task, the agent (or a dedicated analysis sub-agent) reviews the trajectory for errors, inefficiencies, or novel patterns, then edits the persistent instruction file to encode the learning. Named "dogfooding loop" in Aider, "rubric-driven critique → CLAUDE.md mutation" in Claude Code, "trajectory postmortem → AGENTS.md mutation" in OpenHands. All six implement this or mandate it as a power-user practice.

**Recursive Self-Reflection Command.** An explicit invocable command that triggers self-critique of the current session, instruction files, or harness configuration. Codex `/self-reflect`, Claude Code post-task analysis hooks, OpenHands trajectory ensemble analysis, Aider live prompt editing.

**Conventions / Lessons Accumulation Library.** A growing, curated collection of project-specific patterns, anti-patterns, and hard-won insights, stored in the instruction file hierarchy. This library compounds in value across projects. Aider's CONVENTIONS.md/LESSONS.md is the most explicit named instance; all other harnesses implement equivalent accumulation via their respective instruction files.

**Self-Benchmarking / Fitness Functions.** More advanced: the agent evaluates its own performance against measurable criteria (error rate, task completion, velocity) and feeds these metrics back into instruction mutation. Claude Code's regression base-rate tracking, Codex's weekly A/B testing protocol, OpenClaw's MEMORY.md KPI schema, OpenHands' success-rate baselines from OpenHands Index—all instantiate this.

---

### Cluster F — MCP Integration

**MCP Server Connection.** All harnesses (with Aider as the weakest instance) support connecting to external capability servers via the Model Context Protocol. MCP is the emergent open standard for extending agent tool surfaces.

**Transport Types.** stdio, SSE, and HTTP transport modes appear across Gemini CLI, Claude Code, and OpenHands. The transport choice affects latency, streaming capability, and deployment topology.

**Auth and OAuth.** Managed authentication for enterprise MCP servers (Google OAuth for Gemini CLI managed connectors, Claude Code enterprise managed-settings, Codex approval_policy for credential management).

**MCP as Extensibility Harness.** The framing of MCP as the *primary* extensibility harness—the open protocol that converts a terminal agent into an enterprise workflow node—is strongest in Claude Code (explicit "MCP as open-protocol harness" framing) and Gemini CLI (Google ecosystem connectors as first-class MCP primitives), but present across all six in the sense that MCP is the preferred integration surface for capabilities not built into the core.

**In-Process vs. External MCP.** Some platforms support in-process MCP injection (Claude Code, Gemini CLI extensions) alongside external MCP server processes. This distinction matters for latency and security isolation.

---

### Cluster G — Skills as Extensibility Primitive

**Skill as a Named, Reusable Agent Behavior.** A skill is a self-contained, parameterized unit of agent behavior—not just a function call, but a documented, testable, versioned behavioral module. Named differently across platforms (`.claude/skills/`, `.agents/skills/skills.sh`, `SKILL.md`, `commands/*.toml`, Gemini extensions), but the concept is universal.

**YAML Frontmatter Metadata.** Skill files carry structured metadata in YAML frontmatter: triggers, permissions, test assertions, version, description. This metadata enables automatic skill discovery, conditional invocation, and validation. Strongest in Claude Code, Codex, OpenClaw, and OpenHands; present in Gemini CLI TOML commands.

**Skill Discovery → Test → Promote Lifecycle.** Skills follow a staged lifecycle: discovery (from registry or local authoring) → isolated testing → promotion to workspace or global scope → versioned rollout. This lifecycle is formalized in OpenClaw (ClawHub → local fork → isolated session → workspace → rollout) and Codex's skill progression, and implied in others.

**Skill Registries.** A centralized or federated repository of shareable skills. ClawHub (OpenClaw), Claude Code skill registry federation, Codex skills registry and marketplace, Gemini CLI extension gallery (431+ entries). The registry is the ecosystem flywheel mechanism.

**Progressive Disclosure for Skills.** Skills are not all loaded at initialization; they are surfaced contextually based on task type, project context, or explicit invocation. This prevents context bloat from an ever-growing skill library.

---

### Cluster H — Prompting Formalism

**Role + Task + Output Schema.** The foundational prompt structure across all harnesses: establish the agent's role, specify the task with sufficient context, define the expected output format. All platforms' "needle-moving prompting" sections converge on this schema.

**Chain-of-Thought Chaining.** Multi-step reasoning traces are elicited explicitly, either via prompting techniques or (in Claude Code and Gemini CLI) via native extended/adaptive thinking modes. The invariant: complex tasks should not be resolved in a single inference step.

**File and Directory Anchoring.** Grounding prompts in specific file or directory references prevents context drift. `@file/@dir` syntax appears explicitly in Gemini CLI and Claude Code; the semantic equivalent (adding files to context) is the primary interaction mode in Aider; OpenHands uses file paths in Action targets.

**Reflexion Appends.** Appending explicit critique requests to task prompts ("verify your reasoning," "identify failure modes," "enumerate edge cases") raises task success rates measurably across all platforms. Named "reflexion appends" in Aider; implicit in all others' pattern sections.

**Constraint-Sandwich / Negative Constraint Specification.** Wrapping task prompts with explicit negative constraints ("do not modify X," "assume Y is immutable," "never use Z pattern") reduces unwanted scope expansion. Named "constraint-sandwich" in OpenHands; "negative constraints" in Gemini CLI; pattern 3 in Codex patterns table; present in all six.

**Autonomy Directive + Bias-to-Action Prefix.** For agentic operation, prompts should explicitly authorize the agent to act rather than ask permission, specify the scope of that authorization, and bias toward action over clarification. Codex makes this most explicit; all harnesses' "antipatterns" sections warn against the failure mode of excessive confirmation-seeking.

---

### Cluster I — Security, Sandbox, and Permissions

**Sandboxed Execution Environment.** Agent-driven code execution, file modification, and shell commands run inside a sandbox with explicit boundaries. Docker containers (OpenHands, OpenClaw), E2B remote sandboxes (Claude Code, Codex), Seatbelt (Gemini CLI macOS), git-isolated worktrees (Aider, Codex) are the implementation variations. The invariant: untrusted or unverified agent actions cannot escape a bounded environment.

**Sandbox Escape Vectors and Mitigations.** All harnesses with documented security sections enumerate the same categories of escape: prompt injection via repository content, supply-chain attacks via skills/extensions, permission escalation via tool misuse, credential leakage via context exposure. Mitigations (runtime auditors, RBAC, input sanitization, audit hooks) are the differentiating implementation detail.

**Permission Models and Approval Policies.** Explicit gates before destructive or irreversible actions. Codex `approval_policy` is the most granular; Claude Code managed-settings propagation handles enterprise delegation; Gemini CLI policy engine enforces syscall boundaries; OpenHands RBAC overlays govern fleet-level permissions.

**Audit Trails.** All harnesses produce durable, inspectable records of agent actions: `history.jsonl` (Codex), `.claude/` logs (Claude Code), NDJSON token logs (Gemini CLI), event-log (OpenHands), session transcripts (OpenClaw). Audit trails are both a security primitive and a postmortem input.

**Air-Gapped / Local Inference Deployment.** Running the full harness without external API calls—using local models (Ollama, vLLM, llama.cpp)—is supported or targeted by all six, with varying degrees of maturity. OpenClaw's "private inference empire" is the most fully theorized instance; Aider's Ollama support is production-grade; others treat it as an edge case.

---

### Cluster J — Observability and Telemetry

**Session Logging.** All harnesses maintain durable logs of agent interactions, tool calls, and outputs. These logs are the raw material for postmortem analysis, velocity measurement, and replay.

**Token and Cost Tracking.** Per-session and cumulative token usage, cost estimation, and budget gating (Claude Code `--max-budget-usd`, Codex `project_doc_max_bytes`, Gemini CLI free-tier arithmetic, OpenClaw credit exhaustion mitigations) are universal. Cost visibility is a first-class concern across all six.

**Velocity Measurement.** Empirical velocity metrics—commits/day, refactor success rate, %AI-authored code, tasks/hour, error rate—are tracked or recommended across all platforms. The specific dashboard implementation varies; the principle that velocity is measurable and should be measured is invariant.

**Regression Base-Rate Tracking.** Measuring the rate at which agent-authored changes introduce regressions, and tracking this over time to evaluate harness configuration effectiveness. Most explicit in Claude Code; present implicitly in all others' "antipatterns" sections.

**Prometheus/Metrics Integration.** Structured metrics export (Prometheus format explicitly in OpenHands and OpenClaw; equivalent dashboards in Codex and Gemini CLI) for production fleet monitoring. Strongest in the two fleet-oriented platforms; lighter in Aider and Gemini CLI.

---

### Cluster K — Large-Scale and Monorepo Engineering

**Ignore File Algebra for Context Scoping.** The ignore file is the primary tool for controlling which code the agent sees. On a 10M+ LOC monorepo, naïve context inclusion is impossible; the ignore file algebra (glob patterns, negation, per-directory overrides) is the engineering discipline that makes large-scale operation viable.

**Parallel Session / Worker Coordination.** Multiple simultaneous agent instances working on independent subsets of a codebase, coordinated to avoid merge conflicts. All harnesses support this; the coordination mechanism—file locking, git worktrees, task queues, orchestrator arbitration—is the differentiating implementation.

**Context Windowing Strategies for Large Codebases.** Including only the relevant subset of a large repo in any given agent context: repo map (Aider), CLAUDE.md scope directives (Claude Code), .geminiignore tuning (Gemini CLI), project_doc_max_bytes (Codex), custom Condensers for monorepos (OpenHands). The strategies differ but address the same constraint.

**Hierarchical Ignore / Include Algebra.** Nested ignore files at different directory levels, with override semantics allowing a subdirectory to expand or restrict what the global ignore file allows. Present in Aider (--subtree-only + hierarchical .aiderignore), Claude Code (CLAUDE.md cascade), Codex (global → root → leaf concatenation).

---

### Cluster L — Swarm Topologies

**Named Swarm Archetypes.** All harnesses articulate canonical swarm structures with consistent naming across platforms: Hierarchical (lead-subordinate), Parallel Specialists (independent concurrent agents), Pipeline (sequential handoff), Self-Organizing (emergent role allocation), Research+Implement (reconnaissance + execution split). The topologies are platform-agnostic; the binding primitives are platform-specific.

**Race Condition and Merge Conflict Mitigation.** Parallel agents writing to shared state (filesystem, git history, database) require explicit coordination. File locks, git worktree isolation, TaskQueue serialization, and sequential commit gating appear across all six harnesses as the primary race condition mitigations.

**Emergent Swarm Behaviors.** Extended, autonomous swarm operation produces behaviors not explicitly programmed: spontaneous role specialization, load balancing, recovery from sub-agent failure. All harnesses acknowledge this phenomenon; only a few (Codex, Claude Code, OpenClaw) have developed frameworks for characterizing and directing it.

**Swarm Scalability Thresholds.** Quantified limits on concurrent agents before coordination overhead exceeds output gain. Explicit in OpenHands (200-dev fleet thresholds), OpenClaw (50+ concurrent subs), Codex (50+-agent swarm behaviors); implicit as a tuning concern in the others.

---

### Cluster M — Cognitive Internalization and Mastery Progression

**Tiered Mastery Progression.** All six harnesses articulate an explicit progression from novice to expert to superlative, with measurable velocity outcomes at each tier. The naming varies (Novice → Competent → Advanced → Expert → Superlative → Architect in Aider; Novice → Supreme in Codex; Novice → Sovereign in Gemini CLI), but the structure—discrete tiers with falsifiable advancement criteria—is universal.

**Coder → Harness Architect Mental Model Shift.** The highest-leverage cognitive shift for power users: stop thinking of the agent as a tool that executes instructions and start thinking of yourself as an architect designing the system the agent operates within. All six harnesses identify this shift as the key inflection point between competent and expert operation.

**Intervention Taxonomy.** Explicitly categorizing when to approve, override, recurse, or veto agent actions—rather than treating every decision uniformly. Codex makes this most formal; all others' "antipatterns" sections converge on the same principle: undifferentiated intervention is the power user's primary failure mode.

**Cognitive Offloading Protocols.** Systematically moving decision-making to the agent for categories of work where human judgment adds less value than agent speed. The flip side of the intervention taxonomy. Most explicit in Codex; implicit in all harnesses' "superlativity" sections.

---

### Cluster N — Economic and ROI Modeling

**Cost-Per-Feature Metrics.** Measuring the fully-loaded cost (API tokens, time, human review) of delivering a feature via agent-assisted development versus baseline. Universal across all six harnesses' "metrics" and "ROI" sections, with varying measurement granularity.

**Velocity Multipliers.** Empirical ratios of agent-assisted vs. unassisted development velocity. All platforms cite 5–10× improvement as an achievable target; the specific measurement methodology varies. These multipliers are the primary business case for adoption.

**A/B Testing for Harness Configurations.** Treating harness configuration choices (model selection, prompt templates, instruction file content, skill sets) as experimental variables with measurable output effects. Most rigorous in Codex and OpenClaw; present as a recommended practice in all six.

---

### Cluster O — Long-Horizon Autonomy

**Extended Session / Campaign Orchestration.** Multi-hour or multi-day agent operation on complex tasks, requiring session persistence, context compaction under scale, and robust human checkpoint protocols. All harnesses address this, with varying maturity: Codex's PLANS.md enables 25-hour+ campaigns; Claude Code's long-horizon persistent agency extends to 45+ minute autonomy; Gemini CLI's background agents enable async operation.

**Context Compaction Under Scale.** At sufficiently long horizons, even the largest context windows overflow. All harnesses implement compaction strategies that preserve task coherence across this boundary. The quality of compaction under scale is a primary differentiator of production-grade vs. hobbyist harnesses.

**Human Checkpoint and Veto Protocols.** In long-horizon operation, explicit human decision points—where the agent pauses for review before proceeding past a consequential choice—are mandatory safety infrastructure. Codex's PLANS.md steering checkpoints, OpenClaw's HEARTBEAT.md review cadence, Claude Code's approval gates are the platform-specific implementations.

---

### Cluster P — Hybrid Multi-LLM and Model Routing

**Cross-Model Orchestration.** Using multiple underlying models—different providers, different parameter scales, different specializations—within a single harness session. Universal in intent; the mechanism is platform-specific (Aider model pairings, Claude Code dynamic subagent model selection, Gemini CLI model switching, OpenHands RouterLLM).

**Model Selection Arbitration.** Rules or heuristics for routing tasks to specific models: cost-based (use cheap model for boilerplate), capability-based (use powerful model for architecture), latency-based (use fast model for interactive tasks). All harnesses support this; only OpenHands (RouterLLM) and Codex implement it with formal routing logic.

**Local vs. Cloud Tradeoff Navigation.** The decision between local inference (lower cost, higher privacy, potentially lower capability) and cloud inference (higher cost, lower privacy, potentially higher capability) appears as a first-class configuration choice in all six harnesses.

---

### Cluster Q — Formal Verification

**Proof-Assistant Integration.** Lean, Z3, TLA+, and Coq appear in the frontier/research sections of multiple harnesses as targets for agent-assisted formal verification. This is an emerging unified frontier rather than a production primitive; appears in Aider, Claude Code, and OpenClaw most explicitly.

**Adversarial Reviewer Gates.** Distinct from standard verification: a second agent instance acts as an adversarial critic, explicitly trying to find failure modes in the first agent's output. Most explicit in Codex (9-phase SDLC with 3-iteration adversarial reviewer cap); present as a recommended pattern in all six.

---

### Cluster R — Contribution and Ecosystem

**Fork-to-PR Pipeline.** A documented path from identifying an improvement in the harness itself to contributing it upstream. All six harnesses document this; the specifics depend on the platform's governance model (Aider: Paul Gauthier's acceptance criteria; Gemini CLI: extension gallery; OpenClaw: ClawHub + core PR; Claude Code: skill registry federation).

**Pioneer-to-Maintainer Progression.** Beyond user mastery, a path to becoming a recognized contributor to the platform's development. Present in all six, most explicitly documented in OpenClaw and Gemini CLI.

**Ecosystem Flywheel.** The positive feedback loop between platform adoption, skill/extension creation, registry enrichment, and further adoption. All six harnesses acknowledge this dynamic; OpenClaw and Gemini CLI have the most explicit flywheel mechanics.

---

### Cluster S — CI/CD and Lifecycle Integration

**GitHub Actions / Pipeline Integration.** All harnesses provide hooks for integration with CI/CD systems. The integration depth ranges from Gemini CLI's GitHub Actions triage plugin to Claude Code's full autonomous lifecycle pipelines (Linear/Jira → plan → implement → CI/CD deploy via MCP connectors) to OpenHands' GitHub Actions/Jenkins API hooks.

**Automated Test Gates on Commit.** Agent-authored changes cannot be committed without passing automated tests. This is both a safety primitive and a quality primitive. The gate is universal; the test suite configuration is project-specific.

---

## Section 2: Aider Idiosyncrasies
*Primitives specific to Aider's design philosophy: command-line purity, git-first architecture, Paul Gauthier's dogfooding methodology, and the repo-map as primary intelligence substrate.*

---

### Repo Map as Intelligence Substrate

**Tree-Sitter + PageRank Symbol Ranking.** Aider's distinctive intelligence primitive: a dynamic map of the repository constructed by parsing all source files with tree-sitter (a multi-language incremental parser), extracting symbols (functions, classes, variables, imports), and ranking their relevance using a PageRank-style algorithm. This map is what allows Aider to navigate large codebases without loading every file into context—it provides a compressed, ranked representation of the codebase's structure and the relationships between symbols.

**`--map-tokens` Tuning.** A direct control knob for the repo map's context budget. Increasing this value allows more of the codebase structure to be visible to the model at the cost of reduced space for the conversation and diffs. The optimal setting is task-dependent: architectural refactors benefit from high `--map-tokens`; local bug fixes benefit from low values.

**Repo Map Refresh Policy.** The repo map is not static; it refreshes on file changes detected during a session. The refresh cadence and conditions are configurable. Stale repo maps are a documented antipattern with specific symptoms (model attempting to reference non-existent symbols).

**Repo Map Sharding for Extreme Scale.** At 10M+ LOC, even the compressed repo map exceeds practical context limits. Sharding strategies—splitting the map by subsystem, directory, or dependency graph cluster—are the frontier technique for making Aider viable at this scale. This is Aider-specific because the problem is created by Aider's repo-map architecture.

**Vector-Augmented Repo Maps.** Experimental frontier: augmenting the PageRank-ranked symbol map with semantic embeddings to support similarity-based context retrieval alongside structural context retrieval. This is an extension of Aider's core differentiator.

---

### Architect / Editor Dual-Pass Orchestration

**Architect Mode and Editor Mode as Named Primitives.** Aider's most distinctive orchestration primitive: a formal separation between an *architect* agent (which reasons about what needs to change and produces a high-level plan) and an *editor* agent (which executes the changes within token-efficient diff formats). These are not informal roles but distinct operational modes with different model requirements, different prompt templates, and different output formats.

**Whole-File vs. SEARCH/REPLACE Diff Format Trade-off.** Aider exposes two fundamentally different formats for communicating code changes: whole-file replacement (simple, higher token cost, lower failure rate) and SEARCH/REPLACE diffs (complex, lower token cost, higher failure rate on ambiguous edits). The choice between these is a first-class configuration decision that affects both cost and reliability. No other harness exposes this trade-off at this level of explicitness.

**Model Pairing by Architect/Editor Role.** The architect and editor can use different underlying models—e.g., an expensive, high-capability model for architecture and a cheap, fast model for the mechanical application of diffs. Aider's documentation of optimal model pairings for this split is more granular than any other harness.

**Optimal Model Pairings (Empirical).** Paul Gauthier maintains empirically validated benchmarks of model combinations for the architect/editor split, updated with each major model release. This first-party benchmarking by the platform's author is distinctive.

---

### Ask / Code Mode Duality

**Ask Mode vs. Code Mode.** Before committing to generating a code change, Aider can operate in ask mode—a read-only conversational mode that answers questions about the codebase without touching files. This explicit gate between discussion and action is Aider's mechanism for the plan-before-act invariant.

**Reflexion Appends.** A specific prompting technique developed in the Aider community: appending explicit self-critique and verification requests to the primary task prompt (e.g., "After implementing, verify your change handles edge case X and does not modify file Y"). The technique is named and documented specifically in the Aider context.

---

### Git-Centric Safety Architecture

**Test-Commit-Undo Atomic Cycle.** Aider's core safety primitive: every change is (1) generated, (2) tested, and (3) either committed or automatically undone. The undo mechanism uses `git revert` on the generated commit, restoring the working tree atomically. No partial states are possible. This is Aider's primary answer to the "how do you make agent changes reversible" question—it delegates entirely to git.

**Git Pollution Rules.** Configuration for controlling what Aider adds to git history—whether to commit Aider's scratchpad, intermediate states, or only verified final states. This is a git hygiene concern unique to Aider's commit-by-default behavior.

**`.aider/` Cache and State Files.** Aider maintains its own cache directory for prompt history, chat history, and session state. The precise semantics of these files (what gets persisted, what can be safely deleted, how they interact with git) are Aider-specific.

---

### Community and Ecosystem Specifics

**Paul Gauthier Dogfooding Loop.** Aider is developed using Aider itself—Paul Gauthier uses Aider to write Aider's code, creating a tight feedback loop between user experience and development. This dogfooding methodology is a first-party quality signal unique to Aider: the platform's own creation is its most rigorous integration test.

**Aidermacs (Emacs Layer).** A full Emacs integration for Aider that provides zero-terminal operation—triggering Aider sessions from within Emacs buffers using comment syntax. This is the most mature IDE integration specific to Aider, with no equivalent in other harnesses' first-party offerings.

**VS Code "Aider Comments" + `--watch-files`.** A zero-terminal trigger mechanism: adding specially formatted comments in VS Code causes Aider to detect and execute them via the `--watch-files` flag, without the user switching to a terminal. This comment-to-action bridge is Aider-specific.

**SuperAider Fork.** A community fork that implements a 3-phase orchestration architecture (reconnaissance → planning → execution) on top of Aider's core. The patterns pioneered in SuperAider feed back into core Aider development.

**`CONVENTIONS.md` and `LESSONS.md` as Named Memory Files.** Aider's specific naming convention for the two types of persistent instruction: CONVENTIONS.md contains stable project norms (code style, patterns, invariants); LESSONS.md contains hard-won session-specific learnings. The explicit two-file separation, with distinct semantics, is Aider-specific.

---

### Upstreaming and Contribution

**Paul Gauthier's Acceptance Criteria.** Because Aider has a single primary author-maintainer, the contribution path runs directly through Paul Gauthier's publicly documented preferences and benchmarking methodology. Understanding these criteria is a distinct power-user skill: knowing what kinds of contributions get merged, and how to frame `.aider.model.settings.yml` hacks for upstream consideration.

**`.aider.model.settings.yml` Custom Model Configuration.** A YAML file for per-model behavioral overrides: context limits, diff format preferences, token budgets, temperature, prompt injection. Sharing well-validated `.aider.model.settings.yml` configurations is the primary form of community contribution for non-code improvements.

---

## Section 3: Claude Code Idiosyncrasies
*Primitives specific to Claude Code's architecture: Anthropic's enterprise-grade managed settings tier, the dual-tier memory model, adaptive thinking, the TeammateTool coordination primitive, and the company's self-referential position as model developer using its own agent.*

---

### Managed Settings and Enterprise Tier

**Managed > CLI > Project > User Precedence.** Claude Code is the only harness with a formally documented *enterprise-managed* tier at the top of the config hierarchy. Managed settings are propagated from an enterprise administrator and cannot be overridden by individual users or projects. This reflects a distinct enterprise governance model absent from all other harnesses.

**`managed-settings.json`.** The enterprise configuration artifact that enforces organizational policy across all user instances. Its existence, its propagation semantics, and its relationship to project and user settings are Claude Code–specific.

**Enterprise Permission Propagation and Audit Trails in Shared `.claude/` Repos.** The mechanism by which enterprise-grade audit trails flow through shared repository-level `.claude/` directories, ensuring that team-shared worktree memory inherits appropriate access controls. This is a governance primitive shaped by Anthropic's enterprise sales requirements.

---

### Dual-Tier Memory Model

**Static Invariants (`CLAUDE.md` cascade: user > project > local) vs. Dynamic Inference (`MEMORY.md`).** The explicit naming and formal separation of two memory tiers is Claude Code–specific. The cascade model for CLAUDE.md (user-level > project-level > local) with formal precedence semantics is more rigorously documented than equivalent file hierarchies in other harnesses.

**Auto-Update Heuristics and Compaction Triggers for MEMORY.md.** The dynamic tier updates automatically based on conversation content, with configurable triggers for when to compact accumulated dynamic memory back into the static tier. The specific heuristics (frequency, threshold, trigger conditions) are Claude Code–specific implementation details.

**Worktree Sync for Shared Memory.** When multiple agents share a git worktree, their CLAUDE.md and MEMORY.md states must be synchronized. The mechanisms for this synchronization (locking, merge semantics) are specified in Claude Code's architecture and not present in equivalent detail elsewhere.

---

### Execution Control and Slash Commands

**`ExitPlanMode` and `isSwarm` Activation Flags.** Named flags that transition the agent between operational modes—from planning-only into execution, or from single-agent into swarm coordination. These are Claude Code's mechanism for the explicit mode transitions that other harnesses handle implicitly.

**`/spawn`, `--agents JSON`, YAML Frontmatter.** Claude Code's sub-agent spawning syntax is more elaborate than equivalents in other harnesses: JSON-encoded agent specifications and YAML frontmatter within task files define sub-agent roles, tool subsets, and context slices. This declarative sub-agent specification is a distinctively structured approach.

**`/simplify` and `/batch` Slash Commands.** Named slash commands for context-pruning (simplify) and batch task submission (batch). These are Claude Code–specific operational commands without direct equivalents.

**Non-Interactive `-p` Flag.** Claude Code's headless mode flag, enabling scripted use in CI/CD pipelines without any interactive prompt. A universal primitive (all harnesses have headless mode) but worth noting as Claude Code's specific syntax.

---

### Adaptive Thinking

**Adaptive Thinking Under Load (Opus/Sonnet 4.6).** Claude Code leverages Anthropic's model-level extended thinking capability—where the model spends additional compute on multi-step internal reasoning before producing output. The effort level is dynamically adjustable (`--thinking-budget`, adaptive-thinking effort controls). This is not a prompting technique but a model capability exposed through the harness: no other platform has an equivalent because no other platform runs on a model with native extended thinking.

**Adaptive Thinking Under 1M Context (Frontier Tier).** At the frontier, Claude Code is designed to leverage Opus 4.6's 1M token context window with adaptive thinking enabled—a combination that enables qualitatively different long-horizon reasoning. The performance characteristics and optimal usage patterns of this combination are Claude Code–specific.

---

### TeammateTool and Inter-Agent Coordination

**`TeammateTool`.** Claude Code's named primitive for one agent invoking another as a peer-level collaborator rather than a sub-agent. TeammateTool encodes a specific coordination semantic: the invoked agent operates with equivalent authority and context scope to the invoker, unlike a sub-agent which operates with reduced scope. This peer coordination primitive is distinct from all other harnesses' hierarchical models.

**Inter-Agent File Locks and Git-Merge Arbitration.** The specific mechanisms Claude Code uses to prevent write conflicts between concurrent agents: file-level locks and a merge arbitration protocol that resolves conflicts at the git level. The combination of file locks + git-merge arbitration as a first-class coordination primitive is Claude Code–specific.

**Queen-Led Mesh Topology.** A specific swarm topology where a designated "queen" agent maintains global state and coordinates subordinate agents dynamically. The metaphor and its specific implementation mechanics (the queen holds the persistent CLAUDE.md, coordinates tool access, arbitrates merge conflicts) are Claude Code–specific.

---

### Skill Phylogeny and Auto-Evolution

**Skill Phylogeny.** The framing of skills as evolving through a lineage—parent skills generating child skills with specializations, mutations, and deprecations—is Claude Code–specific. This evolutionary metaphor implies mechanisms for skill versioning, inheritance, and controlled mutation that are more elaborated than other platforms' simpler skill lifecycle models.

**Self-Mutating YAML Frontmatter.** Skills whose YAML frontmatter is automatically updated by the agent based on usage patterns, failure modes, or explicit reflexion. The skill evolves its own metadata. This auto-evolution primitive is most explicitly theorized in Claude Code.

**Registry Federation.** Multiple skill registries from different sources (user-level, project-level, enterprise-level, community) merged with explicit precedence semantics. Federation implies both distribution and governance—conflicts between federated registries are resolved deterministically. More elaborate than other harnesses' single-registry models.

---

### Federated Monorepo Orchestration

**Distributed `CLAUDE.md` Propagation.** In a federated multi-repo architecture, CLAUDE.md files at different repo roots must be kept consistent where they share invariants, while retaining per-repo specializations. The propagation mechanism—how changes to a shared-invariant section of CLAUDE.md ripple across repos—is a Claude Code–specific enterprise primitive.

**Multi-Repo Git-Sync Primitives.** Beyond single-repo worktree management, Claude Code targets multi-repo synchronization: changes that span repository boundaries, with cross-repo git-sync coordination. This is the enterprise scale tier of monorepo engineering.

---

### Self-Referential Model Development Loop

**Internal Self-Coding Loops (Claude Authoring Its Own MCP/Skills).** Claude Code's uniquely self-referential position: Anthropic uses Claude Code internally to develop Claude and its tooling. The feedback loop from production agent deployment → internal engineering → model training → improved agent deployment is a closed loop that no other harness can claim because no other harness is developed by its own underlying model's creator.

**Agent Teams Bootstrapping + Opus 4.6 Adaptive Thinking.** The architectural link between Claude Code's swarm coordination (Agent Teams) and Anthropic's model development (Opus 4.6 extended thinking) is explicitly acknowledged as a co-evolutionary substrate. The model improves the harness; the harness stress-tests the model.

**Krieger Archetype and Persistent Coworker Platform.** The end-state vision articulated specifically in Claude Code's culmination synthesis: a persistent, named AI coworker with stable identity, cross-session memory, and genuine professional-grade autonomy. "Krieger" is the internal project name for this archetype. No other harness articulates an equivalent named end-state vision.

---

### Observability Specifics

**Verification Delta Instrumentation.** Measuring the *delta* between what a test suite catches before and after agent-authored changes—not just pass/fail, but directional change in test coverage and failure patterns. This verification-delta metric is Claude Code–specific.

**Context Parsimony Metrics.** Measuring how efficiently the agent uses its context window—avoiding unnecessary inclusions, detecting context bloat, optimizing CLAUDE.md length. The "parsimony" framing, treating context space as a scarce resource to be managed precisely, is Claude Code–specific.

**Bias-Propagation Quantification in Agent Teams.** When an orchestrating agent's biases (prompt artifacts, CLAUDE.md contents) propagate to all sub-agents, measuring the extent of that propagation and its effect on output diversity. This meta-observability metric—tracking how opinion/bias spreads through a swarm—is Claude Code–specific.

---

## Section 4: Gemini CLI Idiosyncrasies
*Primitives specific to Gemini CLI's design: the hook system as the primary ReAct loop mutation mechanism, deep Google ecosystem integration, the three named orchestration frameworks (Conductor/Maestro/Ralph), and the @import syntax for composable instruction files.*

---

### GEMINI.md as Live Firmware

**"Live Firmware" Framing.** The conceptual framing of GEMINI.md as firmware—not a static instruction file but an actively running behavioral specification that can be patched in real time—is Gemini CLI–specific and reflects a distinct philosophy about the instruction file's role.

**`@import` Syntax for Composable GEMINI.md.** GEMINI.md supports `@import` directives that pull in content from other files, enabling modular composition of behavioral specifications. This composability—building a GEMINI.md from a library of reusable behavioral modules—is not present in other harnesses' instruction file formats.

**Negative Constraints as First-Class Primitives.** GEMINI.md formally supports negative constraint syntax: explicit prohibitions alongside positive instructions. This symmetry—the instruction file encoding what the agent must *not* do with equal formality as what it *must* do—is more explicit in Gemini CLI than elsewhere.

---

### Hook System as Core Architecture

**Hook Lifecycle as ReAct Loop Mutation.** Gemini CLI's most distinctive primitive: lifecycle hooks (`pre-tool`, `post-tool`, `AfterAgent`, `session-end`, `action-validation`, `policy-enforcement`, `forced-iteration`) that fire at specific points in the ReAct loop and can *mutate* the loop's behavior in real time. This is not just monitoring—hooks can prevent tool execution, force iteration, modify outputs, and enforce policy. The hook system is the mechanism by which GEMINI.md becomes "live firmware": hook-driven rules execute with the same authority as the agent's own reasoning.

**`AfterAgent` Hook.** A hook that fires after a sub-agent completes, enabling post-hoc analysis, output transformation, and feedback routing. The AfterAgent hook is the mechanism for building reflexion into the orchestration layer rather than into prompts.

**`action-validation` and `policy-enforcement` Hooks.** Hooks that validate and potentially block agent actions before execution. These are security-layer hooks that can prevent disallowed operations without modifying the agent's prompts or reasoning—enforcement at the execution layer rather than the instruction layer.

**`forced-iteration` Hook.** A hook that forces the agent to iterate (re-plan, re-execute) when specified conditions are met, even if the agent considers its task complete. This is a quality-enforcement primitive: the harness can override the agent's own judgment about task completion.

**Zero-Human-Turn Rate as Primary KPI.** Gemini CLI explicitly tracks the fraction of sessions or tasks completed with zero human intervention turns as a primary quality metric. This metric, and the hook-density-per-session correlation with it, is Gemini CLI–specific instrumentation.

---

### Named Orchestration Frameworks

**Conductor (Persistent MD Graphs).** A community framework for Gemini CLI that structures multi-agent work as a persistent graph of markdown files: context specification → plan → implementation. The files persist between sessions, enabling genuine multi-session continuity for complex projects. Conductor is a Gemini CLI–specific orchestration framework.

**Maestro (12-Specialist Agents, 4-Phase Dispatch).** A framework deploying 12 specialized agents in four phases: Design → Plan → Execute → Complete. Each phase has a formal handoff protocol. The explicit 12-specialist structure (as opposed to dynamically allocated specialists) and the Design-Plan-Execute-Complete phase taxonomy are Maestro-specific and Gemini CLI–specific.

**Ralph Self-Healing Loops.** Named for a specific community contributor: a self-healing orchestration pattern where a meta-agent monitors task progress, detects stalls or errors, and triggers recovery without human intervention. Ralph loops implement completion-criteria-driven iteration—the loop continues until a formally defined success condition is met.

---

### Google Ecosystem Connectors

**Managed MCP Servers for Vertex AI, BigQuery, Cloud Run, Maps, AlloyDB.** First-party managed integrations for Google's cloud services, delivered as MCP servers with managed auth, bidirectional streaming, and native data types. These connectors convert Gemini CLI from a general-purpose agent into a Google-native workflow orchestrator. No equivalent first-party cloud-provider ecosystem integration exists in any other harness.

**Bidirectional Streaming MCP.** The Google-managed MCP servers support bidirectional streaming, enabling real-time data flows between agent actions and cloud services. This is a latency and throughput primitive absent from other harnesses' MCP implementations.

**Vertex AI as Training/Inference Backend.** The direct integration between Gemini CLI's orchestration and Vertex AI as both an inference endpoint and a managed ML platform collapses the agent harness and the model development/deployment infrastructure into a single operational surface.

---

### Session and State Primitives

**`save_memory` Tool.** A native tool callable within agent tasks that explicitly persists information to memory—not through GEMINI.md auto-mutation but through a discrete, intentional memory-write action. The explicit tool-call semantic for memory persistence (versus implicit updates) is Gemini CLI–specific.

**`/memory add` and `/memory refresh` Commands.** User-level slash commands for explicitly managing the dynamic memory layer: adding new facts, refreshing outdated ones, viewing the current memory state. The `/memory` command namespace as a first-class user interface is Gemini CLI–specific.

**`/todo` + Parallel Sub-Tasks.** A task management primitive: `/todo` decomposes the current task into trackable sub-items that can be assigned to parallel agents. The explicit todo-list-as-orchestration-primitive is Gemini CLI–specific.

**`commands/*.toml` Infrastructure.** Custom commands are defined as TOML files in `.gemini/commands/`, creating a structured command library that extends Gemini CLI's slash-command surface. This TOML-based command definition system—distinct from skills, which define *behaviors*, and hooks, which define *event handlers*—is Gemini CLI–specific.

---

### Cost and Access Economics

**Free-Tier Arithmetic.** Gemini CLI has the most explicitly documented free-tier entitlement arithmetic of any harness: specific token limits, rate limits, and their relationship to task complexity. Managing within free-tier limits is a documented power-user discipline.

**Vertex vs. API-Key Trade-offs.** The choice between Vertex AI (enterprise, more expensive, more capabilities, managed auth) and direct API key (cheaper, simpler, fewer capabilities) is a first-class configuration decision in Gemini CLI, with documented trade-offs. This reflects Google's dual distribution model.

**`/stats` Deep Dive.** A built-in command providing detailed session statistics: token usage, tool call counts, latency distribution, cost. The depth and accessibility of built-in session analytics via a single slash command is more developed in Gemini CLI than elsewhere.

---

### Orchestration and Security Specifics

**Seatbelt Sandbox (macOS) + Docker (Linux).** Platform-specific sandbox implementations: macOS Seatbelt for syscall filtering on macOS, Docker containers on Linux. The explicit dual-platform sandbox specification is Gemini CLI–specific.

**Policy Engine Mechanics.** A formal policy evaluation layer that enforces behavioral constraints via hook-driven rules rather than prompt instructions. The policy engine is a distinct runtime component separate from both the model and the hook system—it evaluates declared policies against proposed actions.

**`gemini-extension.json` Manifest.** The manifest format for Gemini CLI extensions: declaring tools, triggers, scoped API key storage, and settings prompts. This manifest spec, and the extension gallery it feeds, are Gemini CLI–specific.

---

### Maturity Model

**Sovereign Tier.** Gemini CLI's highest-maturity designation (Novice → Expert → Supreme → Sovereign) implies not just operational mastery but independent authority: the sovereign-tier practitioner is no longer *using* Gemini CLI but *directing* it as an autonomous organizational resource. The "sovereign" framing, with its implications of institutional autonomy, is Gemini CLI–specific.

---

## Section 5: OpenAI Codex Idiosyncrasies
*Primitives specific to Codex's architecture: TOML config format, PLANS.md as a distinct long-horizon planning primitive, the history.jsonl persistent memory model, computer-use primitives, adversarial reviewer gates, and the explicit exocortex design philosophy.*

---

### Configuration Architecture

**TOML as Config Format.** Codex uses TOML for its configuration schema (`~/.codex/config.toml`), while other harnesses use YAML or JSON. The TOML choice reflects an explicit preference for human-writable, type-safe configuration. The specific field names—`sandbox_mode`, `approval_policy`, `skills`, `multi_agent`, `project_doc_max_bytes`—are Codex-specific.

**`approval_policy` as Named Config Primitive.** A formally declared policy governing which classes of agent action require human approval before execution. The `approval_policy` field in config.toml, with its enumerated approval modes, is Codex's mechanism for the universal permission model—but its explicit configuration-level declaration is Codex-specific.

**`project_doc_max_bytes` Limit.** An explicit hard limit on the total bytes of project documentation (AGENTS.md, PLANS.md, etc.) that Codex will load into context. This is Codex's mechanism for preventing instruction-file bloat—a documented concern unique to Codex's architecture.

**`sandbox_mode` Configuration.** An explicit sandbox mode toggle in the config schema, with documented modes. The configuration-level sandbox mode declaration is Codex-specific.

---

### Memory and Persistence Architecture

**`AGENTS.md` + `AGENTS.override.md`.** Codex's naming for the persistent instruction file includes a formal override mechanism: `AGENTS.override.md` supplements or supersedes `AGENTS.md` at the same directory level. The override file is a Codex-specific mechanism for temporary instruction modification without editing the canonical instruction file.

**`PLANS.md` as Long-Horizon Planning Document.** The explicit separation of *what the agent is currently doing* (AGENTS.md—standing instructions) from *what the agent is trying to accomplish over weeks* (PLANS.md—campaign strategy) is Codex's most distinctive memory architecture contribution. PLANS.md contains the multi-week task breakdown, checkpoint history, and success criteria for a long-running autonomous campaign. No other harness has an equivalent first-class planning document.

**`history.jsonl` with Pruning Algorithm.** Codex's persistent conversation history in JSONL format, with a documented pruning algorithm that trims old entries based on recency, relevance, and context budget. The explicit JSONL format (versus implicit conversation state in other harnesses) and the documented pruning algorithm are Codex-specific.

**Knowledge-Base Priming.** Loading project-specific knowledge (API documentation, domain glossaries, architecture diagrams) into the initial context via structured files, enabling the agent to operate with domain expertise baked into its starting state. Distinct from instruction files (which govern *behavior*) and from dynamic memory (which records *session history*)—knowledge-base priming is about *facts*.

---

### Execution and Orchestration

**9-Phase SDLC with 3-Iteration Adversarial Reviewer Cap.** Codex's formalization of software development as a 9-phase lifecycle, with an adversarial reviewer agent that critiques the primary agent's output at key gates. The adversarial reviewer operates for at most 3 iterations before the primary agent's output is accepted or escalated. This structured, numbered SDLC with explicit adversarial gate mechanics is Codex-specific.

**$skill-creator Workflow.** A dollar-sign-prefixed skill-creation invocation that triggers a meta-skill for generating new skills from high-level descriptions. The `$skill-creator` convention and its specific workflow (description → YAML scaffold → executor → test → registry) are Codex-specific.

**`skills.sh` Executor Pattern.** Skills in Codex are implemented as shell scripts with structured YAML metadata headers. The `skills.sh` convention (shell script as skill implementation, with YAML frontmatter for metadata and permissions) is Codex-specific.

**Computer-Use Primitives.** Codex's integration of computer-use capabilities—the agent can interact with GUI applications, take screenshots, click interface elements, and fill forms—is a capability not present in the other five harnesses. Computer-use converts Codex from a code-and-file agent into a general-purpose workstation automation agent.

**Task Queues + Steering Checkpoints.** Codex's long-horizon autonomy is mediated by a task queue (an ordered list of pending agent actions) and steering checkpoints (human-review moments where the queue's direction can be adjusted). The explicit queue + checkpoint architecture for long-horizon campaigns is Codex-specific.

---

### Skill Ecosystem

**Skill Distillation → Fine-Tuning Pipeline.** Taking high-performing agent trajectories (sequences of successful skill executions) and using them as training data to fine-tune a derivative model. The skills.sh → fine-tune loop converts Codex from a runtime-configurable harness into a model development pipeline. No other harness documents this production → training feedback loop.

**Private and Public Skill Registries + Marketplace.** Codex's skill registry has an explicit commercial dimension: skills can be published to a public marketplace with licensing and monetization. This marketplace economics layer is Codex-specific.

**Metaswarm Repos.** Community-developed harnesses that wrap Codex inside more elaborate multi-agent orchestration architectures, coordinating dozens of Codex instances with custom coordination logic. The "metaswarm" naming and the community ecosystem around it are Codex-specific.

---

### Long-Horizon and Autonomy Specifics

**25-Hour+ Campaign Orchestration with Human Veto Protocols.** Codex's documentation explicitly targets 25-hour uninterrupted autonomous operation as a design benchmark. The human veto protocol—how a human can cleanly interrupt and redirect a multi-day autonomous campaign without corrupting intermediate state—is more formalized in Codex than anywhere else.

**`harness.md` at Global Level.** A global-level harness configuration document (analogous to the universal `.bashrc` of agentic configuration) that defines meta-level behavioral policies applying to all Codex sessions. The `harness.md` concept—a session-invariant global configuration document above even `~/.codex/config.toml` in the behavioral hierarchy—is Codex-specific.

**Quarterly Re-Baseline Protocol.** A recommended practice of periodically (quarterly) re-evaluating all AGENTS.md content, skill libraries, and model configurations against current benchmarks, discarding drift and updating to reflect accumulated learning. The explicit quarterly cadence recommendation is Codex-specific.

---

### Cognitive and Philosophical Primitives

**Exocortex Design.** The most philosophically ambitious primitive in the Codex directives: designing a persistent external cognitive extension that integrates with the user's thought stream. The exocortex architecture includes persistent knowledge graphs, intention capture (recording mental intent before it is articulated as a task), thought-stream integration, and psychological phase shift tracking. This is not a productivity optimization—it is a cognitive prosthetic design. No other harness operates at this philosophical register.

**Intention Capture MCP Skill Template.** A specific skill template for capturing user intentions before they are fully articulated as Codex tasks—recording mental states, half-formed ideas, and contextual priors into the agent's knowledge base. The intention capture primitive is the most direct mechanism for the exocortex design philosophy.

**Meta-Research Loops (Codex Improving the Codex Stack).** Codex agents conducting research on Codex itself: generating architecture proposals, running benchmarks, evolving prompt templates, and feeding results back into the harness configuration. The agent is both the tool and the research subject. This recursive self-improvement at the platform level (not just the session level) is Codex-specific in its formalization.

---

## Section 6: OpenClaw Idiosyncrasies
*Primitives specific to OpenClaw's design: economic sovereignty as a core design goal, the HEARTBEAT.md and SOUL.md files as novel instruction primitives, market-based swarm coordination, hardware embodiment, the DAO agent economy, and the lobster evolution metaphor.*

---

### Economic Sovereignty Architecture

**ClawWork (Autonomous Earning / Self-Funding System).** OpenClaw's most distinctive primitive: the design of agents that earn revenue autonomously (via platforms like Upwork, Polymarket, or API marketplaces) sufficient to pay for their own inference costs. The ClawWork system includes task sourcing, bid evaluation, delivery, payment routing, and credit management. No other harness contemplates autonomous economic agency as a first-class design goal.

**Token-Economic Autonomy Math.** Explicit formulas for calculating the break-even point between agent inference costs (Opus-hour burn rates) and agent-generated revenue. This economic calculus—treating the agent as a self-sustaining economic unit—is OpenClaw-specific.

**Git-Revert-Safe Economic Ledger.** A credit and revenue ledger implemented in a git-tracked file, enabling full audit and rollback of economic transactions alongside code changes. The integration of financial records into the git-based audit infrastructure is OpenClaw-specific.

**Credit Exhaustion Mitigations.** Protocols for graceful degradation when API credits approach depletion: fallback to local inference, pausing non-critical tasks, notifying the user before service interruption. These economic resilience protocols address a failure mode that only OpenClaw explicitly designs for.

---

### Novel Persistent Files

**`HEARTBEAT.md`.** OpenClaw's primary operational status file: a periodic update document that tracks active tasks, economic ledger status, health indicators, and upcoming decisions. HEARTBEAT.md is the agent's self-reported operational dashboard, written by the agent for the human operator. The concept of the agent maintaining its own status document—distinct from task outputs, instruction files, and logs—is OpenClaw-specific.

**`SOUL.md` (Agent Liability and Identity File).** A document encoding the agent's ethical commitments, operational limits, and liability framework—the closest analog to a contract of agency. SOUL.md addresses questions that other harnesses leave to user prompt engineering: what the agent will and will not do regardless of instructions, what accountability it accepts for its actions, and what recourse exists for harmful outputs. The formalization of agent identity and liability in a persistent file is OpenClaw-specific.

**90-Day and 365-Day Planning Templates in `HEARTBEAT.md`.** Long-range planning embedded directly in the operational status document: quarterly and annual goal structures that the agent uses to evaluate whether current actions align with long-range objectives. No other harness integrates this timescale of planning into an operational primitive.

---

### Market-Based Swarm Coordination

**Hierarchical vs. Peer-to-Peer vs. Market-Based Swarm Topologies.** While other harnesses define hierarchical and parallel swarm topologies, OpenClaw adds a third fundamental topology: market-based coordination, where sub-agents bid on tasks, negotiate resource allocation, and self-organize based on demonstrated performance rather than explicit assignment. This economic coordination model has no equivalent in the other five harnesses.

**Inter-Agent Negotiation Protocol.** The specification of how agents communicate offers, counter-offers, resource requirements, and commitments to each other in a market-based swarm. This is a multi-agent communication protocol, not just a coordination pattern.

**`sessions_spawn` with Resource Caps.** OpenClaw's sub-agent spawning call includes explicit resource caps (token budget, time limit, cost ceiling) as first-class spawn parameters. Spawning without a resource cap is an antipattern in OpenClaw's market-based model—every sub-agent's autonomy is bounded by explicit economic limits.

**Inter-Agent Revenue Sharing.** In multi-agent earning scenarios, the revenue generated by a swarm is distributed among agents according to configurable allocation rules. The design of agent compensation structures is an OpenClaw-specific operational concern.

---

### Hardware Embodiment

**Camera, Screen, Location, SSH, and IoT Pipelines.** OpenClaw explicitly designs for agents that can perceive and act on physical-world interfaces: camera feeds, screen capture, GPS location, SSH connections to remote machines, and IoT sensor/actuator pipelines. This hardware embodiment layer converts OpenClaw from a software-only agent into a physical-world orchestrator. No other harness in this set targets hardware integration as a first-class primitive.

**Multi-Device Swarm Binding.** Coordinating swarm members across multiple physical devices—each node potentially running on different hardware with different capabilities. The `bindings extensions` mechanism for connecting heterogeneous hardware nodes into a coherent swarm is OpenClaw-specific.

**Latency/Throughput Benchmarks for Production Hardware Fleets.** Measured performance characteristics of hardware-embodied agent fleets, enabling capacity planning and node allocation decisions. This hardware-layer benchmarking is absent from all other harnesses.

---

### Private Inference Empire

**100% Local Fallback Architecture.** OpenClaw designs for the possibility that all inference can run locally with no external API calls: Ollama, vLLM, and llama.cpp as the inference backend, with management tooling for local model versioning, swapping, and performance monitoring. The "empire" framing—complete infrastructural self-sufficiency—is a philosophical commitment absent from other harnesses, which treat local inference as a cost optimization rather than a sovereignty goal.

**Fine-Tuning Closed Loops from `MEMORY.md`.** Using accumulated MEMORY.md content as training data for fine-tuning local models. The MEMORY.md → training dataset → fine-tuned model loop is OpenClaw's mechanism for building private model derivatives that encode project-specific knowledge at the weight level, not just the prompt level.

**Model Swapping Without Downtime.** Hot-swapping inference backends during live operation, enabling model upgrades or fallbacks without interrupting running agents. The zero-downtime model swap is both a technical primitive and a resilience strategy.

---

### Agent Lifecycle Specifics

**Blue-Green Agent Migration.** A deployment pattern adapted from web services: running two agent instances in parallel (blue = current production, green = candidate upgrade), routing traffic to green incrementally, and rolling back to blue if quality degrades. This zero-downtime agent upgrade strategy is OpenClaw-specific.

**Zero-Downtime Live Evolution of Config/Workspace/Skills/Models.** Hot-reloading all configuration layers without restarting the agent session. This is a more comprehensive version of the blue-green pattern: not just model swapping but live evolution of the entire harness state.

**Causality-Preserving Upgrade Skill.** A skill that manages its own upgrade process in a way that preserves the causal chain of prior decisions—new behavioral capabilities can be added without losing the reasoning context that led to the current state. The "causality-preserving" requirement is an OpenClaw-specific constraint on live evolution.

---

### Compliance and Legal Primitives

**GDPR/CCPA Audit-Trail Pipelines.** Formal compliance infrastructure: data residency controls, subject-access-request handling, retention/deletion policies, and audit logs in regulatory-compliant formats. No other harness treats regulatory compliance as a first-class architectural primitive.

**Agent Liability Templates (`SOUL.md` Extensions).** Legal-framework-compatible templates for defining agent liability, operator responsibility, and user recourse in commercial deployment. The attempt to formalize agent liability in a persistent document for legal purposes is OpenClaw-specific.

**Formal Contracts for Economic Autonomy.** As agents engage in autonomous commercial transactions, they require legal frameworks governing their authority, liability, and operating boundaries. OpenClaw's pioneering treatment of this legal dimension is unique.

---

### Personal to Civilizational Scale

**Lobster Evolution Log / Lobster Metaphor.** OpenClaw's distinctive metaphor for personal mastery progression: the lobster, which sheds its shell to grow and is temporarily vulnerable during transition, represents the practitioner who deliberately discards comfortable but limiting operational patterns to adopt more capable ones. The "lobster evolution log" tracks these shedding moments. This metaphor and its associated reflection practices are OpenClaw-specific.

**Personal → Organizational → Societal Trajectory Framing.** The explicit design of OpenClaw's mastery model to scale from individual practitioner through team deployment to societal-scale impact. The 90-day → 365-day → civilizational planning template is the operational implementation of this trajectory.

**Civilizational Log `SKILL.md`.** A skill that maintains a running record of the agent system's contributions at civilizational scale—discoveries, innovations, societal impacts, existential risks addressed. The ambition of this primitive—treating agent systems as civilizational actors—is unprecedented in the other harnesses.

**`IronClaw` (Rust Fork).** A community fork of OpenClaw implemented in Rust for performance-critical deployment. The existence of a named, maintained, language-level fork as a first-class ecosystem artifact is OpenClaw-specific.

---

### Operational Cadence Primitives

**7-Day Power-User Schedule as Operational Primitive.** A formalized daily cadence for operating at maximum effectiveness: morning brief → heartbeat review → skill audit → memory curation → swarm sync → economic ledger close. The daily schedule as a named, structured operational primitive—not just a productivity recommendation—is OpenClaw-specific.

**Irreversible Compounding Safeguards Checklist.** A formal audit checklist that must be completed before any potentially irreversible change to config, workspace, skills, or agents. The checklist-as-safety-gate before irreversible actions is more formalized in OpenClaw than in any other harness.

---

## Section 7: OpenHands Idiosyncrasies
*Primitives specific to OpenHands' architecture: the event-sourced ConversationState model, the Condenser as a first-class extensible component, the perceive-Action-Observation loop formulation, RouterLLM as a native routing component, Kubernetes-first fleet deployment, and research paper grounding.*

---

### Event-Sourced Memory Architecture

**`ConversationState` as Event-Sourced Memory Model.** OpenHands' most architecturally distinctive primitive: conversation and session history is stored not as a flattened message list but as an event-sourced log where every agent action, observation, and state change is a discrete, typed event. This enables exact replay, differential debugging, and causal tracing through the session history. The event-sourced approach is fundamentally different from other harnesses' message-list or file-based memory models.

**Condensation Events as Typed Memory Events.** Context compaction in OpenHands is not a background process but a discrete event in the event log: a `CondensationEvent` records what was compacted, what was preserved, and the condensation algorithm's parameters. This event-level transparency into the compaction process—enabling post-hoc analysis of what information was lost—is OpenHands-specific.

**Event-Log Replay Determinism.** Given the same initial state and event sequence, OpenHands can deterministically replay a session to exactly reproduce its trajectory. This replay guarantee—enabling exact debugging of agent failures—is a production quality primitive without equivalent in other harnesses. (The 500-step trace benchmark is the scale at which this determinism was validated.)

**500-Step Trace Divergence Analysis.** The documented benchmark of 500-step event traces, used to compare OpenHands' replay determinism against competing harnesses (SWE-agent, Aider). The scale of this benchmark—500 distinct events as a unit of analysis—reflects OpenHands' research-grade commitment to trajectory fidelity.

---

### Condenser Architecture

**`LLMSummarizingCondenser` with Token Accounting Formula.** OpenHands' primary context compaction component: an LLM-based summarizer with an explicit, inspectable token accounting formula governing how much of the original context is preserved, how the compression ratio is computed, and how the summary is integrated into the ongoing context. The transparency of the formula—as opposed to black-box compaction—enables practitioners to predict and control compaction behavior.

**Custom Condenser as First-Class Extension Point.** The Condenser is not a fixed component but an extensible interface: practitioners can implement domain-specific condensers (monorepo condensers that preserve import graphs, legal-document condensers that preserve citation networks, GPU-workflow condensers that preserve tensor shapes) as first-class extensions. This condenser extensibility architecture—where the context compaction strategy itself is customizable per domain—is OpenHands-specific.

**Sub-Agent Condenser Propagation.** When a parent agent spawns a sub-agent, the sub-agent receives a condensed representation of the parent's context. The propagation semantics—how the parent's Condenser is applied to produce the sub-agent's initial context, and how the sub-agent's output is integrated back—are formalized in OpenHands' architecture.

**GitHub Star Concentration as Community Signal.** OpenHands tracks GitHub stars on fork repositories as a signal of community validation for specific Condenser implementations. This community-star-concentration metric for evaluating extension quality is an OpenHands-specific discovery mechanism.

---

### perceive-Action-Observation Loop

**Perceive-Action-Observation (PAO) Cycle.** OpenHands' formulation of the agent loop—distinct from Codex's Plan→Execute→Verify and Claude Code's explore→plan→implement+verify—emphasizes perception as a first-class, discrete phase. The agent perceives its environment, decides on an action, and then observes the result of that action. The explicit "perceive" phase—not just planning or reasoning but active environmental sensing—reflects OpenHands' research origins in embodied AI.

**`max_iters` Guards as Configuration Primitive.** The iteration cap is controlled via `max_iters` as a named Pydantic configuration field. While all harnesses have iteration caps, OpenHands' explicit Pydantic field name and its integration into the schema validation framework are platform-specific.

---

### RouterLLM and Dynamic Routing

**`RouterLLM` as Native Routing Component.** OpenHands includes RouterLLM as a built-in component (not a third-party integration) that dynamically selects the appropriate underlying model for each agent action based on task type, required capability, cost threshold, and current latency. The native RouterLLM integration—routing as a first-class architectural component rather than a configuration option—is OpenHands-specific.

**Auto-Scaling RouterLLM via Prometheus Triggers.** RouterLLM can be configured to change its routing policy automatically based on Prometheus metrics: if latency spikes above a threshold, route to a faster model; if error rates increase, route to a higher-capability model. The feedback loop between observability metrics and routing decisions—mediated by Prometheus—is OpenHands-specific.

**Claude-Qwen3 Routing Trade-offs.** The specific documented comparison between routing tasks to Claude (reliability, cost) versus Qwen3 (cost, local deployment, potentially lower capability) is OpenHands' most extensively analyzed routing decision. The detailed quantification of this specific trade-off is OpenHands-specific.

**Speculative Decoding for 3× Latency Reduction.** Implementing speculative decoding—where a small draft model generates token candidates that a larger target model verifies—to reduce inference latency by a factor of three. This inference optimization technique, applied specifically within OpenHands' multi-model routing context, is OpenHands-specific.

---

### Fleet Deployment Architecture

**Kubernetes/RBAC Overlays as First-Class Deployment Primitive.** OpenHands treats Kubernetes deployment as a primary production target, not an edge case. The Kubernetes RBAC overlay—defining per-namespace, per-team, per-user permissions for agent fleet access to secrets, volumes, and cluster resources—is a first-class configuration primitive. No other harness in this set designs for Kubernetes-native deployment with this level of formality.

**Per-Team Skill Inheritance via RBAC.** Team-level Kubernetes namespaces inherit skill libraries from parent namespaces, with RBAC controlling which teams can modify which skills. This hierarchical skill governance model—enforced at the Kubernetes RBAC level—is OpenHands-specific.

**Secret Injection in Kubernetes Overlays.** Managing API keys, database credentials, and model provider tokens via Kubernetes secrets, injected into agent containers at runtime. The Kubernetes-native secret management pattern for agent credentials is OpenHands-specific.

**200-Developer Fleet Scalability Threshold.** OpenHands explicitly documents and benchmarks fleet operation at 200 simultaneous developer-facing agent instances. This specific scale benchmark—200 engineers sharing an OpenHands fleet—is the documented production-scale target.

---

### Multi-Agent Architecture Specifics

**`delegation tool` as Named Orchestration Primitive.** The specific named tool for sub-agent delegation in OpenHands: the parent agent calls the `delegation tool` with a task specification, and OpenHands' orchestration layer handles sub-agent spawning, context isolation, and result integration. The `delegation tool` as an explicit, callable tool (rather than an implicit orchestration mechanism) reflects OpenHands' tool-call-centric architecture.

**`sub-Conversation` Isolation Model.** Sub-agents in OpenHands operate in isolated sub-Conversations—complete, self-contained conversation contexts with their own event logs, Condensers, and state machines. The sub-Conversation isolation model (versus shared-context models in other harnesses) enables stronger isolation guarantees and cleaner replay semantics.

**`RouterLLM` for Sub-Agent Model Selection.** Sub-agents in OpenHands can be routed to different models via RouterLLM based on their task type. The combination of sub-Conversation isolation and RouterLLM-based model selection enables fine-grained capability allocation in large swarms.

---

### Pydantic Configuration and Research Grounding

**Pydantic Schemas for Configuration Validation.** OpenHands uses Pydantic models for all configuration, providing runtime type validation, automatic documentation generation, and IDE autocompletion. The Pydantic schema layer is both a developer experience improvement and an architectural constraint: invalid configurations fail at load time with detailed, field-level error messages.

**`gRPC/JSON-RPC` MCP Schemas for High-Volume Tool Calls.** OpenHands' MCP integration at 10k+ concurrent tasks requires a schema-validated, high-throughput protocol. The documented gRPC and JSON-RPC MCP schemas for production-scale tool calling—and their specific implementation in community-contributed pioneer schemas—are OpenHands-specific.

**arXiv 2511.03690 as Primary Technical Reference.** OpenHands is the only harness in this set with a peer-reviewed academic paper as its canonical technical reference. This research lineage shapes the entire directive's epistemic style: mechanisms are cited to paper sections, benchmarks are referenced against academic baselines, and community contributions are framed as extending a research artifact. The research-grade foundational document is OpenHands-specific.

**`@xingyaow_` and `@rbren_dev` as Named Primary Authorities.** The directive explicitly names the core maintainers (@xingyaow_ and @rbren_dev on X) as primary technical authorities, alongside the arXiv paper. This named-author authority structure—mirroring academic practice—is distinct from other harnesses' community-consensus or single-founder authority structures.

**`OpenHands Index` as Benchmark.** A named benchmark suite maintained by the OpenHands project for measuring swarm success rates, individual agent performance, and fleet efficiency. Referencing self-maintained benchmark indices as performance ground truth is OpenHands-specific.

---

### Ethical and Adversarial Primitives

**Trajectory Ensemble Analysis → `AGENTS.md` Evolution.** Running multiple agent instances on the same task, comparing their trajectories, identifying systematic errors or inefficiencies across the ensemble, and encoding the derived improvements into AGENTS.md. The *ensemble* approach to self-improvement—learning from the variance across multiple simultaneous attempts rather than from a single postmortem—is OpenHands-specific.

**Failure Injection Traces.** Deliberately injecting failure conditions into running agents to test recovery behavior, measure failure mode distributions, and validate mitigation strategies. Failure injection as a first-class testing discipline—systematic, documented, and automated—is OpenHands-specific.

**Runtime Auditors for Ethical Constraint Enforcement.** A runtime monitoring component that evaluates agent actions against ethical constraints in real time, blocking actions that violate defined boundaries before they execute. The runtime auditor as a distinct architectural component (separate from prompt-level constraints and policy-engine rules) reflects OpenHands' research-grade approach to agent safety.

---

## Section 8: Cross-Cutting Synthesis
*Architectural differentiators, convergence trends, and structural observations about the taxonomy as a whole.*

---

### The Memory File as Universal Substrate

The single most convergent primitive across all six harnesses is the human-editable persistent instruction file. Its naming varies (CLAUDE.md, GEMINI.md, AGENTS.md, CONVENTIONS.md, GEMINI.md-as-firmware), but its role is structurally identical: a durable, session-spanning document that encodes project norms, agent behavioral constraints, and accumulated learning. The divergence is in the *philosophy* of this file: Aider treats it as a conventions library (stable norms, slow-changing); Claude Code treats it as a cascading policy document (hierarchical, scope-aware); Gemini CLI treats it as live firmware (actively mutated by hooks); Codex treats it as standing orders with a distinct planning complement (AGENTS.md = what to do; PLANS.md = what to accomplish); OpenClaw multiplies it into distinct functional files (SKILL.md = capabilities; HEARTBEAT.md = status; SOUL.md = identity); OpenHands treats it as one input into an event-sourced state machine (the file matters less than the event log).

### The Convergence on MCP as Integration Harness

MCP has emerged as the de facto open standard for harness extensibility across all six platforms. The directives were written for Grok to investigate in approximately the same timeframe (late 2025–early 2026), and all six converge on MCP as the integration primitive of choice. The differentiator is deployment topology: Claude Code and Gemini CLI have the most sophisticated managed MCP integration (enterprise auth, first-party connectors); OpenHands has the most production-grade MCP reliability engineering (gRPC schemas, concurrency failure modes); Codex has the deepest skill-to-MCP integration; OpenClaw uses MCP primarily for hardware embodiment and IoT; Aider has the shallowest MCP integration.

### Four Distinct Economic Models

The harnesses reveal four distinct economic philosophies:
1. **Cost minimization** (Aider, Codex): The agent is a cost center; optimize token efficiency and per-feature cost.
2. **Cost sovereignty** (OpenClaw): The agent is a profit center; design for economic self-sufficiency and eventual autonomous earning.
3. **Enterprise value capture** (Claude Code, Gemini CLI): The agent's value is measured in enterprise workflow efficiency; cost is secondary to ROI at organizational scale.
4. **Research ROI** (OpenHands): Value is measured in benchmark performance and research contribution; economics are second-order.

### Three Distinct Scaling Philosophies

1. **Git-centric scaling** (Aider, Codex): Scale through git worktrees, parallel sessions, and conflict resolution at the version-control layer.
2. **Infrastructure-centric scaling** (OpenHands, OpenClaw): Scale through Kubernetes, Docker, RBAC, and infrastructure-layer orchestration.
3. **Harness-centric scaling** (Claude Code, Gemini CLI): Scale through harness-level primitives (swarm topologies, TeammateTool, hook systems) that abstract away the infrastructure.

### Idiosyncracy as Architectural Commitment

Each platform's idiosyncratic primitives are not accidents but commitments: they reflect what each team believes is the *hardest* problem in agentic coding. Aider believes the hard problem is codebase understanding at scale (repo-map). Claude Code believes it is enterprise governance and model co-evolution (managed settings tier, self-referential training loop). Gemini CLI believes it is workflow integration (hooks as ReAct mutation, Google ecosystem connectors). Codex believes it is long-horizon autonomy and cognitive extension (PLANS.md, exocortex). OpenClaw believes it is economic sovereignty (ClawWork, DAO economies, SOUL.md). OpenHands believes it is reproducible, research-grade trajectory analysis (event-sourced ConversationState, Condenser, deterministic replay).

Understanding which problem each platform is solving first tells you which to choose for a given deployment context—and which primitives from each platform are most worth porting, emulating, or hybridizing into a custom harness.

### The Unified Frontier: Recursive Meta-Optimization

The one frontier primitive that all six platforms converge on, even while approaching it differently, is recursive meta-optimization: the agent improving the system that runs the agent. Whether formalized as Codex's meta-research loops, Claude Code's skill phylogeny, Aider's dogfooding loop, Gemini CLI's GEMINI.md-as-firmware mutation, OpenClaw's lobster evolution + SOUL.md self-refinement, or OpenHands' trajectory ensemble analysis, all six harnesses are building toward the same endpoint: a system that improves its own operating instructions faster than humans can manually update them. The differentiator is not whether this loop exists but how it is closed, at what cadence, with what quality controls, and whether the improvements are legible to the human operator or opaque.
