# Contract Violations in Multi-Agent AI Systems: Error Handling, Retry, and Escalation Patterns

## Executive Summary

Production multi-agent AI systems face a class of failure distinct from traditional software errors: an agent can produce an output that is syntactically valid, HTTP-successful, and apparently complete — while being semantically wrong, structurally mismatched to the commissioned format, or unsafe to act on. Handling these violations requires layered strategies across four planes: **detection** (knowing a contract was broken), **retry** (attempting recovery with modified inputs), **escalation** (routing to a higher authority when recovery fails), and **attribution** (determining whether the fault lies with the agent or with the commission that specified the task). Each plane has confirmed patterns from production systems and research; the distinctions between them carry operational significance for any system building toward an operational constitution.[^1]

***

## Part I: What Counts as a Contract Violation

### The Silent Failure Problem

The most dangerous violations "look like success". A circuit breaker watching only HTTP status codes will not detect them. In one documented production incident, a model degradation event caused an agent to return malformed JSON on every call — every API call returned HTTP 200, and 40 minutes of compute burned before anyone noticed. This is not an edge case: production teams consistently report that multi-agent pipelines fail silently by default, with no exceptions thrown and pipeline quality simply degrading.[^2][^1]

SHIELDA, a systematic framework from CSIRO's Data61 (published August 2025, based on a literature review of 55 papers), classifies 36 distinct exception types across 12 "agent artifacts". The taxonomy distinguishes violations by phase:[^3][^4]

- **Reasoning/Planning (RP) phase**: Ambiguous Goal, Conflicting Goal, Context Corruption, Faulty Task Structuring, Circular Reasoning, Hallucinated Facts
- **Execution (E) phase**: Output Validation Failure, Tool Invocation Exception, Protocol Mismatch, Role Violation, API Semantic Mismatch, API Response Malformation
- **Cross-phase (RP/E)**: Memory Poisoning, Knowledge Base Poisoning, Token Limit Exceeded

The core architectural insight from SHIELDA is that **execution-phase symptoms frequently have reasoning-phase root causes**. A git push failure (execution) traces back to a Faulty Task Structuring exception (reasoning/planning), meaning the retry strategy for one is inappropriate for the other. Applying a simple format-correction retry to a goal ambiguity exception cannot succeed, and escalating an output formatting error to a human when a prompt correction would suffice wastes capacity.[^5][^6]

### Taxonomy of Format and Contract Failures

Within the narrower category of output-format contract violations specifically, the confirmed exception types are:

- **Output Validation Failure**: Agent produces syntactically malformed or structurally unsafe outputs — invalid JSON, unmatched brackets, unescaped characters — that downstream systems cannot parse[^5]
- **Output Handling Exception**: Structurally invalid outputs that introduce injection surfaces (XSS, SQL injection, remote code execution) when rendered downstream[^5]
- **API Semantic Mismatch**: Agent invokes tools with correctly-formed but semantically wrong parameters (e.g., calling an arXiv search tool for a restaurant query)[^5]
- **Protocol Mismatch**: Agent output format doesn't match the declared schema or protocol the receiving system expects[^5]
- **Role Violation**: Agent produces outputs exceeding its designated authority scope in a multi-agent system[^5]

***

## Part II: Error Detection Layers

### The Four-Layer Defense

Production systems use a layered validation architecture before releasing any LLM output downstream:[^7]

1. **Schema validation** — enforce a structured output contract using JSON mode, function calling, or JSONSchema. Validate required field presence and type constraints before the output leaves the LLM layer[^8][^7]
2. **Confidence gating** — score output confidence; outputs below threshold trigger retry or escalation rather than proceeding[^9]
3. **Cross-reference checks** — compare output against known-good data sources, check URL validity, verify factual claims against the knowledge base[^10]
4. **Semantic/business-rule validation** — check that structurally valid outputs don't violate higher-order constraints: no destructive SQL operations, response length sanity, cost sanity checks[^10]

The implementation pattern uses a severity-tiered `OutputValidator` that classifies rules as `block` (halt execution), `warn` (proceed with flag), or `log` (record only). The critical implication: **not all violations have the same consequence**, and collapsing them into a single "reject" response destroys information needed for downstream routing.[^10]

### Quality Failures vs. HTTP Failures

A circuit breaker adapted for LLM agents must track **quality failures**, not merely HTTP errors. The closed/open/half-open circuit breaker pattern applies, with one modification: the circuit opens after consecutive *output quality* failures (e.g., three schema validation failures in a row), even when every underlying API call returns HTTP 200. This separation ensures that model degradation events — which present as API successes — trigger the same protective circuit behavior as availability failures.[^1]

***

## Part III: Retry Patterns

### Strategy Depends on Error Type

The central principle is that **different error types require different retry strategies**:[^10]

| Error Type | Retry Strategy | Rationale |
|---|---|---|
| Rate limit (HTTP 429) | Exponential backoff + jitter | Give downstream service time to recover; jitter prevents synchronized retries[^11][^12] |
| Output format validation failure | Rephrase prompt with error context | Format error is a model reasoning failure, not a transient state[^10][^12] |
| Ambiguous goal / underspecification | Clarification request to upstream | Cannot retry the same underspecified commission[^5] |
| Tool invocation failure | Backoff + idempotency check | Distinguish transient unavailability from semantic mismatch[^11][^1] |
| Unknown / unexpected error | Log + fallback response | Avoid obscuring novel failure modes with aggressive retry[^10] |
| Quality circuit open | Stop, escalate | Retry cannot resolve systematic model degradation[^1] |

For format correction specifically, feeding the error message back as a new prompt ("You provided invalid JSON. Please correct it based on this schema.") resolves most format errors on the first retry in practice. However, this only works when the error is a formatting issue rather than a goal or context problem — attempting format-correction retries on a reasoning failure produces repeated failures and burns compute.[^12]

### Multi-Agent Retry Coordination

In multi-agent systems, individual agent retry logic creates system-level coordination risks that single-agent patterns don't surface:[^11][^13]

- **Retry storms**: when multiple agents simultaneously retry after a shared dependency failure, exponential retry loads overwhelm the system. Detection requires tracking retry rates across agents and identifying correlated spikes, not just individual agent retry counts[^13]
- **Centralized retry queues**: failed tasks enter a shared queue; a coordinator agent re-dispatches after delay, preventing individual agents from clogging the system[^11]
- **Agent-level circuit breakers**: each agent tracks its own failure rate independently; if Agent A's LLM calls fail at 50%, Agent A stops — but other agents continue[^11]
- **Idempotency tokens**: duplicate work detection via unique task IDs prevents double-execution on retry. Without idempotency tokens, retries after timeout ambiguity create duplicate state mutations — a documented failure mode where payment processing retries caused double charges[^13]

The saga pattern (from distributed systems) has been adapted for AI workflows: every step in a multi-agent task sequence has a defined compensation action, and a failed step triggers chained rollback up the sequence. Compensation handlers must be idempotent — checking whether rollback was already applied before executing, a lesson from production systems where duplicate rollback triggers caused data corruption.[^14][^15][^16]

***

## Part IV: Escalation Patterns

### Escalation as Engineered Pathway, Not Fallback

Escalation should be explicitly designed, not left as a residual catch-all. The confirmed SHIELDA escalation pathway has three components:[^6][^17]

1. **Local handling** — retry, prompt correction, plan repair within the agent
2. **Flow control** — Continue, Skip, or Abort the current workflow branch
3. **State recovery** — No-op, Rollback, or Compensate prior state

When local handling exhausts its retry budget, the Escalation Controller performs **cross-phase root cause analysis**: it traces the execution-phase exception back through the reasoning-phase logs to find the originating failure. This analysis determines whether escalation should go to a higher-tier agent (capable of reprompting or restructuring the task) or to a human reviewer (who must adjudicate ambiguous goals or policy questions).[^6][^1]

### Human-in-the-Loop Thresholds

Production HITL systems target a **10–15% escalation rate** — 85–90% of decisions execute autonomously. Rates near 60% indicate system miscalibration requiring recalibration, not just tuning.[^18][^19]

Escalation triggers operate on multiple dimensions simultaneously:

- **Confidence thresholds**: 80–90% for general use; 90–95% for financial services; 95%+ for healthcare[^18]
- **Multi-agent chain penalties**: a three-agent chain requires escalation at a lower per-agent confidence threshold than a single agent, because compound uncertainty from successive handoffs means 90% individual confidence is insufficient[^18]
- **Risk classification**: financial threshold exceedances, VIP/reputational exposure, time-critical multi-department decisions, and tasks outside the training distribution trigger escalation independent of confidence scores[^18]
- **EU AI Act compliance**: Article 26 and NIST AI RMF frameworks require mandatory oversight for high-risk categories regardless of confidence[^20]

Critically, escalations must carry context: the full decision context including tool inputs, model output, validation failures, and the agent's last reasoning step. An escalation without context merely shifts the debugging burden to a human without enabling them to resolve it.[^1]

***

## Part V: Distinguishing Agent Fault from Commission Underspecification

### The Core Diagnostic Problem

This is the hardest problem in production multi-agent systems, and the research literature is blunt about current limitations. The Who&When benchmark (Penn State / Duke / Google DeepMind, 2025) — comprising failure logs from 127 LLM multi-agent systems — found that the best automated attribution method achieves **53.5% accuracy in identifying the responsible agent but only 14.2% in pinpointing the error step**. Even OpenAI o1 and DeepSeek R1 fail to achieve practical usability on this task. A March 2026 multi-perspective attribution study found inter-annotator disagreement rates reaching 60% on the same failures, confirming that MAS failure attribution "often admits multiple plausible attributions due to complex inter-agent dependencies and ambiguous execution trajectories".[^21][^22][^23][^24][^25]

This is not primarily a tooling gap — it is a structural property of multi-agent systems. The failure mode is inherently multi-causal: a single execution failure may be simultaneously attributable to a flawed plan (reasoning phase), an ambiguous goal in the commission (underspecification), and an inadequate tool interface (execution phase).

### Structural Diagnosis Framework

Despite these limits, confirmed structural approaches exist for separating agent fault from commission underspecification:

**Pre-execution ambiguity detection** is the cleanest preventive intervention. SHIELDA classifies "Ambiguous Goal" as a Reasoning/Planning phase exception distinct from "Output Validation Failure" (Execution phase). The handling strategy for Ambiguous Goal is proactive clarification before execution begins — not retry after execution fails. A multi-agent debate framework (leader-follower protocol) improved ambiguity detection from 28.3% to 76.7% for Mistral-7B by having multiple LLMs collaboratively analyze the commission before any agent begins execution.[^26][^5]

**Underspecification fragility testing** is a diagnostic tool: underspecified prompts are 2x more likely to regress when models or prompts change, sometimes with accuracy drops exceeding 20%. An agent that consistently fails on one formulation of a commission but succeeds on another is exhibiting sensitivity to underspecification, not capability failure. However, LLMs can guess unspecified requirements 41.1% of the time by default — masking the problem. This means apparent agent success on an underspecified commission is not evidence of adequate specification.[^27][^28]

**Spectrum-based failure attribution** (FAMAS, published Sept 2025) uses trajectory replay and spectrum analysis to estimate, from variations across repeated executions, the likelihood that each agent action is responsible for the failure. If the same commission reliably produces failures, the failure pattern points toward the agent. If failures appear stochastically across executions, the pattern points toward commission underspecification or environment instability.[^29][^30]

**Contract-driven runtime separation** distinguishes between what an agent was commissioned to do (the typed input contract) and what it produced (the typed output). By treating the LLM as a compiler producing a typed contract and the runtime as a deterministic interpreter, deviations are surfaced at the boundary: a contract violation is either a mismatch between the input commission spec and what the LLM was given (underspecification) or a mismatch between the output contract and what the LLM returned (agent fault).[^31]

**Phase-aware logging**: SHIELDA's phase-aware recovery links execution-phase exceptions to reasoning-phase root causes through trace-driven diagnosis. In a documented case study (AutoPR agent), a git push failure during execution traced back to a Faulty Task Structuring exception in the planning phase — the agent had incorrectly structured the task before any execution occurred. Without phase-aware logging, this presents as an execution failure; with it, the root cause is a planning (and potentially commission) problem.[^6]

### Practical Attribution Heuristics

Given the 14.2% step-accuracy ceiling of current automated tools, production systems use heuristics rather than full automated attribution:

| Signal | Points Toward | Action |
|---|---|---|
| Same commission, different executions, variable outcomes | Underspecification or non-determinism | Tighten commission spec; add required fields[^27][^28] |
| Multiple agents fail on semantically similar tasks | Common upstream underspecification | Audit commission template, not individual agents[^20] |
| Failure appears immediately at planning/reasoning phase | Ambiguous Goal or Conflicting Goal | Pre-execution clarification, not post-execution retry[^5] |
| Failure appears at execution despite clean planning trace | Agent capability or tool fault | Retry with modified execution parameters[^5] |
| Failure is deterministic for one agent, not others on same commission | Agent-specific fault | Route to different agent or model[^22] |
| Validation fails on format but content is semantically correct | Prompt-format gap | Format correction retry[^12] |
| Validation fails on semantics; format is correct | Deep reasoning failure | Escalate; retry unlikely to help[^1] |

***

## Part VI: Constitutional and Governance-Layer Enforcement

### Constitutions as Runtime Artifacts

An operational constitution — not just a policy document — enforces contracts at execution time. Sovereign-OS (March 2026) demonstrates one implementation: a Pydantic-validated YAML Charter defines mission scope, fiscal boundaries, and KPIs. An Auditor component verifies every agent output against Charter KPIs and seals each report with a SHA-256 proof hash. Across its evaluation suite, Sovereign-OS blocks 100% of fiscal violations and achieves 94% correct permission gating across 200 trust-escalation missions. The TrustScore mechanism dynamically gates agent permissions based on historical performance — agents earn autonomy incrementally rather than receiving it by default.[^32][^33][^34]

Sanna provides a similar pattern: agent authority boundaries are written in a YAML constitution, signed with an Ed25519 key, and version-controlled alongside code. Every decision generates a signed reasoning receipt — portable, vendor-neutral proof that governance was enforced. The Agent Action Receipt (AAR) specification extends this to individual node executions: Ed25519-signed receipts capture agent identity, action, SHA-256 hashes of input and output (never raw data), and timestamps. Receipts chain via Session Continuity Certificates for full workflow provenance.[^35][^36][^37]

The significance of signed receipts for contract violation handling is forensic: when a dispute arises about whether a violation occurred and who bears responsibility, unsigned mutable logs can be rewritten; Ed25519-signed receipts cannot. This is the difference between auditability and accountability.[^37]

### Separation of Power as Structural Defense

The deepest systemic vulnerability in multi-agent systems is what a March 2026 paper terms the "Logic Monopoly": each agent simultaneously plans, executes, and evaluates its own actions, with no external check. The structural remedy — separating Legislation (commission specification), Execution (bounded task performance), and Adjudication (independent verification and escalation) into structurally independent branches — transforms safety from a property of individual agent alignment into a property of the system's architecture.[^38]

This separation has direct implications for contract violation handling: the Adjudication layer can detect violations independent of the executing agent, escalate to a Judicial DAO or human committee before any irreversible action is released, and maintain forensic provenance across the full lifecycle. An agent that evaluates its own outputs cannot reliably flag its own contract violations; an independent adjudicator can.[^38]

***

## Part VII: Observability as the Foundation

### What Must Be Traced

Contract violations cannot be diagnosed without structured traces. The confirmed OpenTelemetry span hierarchy for agent workflows is:[^39][^40]

- **Session span** (root): covers the full task, records session_id, task description, model, total steps, total tokens, tools used, final status
- **Step span**: covers each agent loop iteration, records step number, message count
- **Think span**: covers each LLM call, records input token count, output token count, duration_ms, action taken (tool_call vs final_answer)
- **Tool execution span**: covers each tool call, records tool name, inputs, output, duration

Key attributes that distinguish agent fault from commission failure include: which step the validation failure occurred at, what the model's stated reasoning was before the failure, whether the commission input changed between attempts, and whether the same failure occurs across different agents given identical commission inputs.[^41][^39]

The practical production principle from one team after 86 sessions of multi-agent orchestration: "Context must be injected explicitly. There is no implicit sharing between agents. Discovered bugs must be applied to the codebase immediately to prevent duplicate reports. The more constraints you put on prompts — no code generation, TypeScript enforcement — the more stable the output quality becomes."[^42]

***

## Confirmed vs. Inferred Distinctions

**Confirmed by primary sources:**
- SHIELDA's 36-exception taxonomy and phase-aware recovery architecture[^3][^5]
- Who&When benchmark accuracy figures (53.5% agent, 14.2% step)[^22][^25]
- Underspecification fragility: 2x regression rate, up to 93.1% accuracy drops[^28]
- Sovereign-OS evaluation results (100% fiscal blocking, 94% permission gating)[^33]
- Production HITL escalation rate targets (10–15%)[^18]
- Circuit breaker adaptation for quality failures (not just HTTP errors)[^1]

**Inferences supported by multiple sources but not experimentally isolated:**
- The claim that format-correction retry resolves "most format errors on the first retry" is reported as practitioner observation, not controlled experiment[^12]
- The 41.1% underspecification guessing rate is measured on specific task types (code explanation, trip advisory, product description); generalization to arbitrary multi-agent commission schemas is plausible but unconfirmed[^28]
- Ed25519-signed receipts as the standard for tamper-evident audit trails is an emerging convergence (Sanna, AAR spec, WeilChain, LangGraph proposal) but lacks a dominant standard as of March 2026[^36][^35][^37]

**Contradictions preserved:**
- The SHIELDA paper reports successful cross-phase recovery in its AutoPR case study, while the Who&When benchmark (different team, different systems) finds even SOTA models achieve only 14.2% step-attribution accuracy. These findings are not contradictory — SHIELDA demonstrates that structured recovery *is possible*; Who&When demonstrates that *automated attribution* of where a failure occurred remains hard. Recovery and attribution are different problems.[^25][^6]
- Specifying more requirements in a commission prompt can *hurt* performance (up to 19% drop) due to limited instruction-following under long contexts, while underspecification causes different failures. The implication is that commission quality cannot be measured solely by length or completeness — the format and prioritization of requirements matter as much as their presence.[^28]

---

## References

1. [AI Agents Fail Silently: 5 Error Handling Patterns for Production](https://blog.jztan.com/ai-agent-error-handling-patterns/) - Most AI agents fail silently. These five production error handling patterns stop hallucinations, too...

2. [Multi-agent pipelines break in weird ways. This one failure mode ...](https://www.reddit.com/r/AI_Agents/comments/1rkomls/multiagent_pipelines_break_in_weird_ways_this_one/) - The hardest part of multi-agent debugging is that failures are silent by default. Nothing throws an ...

3. [SHIELDA: Structured Handling of Exceptions in LLM-Driven ...](https://www.alphaxiv.org/overview/2508.07935v1) - View recent discussion. Abstract: Large Language Model (LLM) agentic systems are software systems po...

4. [Structured Handling of Exceptions in LLM-Driven Agentic Workflows](https://arxiv.org/abs/2508.07935) - SHIELDA uses an exception classifier to select a predefined exception handling pattern from a handli...

5. [Structured Handling of Exceptions in LLM-Driven Agentic Workflows](https://arxiv.org/html/2508.07935v1) - This exception arises when an agent incorrectly plans or formats a tool invocation, often due to sem...

6. [SHIELDA: Exception Handling in LLM Workflows - Emergent Mind](https://www.emergentmind.com/topics/shielda-structured-handling-of-exceptions-in-llm-driven-agentic-workflows) - SHIELDA is a modular framework that delivers robust, phase-aware exception handling for LLM-driven w...

7. [How to Validate LLM Outputs in Production Before They Break Your ...](https://dev.to/vhub_systems_ed5641f65d59/how-to-validate-llm-outputs-in-production-before-they-break-your-pipeline-ahl) - LLM hallucination in production pipelines is silent — it produces confidently wrong outputs with no ...

8. [Building Type‑Safe, Schema‑Constrained LLM Pipelines with ...](https://ubos.tech/news/building-type%E2%80%91safe-schema%E2%80%91constrained-llm-pipelines-with-outlines-and-pydantic/) - Type‑safe, schema‑constrained LLM pipelines are built by combining the Outlines library for prompt t...

9. [How to Build Production-Ready AI Agents: Moving Beyond Naive ...](https://www.linkedin.com/pulse/how-build-production-ready-ai-agents-moving-beyond-naive-llm-mfsic) - Input/output contracts: Define JSON schemas, data types, value ranges, and business rule validations...

10. [7 Error Handling Patterns That Keep Your Agent Running at 3 AM](https://dev.to/techfind777/building-self-healing-ai-agents-7-error-handling-patterns-that-keep-your-agent-running-at-3-am-5h81) - Pattern 5: Output Validation Guards. This is the pattern most people skip, and it's the one that cau...

11. [AI Agent Retry Patterns - Exponential Backoff Guide 2026 | Fast.io](https://fast.io/resources/ai-agent-retry-patterns/) - Build fault-tolerant AI agents with retry patterns for LLM failures, rate limits, and tool timeouts....

12. [AI Agent Error Handling: Best Practices & Patterns for 2025 | Fast.io](https://fast.io/resources/ai-agent-error-handling/) - Learn how to reduce AI agent failure rates by 60% with robust error handling patterns, retry strateg...

13. [Multi-Agent System Reliability: Failure Patterns, Root Causes, and ...](https://www.getmaxim.ai/articles/multi-agent-system-reliability-failure-patterns-root-causes-and-production-validation-strategies/) - Agent A times out and retries, causing Agent B to process the payment twice. The customer experience...

14. [Automating saga compensation in microservices using ai agents](https://community.latenode.com/t/automating-saga-compensation-in-microservices-using-ai-agents-any-real-world-examples/44025) - I’ve been wrestling with implementing the Saga pattern across our microservices. Manual compensation...

15. [Transactional AI: Saga Pattern for Reliable AI Agent Workflows (v0.2)](https://news.ycombinator.com/item?id=46595227) - The core idea: apply the Saga pattern (from distributed systems) to AI workflows. Every step has aut...

16. [Implementing the saga pattern in Workflows | Google Cloud Blog](https://cloud.google.com/blog/topics/developers-practitioners/implementing-saga-pattern-workflows) - A saga is a sequence of local transactions. Each local transaction updates the database and triggers...

17. [The Human-in-the-Loop Paradox: When to Automate and ... - Zigment](https://zigment.ai/blog/human-loop-paradox-automate-vs-escalate-guide) - Escalation should never feel accidental. It should be engineered. We recommend defining clear trigge...

18. [How to Build Human-in-the-Loop Oversight for AI Agents | Galileo](https://galileo.ai/blog/human-in-the-loop-agent-oversight) - Effective HITL systems typically target 10-15% escalation rates, meaning 85-90% of decisions execute...

19. [Human-in-the-Loop Agentic AI: When You Need Both - Elementum](https://www.elementum.ai/blog/human-in-the-loop-agentic-ai) - Human-in-the-loop agentic AI is an architectural pattern where autonomous AI agents execute complex,...

20. [10 Multi-Agent Coordination Strategies to Prevent System Failures](https://galileo.ai/blog/multi-agent-coordination-strategies) - Stop multi-agent coordination failures before they impact production systems. Expert strategies for ...

21. [Rethinking Failure Attribution in Multi-Agent Systems - arXiv](https://arxiv.org/html/2603.25001v1) - Failure attribution is essential for diagnosing and improving multi-agent systems (MAS), yet existin...

22. [Which Agent Causes Task Failures and When? On Automated ...](https://proceedings.mlr.press/v267/zhang25cq.html) - Failure attribution in LLM multi-agent systems—identifying the agent and step responsible for task f...

23. [[2603.25001] Rethinking Failure Attribution in Multi-Agent Systems](https://arxiv.org/abs/2603.25001) - Abstract:Failure attribution is essential for diagnosing and improving multi-agent systems (MAS), ye...

24. [Which Agent Causes Task Failures and When? On Automated ...](https://tldr.takara.ai/p/2505.00212) - Using the Who&When, we develop and evaluate three automated failure attribution methods, summarizing...

25. [[2505.00212] Which Agent Causes Task Failures and When ... - arXiv](https://arxiv.org/abs/2505.00212) - In this paper, we propose and formulate a new research area: automated failure attribution for LLM m...

26. [[PDF] Enhancing LLM Detection of Ambiguity in Requests through Debate](https://arxiv.org/pdf/2507.12370.pdf) - We propose and investigate a multi-agent debate framework where multiple LLMs collaboratively analyz...

27. [Understanding and Managing Underspecification in LLM Prompts](https://arxiv.org/abs/2505.13360) - Prompt underspecification is a common challenge when interacting with LLMs. In this paper, we presen...

28. [Understanding and Managing Underspecification in LLM Prompts](https://arxiv.org/html/2505.13360v2) - We found that LLMs are often able to guess unspecified requirements – in 41.1% of cases, they are ab...

29. [Who is Introducing the Failure? Automatically Attributing Failures of ...](https://tldr.takara.ai/p/2509.13782) - To bridge this gap, we propose FAMAS, the first spectrum-based failure attribution approach for MASs...

30. [[2509.13782] Who is Introducing the Failure? Automatically ... - arXiv](https://arxiv.org/abs/2509.13782) - To bridge this gap, we propose FAMAS, the first spectrum-based failure attribution approach for MASs...

31. [[D] A contract-driven agent runtime: separating workflows, state, and ...](https://www.reddit.com/r/MachineLearning/comments/1phl090/d_a_contractdriven_agent_runtime_separating/) - Because contracts are typed (Pydantic/JSON/YAML-schema backed), the validation loop forces the LLM t...

32. [A Charter-Governed Operating System for Autonomous AI Agents ...](https://arxiv.org/html/2603.14011v1)

33. [Sovereign-OS: A Charter-Governed Operating System for Autonomous AI Agents with Verifiable Fiscal Discipline](https://arxiv.org/pdf/2603.14011.pdf)

34. [A Charter-Governed Operating System for Autonomous AI Agents ...](https://arxiv.org/abs/2603.14011) - Across our evaluation suite, Sovereign-OS blocks 100% of fiscal violations (30 scenarios), achieves ...

35. [Sanna – Trust Infrastructure for AI Agents | Constitution Enforcement ...](https://sanna.dev) - Sanna gives you boundaries they can't cross and a receipt proving they stayed inside them. Your agen...

36. [Agent Action Receipts (AAR) — tamper-proof audit trails for Dify ...](https://github.com/langgenius/dify/issues/33135) - Receipts can chain via Session Continuity Certificates (SCC) for full workflow provenance — proving ...

37. [Cryptographic action receipts (AAR) for provable agent execution ...](https://github.com/langchain-ai/langgraph/issues/7065) - Audit logs exist, but they're mutable and unsigned — a compromised system can rewrite history withou...

38. [From Logic Monopoly to Social Contract: Separation of Power and ...](https://arxiv.org/html/2603.25100v1) - Existing multi-agent frameworks allow each agent to simultaneously plan, execute, and evaluate its o...

39. [How to Trace Multi-Step Agent Workflows with OpenTelemetry ...](https://oneuptime.com/blog/post/2026-02-06-trace-multi-step-agent-workflows-opentelemetry/view) - Learn how to trace multi-step AI agent workflows using OpenTelemetry sessions and spans, with practi...

40. [Bringing Production-Grade Observability to AI Agent Workflows with ...](https://huggingface.co/blog/darielnoel/kaibanjs-ai-agent-opentelemetry) - In this article, we'll explore how to add comprehensive observability to AI agent workflows using Op...

41. [LLM Observability in the Wild – Why OpenTelemetry Should Be the ...](https://news.ycombinator.com/item?id=45398467) - It has rich span types like LLM, tool, chain, embedding, agent, etc. You can easily query for "show ...

42. [Building a Multi-Agent LLM Orchestrator with Claude Code - Dev.to](https://dev.to/ji_ai/building-a-multi-agent-llm-orchestrator-with-claude-code-86-sessions-of-hard-won-lessons-13n6) - The idea behind multi-agent LLM orchestration is deceptively simple. Run Claude, Codex, and Gemini.....

