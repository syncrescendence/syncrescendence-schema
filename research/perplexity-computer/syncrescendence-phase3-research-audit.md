# Syncrescendence Phase 3: Research Program Audit — 20 Questions

**Audit Date:** 2026-03-29  
**System:** Syncrescendence — Distributed Cognition Architecture  
**Scope:** Comprehensive terminology calibration, source validation, blind-spot analysis, and reformulation for 20 research questions across five waves (Institutional Baseline → Coordination & Contracts → Trust & Write-Scope → Observability → Selective Scouting → Integration)

---

## Executive Summary

This audit examines twenty research questions intended to ground a constitutional knowledge system in the multi-agent orchestration ecosystem as of March 2026. The most consequential cross-cutting finding is a **systematic terminology gap**: the questions use a domain-specific lexicon ("commission," "receipt," "calibration cycle," "grammar-aligned," "negative routing laws," "promotion ladder") that has no direct mapping to the terms practitioners and protocol authors actually use. The ecosystem converges on **Task** (not commission), **Artifact** (not receipt), **eval run** (not calibration cycle), and **hard gate / HITL checkpoint** (not negative routing law). This vocabulary mismatch would cause research queries to miss the primary-source literature almost entirely.

The second structural finding is that **correlation IDs, schema versioning, and idempotency keys** are load-bearing infrastructure across all twenty questions but are absent from every question's formulation. No reviewed task schema (A2A, CrewAI, LangGraph, OpenAI Agents SDK) carries all three at the task level — these live in tracing infrastructure, environment configuration, or are simply missing.

The third finding concerns the **maturity of standards**: OpenTelemetry GenAI semantic conventions remain experimental; multi-agent coordination attributes (`gen_ai.task.*`, `gen_ai.team.*`) exist only as proposals ([OTel GitHub Issue #2664](https://github.com/open-telemetry/semantic-conventions/issues/2664)); and the interoperability protocols (A2A, ACP, MCP, ANP) have incompatible output models with no standard translation layer. Any system built on these standards is building on a moving foundation.

Fourth, **multi-agent coordination is the unsolved layer**: every current tool and protocol solves single-agent governance. Multi-agent write coordination, multi-agent consistent rollback, cross-agent trust delegation, and coordinated drift detection all lack production-grade implementations. The Chandy-Lamport algorithm provides the theoretical foundation for consistent multi-agent snapshots, but no production framework implements it for agent systems.

---

## Master Terminology Correction Table

The following table maps all twenty questions' non-standard terms to the terms the ecosystem actually uses, with primary source references.

| Question Term | Ecosystem-Standard Term(s) | Source |
|---|---|---|
| Commission | **Task**, **Activity**, **Work Item** | [A2A Protocol Spec](https://github.com/a2aproject/A2A/blob/main/docs/specification.md), [CrewAI Tasks](https://docs.crewai.com/en/concepts/tasks) |
| Receipt | **TaskOutput**, **Artifact**, **CallToolResult**, **Trace/Span** | [MCP Tools Spec](https://modelcontextprotocol.io/specification/2025-06-18/server/tools), [A2A Protocol Spec](https://github.com/a2aproject/A2A/blob/main/docs/specification.md) |
| Calibration cycle | **Eval run**, **Regression trial**, **Evaluation trial** | [Anthropic Evals](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents), [Braintrust](https://www.braintrust.dev/articles/ai-agent-evaluation-framework) |
| Grammar-aligned evidence | **Prompt version N+1**, **Config variant B**, **Treatment variant** | [Braintrust](https://www.braintrust.dev/articles/ai-agent-evaluation-framework), [Google Cloud Eval](https://cloud.google.com/blog/topics/developers-practitioners/a-methodical-approach-to-agent-evaluation) |
| Degraded mode | **ServiceLevel.MINIMAL**, **Circuit OPEN**, **Read-only fallback** | [PraisonAI](https://docs.praison.ai/docs/best-practices/graceful-degradation), [LinkedIn Resilience](https://www.linkedin.com/pulse/building-production-ready-ai-agents-multi-layer-pattern-afolabi-iubme) |
| Comparison frame | **Regression eval** against **golden dataset** with **trajectory assessment** | [Anthropic Evals](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents) |
| Typed contract | **Task object** (A2A), **Handoff** (OpenAI), **TypedDict schema** (LangGraph) | [A2A Protocol](https://a2a-protocol.org/latest/specification/), [OpenAI Handoffs](https://openai.github.io/openai-agents-python/handoffs/) |
| Acknowledgment pattern | **ACK** (A2A), **TaskState transition**, **`invoke_agent` span** | [OTel GenAI Spans](https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/), [A2A Protocol](https://a2a-protocol.org/latest/specification/) |
| CLI fan-out | **Fan-out** (MCO), **Worktree isolation**, **Self-claim** | [MCO](https://github.com/mco-org/mco), [Claude Code Agent Teams](https://code.claude.com/docs/en/agent-teams) |
| Single-writer / present-state update | **Leader election**, **File reservation**, **Reconciliation loop**, **CRDT** | [CodeCRDT (arXiv:2510.18893)](https://arxiv.org/abs/2510.18893), [etcd Leader Election](https://oneuptime.com/blog/post/2025-12-11-etcd-leader-election/view) |
| Contract violation handling | **RetryPolicy**, **Circuit breaker**, **`interrupt()`**, **Escalation** | [LangGraph](https://langchain-ai.github.io/langgraph/), [CrewAI Tasks](https://docs.crewai.com/en/concepts/tasks) |
| Trust/auth models | **Trust hierarchy**, **Principal model**, **NHI**, **Scoped delegation** | [A2A Spec](https://github.com/a2aproject/A2A/blob/main/docs/specification.md), [OWASP Agentic Top 10](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/) |
| Write-scope governance | **Path-scoped Edit rules**, **CODEOWNERS**, **Branch protection**, **Managed settings** | [Claude Code Permissions](https://code.claude.com/docs/en/permissions), [GitHub Branch Protection](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule) |
| Negative routing laws | **Hard gates**, **HITL checkpoints**, **Action classification**, **Lethal trifecta** | [Simon Willison](https://simonw.substack.com/p/the-lethal-trifecta-for-ai-agents), [Anthropic Safe Agents](https://www.anthropic.com/news/our-framework-for-developing-safe-and-trustworthy-agents) |
| Rollback/reversibility | **Behavioral snapshot**, **Compensating transaction**, **Roll forward**, **PITR** | [Replit Snapshot Engine](https://blog.replit.com/inside-replits-snapshot-engine), [Temporal Saga](https://temporal.io/blog/mastering-saga-patterns-for-distributed-transactions-in-microservices) |
| Observability stack | **LLM observability**, **GenAI observability**, **Agent tracing** | [OTel GenAI Agent Spans](https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/), [Arize Phoenix](https://github.com/arize-ai/phoenix) |
| Drift detection | **Agent drift**, **Goal drift**, **Semantic drift**, **Behavioral regression** | [arXiv:2601.04170](https://arxiv.org/abs/2601.04170), [arXiv:2505.02709](https://arxiv.org/abs/2505.02709) |
| Kill switches | **Circuit breaker** (reliability), **`interrupt()`** (HITL), **Corrigibility** (safety) | [LangGraph interrupt](https://blog.langchain.com/making-it-easier-to-build-human-in-the-loop-agents-with-interrupt/), [arXiv:2507.20964](https://arxiv.org/abs/2507.20964) |
| Promotion ladders | **Skill trust tiers (T1–T4)**, **Evolving-Skill MDP**, **Closed learning loop** | [arXiv:2602.12430](https://arxiv.org/pdf/2602.12430), [ARISE (arXiv:2603.16060)](https://arxiv.org/html/2603.16060v1) |
| Cross-surface receipt normal forms | **Artifact normalization**, **Discriminated Part types**, **Media type negotiation** | [A2A Spec](https://github.com/a2aproject/A2A/blob/main/docs/specification.md), [ACP Spec](https://agentcommunicationprotocol.dev/introduction/welcome) |
| Operational constitution | **Agentic Constitution**, **Constitutional Multi-Agent Governance (CMAG)**, **Policy as Code** | [CIO Magazine](https://www.cio.com/article/4118138/why-your-2026-it-strategy-needs-an-agentic-constitution.html), [CMAG (arXiv:2603.13189)](https://arxiv.org/html/2603.13189v1) |

---

## Wave Zero — Institutional Baseline

### Q0.1: What is the atomic unit of commissioned work in a multi-agent knowledge architecture? What fields must a commission carry?

#### Three Most Authoritative Primary Sources

1. **[Google A2A Protocol Specification](https://github.com/a2aproject/A2A/blob/main/docs/specification.md)** — The most authoritative cross-vendor Task schema, published under Linux Foundation governance. Defines the canonical Task object with lifecycle states (`SUBMITTED → WORKING → COMPLETED | FAILED | CANCELED | REJECTED`), artifacts, and status envelope. This is the closest to a formal interoperability standard for the "atomic unit of work."

2. **[CrewAI Task Documentation](https://docs.crewai.com/en/concepts/tasks)** — The most complete practitioner-facing schema, specifying all input fields (`description`, `expected_output`, `agent`, `tools`, `context`, `async_execution`, `human_input`, `output_file`, `output_json`, `guardrail`, `guardrail_max_retries`, `callback`, `config`) and output fields (`raw`, `pydantic`, `json_dict`, `agent`, `output_format`, `messages`).

3. **[LangGraph Functional API](https://docs.langchain.com/oss/python/langgraph/functional-api)** — Defines the `@task` decorator as the primitive for discrete work units: any JSON-serializable input, JSON-serializable output (required for checkpointing), and a future-like return object resolved with `.result()` or `await`.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Commission | **Task** | Used in A2A, CrewAI, Conductor, LangGraph Functional API, Temporal |
| Commission (secondary) | **Run / RunResult** | OpenAI Agents SDK: `Runner.run()` → `RunResult` |
| Atomic unit | **Task** (protocol), **Activity** (Temporal), **Step** (LangGraph Graph API) | Context-dependent granularity |
| Commission fields | **Task schema fields** | No standard "commission" schema exists |

#### What the Question Will Miss

- **The distinction between task-input and task-envelope.** The question conflates the work specification (what to do) with the protocol envelope (how it travels). In A2A, a `Message` carries the instruction while a `Task` tracks the lifecycle — these are architecturally separate objects ([A2A Spec](https://github.com/a2aproject/A2A/blob/main/docs/specification.md)).
- **Correlation and causation lineage.** None of the reviewed schemas carry a `parent_task_id`, `trace_id`, or `caused_by` field at the task level. Correlation lives in tracing infrastructure (OpenTelemetry, A2A `contextId`), not the task schema itself.
- **Budget and constraint fields.** Current schemas omit `max_tokens`, `max_turns`, `timeout_seconds`, `cost_budget` at the task level — these live in `RunConfig` (OpenAI), `workflow.signal` (Temporal), or environment config.
- **Idempotency keys.** File-mediated and distributed orchestration requires an idempotency key to prevent duplicate execution on retry, absent from all reviewed schemas.
- **The term "commission" creates ecosystem friction.** No reviewed framework, protocol, or practitioner post uses this term. Using it in a system grammar creates translation overhead with every existing SDK.

#### Sharpened Reformulation

> *What is the canonical Task schema for inter-agent work delegation across A2A, CrewAI, LangGraph, and OpenAI Agents SDK? What fields are required vs. optional, and which critical fields (correlation ID, idempotency key, budget constraints) are absent from current specifications?*

---

### Q0.2: What is the minimal receipt shape for file-mediated orchestration across heterogeneous surfaces (CLI, web, desktop, protocol)?

#### Three Most Authoritative Primary Sources

1. **[MCP Tools Specification (2025-06-18)](https://modelcontextprotocol.io/specification/2025-06-18/server/tools)** — Defines the canonical `CallToolResult` format: `content` (typed array of text/image/audio/resource_link items), `isError` (boolean), and optional `structuredContent` (JSON conforming to `outputSchema`). This is the cross-surface minimum used by all MCP-compliant clients.

2. **[OWASP Agent Observability Standard — OpenTelemetry Extension](https://owasp.github.io/www-project-agent-observability-standard/spec/trace/extend_opentelemetry/)** — Industry standard for audit-trail receipts: hierarchical spans with `agent.run` → turn → step structure, enriched with `agent.id`, `agent.version`, `llm.model.name`, `turnId`, `stepId`. This is the audit-grade minimum.

3. **[Anthropic — Effective Harnesses for Long-Running Agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)** — Practitioner reference for file-mediated receipt structure: `claude-progress.txt` (human-readable audit trail) + `feature_list.json` (machine-readable completion status) + git commit (version-controlled artifact). Agents are constrained to only update the `passes` field.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Receipt | **TaskOutput** / **RunResult** (operational) or **Trace/Span** (audit) | No single "receipt" concept exists |
| Receipt shape | **CallToolResult** (MCP), **Artifact** (A2A), **Span attributes** (OTel) | Context-dependent |
| File-mediated | **Async/durable orchestration** | Not a primary category; ecosystem distinguishes sync, streaming, async |
| Heterogeneous surfaces | **Cross-surface normalization** via MCP | MCP already abstracts CLI, web, desktop behind JSON-RPC |

#### What the Question Will Miss

- **"File-mediated" is not a primary ecosystem category.** The ecosystem distinguishes synchronous (MCP `tools/call`), streaming (A2A SSE), and async/durable (Temporal Activities, webhook callbacks). File-mediation is a specific sub-pattern within async orchestration, not a named category ([MCP Tools Spec](https://modelcontextprotocol.io/specification/2025-06-18/server/tools)).
- **Surface normalization is solved by MCP, not by receipt format.** The heterogeneous-surface normalization layer is MCP itself — it abstracts CLI, web, and desktop tool invocations behind a common JSON-RPC interface. The `CallToolResult` is already surface-agnostic by design.
- **Missing: idempotency and deduplication fields.** Production receipts need an `idempotency_key` echoed from request — absent from all schemas reviewed.
- **The conflation of "receipt" vs. "audit trail."** The ecosystem distinguishes: receipt = immediate operational response (`CallToolResult`, `TaskOutput`); audit trail = durable observability record (OpenTelemetry trace / AOS span hierarchy). These serve different consumers and retention policies ([OWASP AOS](https://owasp.github.io/www-project-agent-observability-standard/spec/trace/extend_opentelemetry/)).

#### Sharpened Reformulation

> *What is the minimal cross-surface Artifact schema that survives translation across MCP CallToolResult, A2A Task.artifacts[], and OpenTelemetry GenAI spans — and what fields (idempotency key, trace correlation, schema version) must be added for production file-mediated orchestration?*

---

### Q0.3: For a calibration cycle dispatching to 2-3 CLI agents: what constitutes success, failure, abort, retry?

#### Three Most Authoritative Primary Sources

1. **[Conductor OSS Task Lifecycle](https://conductor-oss.github.io/conductor/devguide/architecture/tasklifecycle.html)** — The most precise formal state machine: `SCHEDULED → IN_PROGRESS → COMPLETED | COMPLETED_WITH_ERRORS | FAILED | FAILED_WITH_TERMINAL_ERROR | TIMED_OUT | CANCELED | SKIPPED`, with explicit terminal vs. non-terminal state definitions and retry/timeout semantics.

2. **[Google A2A Protocol — Task State Enum](https://github.com/a2aproject/A2A/blob/main/docs/specification.md)** — Protocol-level lifecycle: `SUBMITTED → WORKING → COMPLETED | FAILED | CANCELED | REJECTED`, plus interrupt states `INPUT_REQUIRED` and `AUTH_REQUIRED`. Only non-terminal states are cancelable.

3. **[HatchWorks — Orchestrating AI Agents in Production](https://hatchworks.com/blog/ai-agents/orchestrating-ai-agents/)** — Practitioner-level production patterns for state machine orchestration, retry with exponential backoff, dead-letter queues, and abort semantics.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Calibration cycle | **Eval run**, **Regression trial** | No standard "calibration cycle" concept |
| Success | `COMPLETED`, `ALL_TESTS_PASSING`, `resolved` | Framework-dependent |
| Failure | `FAILED`, `FAILED_WITH_TERMINAL_ERROR`, `TIMED_OUT` | Conductor provides the richest taxonomy |
| Abort | `CANCELED` (orchestrator-initiated), `REJECTED` (validation failure) | Two distinct abort causes |
| Retry | State transition `FAILED → SCHEDULED` with `retryDelaySeconds` | Exponential backoff + circuit breaker |

#### What the Question Will Miss

- **`COMPLETED_WITH_ERRORS` is an important fifth state.** The question lists only four states. The ecosystem recognizes partial success — a task technically succeeded but optional sub-components failed. Critical for calibration cycles where one of three CLI agents partially completed ([Conductor OSS](https://conductor-oss.github.io/conductor/devguide/architecture/tasklifecycle.html)).
- **`INPUT_REQUIRED` / `AUTH_REQUIRED` are interrupt states, not failures.** A cycle that hits `INPUT_REQUIRED` is paused, not failed. Conflating these with failure causes premature aborts ([A2A Spec](https://github.com/a2aproject/A2A/blob/main/docs/specification.md)).
- **"Abort" conflates two distinct causes** with different recovery logic: orchestrator-initiated cancel (`CANCELED`) vs. upstream validation rejection (`REJECTED`). A third form — budget exhaustion — is also absent.
- **Missing: observability co-requirement.** A calibration cycle cannot distinguish these states in post-hoc analysis without a correlation ID propagated through all CLI agent invocations.
- **"Calibration cycle" has no standard meaning** in the ecosystem. Tooling compatibility requires mapping to "eval run" or "regression trial."

#### Sharpened Reformulation

> *What is the complete task-state machine (including interrupt and partial-success states) for a fan-out eval run dispatching to 2-3 heterogeneous CLI agents, using Conductor OSS and A2A lifecycle semantics as reference? What correlation infrastructure is co-required for state disambiguation?*

---

### Q0.4: What is the minimum degraded mode a first calibration cycle must survive?

#### Three Most Authoritative Primary Sources

1. **[PraisonAI — Graceful Degradation Patterns](https://docs.praison.ai/docs/best-practices/graceful-degradation)** — The most complete taxonomy with explicit `ServiceLevel.MINIMAL` (keyword matching, predefined responses, no LLM inference, no tool access) and a four-tier fallback chain (cache → database → API → static default).

2. **[LinkedIn Engineering — Multi-Layer Resilience Pattern](https://www.linkedin.com/pulse/building-production-ready-ai-agents-multi-layer-pattern-afolabi-iubme)** — Production case study (2.3M requests/month) quantifying the three-layer resilience stack: Layer 1 (exponential backoff), Layer 2 (circuit breaker), Layer 3 (timeout protection). Cascade failures: 847/month → 0; uptime: 94.2% → 99.97%.

3. **[Temporal.io — Error Handling in Distributed Systems](https://temporal.io/blog/error-handling-in-distributed-systems)** — Durable execution reference for what constitutes survivable partial failure in workflow-based orchestration.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Degraded mode | **ServiceLevel.MINIMAL**, **Circuit OPEN**, **Read-only fallback** | PraisonAI is the canonical reference |
| Minimum degraded mode | **Tier 4 fallback**: static default data that always succeeds | PraisonAI four-tier chain |
| First calibration cycle | **First eval run** (no historical baseline exists) | Changes circuit breaker behavior — no failure history to trip on |
| Must survive | **Three-layer resilience stack** plus **bulkhead isolation** | Both isolation and degradation needed |

#### What the Question Will Miss

- **A first cycle has no baseline data.** Standard degradation patterns assume accumulated failure data. A first run has no historical failure rate for circuit breakers to trip on. The minimum viable first-run mode is **read-only + structured output for human review** ([PraisonAI](https://docs.praison.ai/docs/best-practices/graceful-degradation)).
- **Context exhaustion as degradation trigger.** Praetorian's architecture adds a 16-phase compaction gate (>85% context usage blocks new agent spawns) — a form of degradation none of the standard resilience patterns address ([Praetorian](https://www.praetorian.com/blog/deterministic-ai-orchestration-a-platform-architecture-for-autonomous-development/)).
- **"Minimum" is relative to success criteria.** The question cannot be answered without first specifying Q0.3's success definition. The minimum degraded mode is the lowest state producing *any* evaluable output.
- **Isolation vs. degradation distinction.** The ecosystem distinguishes bulkhead isolation (containing failure) from graceful degradation (continuing with reduced capability). A first calibration cycle needs both: isolate each CLI agent so failures don't cascade, and define the minimum output threshold at the orchestration layer.

#### Sharpened Reformulation

> *What is the minimum resilience configuration (circuit breaker thresholds, timeout budgets, fallback chain, bulkhead isolation) for a first-run eval dispatching to 2-3 CLI agents with no historical failure baseline — and what is the lowest-fidelity output that still qualifies as evaluable?*

---

### Q0.5: What comparison frame makes the delta between pre-grammar and grammar-aligned evidence maximally visible?

#### Three Most Authoritative Primary Sources

1. **[Anthropic — Demystifying Evals for AI Agents](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents)** — Defines the canonical framework: trial → transcript → outcome. Key insight: the delta is maximally visible when comparing **outcomes** (environment state), not transcripts (agent statements). An agent can report success while the environment shows failure.

2. **[Braintrust — AI Agent Evaluation Framework](https://www.braintrust.dev/articles/ai-agent-evaluation-framework)** — Most complete practitioner harness with layer-by-layer metrics (reasoning quality, tool selection accuracy, path validity, task completion rate, step efficiency, cost) plus regression gate CI/CD integration.

3. **[Google Cloud — Methodical Approach to Agent Evaluation](https://cloud.google.com/blog/topics/developers-practitioners/a-methodical-approach-to-agent-evaluation)** — Three-pillar framework: Quality (binary Pass/Fail, letter grades A/B/C), Trajectory (step-level unit tests), Trust/Safety (adversarial stress cases).

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Pre-grammar vs. grammar-aligned | **Prompt version N vs. N+1** or **Configuration A/B test** | Must be operationalized as one of these |
| Comparison frame | **Regression eval** against a **golden dataset** | Canonical before/after delta mechanism |
| Delta visibility | **Outcome-based comparison** (not transcript-based) | Anthropic's key insight |
| Grammar-aligned evidence | **Treatment variant** in A/B eval framework | [Maxim AI](https://www.getmaxim.ai/articles/a-b-testing-strategies-for-ai-agents-how-to-optimize-performance-and-quality/) |

#### What the Question Will Miss

- **"Grammar alignment" is not a standard evaluation category.** The ecosystem evaluates model A vs. B, prompt version N vs. N+1, or agent config before/after. "Grammar alignment" must be operationalized as one of these before any harness applies ([Anthropic Evals](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents)).
- **Non-determinism compensation.** A single trial comparison is statistically meaningless. The standard is 10+ trials per task with averaged results and variance estimates. Without this, any delta is within noise.
- **A fixed golden dataset as anchor.** The comparison frame is only meaningful relative to a stable reference set. Without a golden dataset, there is no comparison frame — only anecdote ([Braintrust](https://www.braintrust.dev/articles/ai-agent-evaluation-framework)).
- **"Maximally visible" is a display problem, not just a measurement problem.** The ecosystem's solution is binary Pass/Fail per task, letter-grade aggregation, and CI/CD threshold gates.

#### Sharpened Reformulation

> *What regression eval harness design — golden dataset, outcome-based scoring (not transcript-based), multi-trial averaging, and regression gate CI/CD integration — makes the quality delta between prompt version N (pre-grammar) and version N+1 (grammar-aligned) statistically significant and actionable?*

---

## Wave 1 — Coordination and Contracts

### Q1.1: Typed contract formats for inter-agent work commissioning (Symphony, A2A, ACP, CrewAI, LangGraph)

#### Three Most Authoritative Primary Sources

1. **[A2A Protocol Specification](https://a2a-protocol.org/latest/specification/)** — Under Linux Foundation governance. Defines the Task object (`id`, `contextId`, `status`, `artifacts`, `history`, `metadata`), the AgentCard capability advertisement struct, and JSON-RPC methods (`SendMessage`, `GetTask`, `ListTasks`, `CancelTask`). The Task state machine includes interrupt states (`INPUT_REQUIRED`, `AUTH_REQUIRED`) not present in other frameworks.

2. **[Agent Communication Protocol (ACP) — Message Structure](https://agentcommunicationprotocol.dev/core-concepts/message-structure)** — IBM Research project. Uses `Message(role, parts[])` with MIME-typed `MessagePart` objects supporting inline content, URL references, base64 encoding, and metadata (citation, trajectory). REST-native; no SDK required.

3. **[OpenAI Agents SDK — Handoffs](https://openai.github.io/openai-agents-python/handoffs/)** — Defines `handoff()` with typed `input_type` (Pydantic/Zod schema), `on_handoff` callback, `input_filter`, and `is_enabled` flag. The `input_type` is exposed as JSON Schema parameters and validated before handoff fires.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Typed contract | **Task object** (A2A), **Handoff** (OpenAI), **TypedDict schema** (LangGraph) | "Contract" is not dominant terminology |
| Commissioning | **Task creation** + **routing** + **acknowledgment** | Three distinct moments with different schemas |
| Symphony | **Not an established protocol** as of March 2026 | May reference Microsoft's internal project or a codename |
| Inter-agent | Distinguish **intra-framework** (LangGraph TypedDict) from **inter-agent** (A2A Task, ACP Message) | Architecturally different patterns |

#### What the Question Will Miss

- **AgentCard / capability advertisement is a prerequisite contract.** Before commissioning a task, an orchestrator must discover what the remote agent can do. A2A's AgentCard is the typed "capability contract" — the question omits this discovery phase ([A2A Spec](https://a2a-protocol.org/latest/specification/)).
- **"Symphony" is not an established protocol** in this ecosystem as of March 2026.
- **Claude Code Agent Teams uses file-based task lists** stored at `~/.claude/tasks/{team-name}/` with file locking, not a typed protocol schema ([Claude Code Agent Teams](https://code.claude.com/docs/en/agent-teams)).
- **The question conflates intra-framework state** (LangGraph's TypedDict shared graph memory) with **inter-agent task payloads** (A2A Task, ACP Message) — architecturally different.

#### Sharpened Reformulation

> *What are the typed task schemas (field inventory, required vs. optional, lifecycle states) in A2A, ACP, OpenAI Agents SDK Handoffs, CrewAI, and LangGraph — and how do capability-advertisement schemas (A2A AgentCard) function as pre-task contracts?*

---

### Q1.2: Receipt/acknowledgment patterns in production orchestration

#### Three Most Authoritative Primary Sources

1. **[A2A Protocol Specification — Task Lifecycle & ACK Semantics](https://a2a-protocol.org/latest/specification/)** — Task state transitions serve as structured acknowledgments: `SUBMITTED` (receipt confirmed), `WORKING` (acceptance ACK), `INPUT_REQUIRED` (blocking ACK), `COMPLETED`/`FAILED`/`CANCELED` (terminal receipt). Real-time delivery via SSE, push notifications, or polling. See also [Promptfoo's A2A analysis](https://www.promptfoo.dev/blog/understanding-a2a/).

2. **[OpenTelemetry GenAI Semantic Conventions — Agent Spans](https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/)** — Defines `invoke_agent` and `execute_tool` spans with `gen_ai.agent.id`, `gen_ai.conversation.id`, `gen_ai.response.finish_reasons[]`, and `error.type`. A completed span is the closest thing to a structured execution receipt in the OSS ecosystem. GitHub source: [OTel Semantic Conventions](https://github.com/open-telemetry/semantic-conventions/blob/main/docs/gen-ai/gen-ai-spans.md).

3. **[Overstory — SQLite Mail Protocol](https://github.com/jayminwest/overstory)** — Implements explicit typed acknowledgment via SQLite mail: 8 typed message types (`worker_done`, `merge_ready`, `dispatch`, `escalation`), `ack_required` flag, and explicit `acknowledge_message` signals. Companion: [MCP Agent Mail](https://github.com/Dicklesworthstone/mcp_agent_mail).

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Receipt | **TaskStatus transition** (application layer), **HTTP 200** (transport), **Artifact** (business) | Three distinct layers |
| Acknowledgment | **ACK** (A2A), **SUBMITTED → WORKING** transition, **`invoke_agent` span** | Protocol-dependent |
| Production orchestration | **Agent tracing** + **durable receipts** + **checkpoint state** | Three separate concerns |

#### What the Question Will Miss

- **Receipts exist at three distinct layers**: transport (HTTP 200), application (task state → SUBMITTED), and business (COMPLETED + Artifact). Production systems need all three; the question treats them as one ([A2A Spec](https://a2a-protocol.org/latest/specification/)).
- **Checkpoint-restore causes duplicate tool execution.** A [2026 arXiv paper](https://arxiv.org/html/2603.20625v1) shows LangGraph, CrewAI, and Google ADK all lack built-in duplicate-execution prevention — acknowledged as architecturally difficult to fix.
- **The question conflates acknowledgment (message received) with completion (task done)** — A2A explicitly models these as different state transitions.

#### Sharpened Reformulation

> *What are the structured acknowledgment patterns at transport, application, and business layers across A2A (TaskStatus transitions + SSE), OpenTelemetry (GenAI agent spans), and file-mediated systems (Overstory SQLite mail, MCP Agent Mail) — and how does the checkpoint-restore duplicate-execution gap affect receipt reliability?*

---

### Q1.3: Dispatch and concurrency patterns for heterogeneous CLI fan-out (MCO, gstack, Agent Teams)

#### Three Most Authoritative Primary Sources

1. **[MCO (Multi-CLI Orchestrator)](https://github.com/mco-org/mco)** — Neutral orchestration layer supporting five dispatch modes: parallel (default, wait-all), chain (sequential with prior context), debate (challenge round), divide-by-files, divide-by-dimensions. Per-provider timeout overrides, stall detection, and one-provider failure never stops others. Adapter contract: Detect → Run → Poll → Cancel → Normalize.

2. **[Claude Code Agent Teams](https://code.claude.com/docs/en/agent-teams) + [Overstory](https://github.com/jayminwest/overstory)** — Agent Teams uses self-claim dispatch: shared task list at `~/.claude/tasks/{team-name}/`, file-lock concurrency, peer-to-peer messaging. Overstory extends this with a 4-level hierarchy (Orchestrator → Coordinator → Supervisor → Workers), SQLite mail coordination, `ov sling` for worktree-based spawn, and a FIFO merge queue with 4-tier conflict resolution.

3. **[Git Worktree Pattern for Parallel Agent Isolation](https://devcenter.upsun.com/posts/git-worktrees-for-parallel-ai-coding-agents/)** — The dominant pattern: `git worktree add .trees/{TASK_ID} -B {branch-name}` gives each agent an isolated working directory. Used by [Cursor Parallel Agents](https://dev.to/arifszn/git-worktrees-the-power-behind-cursors-parallel-agents-19j1) and documented by [nrmitchi](https://www.nrmitchi.com/2025/10/using-git-worktrees-for-multi-feature-development-with-ai-agents/).

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| CLI fan-out | **Parallel dispatch** (MCO), **Worktree isolation** | Distinct from fan-out in message queue sense |
| gstack | **Garry Tan's personal Claude Code sprint pipeline** | Not a general-purpose orchestrator or open protocol |
| Agent Teams | **Claude Code Agent Teams** (self-claim dispatch with file locks) | Token-expensive; worktrees are more scalable |
| Heterogeneous dispatch | Distinguish **homogeneous fan-out** (MCO: same prompt to N agents) from **heterogeneous task dispatch** (Overstory: different tasks to specialists) | Different coordination patterns |

#### What the Question Will Miss

- **"gstack" is not an open-source orchestration protocol** — it is a personal sprint pipeline (`office-hours → plan-ceo-review → plan-eng-review → review → qa → ship`), not a generic dispatch pattern.
- **The question conflates homogeneous fan-out with heterogeneous task dispatch.** MCO dispatches the same prompt to N agents; Overstory dispatches different tasks to specialist agents. These require different coordination patterns.
- **File locking is explicitly a limitation**, not a pattern — multiple agents cannot concurrently edit the same file ([Claude Code Agent Teams](https://code.claude.com/docs/en/agent-teams)).

#### Sharpened Reformulation

> *What are the production dispatch patterns (parallel fan-out, sequential chain, worktree-isolated spawn, self-claim task queue) for concurrent CLI agent orchestration in MCO, Claude Code Agent Teams, Overstory, and AWS CLI Agent Orchestrator — and what merge/conflict resolution mechanisms operate at the output boundary?*

---

### Q1.4: Single-writer and present-state update patterns for singular source-of-truth artifacts

#### Three Most Authoritative Primary Sources

1. **[CodeCRDT (arXiv:2510.18893)](https://arxiv.org/abs/2510.18893)** — Applies observation-driven coordination (Linda tuplespaces) to concurrent multi-agent code generation. Agents coordinate by observing shared Yjs Y.Map CRDT state. Optimistic write-verify with 50ms sync delay. Results across 600 trials: 100% convergence, zero character-level merge failures; 5-10% semantic conflicts require reconciliation.

2. **[etcd Leader Election](https://oneuptime.com/blog/post/2025-12-11-etcd-leader-election/view)** — Atomic compare-and-swap to claim leadership with lease TTL (e.g., 15s), `KeepAlive` heartbeats, `Watch` for key deletion, and fencing tokens preventing stale leaders from writing. See also [Kubernetes reconciliation loop](https://kubernetes.io/blog/2025/12/30/kubernetes-v1-35-watch-based-route-reconciliation-in-ccm/).

3. **[MCP Agent Mail — File Reservation / Advisory Locking](https://github.com/Dicklesworthstone/mcp_agent_mail)** — Advisory file reservations with glob patterns, TTL-based auto-release, exclusive vs. shared modes, Git-backed audit trail + SQLite index. `FILE_RESERVATION_CONFLICT` error surface for agents to resolve conflicts.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Present-state update | **Desired state** vs. **actual state** + **reconciliation** | Kubernetes/GitOps terminology |
| Single-writer | **Leader election** (etcd CAS), **File reservation** (advisory locks), **CRDT** (lock-free) | Three architecturally distinct mechanisms |
| Source-of-truth artifact | Maintained by: (a) single writer via locks/election, (b) branch isolation with merge, or (c) CRDT concurrent writes | Three strategies, not one |

#### What the Question Will Miss

- **"Present-state update" is not ecosystem terminology.** The correct terms are desired state, actual/observed state, and reconciliation — from Kubernetes/GitOps.
- **Optimistic vs. pessimistic concurrency distinction is critical**: file locks = pessimistic (block); CRDTs = optimistic (write then reconcile); etcd CAS = optimistic with compare-and-swap. The question treats them as equivalent ([CodeCRDT](https://arxiv.org/abs/2510.18893)).
- **LangGraph checkpointing is the most deployed "source of truth" for agent state** — but it is per-thread, not shared across agents. Cross-agent state sharing requires an external store.
- **The Kubernetes operator pattern** (desired spec + controller that continuously reconciles) is increasingly applied to agent orchestration — architecturally distinct from file locking but achieves the same guarantee.

#### Sharpened Reformulation

> *What are the concurrency mechanisms (leader election via etcd CAS, advisory file reservation with TTL, CRDT-based lock-free writes, Kubernetes reconciliation loop) that enforce single-writer or convergent-multi-writer semantics on shared agent artifacts — and what are the trade-offs in blocking, latency, and conflict resolution?*

---

### Q1.5: Contract violation handling — error, retry, escalation

#### Three Most Authoritative Primary Sources

1. **[LangGraph — RetryPolicy and Fault Tolerance](https://langchain-ai.github.io/langgraph/)** — Node-level `RetryPolicy(max_attempts=3)`, configurable backoff, checkpoint-based resume via `MemorySaver`, `interrupt()` for human-in-the-loop, and time-travel replay from arbitrary `checkpoint_id`. See also [DEV Community guide](https://dev.to/aiengineering/a-beginners-guide-to-handling-errors-in-langgraph-with-retry-policies-h22).

2. **[CrewAI — Task Failure and Escalation](https://docs.crewai.com/en/concepts/tasks)** — `max_retries` (task-level), `max_retry_limit` (agent-level), `guardrail` callable for output validation, `human_input=True` for gated approval. Community best practice: treat human as a gated tool, not an agent. See [CrewAI Community Forum](https://community.crewai.com/t/how-to-deal-with-failing-tasks/5018).

3. **[Circuit Breaker Pattern for Agents](https://neuraltrust.ai/blog/circuit-breakers)** — Two distinct meanings: (a) safety/alignment circuit breakers (model-internal Representation Rerouting), (b) operational circuit breakers (CLOSED → OPEN → HALF-OPEN state machine preventing runaway retries). Production case: [$83 burn in retries](https://www.reddit.com/r/AI_Agents/comments/1rap64j/my_agent_burned_83_in_retries_before_i_realized/) before circuit implementation.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Contract violation | **Tool failure**, **Task failure**, **Agent error**, **Retry exhaustion** | No "contract violation" concept exists |
| Error handling | Three domains: (a) tool/API errors → retry; (b) semantic failures → correction prompt; (c) behavioral violations → circuit breaker or HITL | Each requires different strategy |
| Escalation | **`interrupt()`** (LangGraph), **`human_input=True`** (CrewAI), **`escalation` message** (Overstory) | Multi-agent escalation is emerging |

#### What the Question Will Miss

- **The question conflates three error domains**: transient tool/API errors (retry appropriate), task semantic failures (LLM produced wrong format — retry with correction prompt), and agent behavioral violations (hallucination, policy breach — circuit breaker or human escalation). Each demands a different handling strategy ([LangGraph](https://langchain-ai.github.io/langgraph/)).
- **Checkpoint-restore duplicate execution gap.** [arXiv:2603.20625](https://arxiv.org/html/2603.20625v1) shows retry-on-failure in checkpoint-restore systems can cause tools to fire twice — a known production bug.
- **Cost control is the most pressing production concern**, not abstract contract enforcement. The correct framing is bounded retry with cost ceiling.

#### Sharpened Reformulation

> *What are the error-handling architectures (LangGraph RetryPolicy + interrupt(), CrewAI guardrail + max_retries, operational circuit breakers, Overstory tiered escalation) for transient tool errors, semantic output failures, and behavioral violations — and how does the checkpoint-restore duplicate-execution gap affect retry safety?*

---

## Wave 2 — Trust and Write-Scope

### Q2.1: Trust/auth models for multi-agent systems with different permission levels

#### Three Most Authoritative Primary Sources

1. **[A2A Protocol Specification — Security Model](https://github.com/a2aproject/A2A/blob/main/docs/specification.md)** — Section 7: TLS 1.3+ mandatory, OAuth 2.0/API keys/mTLS/OpenID Connect. Section 7.5: authorization is intentionally implementation-specific. Section 7.6: `TASK_STATE_AUTH_REQUIRED` for mid-task credential delegation. Section 8.4: Agent Card signing via JWS/Ed25519. Confused deputy problem explicitly acknowledged.

2. **[Claude Code Permissions Documentation](https://code.claude.com/docs/en/permissions)** — Tiered model: read-only → bash (permanent) → file modification (session-scoped). Rule precedence: `deny > ask > allow`. Settings hierarchy: Managed > CLI args > local > project > user. PreToolUse [hooks](https://code.claude.com/docs/en/hooks) can block tool calls. Known gap: hooks cannot protect themselves from agent modification ([GitHub #11226](https://github.com/anthropics/claude-code/issues/11226)).

3. **[OWASP Top 10 for Agentic Applications 2026](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/)** — ASI02 (Tool Misuse), ASI03 (Identity & Privilege Abuse — agents as NHIs with JIT credentials), ASI04 (Supply Chain), ASI07 (Insecure Inter-Agent Communication — mTLS, zero-trust between internal agents), LLM06 (Excessive Agency — least privilege, ephemeral tokens).

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Trust/auth models | **Trust hierarchy**, **Principal model** (4-tier: platform → operator → user → agent) | Not simply "permission levels" |
| Different permission levels | **Least privilege**, **JIT credentials**, **Cedar policies**, **Tool allowlists** | Two orthogonal axes: scope and approval mode |
| Multi-agent auth | **Scoped delegation**, **OBO (On-Behalf-Of) tokens**, **NHI management** | [AgentGateway](https://agentgateway.dev) implements Cedar policies at tool level |

#### What the Question Will Miss

- **A2A's authorization gap is intentional.** The spec deliberately does not define how authorization must be performed. The question assumes a standard model to find; the dominant unresolved problem is that implementers must build their own ([A2A Spec](https://github.com/a2aproject/A2A/blob/main/docs/specification.md)).
- **The confused deputy problem is not fully solved.** [AgentGateway](https://shanedeconinck.be/explainers/agentgateway/)'s OBO tokens help, but no end-to-end mechanism ensures a downstream agent cannot exceed the authority of the original user across organizational boundaries.
- **Prompt injection breaks all auth models.** OWASP and [Simon Willison](https://simonw.substack.com/p/the-lethal-trifecta-for-ai-agents) note that once untrusted content enters context, all permission structures are potentially bypassable through the model's reasoning.
- **"Permission levels" conflates two axes**: capability scope (which tools/files/domains) and approval mode (automatic vs. gated). These are orthogonal.

#### Sharpened Reformulation

> *What are the authentication mechanisms (A2A SecuritySchemes, Claude Code tiered permissions, AgentGateway Cedar policies), authorization patterns (scoped delegation, OBO tokens, JIT credentials), and known vulnerabilities (confused deputy, hook self-modification, prompt injection bypass) in production multi-agent trust architectures?*

---

### Q2.2: Write-scope governance — which agents can modify which parts of a shared repo

#### Three Most Authoritative Primary Sources

1. **[Claude Code Permissions + Hooks](https://code.claude.com/docs/en/permissions)** — Path-scoped Edit rules (`Edit(/src/**)`), deny rules that override allows, PreToolUse hooks with `matcher: "Write|Edit"` for interception, PostToolUse hooks for audit. [Hooks reference](https://code.claude.com/docs/en/hooks).

2. **[GitHub Branch Protection Rules + CODEOWNERS](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule)** — Protected branches, required PR + status checks, "restrict who can push" with explicit actor list, CODEOWNERS for mandatory human reviewers by path glob. [Copilot agent management](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/manage-agents): agents always create PRs, cannot direct-push.

3. **[Git Worktree Pattern](https://www.nrmitchi.com/2025/10/using-git-worktrees-for-multi-feature-development-with-ai-agents/)** — `git worktree add .trees/<task-id> -b agent/<task-id>` gives each agent isolation. [Cursor Parallel Agents](https://dev.to/arifszn/git-worktrees-the-power-behind-cursors-parallel-agents-19j1) implements this natively. Limitation: worktrees prevent file conflicts but not branch manipulation.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Write-scope governance | **Path-scoped Edit rules** (Claude Code), **CODEOWNERS** (GitHub), **Branch protection** | Multiple layers |
| Which agents can modify | **Tool allowlist per skill** (OpenClaw Phase 3), **Write filtering** via PreToolUse hooks | Runtime enforcement vs. merge-time enforcement |
| Shared repo | **Git worktree isolation** (runtime) + **PR gating** (merge time) | Two distinct enforcement points |

#### What the Question Will Miss

- **CODEOWNERS doesn't prevent writes — it gates merges.** An agent can write anything to its branch. CODEOWNERS only triggers at PR merge time. The question conflates runtime write access with merge governance ([GitHub Docs](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule)).
- **No agent-aware CODEOWNERS exists.** CODEOWNERS assigns human reviewers by file path. There is no mechanism to route agent-authored PRs differently from human-authored PRs ([GitHub Community #159749](https://github.com/orgs/community/discussions/159749)).
- **The hooks-modify-hooks problem.** Claude Code hooks in `.claude/` can be edited by the agent they constrain ([GitHub #11226](https://github.com/anthropics/claude-code/issues/11226)). Enterprise write governance requires managed settings.
- **Multi-agent write conflicts lack protocol support.** No cross-agent write coordination mechanism exists — no concept of "agent A has exclusive write lock on `/src/auth/`." See [LangGraph CogniWall](https://dev.to/cogniwall/securing-langgraph-multi-agent-workflows-how-to-enforce-tool-level-permissions-13cm) for declarative tool-level policies.

#### Sharpened Reformulation

> *What are the layered write-governance mechanisms — runtime (Claude Code path-scoped Edit rules, PreToolUse hooks, tool allowlists), isolation (git worktree per agent), and merge-time (GitHub branch protection, CODEOWNERS, PR gating) — and where do enforcement gaps (hook self-modification, no agent-aware CODEOWNERS, no cross-agent file locking) remain?*

---

### Q2.3: Negative routing laws — what must NOT be automated despite feasibility

#### Three Most Authoritative Primary Sources

1. **[Simon Willison — "The Lethal Trifecta for AI Agents"](https://simonw.substack.com/p/the-lethal-trifecta-for-ai-agents)** — Any combination of (a) access to private data, (b) exposure to untrusted content, and (c) ability to externally communicate = must not automate without additional controls. Design patterns: Action-Selector, Plan-Then-Execute, Dual LLM, Taint tracking + policy gating.

2. **[Anthropic — Framework for Developing Safe and Trustworthy Agents](https://www.anthropic.com/news/our-framework-for-developing-safe-and-trustworthy-agents)** — Any action that modifies code or systems requires approval. High-stakes decisions before execution. Privacy-sensitive cross-context data use. Core principle: "Prefer reversible over irreversible actions."

3. **[Codebridge — Human in the Loop AI in Regulated Workflows](https://www.codebridge.tech/articles/human-in-the-loop-ai-where-to-place-approval-override-and-audit-controls-in-regulated-workflows)** — Four-tier control model: Tier 1 (Shadow Mode), Tier 2 (Supervised Autonomy — approval workflow), Tier 3 (Guided Autonomy — override controls), Tier 4 (Human-in-Command — advisory only). Hard gates always Tier 2 or 4: medical diagnoses, credit approvals, legal contract execution, ICU interventions.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Negative routing laws | **Hard gates**, **HITL checkpoints**, **Action classification** (read-only / reversible / compensatable / final) | "Laws" overstates the rigidity; these are risk-tiered decisions |
| Must NOT be automated | **Final actions** (cannot be undone), **Lethal trifecta** conditions | Smaller category than intuition suggests |
| Despite feasibility | **Accountability and regulation constraints**, not capability limits | HIPAA, KYC/AML, GDPR ADMT |

#### What the Question Will Miss

- **"Negative routing laws" is not ecosystem terminology.** The field uses "hard gates," "HITL checkpoints," "irreversibility constraints," or "action classification" ([Kevin Tan](https://blog.jztan.com/ai-agent-error-handling-patterns/): read-only → reversible → compensatable → final).
- **The infeasibility is usually about accountability, not technical impossibility.** Most actions *are* technically feasible to automate. The prohibition stems from liability, regulation, or irreversibility ([OWASP Agentic Top 10](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/)).
- **Regulatory specificity is missing.** California CCPA ADMT (Jan 2027), Colorado CAIA, Texas TRAIGA define different "must not" categories in different jurisdictions.
- **Single-agent vs. orchestrator context distinction.** An action safe in a single-agent system can become dangerous in a multi-agent pipeline (action cascades, confused deputy, inter-agent prompt injection).

#### Sharpened Reformulation

> *What is the action classification taxonomy (read-only, reversible, compensatable, final) and what hard-gate decision criteria (lethal trifecta conditions, irreversibility, regulatory mandate) determine which agent actions require mandatory human approval — with specific attention to how multi-agent orchestration changes the risk profile of individually safe actions?*

---

### Q2.4: Rollback/reversibility for agent-produced artifacts

#### Three Most Authoritative Primary Sources

1. **[Replit — Inside the Snapshot Engine](https://blog.replit.com/inside-replits-snapshot-engine)** — Copy-on-Write at block device level (constant-time manifest copy), immutable append-only Git remote, checkpoint includes database state. Parallel sampling: fork same base state → pick best → apply atomically (+8% SWE-bench improvement).

2. **[Auxiliobits — Versioning & Rollbacks in Agent Deployments](https://www.auxiliobits.com/blog/versioning-and-rollbacks-in-agent-deployments/)** — Four-layer versioning taxonomy: cognitive (prompt bundle), model (LLM version), knowledge context (embeddings, RAG docs), tool contracts (schema versions). When rollback must be prohibited: agents with long-term memory coupled to business events, real-time markets, legally binding decisions. Rule: **roll forward**, not back.

3. **[Eunomia.dev — Checkpoint/Restore for AI Agents](https://eunomia.dev/blog/2025/05/11/checkpointrestore-systems-evolution-techniques-and-applications-in-ai-agents/)** — Layer taxonomy: OS-level (CRIU), container-level (Docker+CRIU), library-level (DMTCP), application-level (LangGraph checkpointer). Multi-agent coordinated checkpoint: Chandy-Lamport algorithm is the theoretical basis but no production implementation exists.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Rollback | **Behavioral snapshot** (full rollback unit), **Compensating transaction** (Saga pattern), **Roll forward** (preferred for stateful agents) | Three distinct approaches |
| Reversibility | **Point-in-time recovery (PITR)**, **Time travel** (LangGraph), **Copy-on-Write** (Replit) | Mechanism-dependent |
| Agent-produced artifacts | Distinguish **local artifacts** (code files — git handles trivially) from **world-affecting side effects** (database mutations, API calls, sent emails) | Fundamentally different rollback designs |

#### What the Question Will Miss

- **Code artifacts are the easy case.** Git handles code rollback trivially. The hard problem is state rollback — agent memory, vector embeddings, database mutations, external service side effects ([Auxiliobits](https://www.auxiliobits.com/blog/versioning-and-rollbacks-in-agent-deployments/)).
- **Memory poisoning is a rollback threat.** When an agent's long-term memory is rolled back, all interactions since are "forgotten" — potentially creating inconsistency with humans who remember those interactions.
- **No production-grade multi-agent rollback exists.** Chandy-Lamport is the theoretical foundation, but no production framework implements coordinated rollback across a running multi-agent system ([Eunomia.dev](https://eunomia.dev/blog/2025/05/11/checkpointrestore-systems-evolution-techniques-and-applications-in-ai-agents/)).
- **Behavioral rollback requires pinning model versions, embedding datasets, and tool schemas together** — a discipline most teams don't practice. Rolling back code without rolling back the upstream model (which may have silently changed) produces a non-reproducible snapshot.

#### Sharpened Reformulation

> *What are the rollback mechanisms across local artifacts (git revert, Replit CoW snapshots, LangGraph time-travel), external side effects (Temporal Saga compensating transactions), and agent behavior (behavioral snapshots pinning prompt + model + embeddings + tool schemas) — and where does coordinated multi-agent rollback remain unsolved?*

---

## Wave 3 — Observability

### Q3.1: Minimal viable observability stack for multi-agent systems

#### Three Most Authoritative Primary Sources

1. **[OpenTelemetry GenAI Semantic Conventions — Agent Spans](https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/)** — Defines `create_agent` and `invoke_agent` spans with `gen_ai.agent.id`, `gen_ai.agent.name`, `gen_ai.agent.version`, `gen_ai.conversation.id`. All GenAI conventions carry experimental status. The [multi-agent proposal (Issue #2664)](https://github.com/open-telemetry/semantic-conventions/issues/2664) proposes `gen_ai.task.*`, `gen_ai.team.*`, `gen_ai.artifact.*`, `gen_ai.memory.*` attributes.

2. **[Arize Phoenix](https://github.com/arize-ai/phoenix)** — Most-referenced OSS LLM observability platform. Built on OTel + OpenInference. Provides tracing via OTLP, LLM-as-judge evaluation, datasets & experiments, prompt management. OpenInference span kinds: `AGENT`, `CHAIN`, `LLM`, `TOOL`, `RETRIEVER`, `RERANKER`, `EMBEDDING`. [OpenInference instrumentation](https://github.com/Arize-ai/openinference).

3. **[Langfuse](https://github.com/langfuse/langfuse)** — 19k+ GitHub stars, MIT-licensed, self-hostable. Typed trace tree (Trace → Span → Generation → Event), cost/token tracking, LLM-as-judge evaluation, prompt management. Acquired by ClickHouse in early 2026. Production multi-agent use documented by [Cresta](https://cresta.com/blog/observability-for-ai-agents-tracing-multi-service-llm-pipelines-with-langfuse).

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Observability stack | **LLM observability stack** or **GenAI observability** | Must include evaluation (LLM-as-judge), not just tracing |
| Minimal viable | **Five-layer MVS**: Traces, Metrics, Evaluation, Sessions, Baselines | Evaluation is inseparable from observability |
| Multi-agent | **OTel GenAI agent spans** (experimental) + **OpenInference** (de facto) | No stable multi-agent standard yet |

#### What the Question Will Miss

- **Evaluation is inseparable from observability.** Without automated LLM-as-judge scoring on production traces, the system has logs but not actionable observability. [Cresta's writeup](https://cresta.com/blog/observability-for-ai-agents-tracing-multi-service-llm-pipelines-with-langfuse) states observability is a prerequisite for quality, not just a post-incident tool.
- **No stable OTel standard yet.** All `gen_ai.*` attributes carry experimental status. The multi-agent coordination attributes exist only as a proposal. Teams building now are instrumenting against a moving spec.
- **The semantic loop problem.** A stuck agent that keeps reasoning without making progress shows green on all infrastructure metrics. Detection requires embedding similarity comparison across consecutive outputs (cosine > 0.92 for N consecutive steps signals a loop).
- **Cost as a first-class signal.** One misconfigured agent can produce cost explosions invisible to infrastructure monitors. [OpenLIT](https://github.com/openlit/openlit) tracks cost per LLM provider and per GPU.

#### Sharpened Reformulation

> *What is the five-layer minimal viable observability stack (OTel OTLP traces, token/cost metrics, LLM-as-judge scoring, session grouping, behavioral baselines) for multi-agent systems — and what are the gaps in current standards (experimental OTel GenAI conventions, absent multi-agent correlation attributes, no semantic loop detection)?*

---

### Q3.2: Drift detection — behavioral divergence from configured intent

#### Three Most Authoritative Primary Sources

1. **["Agent Drift" — arXiv:2601.04170](https://arxiv.org/abs/2601.04170)** (Rath, January 2026) — Foundational paper introducing the Agent Stability Index (ASI): composite across 12 dimensions in 4 categories (Response Consistency 0.30, Tool Usage Patterns 0.25, Inter-Agent Coordination 0.25, Behavioral Boundaries 0.20). Detectable drift (ASI < 0.85) emerges after median 73 interactions. Three mitigations: episodic memory consolidation (EMC), drift-aware routing (DAR), adaptive behavioral anchoring (ABA) — combined 81.5% drift reduction.

2. **["Goal Drift in Language Model Agents" — arXiv:2505.02709](https://arxiv.org/abs/2505.02709)** (Arike et al., May 2025, AAAI/ACM AIES 2025) — First systematic measurement of inference-time goal drift. Primary mechanism: pattern-matching behavior — agents increasingly match in-context behavioral patterns rather than adhering to system instructions as context grows. Claude 3.5 Sonnet (scaffolded) maintains near-perfect adherence for 100,000+ tokens.

3. **[Chanl AI — "Agent Drift: Silent Degradation"](https://www.chanl.ai/blog/agent-drift-silent-degradation)** (March 2026) — Practitioner synthesis: run same scenario at turn 5 vs. turn 20 to isolate depth-dependent degradation. Multi-criteria scorecards (factual accuracy, tone stability, policy adherence, fact retention — scored separately). Long-tail 5% of conversations at 25+ turns is where drift concentrates.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Behavioral divergence from configured intent | **Agent drift** (session-level umbrella), **Goal drift** (inference-time deviation), **Semantic drift** (output divergence), **Coordination drift** (multi-agent handoff degradation) | At least four distinct sub-problems |
| Drift detection | **Agent Stability Index (ASI)**, **Behavioral regression testing**, **Prompt fidelity ratio** | No ground truth available for most production tasks |
| Configured intent | **System prompt** + **goal elicitation** + **behavioral boundaries** | Detection unit is the conversation trajectory, not the deployment |

#### What the Question Will Miss

- **The question conflates at least four distinct problems**: semantic drift from system prompt, behavioral style drift, coordination drift, and model regression (provider version update). Each requires different detection methods ([arXiv:2601.04170](https://arxiv.org/abs/2601.04170)).
- **Drift is primarily an in-session phenomenon**, not a deployment-level one. It occurs within individual long-running sessions as context accumulates — not because someone changed the system prompt.
- **No ground truth exists for most production agent tasks.** Traditional ML drift detection (PSI, KL divergence) requires labeled ground truth. The ASI framework sidesteps this by measuring behavioral consistency metrics (tool selection stability, reasoning pathway edit distance) that don't require ground truth.
- **Multi-agent coordination drift is a separate problem class.** Inter-agent coordination metrics remain stable until ~200 interactions before sharply declining — a different timescale than semantic drift. Router-agent bias and handoff latency accumulation are coordination-specific failure modes.

#### Sharpened Reformulation

> *What are the detection methods for the four distinct drift types (semantic drift from system prompt, goal drift from in-context pattern matching, behavioral style drift, multi-agent coordination drift) — using the Agent Stability Index, behavioral regression testing at varying conversation depths, and prompt fidelity measurement — and what structural countermeasures (episodic memory consolidation, strong goal elicitation, context windowing) reduce drift incidence?*

---

### Q3.3: Intervention models and kill switches

#### Three Most Authoritative Primary Sources

1. **[LangGraph Human-in-the-Loop `interrupt()`](https://blog.langchain.com/making-it-easier-to-build-human-in-the-loop-agents-with-interrupt/)** — Production-standard HITL implementation. Persistence as first-class citizen (every step writes checkpoint), `interrupt()` pauses execution and marks thread `interrupted`, resume via `Command(resume=value)`. Four HITL patterns: approve/reject, review & edit state, review tool calls, multi-turn in multi-agent. [LangGraph GitHub](https://github.com/langchain-ai/langgraph).

2. **["Core Safety Values for Provably Corrigible Agents" — arXiv:2507.20964](https://arxiv.org/abs/2507.20964)** (Nayebi, CMU, July 2025) — Five lexicographically combined utility heads: deference, switch-access preservation, truthfulness, low-impact behavior, bounded task reward. Theorem 1: exact single-round corrigibility. Theorem 3: extends to multi-step, self-spawning agents. Key finding: for an arbitrary post-hack agent, verifying corrigibility is **undecidable** (reduction to halting problem), but a finite-horizon "decidable island" exists.

3. **[OneUptime — "How to Build Agent Supervision"](https://oneuptime.com/blog/post/2026-01-30-agent-supervision/view)** (January 2026) — Complete practitioner guide to circuit breaker implementation (CLOSED/OPEN/HALF-OPEN) with working Python code. Three intervention principles: threshold-based cutoffs, HITL escalation ladders, auto-rollback triggers. See also [$83 burn case](https://www.reddit.com/r/AI_Agents/comments/1rap64j/my_agent_burned_83_in_retries_before_i_realized/).

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Kill switch | **Circuit breaker** (reliability), **`interrupt()` + approval gates** (HITL), **Corrigibility** (AI safety) | Organizational control, not primarily a technical mechanism |
| Intervention model | **Tiered intervention architecture**: T1 auto-halt, T2 soft pause, T3 human-on-loop, T4 emergency override, T5 full rollback | Five tiers, not a single pattern |
| Kill switch (emergency) | **Breakglass** (enterprise), **Kill switch** (governance artifact requiring audit trails) | EU AI Act mandates documented oversight mechanisms |

#### What the Question Will Miss

- **"Kill switch" is a governance requirement, not a technical implementation.** The organizational problem — who knows where it is, who can operate it, whether it spans multiple workflows — is harder than the technical implementation ([CNBC, March 2026](https://www.syntaxia.com/post/ai-agent-safety-circuit-breakers-for-autonomous-systems)).
- **Corrigibility and circuit breakers are completely different problem classes.** Corrigibility (agent resists shutdown) requires training-time changes. Circuit breakers (reliability failures) assume a cooperative agent. Most production systems only need the reliability pattern ([arXiv:2507.20964](https://arxiv.org/abs/2507.20964)).
- **Multi-agent cascades are unsolved.** A single circuit breaker on one agent doesn't stop the cascade. Cross-agent transaction boundaries and shared state rollback remain largely unsolved.
- **HITL does not scale linearly.** Targeting 10-15% escalation rate is the practical production target; above this, HITL becomes a bottleneck.
- **Regulatory mandates are arriving.** EU AI Act (August 2026) and California SB-833 (July 2026) mandate documented human oversight mechanisms for high-risk AI systems.

#### Sharpened Reformulation

> *What is the tiered intervention architecture (auto-halt via circuit breakers, soft pause via LangGraph interrupt(), human-on-loop via async review, emergency override, and auto-rollback) — and how do corrigibility guarantees, multi-agent cascade containment, HITL scalability limits, and regulatory mandates (EU AI Act, California SB-833) constrain the design space?*

---

## Wave 4 — Selective Scouting

### Q4.1: Promotion ladders for learned behaviors in self-improving agents

#### Three Most Authoritative Primary Sources

1. **[NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent)** — Canonical self-improving agent implementation. Closed learning loop: autonomous skill creation from experience, skills self-improve during use, agent-curated memory with periodic nudges, FTS5 cross-session recall. Skills stored in `~/.hermes/skills/`, following [agentskills.io](https://sundialhub.com) standard. Companion: [hermes-agent-self-evolution](https://github.com/NousResearch/hermes-agent-self-evolution) using DSPy + GEPA.

2. **[ARISE: Agent Reasoning via Intrinsic Skill Evolution (arXiv:2603.16060)](https://arxiv.org/html/2603.16060v1)** — Formally specified skill lifecycle: Seed → Generate → Add (cache, u=0) → Update (EMA: u_t ← β·u_t + (1−β)·R_t) → Evict → Load/Promote (reservoir skill replaces lowest-utility cache entry) → Delete (reservoir entries with u < 10th percentile AND zero usage permanently removed). Two-tier cache (C=10) + reservoir (C=100).

3. **["Agent Skills: Architecture, Acquisition, Security" (arXiv:2602.12430)](https://arxiv.org/pdf/2602.12430)** — Skill Trust and Lifecycle Governance Framework with four trust tiers: T1 (Unvetted/Sandboxed), T2 (Community-Reviewed), T3 (Organization-Vetted), T4 (Vendor-Certified). Four verification gates (G1–G4). Promotion (T↑) and demotion (T↓) based on runtime behavior. 26.1% of community skills in the wild are vulnerable.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Promotion ladder | **Skill trust tiers (T1–T4)**, **Dynamic cache-reservoir** (ARISE), **Closed learning loop** (Hermes) | "Ladder" implies one-directional ascent — actual model is bidirectional |
| Learned behavior promotion | **Autonomous skill creation**, **Skill self-improvement**, **Skill evolution** | Not "promotion" — creation + utility-based routing |
| Skill graduation | **Eviction + deletion** from reservoir | No graduation-to-production framing exists |
| Habit learning | **Auto memory**, **Theory-of-Mind modeling** ([Honcho](https://github.com/plastic-labs/honcho)) | Memory ≠ skills — separate management systems |

#### What the Question Will Miss

- **The lifecycle is bidirectional, not just upward.** ARISE shows equal emphasis on eviction, promotion, and deletion. Skills degrade in utility and get removed. The "ladder" metaphor implies one-directional ascent; the actual model is a dynamic cache-reservoir with utility-based routing ([ARISE](https://arxiv.org/html/2603.16060v1)).
- **Memory and skills are separate systems.** Hermes has `MEMORY.md` (episodic/factual), `USER.md` (user modeling), and `skills/` (procedural). "Habit learning" maps to auto memory, not skill promotion.
- **The question ignores the security gate model.** The dominant 2025-2026 framing is a trust-tiered verification pipeline, not a performance-based ladder ([arXiv:2602.12430](https://arxiv.org/pdf/2602.12430)).
- **No consensus on the promotion signal.** ARISE uses EMA-weighted utility. OpenAI evals use [score drift on CSV-tracked test cases](https://developers.openai.com/blog/eval-skills/). Hermes uses human nudges + self-assessment. This is the actual open problem.
- **RL-from-experience (ARISE, MemSkill) and file-based skills (Hermes, Claude Code) are architecturally incompatible.** "Promotion" means fundamentally different things in training loops vs. inference loops.

#### Sharpened Reformulation

> *What are the skill lifecycle management architectures (ARISE two-tier cache-reservoir with EMA-weighted utility, Hermes closed learning loop, trust-tier T1-T4 verification pipeline) — distinguishing performance-based promotion/eviction from security-based trust escalation — and what quality signals reliably indicate a learned skill should be promoted, demoted, or permanently evicted?*

---

### Q4.2: Cross-surface receipt normal forms across heterogeneous agents

#### Three Most Authoritative Primary Sources

1. **[A2A Protocol Specification — Artifact Schema](https://github.com/a2aproject/A2A/blob/main/docs/specification.md)** — `Task.artifacts[]` as the canonical output container. `Artifact` contains `artifactId`, `name`, `parts[]` (discriminated union: text, raw/inline binary, URL reference, structured data), `extensions`, `metadata`. Normalization via media type negotiation (`defaultOutputModes` / `acceptedOutputModes`), camelCase JSON convention, ISO 8601 UTC timestamps.

2. **[ACP — Agent Communication Protocol](https://agentcommunicationprotocol.dev/introduction/welcome)** — `Artifact` with `name`, `content`, `content_encoding` ("base64"/"plain"), `content_type` (MIME). REST-native, async-first with SSE. Multimodal content via MIME types. See [ACP Artifact docs](https://agentcommunicationprotocol.dev/how-to/generate-artifacts) and [IBM Research](https://research.ibm.com/projects/agent-communication-protocol).

3. **["Survey of Agent Interoperability Protocols" (arXiv:2505.02279)](https://arxiv.org/html/2505.02279v1)** — Canonical cross-protocol comparison: MCP (JSON-RPC Result), ACP (Artifact via multipart Message), A2A (Task.artifacts[] via JSON-RPC + Agent Card), ANP (JSON-LD + Schema.org via DID). Proposes phased adoption: MCP → ACP → A2A → ANP.

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Receipt | **Artifact** (A2A, ACP), **Task.artifacts[]**, **CallToolResult** (MCP) | No "receipt" concept in protocols |
| Normal form | **Discriminated Part types** + **media type negotiation** | A2A specification language |
| Cross-surface | **Cross-framework interoperability** | Ecosystem hasn't converged on a single normal form |
| Receipt normal form | **Agent Artifact normalization** | Via protocol-specific type systems, not a universal schema |

#### What the Question Will Miss

- **"Receipt" is not an established concept in agent protocols.** Protocols define `Task` (lifecycle), `Artifact` (output), and `Message` (communication) — separate concerns in A2A (`TaskStatus` vs. `Task.artifacts[]`).
- **The ecosystem hasn't converged.** MCP, ACP, A2A, and ANP have incompatible output models. The phased adoption roadmap suggests these are complementary layers, not converging alternatives ([arXiv:2505.02279](https://arxiv.org/html/2505.02279v1)).
- **Data-plane vs. control-plane normalization is elided.** A2A Artifacts normalize the data payload; OTel [GenAI spans](https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/) normalize the audit trail. Different consumers, different timescales.
- **Structured output is a model-provider problem** (OpenAI `json_schema`, Claude `output_config.format`, Gemini `response_schema`) operating before the agent protocol layer. Normalization happens at three levels: model output, protocol artifact, and trace.
- **Schema drift and versioning are absent.** [OASF](https://www.emergentmind.com/topics/open-agentic-schema-framework-oasf) addresses forward-compatible evolution with content-addressed storage — but this is not integrated with any protocol.

#### Sharpened Reformulation

> *What are the output artifact schemas across A2A (discriminated Part types with media type negotiation), ACP (MIME-typed multipart Messages), MCP (CallToolResult with structured content), and ANP (JSON-LD semantic descriptions) — and what translation/adapter layer would be required to normalize heterogeneous agent outputs into a single canonical form with versioning and schema evolution support?*

---

## Wave 5 — Integration

### Q5.1: Minimal viable operational constitution for transitioning from human-mediated to protocol-mediated orchestration

#### Three Most Authoritative Primary Sources

1. **["Evolving Interpretable Constitutions for Multi-Agent Simulation" (arXiv:2602.00755)](https://arxiv.org/pdf/2602.00755)** — LLM-guided Constitutional Evolution. Key finding: **operational specificity outperforms abstract principles.** "Deposit First" vs. "Be Helpful" produced 123% improvement in stability (S from 0.249 to 0.556) and 84% reduction in variance. The evolved constitution has exactly **7 priority-ordered rules**. Communication dropped from 62.2% to 0.9% — implicit coordination via shared rules replaced explicit negotiation.

2. **[CMAG — Constitutional Multi-Agent Governance (arXiv:2603.13189)](https://arxiv.org/html/2603.13189v1)** — Two-stage architecture: Stage 1 (hard constraints — inviolable red lines, reject forbidden themes/claims, intensity threshold ι_max = 0.80) + Stage 2 (soft penalized-utility optimization — maximize ECS = C × A × I × F). Key finding: hard constraints alone achieve ECS=0.733; full CMAG achieves 0.741 — the soft optimization layer provides critical additional governance. [GitHub: drdezarza/cmag](https://github.com/drdezarza/cmag).

3. **[CIO Magazine — "Why Your 2026 IT Strategy Needs an Agentic Constitution"](https://www.cio.com/article/4118138/why-your-2026-it-strategy-needs-an-agentic-constitution.html)** (January 2026) — Defines agentic constitution as machine-readable foundational principles + operational boundaries + actionable rules. Three-tier autonomy hierarchy: Tier 1 (full autonomy — log rotation, basic routing), Tier 2 (supervised autonomy — patching, provisioning — reasoning trace required), Tier 3 (human-only red line — database deletions, security overrides, constitution modification — MFA/dual-key). Transition framed as "Policy on Paper" → "Policy as Code (PaC)."

#### Corrected Search Terminology

| Question's Term | Ecosystem-Standard Term | Notes |
|---|---|---|
| Operational constitution | **Agentic Constitution** (CIO), **CMAG** (academic), **Policy as Code** | Partially adopted, not standardized |
| Minimal viable | **Minimum Viable Governance (MVG)** — incompatible answers from three sources | 7 operational rules (arXiv:2602.00755), hard+soft constraints (CMAG), Tier 3 red lines only (CIO) |
| Human-mediated → protocol-mediated | **Autonomy escalation ladder** (Tier 1→3), **"Operator" → "Architect of Intent"** | Two distinct transition problems |
| Protocol-mediated | **MCP** (tool access) + **A2A** (delegation) + **AGENTS.md** (behavioral spec) + **OTel** (audit) | Multiple protocols govern different aspects |

#### What the Question Will Miss

- **"Minimal viable" is underspecified — minimal along which dimension?** Three incompatible answers: CIO says Tier 3 red lines only; arXiv:2602.00755 says 7 operational rules outperform abstract principles; CMAG says hard constraints alone are insufficient — the soft optimization layer is required.
- **The question conflates two transition problems**: (a) individual agent behaviors from human approval to autonomous execution, and (b) the orchestration layer from human coordinator to protocol-mediated coordinator. These require different constitutional elements.
- **The principal hierarchy problem is absent.** [Anthropic's constitution](https://www.anthropic.com/constitution) explicitly defines a four-level hierarchy (Anthropic > Operator > User > Non-principal agents). Any operational constitution must specify how agent-to-agent authority is bounded.
- **The "policy as code" implementation gap.** Encoding rules as LLM-readable machine code is required, but the practical implementation — which format, which enforcement mechanism — is not standardized. [AAIF](https://aaif.io/press/linux-foundation-announces-the-formation-of-the-agentic-ai-foundation-aaif-anchored-by-new-project-contributions-including-model-context-protocol-mcp-goose-and-agents-md/)'s AGENTS.md (60k+ projects), MCP, and goose constitute the closest standard stack.
- **The "autonomy ratchet" problem.** Once tasks move from supervised to autonomous, reversing that transition is organizationally difficult. The constitution needs explicit downgrade mechanisms.
- **"Protocol-mediated" underspecifies the protocol stack.** MCP (tool access), A2A (agent delegation), ACP (multimodal messaging), AGENTS.md (behavioral spec), OTel GenAI spans (audit trail) — a minimal constitution must specify which protocols govern which aspects. The [IETF draft](https://datatracker.ietf.org/doc/draft-smith-opsawg-ai-network-governance/) and [TMForum framework](https://inform.tmforum.org/features-and-opinion/ai-autonomy-governance-a-governance-framework-for-agentic-ai-enabling-safe-accountable-and-scalable-autonomous-intelligence) provide the most complete governance scaffolding.

#### Sharpened Reformulation

> *What is the minimum viable agentic constitution — combining hard constraints (inviolable red lines, CMAG Stage 1), soft optimization criteria (CMAG Stage 2 ECS function), a principal hierarchy (Anthropic 4-tier model), and explicit autonomy tier definitions (CIO Tier 1-3 with downgrade mechanisms) — that enables safe transition from human-mediated to protocol-mediated orchestration via AGENTS.md, MCP, A2A, and OpenTelemetry?*

---

## Cross-Cutting Gaps

These patterns span multiple questions and would be missed by executing them individually.

### 1. Correlation IDs Are Load-Bearing Across All 20 Questions

Every framework reviewed (OpenTelemetry, A2A `contextId`, HatchWorks) requires a correlation ID that propagates from task creation through receipt through lifecycle states through eval comparison. Without it, none of Q0.1–Q5.1 is practically implementable. Yet no reviewed task schema carries a mandatory `trace_id` or `caused_by` field at the task level — correlation lives in tracing infrastructure or is absent entirely. A Syncrescendence grammar must define correlation as a first-class field in the task object, not delegate it to observability infrastructure ([OWASP AOS](https://owasp.github.io/www-project-agent-observability-standard/spec/trace/extend_opentelemetry/), [OTel GenAI Spans](https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/)).

### 2. Schema Versioning Is Assumed but Never Specified

As grammar evolves, the task schema (Q0.1), receipt schema (Q0.2, Q4.2), eval criteria (Q0.5), trust tiers (Q4.1), and constitution rules (Q5.1) all need version fields. Current schemas have no `schema_version` field. [OASF](https://www.emergentmind.com/topics/open-agentic-schema-framework-oasf) addresses this with content-addressed storage and SHA-256 CIDs, but no production protocol has adopted it. A constitutional knowledge system that evolves its own grammar needs explicit version-aware schemas from day one.

### 3. Multi-Agent Coordination Is the Universally Unsolved Layer

Every current tool solves single-agent governance. The following problems lack production-grade solutions:
- **Multi-agent write coordination** (Q1.4, Q2.2): No cross-agent file-locking protocol exists. Worktrees solve isolation but not coordination.
- **Multi-agent consistent rollback** (Q2.4): Chandy-Lamport is theoretical; no framework implements coordinated multi-agent rollback ([Eunomia.dev](https://eunomia.dev/blog/2025/05/11/checkpointrestore-systems-evolution-techniques-and-applications-in-ai-agents/)).
- **Cross-agent trust delegation** (Q2.1): The confused deputy problem is acknowledged but unsolved across organizational boundaries ([A2A Spec](https://github.com/a2aproject/A2A/blob/main/docs/specification.md)).
- **Coordinated drift detection** (Q3.2): Inter-agent coordination drift has a different timescale than semantic drift and requires different detection methods ([arXiv:2601.04170](https://arxiv.org/abs/2601.04170)).
- **Multi-agent cascade containment** (Q3.3): A single circuit breaker on one agent doesn't stop cascades in multi-agent pipelines.

### 4. Prompt Injection Undermines All Trust and Governance Layers

All four Wave 2 questions (Q2.1–Q2.4) are vulnerable to prompt injection bypassing technical controls. [OWASP](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/) and [Simon Willison](https://simonw.substack.com/p/the-lethal-trifecta-for-ai-agents) both note that once untrusted content enters context, all permission structures are potentially bypassable. The mitigations are architectural (Dual LLM, taint tracking, Action-Selector pattern), not enforcement-based. A constitutional knowledge system must treat prompt injection as a cross-cutting architectural constraint, not a per-question concern.

### 5. Behavioral Versioning Is Not Practiced

The ecosystem has version control for code (git) but not for agent behavior. Prompt bundles, model versions, embedding datasets, and tool schemas need to be versioned together for Q2.2 (write governance), Q2.4 (rollback), Q3.2 (drift detection), and Q4.1 (skill promotion) to function correctly. [Auxiliobits](https://www.auxiliobits.com/blog/versioning-and-rollbacks-in-agent-deployments/) defines the four-layer versioning taxonomy but no tool implements it end-to-end. A "behavioral snapshot" — the minimum rollback unit — must be a first-class concept in the Syncrescendence grammar.

### 6. The Regulatory Layer Is Converting "Should" Into "Must" (2026-2027)

Q2.3's "negative routing laws" are becoming actual laws. California CCPA ADMT regulations (effective January 2027), Colorado CAIA, and Texas TRAIGA explicitly define which automated decision-making requires human oversight. The EU AI Act (full enforcement August 2026) mandates documented human oversight mechanisms for high-risk AI systems. Q3.3's kill switches are no longer just best practice — they are compliance artifacts requiring audit trails. The research program should treat regulatory compliance as an architectural constraint affecting Q2.1, Q2.3, Q3.3, and Q5.1 simultaneously, not as a footnote to individual questions.

### 7. The "2-3 CLI Agents" Topology Is Implicit in Multiple Questions but Never Specified

Q0.3, Q0.4, Q1.3, and Q1.5 all assume a topology of 2-3 CLI agents, but the inter-agent communication pattern (A2A vs. file-mediated vs. shared state vs. worktree isolation) fundamentally changes what lifecycle states are observable, what concurrency mechanisms are available, and what failure modes are possible. The questions should specify the communication topology before asking about lifecycle semantics. This choice — A2A protocol-mediated vs. Overstory SQLite mail vs. MCO subprocess-based — is a foundational architectural decision that constrains answers across all four questions.
