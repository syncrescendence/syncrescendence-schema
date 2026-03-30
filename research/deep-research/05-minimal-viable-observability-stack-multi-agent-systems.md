# Minimal Viable Observability Stack for Multi-Agent AI Systems (March 2026)

## Executive Summary

As of March 2026, the multi-agent AI observability landscape has converged around a coherent but still-evolving stack: OpenTelemetry's GenAI Semantic Conventions as the transport and schema layer, OpenInference as a richer supplemental convention, and a tiered ecosystem of purpose-built tools — Langfuse, Braintrust, Phoenix, and Helicone — occupying distinct positions along the tracing-evaluation-governance spectrum. The minimal viable observability (MVO) stack is not a single tool; it is a **three-layer architecture**: a telemetry emission layer (OTel + semantic conventions), a trace storage and visualization layer (Langfuse, Phoenix, or Braintrust), and a quality evaluation layer (Braintrust scorers, Langfuse evaluators, or Phoenix annotations). For a constitutional multi-agent system entering "operational constitution," a fourth governance layer — immutable audit receipts, identity-bound logs, and policy enforcement records — is non-negotiable and cannot be adequately served by debugging tools alone.

***

## Layer 1: Telemetry Emission — OpenTelemetry for LLM/Agent Workloads

### GenAI Semantic Conventions (OTel-Native)

The OpenTelemetry Generative AI Observability Special Interest Group (GenAI SIG), which began work in April 2024, is the primary standards body for AI agent telemetry. As of early 2026, the conventions cover four primary areas: LLM client spans, agent spans, events (for capturing prompt/completion content), and metrics. Key attributes that all agent spans should emit include:[^1][^2]

- `gen_ai.agent.name` — human-readable agent name set by the application
- `gen_ai.agent.id` — stable identifier for the agent instance
- `gen_ai.agent.description` — what this agent does (optional but high governance value)
- `gen_ai.operation.name` — `invoke_agent` or `create_agent`[^1]

For the LLM call layer, the conventions standardize: model identifier (`gen_ai.request.model`, `gen_ai.response.model`), token counts (`gen_ai.usage.input_tokens`, `gen_ai.usage.output_tokens`), temperature, max tokens, and finish reason. Major vendors including Datadog (since v1.37+), Honeycomb, and New Relic already support these conventions natively.[^3][^4][^1]

An emerging RFC within OpenLLMetry (November 2025) proposes extending the `gen_ai.*` namespace to cover multi-agent-specific concerns including: agent lifecycle and orchestration (creation, execution, handoffs, termination), multi-agent coordination (`gen_ai.team.*` attributes), task management with delegation hierarchies, memory systems (`gen_ai.memory.*`), guardrail quality assurance, and session checkpointing. These are not yet stable but represent the direction the community is moving.[^5]

### OpenInference: The Alternative Convention with More Expressiveness

A competing convention set, OpenInference (originated by Arize AI and now open-sourced), offers richer expressiveness for production agent workloads. Where OTel GenAI conventions are catching up, OpenInference already provides:[^6][^7]

- Explicit typed span kinds: `AGENT`, `LLM`, `TOOL`, `RETRIEVER`, `GUARDRAIL`, `CHAIN`, `EMBEDDING`[^8]
- Explicit message role types: system, user, assistant, tool
- Out-of-the-box auto-instrumentation for LangChain, LlamaIndex, OpenAI Agents SDK, CrewAI, and more[^7][^6]

The two conventions are described as complementary rather than mutually exclusive — both use OTel as the transport, with OpenInference adding richer semantic layer on top. Arthur AI (a production agent platform) explicitly chose OpenInference over OTel GenAI for this reason, noting the difference as "stark when you compare traces side by side".[^6][^7]

**Inference for constitutional systems:** For a system with typed contracts and trust boundaries, OpenInference's `GUARDRAIL` span type is directly usable to record constitutional grammar layer evaluations as first-class observability events, not just log strings.

### Trace Context Propagation Across Agent Boundaries

In any multi-agent architecture where agents spawn as separate processes or communicate asynchronously, the W3C `traceparent` header (and its `tracestate` companion) must be explicitly propagated. This is the mechanism by which a single user-initiated request can be correlated as a single trace tree spanning Claude Code orchestrator → Codex/Gemini/Grok execution agents → Hermes learning runtime.[^9][^10]

The critical implementation detail: for synchronous HTTP/gRPC calls, trace context flows through headers automatically with OTel auto-instrumentation. For asynchronous message queues (e.g., if the GitHub repository serves as coordination substrate), trace context must be **embedded directly in the message payload**, not just headers, because transport headers are lost when messages are queued. A practical pattern is to inject `traceparent` and `tracestate` as fields in every coordination receipt written to the repository.[^11]

For heterogeneous agent environments, a composite propagator supporting W3C Trace Context, W3C Baggage, B3 (Zipkin compatibility), and Jaeger formats can be configured in OTel Collector to handle interoperability between agents built on different runtimes.[^12]

***

## Layer 2: Trace Storage and Visualization

### Langfuse — Trace Model Deep Dive

Langfuse organizes execution into **trace trees** where each node is a typed observation. As of early 2026, Langfuse has migrated to an "observation-centric" model: a single immutable Observations table (written once, never mutated), with context attributes propagated at SDK side rather than joined at query time. This immutability is architecturally significant for governance — observations become tamper-evident records.[^13][^14]

Observation types map directly to common agent patterns:[^15]

| Type | Description |
|------|-------------|
| `span` | Generic unit of work (default) |
| `agent` | AI agent decision spans |
| `tool` | Tool/function call observations |
| `chain` | Sequential step chains |
| `retriever` | RAG/retrieval operations |
| `embedding` | Embedding generation calls |
| `evaluator` | Evaluation/scoring steps |
| `guardrail` | Constitutional/safety checks |

Each observation captures structured data appropriate to its type: prompts and completions for generations, document counts and relevance scores for retrievals, pass/fail results for guardrails. This typed structure enables cross-trace querying — for example, surfacing all generations where `total_tokens > 2000`, or filtering all tool calls that returned errors.[^13]

For multi-agent systems, the key implementation discipline is: (1) explicitly set `input` and `output` on every agent span — these do not default for non-LLM spans; (2) use unique, descriptive names per agent so evaluators can target specific agents rather than ambiguous span clusters; (3) for multi-tenant deployments, use per-tenant Langfuse organizations with separate API credentials to enforce trace isolation as a compliance requirement, not just a convenience.[^16][^13]

**Known limitation (confirmed):** Session-level scoring — attaching evaluation scores to an entire multi-agent conversation session rather than individual traces — was not yet natively supported as of mid-2024, requiring manual `traceId` management as a workaround. Check current Langfuse release notes for whether this has been addressed.[^17]

### Phoenix (Arize) — OpenTelemetry-Native, Agent Graph Visualization

Arize Phoenix is open-source, built natively on OTel + OpenInference, and requires a single `register()` call with `auto_instrument=True` to begin capturing structured traces. It provides an **Agent Graph visualization** — an execution tree rather than a linear trace — showing exactly how agents delegated to sub-agents, which tools fired, and where state changed. This is particularly valuable for debugging orchestrator-worker architectures.[^18][^19]

Phoenix's span taxonomy follows OpenInference directly: `AGENT`, `LLM`, `TOOL`, `RETRIEVER`, `GUARDRAIL`, `CHAIN`. Oracle's Agent Spec integration demonstrates the runtime-agnostic promise: the same `register()` call works whether the agent is executed by LangGraph or WayFlow, and Phoenix sees an identical trace schema in both cases.[^20][^21]

The commercial Arize AX platform adds architectural depth for enterprise-scale deployments: a specialized OLAP database (ADB) built for billions of agent traces, cloud warehouse export in Iceberg format every 60 minutes, and the Alyx AI assistant which connects via Model Context Protocol (MCP) for in-IDE debugging from Cursor or Claude Code without context switching. The MCP Tracing Assistant specifically unifies client-server traces in a single hierarchy when agents call external MCP tools — directly relevant to multi-agent systems where execution agents call external APIs.[^18]

**Architectural note — SDK vs. proxy:** Phoenix instruments code directly via SDK, meaning agents continue functioning during an observability backend outage with no latency overhead from a proxy. This is a meaningful reliability difference for constitutional systems where observability infrastructure must not become a single point of failure.[^18]

### Braintrust — Evaluation-Driven Observability

Braintrust's distinguishing position is the integration of **evaluation directly into the observability workflow** — the same scorers that run in offline CI testing run continuously on production traffic, making quality degradation visible in real time alongside technical metrics.[^22]

Each Braintrust trace captures exhaustive telemetry: duration, LLM duration, time to first token, all LLM calls and tool calls, errors separated by type, prompt tokens, cached tokens, completion tokens, reasoning tokens, and estimated cost. The trace viewer presents these as an expandable span tree, allowing engineers to drill from a failed task-completion score down to the specific step that caused the failure.[^22]

For agent-specific evaluation, Braintrust's documentation frames the key questions to answer at each span:[^23]

- Does the agent's initial plan make sense for the task?
- Did the agent follow its plan or deviate during execution?
- Did the agent choose the correct next step or defer to a human as expected?
- Did the agent invoke the correct tools with correctly built arguments?
- Did the agent properly utilize tool output to advance or complete the task?

The platform includes 25+ built-in scorers for accuracy, relevance, and safety. Alerts are triggered via BTQL (Braintrust Query Language), a SQL-like interface for defining conditions — e.g., trigger when relevancy scores drop below a threshold or token consumption exceeds historical averages — with delivery via webhooks or Slack. Used in production by Notion, Stripe, and Zapier.[^24][^22]

**OTel bridge:** Braintrust natively converts OTel spans into Braintrust traces with full LLM-specific context, meaning an OTel-instrumented agent stack can route telemetry to Braintrust without additional SDK integration.[^22]

### Helicone — Proxy-Based, Zero-Friction Baseline

Helicone operates as a **proxy gateway**: change one base URL in your LLM API calls, and every request is automatically logged with metrics for cost, latency, token usage, and model performance. No SDK installation, no code refactoring — integration takes a single line. It supports 100+ LLM providers and is SOC 2 and GDPR compliant.[^25]

Helicone's strength is breadth of coverage at minimal instrumentation cost. Its smart routing layer adds fallbacks, retries, and caching on top of logging. For multi-step agent pipelines, it provides session tracing to visualize the full workflow and identify where failures occur.[^26][^25]

**Architectural trade-off:** Helicone's proxy architecture introduces an additional failure point in the critical path between agent and LLM provider. For an eleven-agent constitutional system where observability infrastructure must itself be trustworthy, proxy failure could corrupt agent operation or interrupt execution trace continuity. Phoenix/Langfuse's SDK approach avoids this by keeping telemetry emission asynchronous and non-blocking.

***

## Layer 3: Quality Evaluation

Quality evaluation is the layer that separates AI observability from traditional APM. Traditional monitoring answers "is the system up and responding?" Quality evaluation answers "is the system producing correct, safe, policy-compliant outputs?" — a question that cannot be answered by latency or error rate alone.[^27][^24]

The standard patterns as of March 2026:

- **LLM-as-a-Judge**: Automated scoring where a separate LLM evaluates outputs for correctness, relevance, faithfulness, hallucination, and policy adherence — running at scale without human intervention[^28]
- **Regression datasets**: Curated collections of input-expected-output pairs used to detect drift when model versions or prompts change[^28]
- **Human annotation queues**: Domain experts review production traces flagged by automated signals; the goal is to maximize signal-to-noise, routing experts to traces where judgment matters rather than routine outputs[^29]
- **Plan adherence and tool selection metrics**: Specific to agents — does the agent follow its own stated plan, and does it invoke the right tool with correct arguments?[^23][^22]

For a constitutional governance layer, policy adherence rate — how often responses comply with organizational rules — and prompt injection resilience — whether hostile inputs can hijack agent behavior through documents the agent processes — are first-class evaluation metrics, not secondary concerns.[^22]

***

## Layer 4: Governance and Audit

This layer is categorically different from debugging observability. Governance logs exist to prove accountability to external parties — auditors, regulators, users — not to help engineers debug. The requirements are therefore different: immutability, completeness, linkage to identity, and legal sufficiency.

### What Must Be Logged for Governance vs. Debugging

| Dimension | Debugging Logs | Governance/Audit Logs |
|---|---|---|
| **Completeness** | Sample acceptable; 100% of errors | 100% of consequential decisions; no sampling |
| **Mutability** | Mutable (append/update acceptable) | Immutable; write-once; cryptographically verified |
| **Content** | Execution details, intermediate states, token counts | Decision context, policy evaluation records, data flow lineage |
| **Identity** | Agent name/type sufficient | Agent ID + authorization scope + delegation status required |
| **Retention** | Days to weeks | Months to years (per regulatory framework) |
| **Structure** | Flexible, developer-readable | Formal schema; control-ID tags for SOC2/PCI/HIPAA mapping |
| **Human checkpoints** | Noted incidentally | Explicitly recorded as hard gates vs. soft notifications |
| **Rejected alternatives** | Not required | Required — capture what the agent *considered but rejected* |

A compliance-grade agent audit trail must capture five elements:[^30]
1. **Full decision context** — what information the agent had at the moment it took an action
2. **Every tool call** with parameters and response (not just success/failure)
3. **Policy evaluation records** — which governance rules were evaluated, what the outcome was
4. **Data flow lineage** — where user data went (retrieved, processed, passed to tools, included in responses)
5. **Human intervention points** — where humans reviewed or approved actions, and whether those were hard gates or soft notifications

Regulatory frameworks impose specific log field requirements:[^31]
- **SOC 2**: User actions with timestamps mapped to control CC6.1 (logical access controls)
- **PCI DSS**: All access attempts with user IDs and timestamps under requirement 10.2
- **HIPAA §164.312**: Detailed logs of all modifications to protected health information
- **EU AI Act**: Non-compliance penalties reach €35 million or 7% of global revenue[^32]

For constitutional multi-agent systems specifically, agent governance platforms increasingly implement **hash-chained audit trails** where every record is cryptographically linked to the previous one, plus **governance seals** that prove authorization at the moment of decision. This enables what governance practitioners call "counterfactual replay" — running historical agent actions against alternative configurations to verify that the system would have behaved differently under a different policy.[^33]

### Identity-Bound Logging

Every log entry for governance purposes should carry: AI agent identifier, tenant or environment context, authorization scope, and delegation status when acting on behalf of a user. This makes actions attributable and auditable — investigators can trace any action back to the responsible agent and verify whether it occurred within permitted authorization scope. For the described architecture, this means the orchestrator (Claude Code), each execution agent (Codex, Gemini CLI, Grok CLI), and the Hermes learning runtime should each have stable, unique identifiers that appear in every span they emit.[^34]

### PII Redaction

Governance logs must include PII redaction on ingestion while preserving sufficient context for analysis. The pattern is to mask personally identifiable data in the logged payload before writing to storage, but retain enough structural context (token counts, retrieved document metadata, decision outcomes) to support audit queries without re-exposing raw PII.[^35]

***

## The Logging Budget: Too Much vs. Enough

The distinction between over-logging and sufficient logging is not about quantity — it is about **relevance tier and retrieval cost**.

### Over-Logging: The Failure Modes

Over-logging manifests in two forms. The first is **volumetric noise**: logging health checks, polling loops, and routine success paths at the same level of fidelity as failures and decisions. When everything is logged at the same priority, the signal-to-noise ratio collapses and engineers stop trusting alerts — at which point over-logging is functionally identical to under-logging. The second form is **cost explosion**: LLM traces with full prompt/completion content at 100% sampling can generate storage volumes that make the observability system more expensive than the agents it monitors. Unmanaged token logging has destroyed observability budgets in documented production cases.[^36][^37][^38]

### Under-Logging: The Failure Modes

Under-logging — "flying blind" — occurs when key decision points lack instrumentation. The canonical failure is: an agent makes a wrong tool call, but no tool call span was recorded, so post-hoc debugging requires re-running the agent with the same inputs (which may be irreproducible due to non-determinism) rather than inspecting the original trace. For multi-agent systems, under-logging is compounded because a missing span in a child agent can sever the causal chain for the entire orchestration session.[^37][^38]

### The Sampling Strategy

The operationally validated approach as of March 2026:[^39][^38][^29]

- **Log 100% of failures** — every error, every exception, every guardrail violation, every tool call that returns an unexpected response
- **Log 100% of consequential decisions** for governance purposes — this is a non-negotiable category that cannot be sampled
- **Sample successful routine requests** — a statistically meaningful percentage (10–25% depending on volume) is sufficient for performance debugging and drift detection
- **Drop high-frequency noise at the collector** — use OTel Collector processors with regex filters to drop health-check spans, polling loops, and other high-frequency low-value events before they reach storage[^39]
- **Use dynamic log levels** — debug-level logging should be activatable on demand for active incident investigation without being permanently enabled in production[^39]

### Structured Logging as a Prerequisite

Sampling strategies only work if logs are structured. Plain-string log messages require grep to navigate and cannot be aggregated by agent, tool, user, or session. Every log entry should use key/value pairs at minimum, and ideally emit as OTel spans so they participate in the trace tree rather than existing as disconnected log lines. The test: if retrieving all tool calls made by a specific agent in a 30-minute window requires more than one query to the observability backend, the logging structure is insufficient.[^39]

***

## Tool Comparison: Feature Matrix

| Capability | Langfuse | Phoenix (Arize) | Braintrust | Helicone |
|---|---|---|---|---|
| **Deployment** | Open-source / Cloud | Open-source / Cloud (Arize AX) | Cloud | Cloud (open-source gateway) |
| **Integration architecture** | SDK + OTel | SDK (OTel + OpenInference) | SDK + OTel bridge + AI Proxy | Proxy (URL change) |
| **Agent Graph visualization** | Trace tree | Execution tree w/ sub-agent delegation[^18] | Expandable span tree[^22] | Session trace[^25] |
| **Evaluation/scoring** | LLM-as-Judge, custom[^28] | Annotations + Phoenix evaluators | 25+ built-in scorers + LLM judge[^22] | Basic output scoring |
| **Multi-agent coordination** | Typed observations; sessions | MCP Tracing for client-server[^18] | Framework integrations (CrewAI, LangGraph)[^22] | Session segmentation[^40] |
| **Governance/compliance** | Immutable obs. table[^14] | Iceberg export, OLAP[^18] | BTQL alerts, cost analytics[^22] | SOC2/GDPR compliant[^25] |
| **Semantic conventions** | OTel native[^41] | OpenInference + OTel[^7] | OTel bridge[^22] | Provider-native |
| **Cost tracking** | Token + cost per trace | Cost per trace[^18] | Estimated cost per trace[^22] | Cost per call[^25] |
| **Reliability during outage** | SDK (async, non-blocking) | SDK (agent continues)[^18] | SDK | Proxy failure = gap |
| **Best fit** | Open-source teams, complex multi-agent graph debugging | ML teams, OTel-first stacks, MCP agents | Evaluation-driven teams, CI integration | Rapid baseline visibility, cost management |

***

## Minimal Viable Stack: The Recommended Architecture

For a constitutional multi-agent system with eleven agents governed by a typed contract layer and a shared GitHub repository as coordination substrate, the minimal viable observability stack is:

**Emission layer (required):** OTel SDK with OpenInference semantic conventions in every agent process; W3C `traceparent` propagated as a field in every coordination receipt written to the repository; OTel Collector with sampling rules (100% errors, 10-25% successes, drop polling/health spans).[^1][^6][^39]

**Trace layer (required):** Phoenix (self-hosted) or Langfuse (self-hosted) as the primary trace backend. Phoenix is preferred for OTel-native teams with MCP tool calls in the stack; Langfuse is preferred if evaluation and prompt version management are higher priority than agent graph visualization.[^28][^18]

**Evaluation layer (required for production):** Braintrust (or Langfuse evaluators) running plan adherence, tool selection accuracy, policy adherence rate, and prompt injection resilience scorers on 100% of traces and continuously on production samples.[^23][^22]

**Governance layer (required for operational constitution):** Separate, append-only audit log store — distinct from the debugging trace backend — capturing the five compliance elements with agent identity binding, PII redaction, and hash-chained records mapped to constitutional rule IDs. This layer should integrate with SIEM tooling (Splunk, Sentinel, or equivalent) for enterprise-wide visibility.[^42][^30][^34][^33]

**What can be deferred:** Helicone's proxy can be added as a cost optimization and multi-provider routing layer without replacing the SDK-based tracing stack — the two are complementary, not competing. Arize AX commercial features (Alyx, ADB, Iceberg export) become relevant when trace volume exceeds what Phoenix OSS can efficiently query.

***

## Confirmed Facts vs. Inferences

**Confirmed (sourced):**
- OTel GenAI SIG active since April 2024; four convention areas stable as of early 2026[^2][^1]
- OpenInference offers explicit `GUARDRAIL` span type; OTel GenAI does not yet[^8][^6]
- Langfuse's observation-centric model uses an immutable single Observations table[^14]
- Braintrust's same scorers run in both CI and production without modification
- Helicone is SOC 2 and GDPR compliant; proxy architecture[^25]
- Arize AX connects to Claude Code/Cursor via MCP[^18]
- EU AI Act penalties: up to €35M or 7% global revenue[^32]
- W3C `traceparent` must be embedded in message payloads for async queues[^11]
- Hash-chained audit trails are an emerging governance pattern as of late 2025[^33]

**Inferences (not directly confirmed):**
- That Langfuse's session-level scoring gap (noted mid-2024) has been resolved in 2025/2026 releases — unverified; check current docs
- That Phoenix OSS is sufficient for eleven-agent trace volumes without Arize AX commercial features — depends on trace frequency and retention requirements not specified
- That OTel's GenAI RFC additions (memory systems, team coordination attributes) are production-stable — they are proposed/experimental as of the November 2025 RFC[^5]
- That Braintrust's BTQL alerting covers agent-to-agent delegation events natively — only per-trace and per-scorer alerting is documented; cross-agent session alerting not confirmed

**Preserved contradiction:** Arthur AI advocates explicitly for OpenInference over OTel GenAI conventions, while the OTel community blog and multiple framework maintainers advocate for OTel GenAI as the convergence standard. Both are valid positions as of March 2026 because the two conventions are in different states of maturity and serve somewhat different use cases — OpenInference for expressive production tracing, OTel GenAI for vendor-neutral interoperability. The resolution is not to pick one but to emit OpenInference-enriched spans via OTel transport.[^2][^6]

---

## References

1. [OpenTelemetry for AI Agents: Observability, Tracing, and the GenAI ...](https://zylos.ai/research/2026-02-28-opentelemetry-ai-agent-observability) - How to instrument AI agent systems with OpenTelemetry's emerging GenAI semantic conventions to gain ...

2. [Future Of Ai Agent...](https://opentelemetry.io/blog/2025/ai-agent-observability/) - 2025: Year of AI agents AI Agents are becoming the next big leap in artificial intelligence in 2025....

3. [Datadog LLM Observability natively supports OpenTelemetry GenAI ...](https://www.datadoghq.com/blog/llm-otel-semantic-convention/) - LLM Observability now supports OpenTelemetry GenAI Semantic Conventions (v1.37+), enabling you to an...

4. [How to Monitor LLM Applications with OpenTelemetry GenAI ...](https://oneuptime.com/blog/post/2026-02-06-monitor-llm-opentelemetry-genai-semantic-conventions/view) - Learn how to monitor LLM applications using OpenTelemetry's GenAI semantic conventions, including tr...

5. [[RFC] Semantic Conventions for AI Agent Observability #3460 - GitHub](https://github.com/traceloop/openllmetry/issues/3460) - This document defines semantic conventions for observability of AI agent systems built with framewor...

6. [Best Practices for Building Agents | Part 1: Observability and Tracing](https://www.arthur.ai/blog/best-practices-for-building-agents-part-1-observability-and-tracing) - Discover how observability and tracing help teams improve, validate, and ship trustworthy AI agents ...

7. [openinference | OpenTelemetry Instrumentation for AI Observability](https://arize-ai.github.io/openinference/) - OpenTelemetry Instrumentation for AI Observability

8. [Semantic Conventions | openinference - GitHub Pages](https://arize-ai.github.io/openinference/spec/semantic_conventions.html) - The Semantic Conventions define the keys and values which describe commonly observed concepts, proto...

9. [Distributed Tracing](https://maecapozzi.com/blog/building-a-multi-agent-orchestrator) - Learn how I built a Claude Code multi-agent orchestrator that coordinates specialized AI coding agen...

10. [Exploring the Essentials: What is Context Propagation in Distributed ...](https://edgedelta.com/company/blog/what-is-context-propagation-in-distributed-tracing) - The traceparent header Identifies the request in a tracing system and describes the incoming request...

11. [W3C Trace Context Explained: Traceparent & Tracestate - Dash0](https://www.dash0.com/knowledge/w3c-trace-context-traceparent-tracestate) - Learn how W3C Trace Context works including traceparent and tracestateand how to implement reliable ...

12. [How to Implement Distributed Tracing Context Propagation](https://oneuptime.com/blog/post/2026-02-02-distributed-tracing-context-propagation/view) - A comprehensive guide to implementing distributed tracing context propagation across microservices.

13. [Cross-Service Trace...](https://cresta.com/blog/observability-for-ai-agents-tracing-multi-service-llm-pipelines-with-langfuse) - A look at how Cresta traces and debugs complex AI agent pipelines in production—from retrieval to ge...

14. [Concepts - Langfuselangfuse.com › docs › observability › data-model](https://langfuse.com/docs/observability/data-model) - Langfuse (open source) helps you trace and analyze LLM applications. Learn how traces and observatio...

15. [Langfuse.Span - Hex](https://hexdocs.pm/langfuse/Langfuse.Span.html)

16. [How to CORRECTLY setup Multi-agent workflow tracing using Langfuse with ADK ? · langfuse · Discussion #7569](https://github.com/orgs/langfuse/discussions/7569) - Context New user of both ADK and Langfuse. I've already set up a multi agent workflow: SequentialAge...

17. [Session-level scores · langfuse · Discussion #2728](https://github.com/orgs/langfuse/discussions/2728) - Describe the feature or potential improvement At the moment, scores are related to traces and/or obs...

18. [Best AI Observability Tools for Autonomous Agents in 2026 - Arize AI](https://arize.com/blog/best-ai-observability-tools-for-autonomous-agents-in-2026/) - Compare the best platforms for monitoring autonomous agents in 2026. Learn how to choose between pro...

19. [Add Observability to Your Open Agent Spec Agents with Arize Phoenix](https://arize.com/blog/add-observability-to-your-open-agent-spec-agents-with-arize-phoenix/) - Open Agent Specification lets you define an agent once and run it on any compatible runtime: LangGra...

20. [Spans - Arize AX Docs](https://arize.com/docs/ax/observe/tracing/spans) - Spans track specific operations such as a retriever, tool call, or LLM step. ... Root span which con...

21. [announcing integration with Arize Phoenix and OpenInference](https://blogs.oracle.com/ai-and-datascience/agent-spec-phoenix-integration) - ... Phoenix provides: End-to-end traces with clear parent–child span relationships; Unified visibili...

22. [AI agent evaluation: A practical framework for testing multi-step agents](https://www.braintrust.dev/articles/ai-agent-evaluation-framework) - Learn how to evaluate AI agents with metrics, harnesses, and regression gates. A practical framework...

23. [Structuring agent evaluations](https://www.braintrust.dev/docs/best-practices/agents)

24. [Top 5 AI Agent Observability Platforms 2026 Guide | Articles | o-mega](https://o-mega.ai/articles/top-5-ai-agent-observability-platforms-the-ultimate-2026-guide) - Discover the best AI agent observability platforms for 2026. Track agent decisions, debug workflows,...

25. [Helicone: Open source LLM observability for developers](https://agentsindex.ai/helicone) - Helicone is an open source observability platform that monitors LLM API calls with one line of code,...

26. [💡 Bottom Line](https://www.helicone.ai/blog/the-complete-guide-to-LLM-observability-platforms) - Compare the top LLM observability platforms including Helicone, LangSmith, Langfuse, and more. Find ...

27. [Why logs alone aren't enough to monitor AI agents - Braintrust](https://www.braintrust.dev/articles/logging-vs-ai-observability) - Learn why traditional logging tools like Datadog and Grafana fall short for AI agent monitoring, and...

28. [Production-Grade Observability for AI Agents: A Minimal-Code, Configuration-First Approach](https://towardsdatascience.com/production-grade-observability-for-ai-agents-a-minimal-code-configuration-first-approach/) - LLM-as-a-Judge, regression testing, and end-to-end traceability of multi-agent LLM systems

29. [AI Observability: Capturing Failures That Traditional Metrics Miss](https://www.langchain.com/articles/ai-observability) - The goal is to maximize the signal-to-noise ratio: get domain experts looking at the traces where th...

30. [Your AI Agents and the Audit Trail: What Compliance Actually Needs](https://dev.to/waxell/your-ai-agents-and-the-audit-trail-what-compliance-actually-needs-33i5) - Your auditor is going to ask you to show them what your agent did. Can you? Not in a vague "we have....

31. [Audit Trails in CI/CD: Best Practices for AI Agents - Prefactor](https://prefactor.tech/blog/audit-trails-in-ci-cd-best-practices-for-ai-agents) - Audit trails in CI/CD pipelines are essential when deploying AI agents, especially in regulated indu...

32. [AI agent governance: a practical guide to risk, trust, and compliance](https://www.kore.ai/blog/ai-agent-governance-a-practical-guide) - Immutable audit trails: Comprehensive, cryptographically verified logging of all agent activity, aut...

33. [The Six Phases of AI Governance for Agents - LinkedIn](https://www.linkedin.com/pulse/six-phases-ai-governance-agents-chris-hood-istzc) - A complete governance lifecycle as a single integrated runtime. One identity model. One trust system...

34. [Ensuring Log Integrity and Non-Repudiation for AI Agents](https://www.loginradius.com/blog/engineering/ensure-log-integrity-non-repudiation-ai-agents) - This guide explains how to ensure log integrity and non-repudiation for AI agents through cryptograp...

35. [Global Regulatory Framework...](https://galileo.ai/blog/ai-agent-compliance-governance-audit-trails-risk-management) - Build bulletproof audit trails for AI agents. Meet regulatory requirements with immutable logging, r...

36. [Building a Multi-Agent LLM Orchestrator with Claude Code - Dev.to](https://dev.to/ji_ai/building-a-multi-agent-llm-orchestrator-with-claude-code-86-sessions-of-hard-won-lessons-13n6) - The idea behind multi-agent LLM orchestration is deceptively simple. Run Claude, Codex, and Gemini.....

37. [Multi-Agent AI for Operational Intelligence Guide | Augment Code](https://www.augmentcode.com/guides/multi-agent-ai-operational-intelligence) - Learn how multi-agent AI for operational intelligence scales incident management across hundreds of ...

38. [The 4 Pillars Of Ai Agent...](https://wandb.ai/site/articles/ai-agent-observability/) - %

39. [Any efficient ways to cut noise in observability data? : r/devops - Reddit](https://www.reddit.com/r/devops/comments/1l811zt/any_efficient_ways_to_cut_noise_in_observability/) - Anyone has solid strategies/solutions for cutting down observability data noise, especially in logs?...

40. [Helicone Review – Cost, Use Cases & Alternatives [2025] - AIChief](https://aichief.com/ai-development-tools/helicone/) - Discover Helicone, an observability platform designed to monitor, debug, and enhance large language ...

41. [Langfuse Documentation](https://langfuse.com/docs) - Langfuse is an open-source LLM engineering platform (GitHub) that helps teams collaboratively debug,...

42. [AI Agent Security: Best Practices Guide 2025](https://www.digitalapplied.com/blog/ai-agent-security-best-practices-2025) - Secure AI agents with enterprise best practices. 24 CVEs across top tools. Prompt injection, data ex...

