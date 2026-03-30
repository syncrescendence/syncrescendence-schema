# Receipt & Acknowledgment Patterns in Production AI Agent Orchestration

## Executive Summary

Every production multi-agent system must answer six questions about any completed (or failed) task: *who ran it*, *under what authority*, *against what input*, *with what output*, *whether it passed or failed*, and *where the evidence landed*. No current framework answers all six out of the box. Each system studied — OpenAI Agents SDK, Google A2A, BeeAI ACP, Symphony, and Claude Code — provides a different subset of these answers, with different degrees of immutability, cross-agent linkage, and post-hoc verifiability. The gap between what protocols emit and what a governance-grade receipt requires is the central design challenge for systems entering "operational constitution."

***

## 1. What Makes a Receipt a Receipt

Before examining individual systems, it is worth distinguishing three concepts that are often conflated in practice:

- **Trace/span** — a structured execution log recording the timing and sequencing of operations. Optimized for debugging and performance analysis. Mutable by the platform unless cryptographically anchored.
- **Result object** — the in-process return value of an agent run, containing final output, run items, and status flags. Ephemeral unless explicitly persisted.
- **Receipt** — a durable, self-describing record sufficient to reconstruct the authorization chain and verify the outcome of a specific agent action without trusting the logging platform. A receipt implies accountability; a trace implies observability.

The gap matters because most frameworks today produce traces and results, but not receipts in the accountability sense. A receipt becomes necessary the moment an agent action is consequential enough that a human, regulator, or downstream agent needs to verify it independently.[^1][^2]

***

## 2. OpenAI Agents SDK

### Result Surface

When `Runner.run()` completes, it returns a `RunResult` (or `RunResultStreaming`) object that is the SDK's closest equivalent to a receipt. The object exposes the following surfaces:[^3]

| Property | Audit Function |
|---|---|
| `input` | What the run actually consumed as input (post-handoff filtering) |
| `final_output` | The agent's structured or string answer |
| `new_items` | Rich `RunItem` wrappers with agent, tool, handoff, and approval metadata |
| `last_agent` | Which agent produced the final output |
| `raw_responses` | Raw `ModelResponse` objects from every model call |
| `input_guardrail_results` | Accumulating log of all input guardrail decisions |
| `output_guardrail_results` | Accumulating log of all output guardrail decisions |
| `interruptions` | Pending approval items if the run paused |
| `context_wrapper.usage` | Token counts and cost metadata |
| `last_response_id` | Chaining ID for Responses API continuation |

The `new_items` property is the richest audit surface. It is a typed union of `RunItem` subtypes: `MessageOutputItem`, `ReasoningItem`, `ToolCallItem`, `ToolCallOutputItem`, `HandoffCallItem`, `HandoffOutputItem`, `ToolApprovalItem`, and search variants. Each item carries agent association and raw model payload, making it possible to reconstruct which agent produced which action.[^4][^5]

### Trace Structure

The SDK wraps each `Runner.run()` call in a `trace()` context identified by `trace_id`, `group_id`, `workflow_name`, and optional `metadata`. Within the trace, span types are:[^6][^7]

- `agent_span`: name, handoffs list, tools list, output_type
- `generation_span`: input message sequence, outputs, model name, usage
- `function_span`: tool call inputs and outputs
- `guardrail_span`: guardrail name and result
- `handoff_span`: from_agent, to_agent

Each span carries `started_at`, `ended_at`, `trace_id`, `parent_id`, and `span_data`. The parent_id chain enables reconstruction of nested agent execution trees.[^6]

### Guardrails as Pass/Fail Signal

Guardrails produce `GuardrailFunctionOutput` objects with two fields: `tripwire_triggered` (bool) and `output_info` (arbitrary metadata about the decision). If `tripwire_triggered` is `True`, the SDK raises `InputGuardrailTripwireTriggered` or `OutputGuardrailTripwireTriggered` and halts execution. This is the SDK's primary structured failure signal, but it is an exception, not a persisted receipt.[^8][^9]

### Authority Gap

The SDK provides no native delegation token or authority claim within the `RunResult`. Authority must be conveyed through `RunContextWrapper.context` (application-managed state) or through the agent's `instructions` prompt. There is no signed proof that a specific tool invocation was authorized against a specific policy at a specific time.[^2]

### Known Limitation

A documented issue exists where the last agent's trace in multi-agent chains is sometimes incomplete due to trace flush timing. This means the `RunResult` may be complete while the trace record is not — a material gap for post-hoc audit in sequential pipelines.[^10]

***

## 3. Google Agent-to-Agent (A2A) Protocol

### Task as Receipt Primitive

The A2A `Task` object is the protocol's primary unit of accountability. Its fields:[^11][^12]

| Field | Audit Function |
|---|---|
| `id` (UUID) | Unique task identifier, generated by server |
| `contextId` (UUID) | Groups related tasks across a conversation thread |
| `status` (TaskStatus) | Current lifecycle state |
| `artifacts[]` | Structured output objects (the "product" of the task) |
| `history[]` | Multi-turn interaction history |

### State Machine

A2A defines an eight-state machine for task lifecycle:[^13][^14][^15]

```
SUBMITTED → WORKING → [INPUT_REQUIRED | COMPLETED | FAILED | CANCELLED | REJECTED | AUTH_REQUIRED]
```

- **SUBMITTED**: Task received and queued; client has the `taskId`
- **WORKING**: Active processing underway
- **INPUT_REQUIRED**: Interrupted, awaiting additional client data
- **COMPLETED**: Terminal success; `artifacts[]` populated
- **FAILED**: Terminal error; error details included for retry/escalation decisions
- **CANCELLED**: Terminated before completion; may include partial results
- **REJECTED**: Agent declined to perform the task (Google Cloud extension)
- **AUTH_REQUIRED**: Out-of-band authentication needed (Google Cloud extension)

Every state transition carries a timestamp and optional context message, enabling chronological reconstruction of the task lifecycle.[^16]

### Artifacts as Structured Output

Artifacts are explicitly distinguished from messages: they are the *product* of a task, not point-to-point communication. An artifact contains `artifactId`, `name`, `description`, `parts[]` (typed content segments), `metadata`, and `extensions[]`. The `index` and `append`/`lastChunk` flags support streaming assembly. A single task can produce multiple artifacts (documents, data, images).[^17][^18][^11]

### Authority Model

The `AgentCard` (served at `/.well-known/agent-card.json`) declares authentication schemes (OAuth, API keys) and capabilities. Authentication is performed out-of-band, with credentials conveyed via HTTP headers. The ACP companion paper extends this to require per-hop identity validation: every receiving agent must independently validate sender identity and scope, and trust must not be inherited transitively. However, in the baseline A2A spec, there is no signed delegation claim embedded in the `Task` object itself.[^19][^16]

### Known Issues

A documented production bug in Google ADK's `RemoteA2aAgent` causes failed task states (`state: "failed"`) to propagate the error message as regular content artifacts rather than structured error events. This means downstream agents and their LLM contexts may receive internal error details (including SQL stack traces) as if they were valid task output — a significant integrity failure for multi-agent pipelines.[^20]

Distributed tracing across A2A workflows is not yet as mature as microservices distributed tracing. Understanding cross-agent causality requires per-agent instrumentation and log correlation by `taskId`, but purpose-built tooling does not yet automate this.[^13]

***

## 4. Agent Communication Protocol (ACP) — BeeAI / IBM

### Run Object Schema

ACP's `Run` object is the receipt equivalent:[^21][^22]

```json
{
  "run_id": "44e480d6-9a3e-4e35-8a03-faa759e19588",
  "agent_name": "echo",
  "session_id": "b30b1946-6010-4974-bd35-89a2bb0ce844",
  "status": "completed",
  "await_request": null,
  "output": [{ "parts": [{ "content_type": "text/plain", "content": "Howdy!" }] }],
  "error": null,
  "created_at": "<ISO 8601 timestamp>",
  "completed_at": "<ISO 8601 timestamp>"
}
```

Status values progress through: `created → in_progress → awaiting → completed / failed / cancelling / cancelled`. The `await_request` field surfaces the ACP "Await" primitive — the protocol's mechanism for an agent to pause and request client input before resuming.[^22][^21]

### Execution Modes

ACP supports three execution modes affecting how receipts are delivered:[^23]
- **Synchronous**: blocks until completion; receipt returned in-line
- **Asynchronous**: returns `run_id` immediately; caller polls `GET /runs/{run_id}`
- **Streaming**: Server-Sent Events for incremental output

### Authentication at Every Hop

The ACP specification paper explicitly requires authentication logs to capture "sender identity, receiver identity, tenant context, delegation metadata, and authorization results" at every hop in a relay chain. This is a stronger per-hop requirement than A2A's model, but as of early 2026 it remains a specification requirement rather than universally enforced behavior in implementations.[^19]

### ACP Paper (arXiv 2602.15055)

The formal ACP proposal introduces a federated orchestration model with decentralized identity verification, semantic intent mapping, and automated service-level agreements. The paper claims a 50% reduction in inter-agent communication latency while maintaining a zero-trust security posture, though these figures are from the authors' evaluation environment rather than independently verified production deployments.[^24]

***

## 5. Symphony (Decentralized Multi-Agent)

### Architecture

Symphony is a decentralized framework for orchestrating lightweight LLMs on consumer-grade hardware without a centralized coordinator. Its three core mechanisms each contribute to an implicit receipt:[^25][^26]

1. **Decentralized Ledger**: A distributed, immutable record of each agent's capabilities and reputation, indexed by a DID-compliant cryptographic address. This provides the "who ran" answer via verifiable identity rather than a trusted central registry.[^27]

2. **Beacon-Selection Protocol**: When a planning agent generates a sub-task, it broadcasts a `Beacon` describing requirements. Each candidate agent computes a capability match score \( s_j(t_{i,k}) = \phi(c_j, r(t_{i,k})) \in [0,1] \). The delegating agent selects the highest scorer. This score becomes part of the execution record.[^27]

3. **Weighted Result Voting**: After all sub-tasks within a Chain-of-Thought are executed, final answers are aggregated using confidence scores \( w_i = \text{avg}(s_j(t_{i,k})) \) across all assigned agents. This voting record is Symphony's pass/fail mechanism — not a binary flag but a consensus confidence value.[^27]

### Receipt Gaps

Symphony's `TaskResult` object (returned by `submit_task()`) and `TaskStatus` (from `get_task_status()`) exist at the API surface, but the framework does not document a signed receipt primitive. The decentralized ledger provides capability history, but individual task execution receipts with cryptographic linkage to delegation are not described in the published literature. Symphony's overhead for its orchestration mechanisms is documented at less than 5% of inference latency, but this refers to the coordination overhead rather than a receipt generation cost.[^28][^26]

***

## 6. Claude Code Agent Teams

### Hook-Based Observability Architecture

Claude Code provides a hooks system that fires at twelve lifecycle events, enabling external receipt construction even though the SDK does not emit receipts natively:[^29][^30][^31]

| Event | When | Can Block | Receipt Role |
|---|---|---|---|
| `UserPromptSubmit` | Before prompt processed | Yes | Task intake record |
| `PreToolUse` | Before any tool execution | **Yes** | Authorization gate + input record |
| `PostToolUse` | After successful tool execution | No | Output record, pass signal |
| `PostToolUseFailure` | On tool error | No | Failure signal |
| `PermissionRequest` | User permission dialog | No | Authority escalation record |
| `SubagentStop` | When subagent concludes | No | Subagent completion receipt |
| `SubagentStart` | When subagent spawns | No | Delegation event |
| `Stop` | Main agent finishes | No | Session-level completion |
| `SessionStart` | Session begins | No | Context establishment |
| `SessionEnd` | Session ends | No | Session closure |
| `Notification` | Agent sends notification | No | Alert record |
| `PreCompact` | Before context compaction | No | Context boundary marker |

`PreToolUse` is the only event that can block execution, making it the enforcement gate for authorization policies. `SubagentStop` is the primary subagent completion signal; a `Stop` hook scoped within a subagent is automatically converted to `SubagentStop`.[^30][^29]

### Subagent Output Model

Each Claude Code subagent operates in its own isolated 200,000-token context window, receives a task description, and returns a single filtered result to the delegating agent. The filtering is intentional: the subagent returns only *relevant* information, not its full context. This means the delegating orchestrator's receipt of the subagent's work is necessarily summarized, not a full transcript.[^32][^33]

### Known Observability Gap (Critical for Multi-Agent)

A documented limitation as of early 2026: hook events (`PreToolUse`, `PostToolUse`, `SubagentStop`) carry no field indicating which agent (main or subagent) triggered the event. All events share the same `session_id`, making it impossible to build reliable agent-attribution receipts without external workarounds. Known workarounds — parsing the transcript JSONL, PID-based heuristics, `tool_use_id` correlation — each fail in the presence of concurrent parallel subagents. A community-built workaround uses Redis pub/sub at `SubagentStop` to emit `{session_id, status: "completed", timestamp}` as a coordination signal, but this is not a signed or typed receipt.[^34][^35]

This gap is architecturally significant: a system with eleven parallel agents sharing a session namespace cannot construct per-agent receipts from hooks alone without external disambiguation.

***

## 7. Cryptographic Receipt Approaches

### The Core Problem

Traditional log files fail all three receipt properties:[^1]
- **Completeness**: A database admin can `DELETE FROM logs WHERE ...` without detection
- **Integrity**: Files can be truncated, overwritten, or have lines inserted
- **Ordering**: Timestamps can be forged; causality cannot be verified without cryptographic linking

### HELM Receipt Chain Model

The HELM kernel formalizes a receipt as a tuple:[^1]

\[
R_i = (id_i,\ ts_i,\ action_i,\ verdict_i,\ hash_i,\ prevHash_i)
\]

where:
- \( id_i \): UUID v7 (time-ordered)
- \( ts_i \): Hybrid Logical Clock timestamp (causally ordered across distributed nodes)
- \( action_i \): serialized tool call / proposal
- \( verdict_i \in \{\text{ALLOW, DENY, DENY\_EXHAUSTION, DENY\_POLICY}\} \)
- \( hash_i = \text{SHA256}(id_i \| ts_i \| action_i \| verdict_i \| prevHash_i) \)
- \( prevHash_i = hash_{i-1} \)

Key design choice: **denied actions are also recorded**. An auditor can verify not only what the agent did, but what it attempted and was blocked from doing. Performance overhead is approximately 18 microseconds per receipt and 512 bytes of storage — negligible against LLM inference latency.[^1]

### Cross-Agent Receipt Graph

When Agent A delegates to Agent B, Agent A's delegation receipt contains the hash of its current chain head. Agent B's receipts reference Agent A's delegation hash as a foreign key. The result is a **receipt graph** rather than a simple chain — each agent maintains an independently verifiable chain, but causality across agents is preserved through cryptographic foreign keys.[^1]

### DelegateOS and Scoped Authority Tokens

DelegateOS (TypeScript, MIT licensed) implements Ed25519-signed Delegation Capability Tokens (DCTs) with explicit fields for capabilities, budget limits, expiry, chain depth, and parent delegation ID. Sub-agents can further delegate, but only within a monotonically attenuating scope — the sub-agent can never grant more authority than it received. An MCP middleware plugin enforces scope at tool invocation time. This approach answers the "what authority" question cryptographically rather than through prompts.[^36][^37]

### AP2: Mandate-Chained Receipts for Commerce

The Agent Payments Protocol (AP2), developed by Google with Amex, Mastercard, PayPal, and 60+ organizations, provides a domain-specific receipt pattern for agentic commerce:[^38][^39][^40]

- **Intent Mandate**: signed authorization boundary (what the agent can do, price limits, timing)
- **Cart Mandate**: non-repudiable record of what the user approved for a specific transaction
- **Payment Mandate**: agent-presence signal appended to payment authorization packets

The three mandates form a cryptographic chain: Intent → Cart → Payment. This creates an audit trail answering authorization (Intent), authenticity (Cart), and accountability (Payment). AP2 demonstrates how domain-specific receipt semantics can be formalized beyond generic execution logging.[^41][^38]

### PROV-AGENT: Provenance as Receipt

The PROV-AGENT model extends W3C PROV-DM (Entity, Activity, Agent) with AI-specific concepts:[^42][^43]
- `AIAgent` as a subclass of PROV Agent
- Tools as Activities linked to agents
- Prompts and responses as Entities (data)
- `SchedulingData` (where it ran: compute node, GPU ID) and `TelemetryData` (CPU/GPU usage) as enrichment

This model enables critical provenance queries: tracing an erroneous output back to its upstream prompts, inputs, and prior decisions across a multi-agent, multi-facility workflow.[^44][^42]

***

## 8. Comparative Receipt Coverage

The following table maps each system's native output against the six mandatory receipt questions.

| Question | OpenAI Agents SDK | Google A2A | BeeAI ACP | Symphony | Claude Code Hooks |
|---|---|---|---|---|---|
| **Who ran** | `last_agent` name in RunResult; `agent_span` name in trace | `Task.id` + contextId; server-assigned | `run.agent_name` + `session_id` | Ledger DID address of executor | `session_id` in hook payload (shared across subagents — **gap**) |
| **What authority** | `RunContextWrapper.context` (app-managed); no native delegation claim | AgentCard auth schemes (out-of-band); no per-task delegation token | Per-hop auth log (spec requires it); no native signed token | Capability match score + ledger entry | `PermissionRequest` event; no signed scope |
| **What input** | `result.input` (auditing-ready); `new_items` with `ToolCallItem.raw_item` | Task `message` payload; `history[]` for multi-turn | `run.input[]` (MessageParts) | Task `description` + `requirements` | `PreToolUse` hook payload (tool name + input); `UserPromptSubmit` |
| **What output** | `final_output`; `new_items` ToolCallOutputItems; `raw_responses` | `artifacts[]` with typed Parts; `metadata` per artifact | `run.output[]` (MessageParts) | `TaskResult` from `submit_task()` | `PostToolUse` hook payload; `SubagentStop` |
| **Pass/Fail** | Status implicit in `final_output` non-null / exception raised; `tripwire_triggered` in guardrail results | Explicit `TaskStatus` enum: COMPLETED / FAILED / CANCELLED / REJECTED | `run.status` enum: completed / failed; `run.error` field | CoT voting confidence score; no binary flag | `PostToolUseFailure` event; `Stop` vs abnormal termination |
| **Where it landed** | `trace_id` + `span_id`; `last_response_id` for API chain | `taskId` + `contextId`; artifact `artifactId` | `run_id` + `session_id` | Task ID from `submit_task()` | `transcript_path` (JSONL); external store via hook script |

**Critical gaps** (confirmed, not inferred):
- OpenAI Agents SDK: no native signed authority claim; last-agent trace may be incomplete in sequential multi-agent runs[^10]
- Google A2A: failed task errors propagate as content artifacts rather than structured error events in current ADK implementation; distributed tracing not yet purpose-built[^20][^13]
- Claude Code: all hook events share `session_id` regardless of which agent (main or subagent) fired them, making per-agent attribution impossible from hooks alone[^34]

***

## 9. The Canonical Receipt: Minimum Required Fields

Synthesizing across all systems, a receipt sufficient to answer the six governance questions without implicit human arbitration requires at minimum:

### Identity & Delegation (Who + Authority)
```
receipt_id:        UUID v7 (time-ordered)
agent_id:          stable identifier (name, DID, or registry key)
model_id:          model name + version
session_id:        orchestration session
parent_receipt_id: receipt_id of delegating agent's dispatch (null for root)
authority_token:   signed delegation scope (capabilities, budget, expiry)
policy_verdict:    ALLOW | DENY | CLAMP (from policy engine)
```

### Task & Input (What Input)
```
task_id:           unique task identifier
context_id:        conversation/context thread grouping
input_hash:        SHA256 of serialized input (enables tamper detection)
input_summary:     human-readable description of what was requested
tool_name:         if a specific tool invocation
tool_arguments:    typed input parameters
```

### Output & Status (What Output + Pass/Fail)
```
status:            COMPLETED | FAILED | CANCELLED | REJECTED | INTERRUPTED
output_ref:        reference to artifact/output location (not the content itself)
output_hash:       SHA256 of serialized output
error_code:        structured error type (if FAILED)
error_message:     human-readable failure description
guardrail_results: array of {guardrail_name, tripwire_triggered, output_info}
```

### Provenance & Causal Ordering (Where It Landed)
```
started_at:        HLC timestamp (causally ordered)
ended_at:          HLC timestamp
trace_id:          distributed trace identifier
span_id:           span within trace
prev_hash:         SHA256 of predecessor receipt (for chain integrity)
storage_ref:       where the full execution record is durably stored
```

This schema ensures that denied actions produce receipts (not just successful ones), that the authority chain is embedded rather than implicit, and that the receipt is offline-verifiable through hash-linking.[^2][^1]

***

## 10. Failure Reporting Patterns

Production multi-agent systems exhibit failure modes that receipt patterns must specifically address:[^45][^46]

| Failure Mode | How It Manifests | Receipt Requirement |
|---|---|---|
| **Loud failure** | Exception raised, HTTP error returned | Status field + error_code + error_message |
| **Silent hallucination** | Agent returns 200 with well-formatted but factually wrong output | Output hash + grounding check result as guardrail field |
| **Semantic loop** | Agent calls same tool repeatedly with no progress | Iteration count + tool_use_id sequence in receipt chain |
| **Cascading failure** | Degraded output propagates across agents; no single agent shows clear failure | Per-handoff quality evaluation embedded in each receipt |
| **Model regression** | Provider updates model; behavior changes without announcement | `model_id` with version pinned in each receipt |
| **Context abandonment** | Agent forgets original goal mid-task | Goal hash from task intake receipt, compared at completion |

The A2A bug where failed task errors propagate as content artifacts exemplifies how cascading failures hide behind a "success" status. A properly structured receipt would require that any `status: failed` state produce an `error_message` event — not a content artifact — preventing it from entering the next agent's LLM context.[^20]

***

## 11. Post-Hoc Audit Mechanisms

### OpenAI: Traces Dashboard + Third-Party Exporters
The SDK's built-in `BatchTraceProcessor` exports spans to OpenAI's Traces dashboard. Third-party processors (Langfuse, LangSmith, Arize-Phoenix, MLflow, Braintrust, and a dozen others) can be added or substituted. For Zero Data Retention deployments, the built-in exporter is disabled and audit must be routed to a self-hosted processor.[^6]

### Google A2A: Task ID Correlation
Cross-agent audit requires correlating logs by `taskId` across independently instrumented agents. There is no built-in cross-agent trace ID propagation in the base protocol; each agent's A2A server maintains its own logs. Purpose-built A2A observability tooling does not yet exist at the maturity level of microservice distributed tracing.[^13]

### Claude Code: Transcript + Hooks
The `transcript_path` environment variable in hook payloads points to the JSONL session transcript. The `Stop` event is the recommended point to capture and process the full transcript. Multi-agent observability implementations have built Bun-server + SQLite + WebSocket architectures consuming hook events, but these are community patterns rather than platform-provided tooling.[^47][^48]

### Cryptographic: EvidencePacks
The HELM Receipt Chain model exports an `EvidencePack` — a self-contained bundle of the receipt chain with its published root hash. Offline verification runs in O(n) time with O(1) space (streaming scan), completing in approximately 20 milliseconds for 10,000 receipts on commodity hardware. This is the only pattern studied that enables verification without trusting the logging platform.[^1]

***

## 12. Design Implications for Constitutional Multi-Agent Systems

For a system like the eleven-avatar orchestration architecture described, where agents operate across a shared GitHub repository under a constitutional grammar layer, the following design choices emerge from the evidence:

**Receipt generation must be a first-class concern, not a side effect.** No current SDK emits a governance-grade receipt automatically. The `SubagentStop` hook (Claude Code) and the `Run` object (ACP) provide the closest foundations, but both require external augmentation to capture authority claims and produce hash-linked chains.

**Session ID alone is insufficient for agent attribution.** The confirmed gap in Claude Code's hook system — all agents sharing a `session_id` — means the constitutional layer must assign and propagate agent-scoped identifiers through task dispatch, not rely on platform-generated session IDs for disambiguation.[^34]

**Authority must be embedded in the receipt, not derived from it.** Delegation tokens (DCTs in DelegateOS, mandates in AP2) embed scope, budget, and expiry in a signed claim carried with the task. Post-hoc derivation of authority from conversation history is fragile — the constitutional grammar layer should generate a signed authority token at task dispatch and require the receiving agent to echo it in its receipt.[^36][^38]

**Denied actions must produce receipts.** Systems that only log successful completions create an incomplete audit trail. The HELM model's requirement that policy denials generate receipts identical in structure to approvals is the correct pattern for a constitutional system where what agents *attempted but were blocked from doing* is as important as what they accomplished.[^1]

**The receipt graph, not the receipt chain, is the right topology.** Linear per-agent chains connected by cross-agent foreign keys (as in the HELM cross-agent model) preserve both per-agent independent verifiability and cross-system causal ordering. This maps naturally to a multi-agent system where each avatar maintains its own receipt chain and the orchestrator's dispatch receipts link to each subagent's chain head.[^1]

**Failure must be structurally distinguished from success, not just textually.** The A2A bug where failed tasks emit content artifacts instead of error events demonstrates the cost of unstructured failure propagation. A constitutional grammar layer should enforce that receipts include a typed `status` enum, and that downstream agents can check `receipt.status === "FAILED"` without parsing free-text content.[^20]

---

## References

1. [Receipt Chain Graph Integrity: Tamper-Evident Execution Auditing ...](https://mindburn.org/en/research/notes/receipt-chain-integrity/) - The control layer between AI agents and the real world. Every action checked, every decision gets a ...

2. [Cryptographic proof of authorization for agent workflows · Issue ...](https://github.com/microsoft/agent-framework/issues/4203) - For the multi-agent delegation scenario: when Agent A delegates to Agent B, Agent B's OATR attestati...

3. [Results - OpenAI Agents SDK](https://openai.github.io/openai-agents-python/results/) - Rich RunItem wrappers with agent, tool, handoff, and approval metadata. Logs, UIs, audits, and debug...

4. [OpenAI Agents SDK Documentation - jumpad.ai](https://jumpad.ai/temp/openai-agents-sdk-documentation.pdf)

5. [OpenAI Agents SDK 中文文档 中文教程 （8）](https://blog.csdn.net/wtsolutions/article/details/146363948) - 文章浏览阅读685次，点赞7次，收藏22次。它们可用于执行以下作： - 检查输入的消息是否偏离主题 - 如果检测到意外输入，则接管代理执行的控制权。一个函数，它接收最终代理、其输出和上下文，并返回一个...

6. [Tracing - OpenAI Agents SDK](https://openai.github.io/openai-agents-python/tracing/)

7. [openai-agents-python/docs/tracing.md at main - GitHub](https://github.com/openai/openai-agents-python/blob/main/docs/tracing.md) - The Agents SDK includes built-in tracing, collecting a comprehensive record of events during an agen...

8. [Guardrails - OpenAI Agents SDK](https://openai.github.io/openai-agents-python/ref/guardrail/) - A function that receives the final agent, its output, and the context, and returns a GuardrailResult...

9. [Guardrails - OpenAI Agents SDK](https://openai.github.io/openai-agents-python/guardrails/) - First, the guardrail receives the output produced by the agent. Next, the guardrail function runs to...

10. [The last Agent's trace using Agents SDK Remains Incomplete](https://community.openai.com/t/the-last-agents-trace-using-agents-sdk-remains-incomplete/1221412) - We shifted our project to Agents SDK but the tracing is not working correctly. The trace of the last...

11. [projects.locations.collections.engines.assistants.agents.a2a.v1.tasks](https://docs.cloud.google.com/generative-ai-app-builder/docs/reference/rest/v1/projects.locations.collections.engines.assistants.agents.a2a.v1.tasks)

12. [projects.locations.collections.engines.assistants.agents.a2a.v1.tasks](https://docs.cloud.google.com/gemini/enterprise/docs/reference/rest/v1/projects.locations.collections.engines.assistants.agents.a2a.v1.tasks) - Fields. data. object ( Struct format). Artifact. Artifacts are the container for task completed resu...

13. [Google A2A Protocol: Agent-to-Agent Communication Guide](https://www.digitalapplied.com/blog/google-a2a-protocol-agent-to-agent-communication-guide) - ... task state machine (submitted, working, input-required, completed, failed, cancelled) with Serve...

14. [projects.locations.collections.engines.assistants.agents.tasks](https://docs.cloud.google.com/generative-ai-app-builder/docs/reference/rest/v1/projects.locations.collections.engines.assistants.agents.tasks)

15. [Building A Secure Agentic AI Application Leveraging Google's A2A ...](https://arxiv.org/html/2504.16902v1) - Completion: The task transitions to a terminal state (completed, failed ... Error Handling and Loggi...

16. [How Google A2A Protocol Actually Works: From Basic Concepts to ...](https://trickle.so/blog/how-google-a2a-protocol-actually-works) - The protocol uses standardized components like Agent Cards, Tasks, and Artifacts that create a commo...

17. [How the Agent2Agent Protocol (A2A) Actually Works: A Technical ...](https://www.blott.com/blog/post/how-the-agent2agent-protocol-a2a-actually-works-a-technical-breakdown) - A2A protocol formalizes task outputs as "artifacts". Each artifact delivers structured content back ...

18. [Understanding A2A — The protocol for agent collaboration](https://discuss.google.dev/t/understanding-a2a-the-protocol-for-agent-collaboration/189103) - A single Task can produce multiple Artifacts, such as generated documents, structured data summaries...

19. [What Is the Agent Communication Protocol (ACP)? - LoginRadius](https://www.loginradius.com/blog/engineering/what-is-agent-communication-protocol-acp) - Understand Agent Communication Protocol (ACP), its security risks, and how AI agent identity and aut...

20. [Failed A2A task errors leak into conversation history as regular content](https://github.com/google/adk-python/issues/4309) - When a remote agent task fails (either due to a tool exception or an internal error like a sessions ...

21. [acp/docs/spec/openapi.yaml at main · i-am-bee/acp - GitHub](https://github.com/i-am-bee/acp/blob/main/docs/spec/openapi.yaml) - Open protocol for communication between AI agents, applications, and humans. - i-am-bee/acp

22. [i-am-bee/acp: Open protocol for communication between AI agents ...](https://github.com/i-am-bee/acp) - ACP is an open protocol for communication between AI agents, applications, and humans. Modern AI age...

23. [Discover & Run Agent - Agent Communication Protocol](https://agentcommunicationprotocol.dev/how-to/discover-and-run-agent) - This guide shows how to discover available ACP agents and execute them using different modes (synchr...

24. [A Unified Agent Communication Protocol (ACP) for Secure ...](https://arxiv.org/abs/2602.15055) - In the artificial intelligence space, as we transition from isolated large language models to autono...

25. [Symphony: A Decentralized Multi-Agent Framework for Scalable ...](https://arxiv.org/abs/2508.20019) - Symphony introduces three key mechanisms: (1) a decentralized ledger that records capabilities, (2) ...

26. [Symphony — A decentralized multi-agent framework that ... - GitHub](https://github.com/GradientHQ/symphony) - Symphony — A decentralized multi-agent framework that enables intelligent agents to collaborate seam...

27. [[Literature Review] Symphony: A Decentralized Multi-Agent ...](https://www.themoonlight.io/en/review/symphony-a-decentralized-multi-agent-framework-for-scalable-collective-intelligence) - Symphony is a decentralized multi-agent framework designed to overcome the limitations of centralize...

28. [Symphony: A Decentralized Multi-Agent Framework for ...](https://arxiv.org/html/2508.20019v1)

29. [Hooks reference - Claude Code Docs](https://code.claude.com/docs/en/hooks) - Matches on tool name, same values as PreToolUse. ​. PostToolUse input. PostToolUse hooks fire after ...

30. [Claude Code Hooks: PreToolUse, PostToolUse & All 12 Events (2026)](https://www.pixelmojo.io/blogs/claude-code-hooks-production-quality-ci-cd-patterns) - PreToolUse hooks block actions that require review, PostToolUse hooks run quality checks, and Stop h...

31. [Claude Code Hooks: Automate Your AI Coding Workflow](https://www.ksred.com/claude-code-hooks-a-complete-guide-to-automating-your-ai-coding-workflow/) - Start with auto-formatting on PostToolUse, dangerous command blocking on PreToolUse, and desktop not...

32. [Subagent task output & the context window : r/ClaudeAI - Reddit](https://www.reddit.com/r/ClaudeAI/comments/1m6ez5b/subagent_task_output_the_context_window/) - The sub-agent only returns relevant information to the delegating-agent . If a task can be done in i...

33. [Create custom subagents - Claude Code Docs](https://code.claude.com/docs/en/sub-agents) - Claude uses each subagent's description to decide when to delegate tasks. When you create a subagent...

34. [[FEATURE] Expose Agent Context in Hook Event Payloads for Multi ...](https://github.com/anthropics/claude-code/issues/16424) - Flat Architecture: Claude Code's subagents operate in parallel within the same process, not in a tru...

35. [Mastering Claude Hooks: Building Observable AI Systems (Part 2)](https://dev.to/bredmond1019/mastering-claude-hooks-building-observable-ai-systems-part-2-2ic4) - Transform Claude Code from a reactive tool into a proactive development partner using hooks for safe...

36. [Built a cryptographic delegation layer for multi-agent setups - Reddit](https://www.reddit.com/r/LocalLLaMA/comments/1r6vb5c/built_a_cryptographic_delegation_layer_for/) - So I built DelegateOS. It's a TypeScript library that creates Ed25519-signed delegation tokens. When...

37. [How to add trust boundaries to your multi-agent system](https://dev.to/jnycode/how-to-add-trust-boundaries-to-your-multi-agent-system-gic) - DelegateOS solves this with cryptographic delegation tokens. Let's build it step by step. Setup. npm...

38. [What is the Agent Payments Protocol (AP2) and How Does It Work?](https://www.descope.com/learn/post/ap2) - Learn how the Agent Payments Protocol (AP2) enables secure AI agent transactions through cryptograph...

39. [Google Agents Payment Protocol (AP2) : Deep Dive with Live ...](https://www.linkedin.com/pulse/google-agents-payment-protocol-ap2-deep-dive-live-examples-mysore-rwdac) - ... Mandate, creating a non-repudiable audit trail for authorization, authenticity, and accountabili...

40. [MultiversX Reveals Google AP2 Integration](https://multiversx.com/blog/multiversx-reveals-google-ap2-integration) - Provides the mandate system and audit trails that make agent transactions trustworthy. AP2 handles a...

41. [What is Google AP2 Protocol : Step by Step Guide with Examples](https://dev.to/vishalmysore/what-is-google-ap2-protocol-step-by-step-guide-with-examples-2lcp) - The payment processor handles creation, authorization, capture, refund, and status queries. Mandate ...

42. [PROV-AGENT: Unified Provenance for Tracking AI Agent ... - arXiv](https://arxiv.org/html/2508.02866v1) - PROV-AGENT is a provenance model for representing AI agent interactions, model invocations, and thei...

43. [Unified Provenance for Tracking AI Agent Interactions in ... - arXiv](https://arxiv.org/abs/2508.02866) - In this paper, we introduce PROV-AGENT, a provenance model that extends W3C PROV and leverages the M...

44. [PROV-AGENT: Unified Provenance for Tracking AI Agent ...](https://impact.ornl.gov/en/publications/prov-agent-unified-provenance-for-tracking-ai-agent-interactions-/)

45. [AI Agent Observability: Your Agents Are Running Blind in Production](https://fordelstudios.com/research/ai-agent-observability-running-blind-production) - This is the engineering guide to observing what your agents actually do in production — before the i...

46. [AI Agent Observability: Monitoring and Debugging Agent Workflows](https://www.truefoundry.com/blog/ai-agent-observability-tools) - Learn how AI agent observability helps teams trace reasoning steps, tool calls, and costs to debug a...

47. [disler/claude-code-hooks-multi-agent-observability - GitHub](https://github.com/disler/claude-code-hooks-multi-agent-observability) - claude/settings.json in your project and modify the source-app parameter to identify your project: {...

48. [Claude Code Hooks for Multi Agent Observability - YouTube](https://www.youtube.com/watch?v=9ijnN985O_c) - Multi-agent systems are SILENTLY EXPLODING, but there's a MASSIVE problem nobody's talking about... ...

