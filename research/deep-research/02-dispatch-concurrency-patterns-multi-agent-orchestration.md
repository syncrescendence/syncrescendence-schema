# Dispatch & Concurrency Patterns for Multi-Agent AI Orchestration

## Executive Summary

Five production systems — MCO, gstack/Conductor, Claude Code Agent Teams, Symphony (OpenAI), and DeerFlow — converge on a common structural insight: fan-out concurrency is tractable, but near-state conflicts require deliberate primitive design. Each system makes a different trade-off between isolation cost and coordination expressiveness. The core patterns are **typed fan-out dispatch**, **worktree-per-agent isolation**, **file-locked task claiming**, **mailbox-based peer messaging**, and **serialized merge queues with CI gating**. None achieves all five simultaneously without coordination overhead; the choice of which primitives to compose determines what classes of concurrent edit conflict are possible.

***

## 1. MCO (mco-org/mco): Parallel Dispatch with Consensus Synthesis

MCO describes itself as a "neutral orchestration layer for AI coding agents" that dispatches the same prompt to multiple heterogeneous CLI agents simultaneously and synthesizes their outputs. The supported backend CLIs are `claude`, `gemini`, `codex`, `opencode`, `qwen`, and `openclaw`. The primary dispatch model is pure fan-out: one orchestrating prompt is broadcast to all configured agents, all run in parallel, and the calling agent (or OpenClaw as meta-orchestrator) reads MCO's help interface, learns the dispatch API, and synthesizes consensus from the returned outputs.[^1]

MCO's design thesis is "work like a Tech Lead: assign one task to multiple agents, run in parallel, and compare outcomes before acting". This positions MCO as a **review/analysis dispatch layer** rather than a parallel code-writing coordinator. The synthesis step is not internally defined inside MCO; it falls to the primary orchestrator agent (commonly OpenClaw) to consume parallel outputs and select, merge, or debate among them.[^1]

**Near-state conflict posture**: Because MCO's canonical use is parallel review of a shared read-only codebase rather than parallel writes, no explicit locking, worktree provisioning, or merge queue primitives are described in available documentation. The "compare before acting" model sidesteps write conflicts by design: multiple agents produce independent read-based analysis, then a single meta-agent acts on the synthesized result. If MCO is used to dispatch parallel *write* tasks to heterogeneous CLIs, the conflict resolution burden falls on the human or orchestrator agent at synthesis time — MCO provides no native primitive for this.[^1]

***

## 2. gstack (garrytan/gstack) + Conductor: Structured Prompting + External Parallelism

gstack is frequently described as multi-agent orchestration but is more precisely **structured prompt engineering**: a single Claude Code instance switches roles using SKILL.md files (CTO, Staff Engineer, Senior Engineer, etc.) to simulate a 15-person engineering org. It does not provide multiple independent agent instances, dynamic memory shared across agent boundaries, or direct message-passing. Garry Tan reports producing 600,000 lines of production code in 60 days using gstack combined with the Conductor app.[^2]

True parallelism in this system comes from **Conductor** (a Mac-only application), not from gstack itself. Conductor automates git worktree creation, branching, and isolation, allowing independent work streams to proceed simultaneously without merge conflicts. The architecture is: each worktree is an independent feature branch; Conductor manages context isolation so one agent's file operations do not contaminate another's context window; work is reviewed using the `/review` command and then merged.[^2]

**Near-state conflict posture**: Conductor's worktree enforcement means two "agents" (actually separate Claude Code instances in separate worktrees) work against different HEAD states. Conflicts are deferred to the merge step, where they appear as standard git merge conflicts and are resolved manually with `/review`. There is no semantic-level conflict detection — two agents can write logically conflicting code in separate worktrees that only manifests as a conflict at merge time. Coordination is user-mediated: the human sequences the merges.[^2]

***

## 3. Claude Code Agent Teams (Shipped February 5, 2026)

Released as an experimental feature in Claude Code v2.1.32 on February 5, 2026, alongside Claude Opus 4.6, Agent Teams is the most fully specified concurrent dispatch system of those examined here. It requires the `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` environment variable and Opus 4.6+ model.[^3][^4]

### Architecture

| Component | Role | Persistence |
|-----------|------|-------------|
| Team Lead | Main session that spawns teammates, assigns work, synthesizes results | Session duration |
| Teammates | Separate Claude Code instances with own full context windows | Until explicit shutdown |
| Task List | Shared work queue with dependency tracking; file-locked claims | `~/.claude/tasks/{team-name}/` |
| Mailbox | Peer-to-peer messaging system between all agents | Session duration |

[^5][^6]

### Dispatch Pattern

The lead creates a typed task list with dependency tracking. Each task carries an ID, description, status, assignee, and an optional `depends_on` array of other task IDs. Tasks transition through `pending → in_progress → completed`; blocked tasks auto-unblock when their dependencies complete without manual intervention. Teammates can be explicitly assigned tasks by the lead or **self-claim** the next unassigned, unblocked task autonomously — with atomic file locking to prevent race conditions when multiple teammates simultaneously try to claim the same task.[^7][^5]

### Communication Primitives (Seven Tools)

Claude Code Agent Teams exposes seven coordination primitives:[^8][^9]

1. `TeamCreate` — initialize team namespace and config
2. `TaskCreate` — define work units as JSON files on disk
3. `TaskUpdate` — claim/complete state transitions
4. `SendMessage` — point-to-point message to named teammate
5. `Broadcast` — message all teammates simultaneously (costs scale with team size; use sparingly)
6. `shutdown_request` / `shutdown_response` — graceful teardown handshake
7. `plan_approval_response` — quality gate: teammate plans before implementing, lead must approve

The `SendMessage` primitive enables genuine peer-to-peer communication, not just hierarchical hub-and-spoke. Teammates can message each other directly without routing through the lead — a critical distinction from the subagent model, where workers can only report back to the parent. Message delivery is automatic (push-not-poll); idle notifications fire automatically when a teammate stops.[^10][^8][^5]

### Worktree Isolation (February 2026 Update)

The February 2026 Claude Code release added the `isolation: worktree` key in agent definition YAML files:[^11]

```yaml
# .claude/agents/feature-builder.yaml
name: feature-builder
isolation: worktree
model: claude-opus-4.6
tools: [read, write, bash]
```

When set, Claude Code automatically provisions a dedicated git worktree for that agent, runs all file operations within the isolated tree, and cleans up or preserves the worktree on task completion. This converts what was a manual worktree-scripting requirement into a declarative agent property, removing a major friction point for parallel agent workflows.[^11]

### Near-State Conflicts

The official documentation acknowledges a hard limitation: "Two teammates editing the same file leads to overwrites. Break the work so each teammate owns a different set of files". The task dependency system provides the primary coordination mechanism: if Agent A's task modifies shared config, Agent B's task depending on it is blocked until Agent A completes. The `plan_approval_response` gate allows quality review before writes occur. File locking ensures only one agent claims a task at a time, but it does not prevent two independently claimed tasks from touching overlapping files.[^7][^8][^5]

### Empirical Validation: Anthropic C Compiler (Feb 2026)

Anthropic researcher Nicholas Carlini deployed 16 Claude Opus 4.6 agents to build a Rust-based C compiler from scratch. Each agent ran in its own Docker container, cloned a shared git repository, claimed tasks autonomously via lock files, and pushed completed code back upstream. There was **no central orchestration agent** — each instance determined what issue to address next and resolved merge conflicts independently. The result: a 100,000-line Rust compiler capable of building a bootable Linux 6.9 kernel on x86, ARM, and RISC-V, achieving 99% of GCC's torture test suite, produced over ~2,000 sessions in approximately two weeks at ~$20,000 in API costs. Critically, when 16 agents were initially run simultaneously on the same bugs, they overwrote each other's fixes — the experiment found that per-task lock file claiming (not just worktree isolation) was necessary to prevent destructive interference.[^12][^13][^14][^15]

***

## 4. Symphony: Two Distinct Systems Sharing a Name

There are two independent systems named "Symphony," which must be distinguished carefully.

### Symphony (OpenAI, Released March 4, 2026)

OpenAI's Symphony is an open-source Elixir/OTP daemon for autonomous software development. Its architectural choice of Erlang/BEAM provides high-concurrency supervision trees, lightweight process isolation, and hot code reloading of subagents without service interruption. It persists state in PostgreSQL via Ecto and runs as a persistent service.[^16][^17][^18]

**Dispatch model**: Symphony's core unit is the **implementation run** — one issue from a Linear tracker maps to one isolated agent workspace. The system polls Linear for tickets in "Ready for Agent" state, creates a deterministic per-issue sandbox, executes the agent, and gates landing on **Proof of Work**: CI must pass, unit tests must clear, and a PR walkthrough must be generated before the code is merged. Critically, this is **not a fan-out pattern** — it is a single-agent-per-issue dispatch model with strong serialized lifecycle management.[^18][^19]

**Concurrency primitives**: Symphony uses per-state concurrency limits to prevent race conditions — for example, a maximum of 1 agent in `human_review` state (serialize reviews), max 2 in `merging` state (limited merge parallelism), and max 10 in `in_progress` state (full parallel development). Erlang/OTP supervision trees provide process-level fault containment: individual agent failures are caught and recovered without system-wide crash. The reconciliation pattern periodically re-fetches issue state from Linear; if an issue is marked Done externally, Symphony detects this and stops the agent, preventing wasted compute. Exponential backoff retry with configurable cap handles transient failures.[^20][^17]

**Near-state conflicts**: Because each issue maps to one isolated workspace, concurrent writes to the same state within a single run are not a design concern. The per-state concurrency limits on `merging` (max 2) prevent merge races at the integration layer. The reference workflow's "destructive review rework" — full workspace reset when review requires changes — eliminates partial-edit conflicts at the cost of discarding work.[^21][^19][^20]

### Symphony (arXiv, Decentralized Framework, August 2025)

A separate academic "Symphony" is a decentralized multi-agent framework for scalable reasoning across heterogeneous edge LLMs. It introduces three mechanisms: (1) a **decentralized ledger** recording agent capabilities and availability; (2) a **Beacon-selection protocol** that scores agents against subtask requirements and routes tasks to best-match agents dynamically; and (3) **weighted result voting** that aggregates outputs across multiple Chains-of-Thought (CoTs) to mitigate individual model errors or bias. On reasoning benchmarks (BBH, AMC), this Symphony outperforms centralized orchestrators like AutoGen and CrewAI by 6.5–41.6% absolute accuracy gains. This is architecturally distinct from OpenAI's Symphony — it is a decentralized inference-layer coordination framework, not a software development lifecycle manager.[^22][^23]

***

## 5. DeerFlow (ByteDance v2.0): Bounded Parallel Subagent Spawning

DeerFlow 2.0, built on LangGraph and LangChain, is a research-oriented super-agent with a lead-plus-subagent architecture. The lead agent acts as orchestrator: it decomposes complex prompts into structured sub-tasks, decides which can run in parallel, and spawns subagents via the `task()` tool. Each sub-agent receives its own scoped context, its own tool set, and its own termination conditions — isolated from other subagents.[^24][^25][^26][^27]

### Dispatch Pattern

Fan-out occurs when the lead issues multiple `task()` calls in a single response turn; all issued tasks execute simultaneously:[^24]

```python
# Lead agent's single response — all 3 run simultaneously
task(description="Research Python", prompt="...", subagent_type="general-purpose")
task(description="Research Go",     prompt="...", subagent_type="general-purpose")
task(description="Research Rust",   prompt="...", subagent_type="general-purpose")
```

Sequential dependencies are handled by separating calls across turns: the lead waits for results before issuing the next wave of tasks. This creates a **turn-scoped fan-out** pattern rather than a free-running concurrent DAG.[^24]

### Concurrency Limit

DeerFlow enforces a maximum of **3 concurrent sub-agents** enforced by `SubagentLimitMiddleware`, which truncates excess `task()` calls:[^24]

```python
class SubagentLimitMiddleware:
    async def after_model(self, state: ThreadState):
        task_calls = [msg for msg in state["messages"]
                      if isinstance(msg, AIMessage) and msg.tool_calls]
        if len(task_calls) > MAX_CONCURRENT_SUBAGENTS:
            state["messages"][-1].tool_calls = task_calls[:3]
```

If the lead requests more than 3 subagents, the first 3 are executed and the remainder silently dropped. For larger fan-outs, the lead must batch requests across sequential turns.[^24]

### ThreadState and LangGraph Concurrency

DeerFlow's `ThreadState` extends LangGraph's `AgentState` with custom reducers for `messages`, `artifacts`, and `viewed_images`. LangGraph's reducer model handles concurrency at the state graph level: updates are returned from nodes (never mutated in place) and parallelism is managed via the graph executor's reducer, preventing data races within the graph. This means DeerFlow's concurrency model is **state-graph scoped** — subagents operate on isolated thread states, not a shared mutable object, so the race condition is contained.[^28][^29]

**Near-state conflicts**: DeerFlow's primary use case is research aggregation (parallel web searches, parallel analysis), not parallel code editing. No shared filesystem state exists between subagents in the reference architecture. The lead's synthesis step is a structured reduce over subagent results into a `ThreadState` field.[^29][^24]

***

## Cross-System Concurrency Primitives

### Git Worktrees

The foundational filesystem isolation primitive across systems is the git worktree. A worktree gives each agent its own working directory that shares the same underlying git object store but maintains a separate HEAD state, staged index, and file system view. This eliminates file-level race conditions *during active work* but does not prevent semantic conflicts (two agents writing logically incompatible implementations in separate files).[^30][^31]

The canonical sequential merge pattern using directory-mutex locking is:[^31]

```bash
# Acquire directory lock → rebase on latest main → merge → release lock
while ! mkdir .git/merge.lock 2>/dev/null; do sleep 1; done
git checkout "$branch" && git rebase main
git checkout main && git merge --no-ff "$branch"
rmdir .git/merge.lock
```

Key failure modes identified in production:[^32]

| Conflict Type | Root Cause | Resolution Pattern |
|---------------|------------|-------------------|
| Lock file divergence | `package-lock.json` generated independently | `npm install` after merging `package.json`; npm-merge-driver |
| Index lock error | Stale `.git/worktrees/<name>/index.lock` | Remove stale lock file |
| Branch already checked out | Worktree reuse collision | `-b new-branch-name` flag on `git worktree add` |
| Merge conflict (shared file) | Hotspot files (routes, configs, barrel exports) | Merge first branch; rebase second; resolve |
| Stale worktree | Crashed agent left ghost worktree entry | `git worktree prune` |

[^32]

The single-writer rule for hotspot files — designating one agent as the owner of shared configuration files — prevents the most common class of semantic conflicts. Additive-only changes (new routes in new files, new exports in new modules rather than modifying existing ones) further reduce merge-time conflict rates.[^32]

### Mailboxes

The Claude Code Agent Teams mailbox is a named, FIFO, push-delivered message queue. Any string can be an inbox name — worker IDs, task slugs, topic slugs. Messages are delivered automatically to recipients; the lead does not need to poll. This maps directly to Erlang/OTP's message-passing model (per-process inboxes, FIFO delivery, no shared memory) — the same primitives underpinning Symphony's concurrency model.[^33][^17][^34][^5]

A Rust-idiomatic equivalent used in parallel multi-agent coding experiments maps the Agent Teams primitives:[^33]

| Agent Teams concept | Rust equivalent |
|---------------------|----------------|
| Shared task list | `TaskQueue<P>` |
| Atomic task claiming | `TaskQueue::claim` |
| Task dependencies | `depends_on` in `TaskQueue::push` |
| Retry on failure | `max_attempts` + re-queue |
| Queue change notification | `TaskQueue::notify_handle` |
| Lead / worker separation | `TeamLead` + `TeamContext` |
| Point-to-point message | `Mailbox::send` (named inboxes) |

[^33]

### Merge Queues

The most sophisticated merge queue implementation in this survey is Enki's refinery processor. When a worker finishes, its branch is committed and queued for merging; the refinery handles rebase, conflict detection, and verification. If conflicts exist that cannot be auto-resolved, the refinery spawns a dedicated **merger agent** in a temp clone to resolve conflicts, commits the resolution, and returns control to the refinery. This creates a three-tier merge pipeline: worker agent → refinery (automated) → merger agent (conflict resolution) → verification → land.[^35]

GitHub's native Merge Queue (available since 2023) serializes PRs before CI runs, preventing the failure mode where CI passes on an outdated base branch that becomes invalid after another PR lands. The standard enterprise pattern for agent-generated PRs uses branch protection rules, severity-based merge gates, and a dedicated token (not the default `GITHUB_TOKEN`) to ensure CI triggers on agent-created PRs.[^36][^37]

***

## Comparative Dispatch Model

| System | Fan-Out Model | Parallelism Scope | Synthesis Method | State Conflict Primitive |
|--------|--------------|-------------------|-----------------|------------------------|
| MCO | Broadcast same prompt to all CLIs | Unlimited (per config) | Orchestrator reads all outputs; selects/merges | None native; compare-before-act |
| gstack + Conductor | One worktree per role/task | External via Conductor | Human-mediated `/review` + merge | Worktree per task (filesystem isolation) |
| Claude Code Agent Teams | Lead-spawned teammates, self-claiming task list | No hard limit; 3–5 recommended | Lead synthesizes after all complete; peer debate supported | File-locked task claiming + `isolation: worktree` (Feb 2026) |
| Symphony (OpenAI) | One agent per issue (no fan-out) | Per-state concurrency limits | PR + Proof of Work gating | OTP supervision trees; per-state max concurrency |
| DeerFlow | Lead-issued `task()` calls in one turn | Max 3 concurrent (hard limit) | Lead reduces structured subagent results | LangGraph state reducers; isolated ThreadState per subagent |
| Symphony (arXiv) | Beacon-selected agents per subtask | Dynamic, ledger-bounded | Weighted CoT voting | Decentralized ledger; capability-scored routing |

***

## Structural Convergences and Divergences

Three convergences appear across independent implementations:[^38]

1. **Hierarchical decomposition outperforms flat structures.** Cursor's browser-building experiment (1,000+ commits/hour, 10M tool calls) found that flat equal-status agent structures caused agents to hold locks too long, deadlock, and exhibit responsibility avoidance — choosing smaller, safer changes rather than core challenges. The fix was a three-tier hierarchy (root planners, sub-planners, workers). Anthropic's C compiler experiment confirmed the pattern with a flatter but still hierarchical model where agents self-selected specialization.[^38][^12]

2. **Worktrees are necessary but not sufficient.** Worktrees prevent filesystem races during active work; they do not prevent semantic conflicts. "Two agents can write clean isolated code that still conflicts — one introduces a new abstraction the other's code assumes doesn't exist". Semantic coordination requires either exclusive file ownership (the single-writer rule), task dependency tracking (Claude Code's dependency graph), or post-merge synthesis (MCO's compare-before-act model).[^30]

3. **The merge sequence itself must be serialized.** Even with worktree isolation, simultaneous merges cause conflicts because Agent 2's branch was rebased on a main that predates Agent 1's merge. Production systems use directory-mutex locks (bash-level), per-state concurrency limits (Symphony), or a dedicated merge queue processor (Enki's refinery) to serialize the integration step.[^31]

A notable divergence is the **verification philosophy**: Symphony (OpenAI) requires Proof of Work (CI green, PR walkthrough, tests pass) before any code lands, while Claude Code Agent Teams provides hooks (`TaskCompleted`, `TeammateIdle`) for quality gating but makes them optional and does not prescribe verification content. The tradeoff is flexibility vs. correctness guarantees — Symphony's strict gating reduces agent-introduced regressions at the cost of requiring a well-formed CI pipeline.[^18][^5]

***

## Implications for Constitutional Multi-Agent Systems

For a system entering "operational constitution" — formalizing typed contracts, receipts, and trust boundaries — the most directly applicable design pattern is a **typed task contract** (issue-as-contract: claiming agent, scope, allowed files, dependency IDs, completion criteria, and verification hook) combined with **declarative worktree isolation** (`isolation: worktree` per agent definition), and a **serialized merge queue with CI gating** at the integration boundary. Mailbox-based peer messaging (FIFO named inboxes) provides the audit trail and trust-bounded communication channel between agents of different provenance.[^39][^5][^11][^31][^33]

The unresolved design challenge across all surveyed systems is **semantic conflict detection**: identifying when two independent agents, editing non-overlapping files in isolated worktrees, produce an integration whose semantics violate shared invariants. Symphony's Proof-of-Work gate is the strongest published answer to this (CI as the semantic oracle), but it requires investing in test coverage before agents can be trusted to self-integrate. Without that investment, the "compare before acting" model (MCO's design) — fan-out for analysis, human or meta-agent for synthesis — remains the safest pattern for heterogeneous orchestration over shared state.[^18]

---

## References

1. [GitHub - mco-org/mco: Orchestrate AI coding agents. Any prompt ...](https://github.com/mco-org/mco) - MCO (Multi-CLI Orchestrator) is a neutral orchestration layer for AI coding agents. It dispatches pr...

2. [Garry Tan's gstack and the rise of AI agent teams | Agents' Codex](https://agentscodex.com/posts/2026-03-20-garry-tan-gstack-agent-teams-claude-code/) - Garry Tan's gstack reached 20,000 GitHub stars in days by turning Claude Code into a full engineerin...

3. [Claude 4.6 Agent Teams: The Complete Guide to Multi-Agent ...](https://blog.laozhang.ai/en/posts/claude-4-6-agent-teams) - Released on February 5, 2026 alongside Claude Opus 4.6, Agent Teams enable one session to act as a t...

4. [Agent Teams Workflow - claude-code-ultimate-guide - GitHub](https://github.com/FlorianBruniaux/claude-code-ultimate-guide/blob/main/guide/workflows/agent-teams.md) - Each agent works in separate git worktree (isolated file system) ... Building a C compiler with agen...

5. [agent-teams.md](https://code.claude.com/docs/en/agent-teams.md)

6. [Agent Teams in Claude Code: Complete Guide to Multi-Agent ...](https://www.claudio-novaglio.com/en/papers/agent-teams-claude-code-multi-agent-orchestration) - Technical paper: multi-agent architecture in Claude Code with Agent Teams, sub-agents, git worktrees...

7. [Claude Code Agent Teams: Building Coordinated Swarms of AI ...](https://www.dotzlaw.com/insights/claude-teams/) - The coordination layer provides 3 critical primitives: a shared task list with dependency tracking (...

8. [From Tasks to Swarms: Agent Teams in Claude Code | alexop.dev](https://alexop.dev/posts/from-tasks-to-swarms-agent-teams-in-claude-code/) - The Seven Team Primitives#. Agent teams aren't magic. They're built from seven tools that Claude can...

9. [Claude Code Agent Teams - prg.sh](https://prg.sh/notes/Claude-Code-Agent-Teams) - Seven Primitives ; TeamCreate - initialize team namespace and config ; TaskCreate - define work unit...

10. [Multi-agent orchestration for Claude Code in 2026 - Shipyard.build](https://shipyard.build/blog/claude-code-multi-agent/) - It lets users instantiate new agents via CLI commands. To manage orchestration, it has an agent hier...

11. [Claude Code February 2026 Changelog: Agent Worktree Isolation ...](https://subagentic.ai/howtos/claude-code-isolation-worktree-agent-definitions/) - Claude Code adds declarative git worktree isolation for agents, fixes memory leaks in agent teams, a...

12. [Anthropic's Agent Teams Write Linux Compiler in Rust - LinkedIn](https://www.linkedin.com/posts/glibshchur_building-a-c-compiler-with-a-team-of-parallel-activity-7425863538621202432--VNB) - Anthropic just spent $20K having Claude Agent Teams write a C compiler from scratch. https://lnkd.in...

13. [Building a C compiler with a team of parallel Claudes - Anthropic](https://www.anthropic.com/engineering/building-c-compiler) - Over nearly 2,000 Claude Code sessions and $20,000 in API costs, the agent team produced a 100,000-l...

14. [Anthropic had 16 AI agents build a C compiler from scratch ... - Reddit](https://www.reddit.com/r/AgentsOfAI/comments/1qx9ku3/anthropic_had_16_ai_agents_build_a_c_compiler/) - Anthropic had 16 AI agents build a C compiler from scratch. 100k lines, compiles the Linux kernel, $...

15. [Sixteen Claude AI agents working together created a new C compiler](https://arstechnica.com/ai/2026/02/sixteen-claude-ai-agents-working-together-created-a-new-c-compiler/) - The model hit this wall at around 100,000 lines, which suggests a practical ceiling for autonomous a...

16. [OpenAI Releases Symphony: An Open Source Agentic Framework ...](https://www.marktechpost.com/2026/03/05/openai-releases-symphony-an-open-source-agentic-framework-for-orchestrating-autonomous-ai-agents-through-structured-scalable-implementation-runs/) - OpenAI Releases Symphony: An Open Source Agentic Framework for Orchestrating Autonomous AI Agents th...

17. [OpenAI Launches Symphony with Elixir/OTP - LinkedIn](https://www.linkedin.com/posts/richard-holland_openai-just-launched-symphony-an-autonomous-activity-7435403947022094336-jjfh) - OpenAI just launched Symphony, an autonomous agent orchestration project. Their reference implementa...

18. [OpenAI Releases Symphony: An Open Source Agentic Framework ...](https://www.marktechpost.com/2026/03/05/openai-releases-symphony-an-open-source-agentic-framework-for-orchestrating-autonomous-ai-agents-through-structured-scalable-implementation-runs/?amp) - OpenAI Releases Symphony: An Open Source Agentic Framework for Orchestrating Autonomous AI Agents th...

19. [Poll-Dispatch-Resolve-Land Workflow (inspired by OpenAI ... - GitHub](https://github.com/NousResearch/hermes-agent/issues/404) - It polls an issue tracker (Linear) for work items, spawns isolated coding agents per issue, manages ...

20. [OpenAI Symphony: When AI Agents Run Your Sprint Board](https://sjramblings.io/openai-symphony-autonomous-agent-orchestration/) - It's a long-running orchestration service built in Elixir that polls your Linear board, creates isol...

21. [AO vs T3 Code vs OpenAI Symphony vs Cmux · ComposioHQ agent ...](https://github.com/ComposioHQ/agent-orchestrator/discussions/526) - Per-state concurrency limits prevent race conditions (e.g., max 1 agent in human-review state). AO d...

22. [Symphony: A Decentralized Multi-Agent Framework for Scalable ...](https://arxiv.org/abs/2508.20019) - Empirically, Symphony outperforms existing baselines on reasoning benchmarks, achieving substantial ...

23. [[PDF] Symphony: A Decentralized Multi-Agent Framework for Scalable ...](https://arxiv.org/pdf/2508.20019.pdf) - Symphony introduces three key mecha- nisms: (1) a decentralized ledger that records capabilities, (2...

24. [Sub-agents - DeerFlow - Mintlify](https://www.mintlify.com/bytedance/deer-flow/concepts/sub-agents) - The lead agent can spawn sub-agents on the fly to: Research multiple topics concurrently; Execute sp...

25. [DeerFlow 2.0 Super Agent: Orchestrating AI Sub-Agents to Execute ...](https://www.xugj520.cn/en/archives/deerflow-super-agent-architecture.html) - How does DeerFlow 2.0 transform from a simple research tool into an open-source 'super brain'? Disco...

26. [Data Points: DeerFlow 2.0 puts new spin on Claw-like agents](https://www.deeplearning.ai/the-batch/deerflow-2-0-puts-new-spin-on-claw-like-agents/) - ... models. The lead agent can spawn parallel sub-agents with isolated contexts for multi-step tasks...

27. [DeerFlow 2.0: What It Is, How It Works, and Why Developers Should ...](https://dev.to/arshtechpro/deerflow-20-what-it-is-how-it-works-and-why-developers-should-pay-attention-3ip3) - Each sub-agent gets its own scoped context, its own tools, and its own termination conditions. Sub-a...

28. [Are people hitting race conditions in multi-agent ...](https://forum.langchain.com/t/are-people-hitting-race-conditions-in-multi-agent-langchain-setups/3202) - I’ve been spending time on multi-agent workflows lately, and I keep coming back to the same question...

29. [Agent System - DeerFlow - Mintlify](https://www.mintlify.com/bytedance/deer-flow/concepts/agent-system) - Lead agent, ThreadState, and middleware chain

30. [Parallel agents + git worktrees: real-world experience? : r/cursor](https://www.reddit.com/r/cursor/comments/1rxg2b7/parallel_agents_git_worktrees_realworld_experience/) - Worktrees solve the file conflict but not logical coordination. Two agents can write clean isolated ...

31. [Git Worktrees Changed How I Run Parallel AI Agents](https://dev.to/battyterm/git-worktrees-changed-how-i-run-parallel-ai-agents-39pm) - The first time I ran three AI agents on the same repo, they all edited the same file within seconds....

32. [Git Worktree Conflicts with Multiple AI Agents: Diagnosis and Fixes](https://www.termdock.com/en/blog/git-worktree-conflicts-ai-agents) - Fix git worktree conflicts when running multiple AI agents. Covers lock files, index.lock, branch co...

33. [Two Paradigms of Multi-Agent AI: Rust Parallel Agents vs Claude ...](https://vadim.blog/two-paradigms-multi-agent-ai-rust-vs-claude-teams) - ... Claude Code agent-teams SendMessage primitive enables. Paradigm 2 ... primitives for describing ...

34. [Niko Maroulis' Post - openai/symphony - LinkedIn](https://www.linkedin.com/posts/nikomaroulis_github-openaisymphony-symphony-turns-activity-7435131774155993088-TV2t) - OpenAI just published Symphony — a repo for turning project work into isolated, autonomous implement...

35. [Merge Queue - Enki - Mintlify](https://www.mintlify.com/korbindeman/enki/concepts/merge-queue) - When a worker finishes, its changes are committed to a git branch, queued for merging, and processed...

36. [How Do Enterprise Teams Build Agentic Workflows? - Augment Code](https://www.augmentcode.com/guides/how-do-enterprise-teams-build-agentic-workflows) - Agent-generated PR workflows require explicit security configuration and merge queue management to h...

37. [GitHub Merge Queue Compatibility with CircleCI](https://support.circleci.com/hc/en-us/articles/36054868397851-GitHub-Merge-Queue-Compatibility-with-CircleCI) - As of June 2023, GitHub changed the behavior of their merge queue to attribute merges to the GitHub ...

38. [Five Architectural Primitives Every Agent Swarm Rediscovers | Blog](https://alexlavaee.me/blog/five-primitives-agent-swarms/) - Different models. Different goals. They converged on the same five architectural primitives. This po...

39. [Agentic Systems Research Plan: Q1 2026 - wal.sh](https://wal.sh/research/agentic-2026/plan.html?t=1) - This plan outlines Q1 2026 research focus on multi-agent coordination infrastructure. Our prior work...

