# Syncrescendence Phase 3: Specification Outline
## Five-Lane Build Plan with Dependencies and Wave Sequencing

**Document Class:** Phase 3 Constitutional Architecture — DOCUMENT 1 of 3  
**Compiled:** 2026-03-30  
**Source Corpus:** 15 primary research documents, 2 master audits (733 + 736 lines), 5 gap-fill briefs, Oracle adversarial synthesis  
**Confidence Notation:** [Confirmed] = multiple independent sources; [Emerging] = single credible or early-stage source; [Inference] = logical derivation from confirmed facts  
**Contraindication Notation:** Contradictions flagged with ⚠️ CONTRADICTION — not resolved

---

## Master Terminology Reference

All ecosystem-standard terms appear first; grammar equivalents follow in brackets. Full mapping from the [Mission 1 audit terminology table](workspace://syncrescendence-phase3-research-audit.pplx.md) and [gap-fill Q2 vocabulary translation](workspace://gap-fill-q2-vocabulary-translation.md):

| Ecosystem Term | Grammar Equivalent | Confidence |
|---|---|---|
| Task | commission | [Confirmed] |
| Artifact | receipt | [Confirmed] |
| Eval run | calibration cycle | [Confirmed] |
| Hard gate / HITL checkpoint | negative routing law | [Confirmed] |
| Skill promotion / capability escalation | promotion ladder | [Confirmed] |
| Agent scaffold / runtime framework | scaffold (Tier 5) | [Confirmed] |
| Agent drift / behavioral drift | delta metabolism (Tier 6) | [Confirmed — with polarity caveat: ecosystem "drift" is exclusively negative; grammar "metabolism" includes healthy throughput] |
| Execution engine / workflow engine | method engine (Tier 7) | [Confirmed] |
| Production readiness review (PRR) | readiness matrix (Tier 8) | [Confirmed] |
| Agentic trust model / authorization graph | authority lattice (Tier 9) | [Confirmed for components; [Inference] for lattice structure] |

---

## Oracle Adversarial Brief — 5 Pressure Points

The following five pressure points from the [Oracle synthesis brief](workspace://turn-40-SYNTHESIS-oracle-adversarial-brief.md) are load-bearing for Phase 3 architecture. Each is addressed within the applicable lane.

| # | Pressure Point | Confidence | Primary Lane |
|---|---|---|---|
| PP-1 | Hermes shadow-mode is correct — first calibration cycle is the sole unadulterated baseline; passive ingestion produces summarization but no skill promotion | 85 | Lane E |
| PP-2 | Memory deferral unsafe — must insert minimal memory taxonomy into Wave Zero; coordination failures compound 17× without inter-agent verification | 90 | **Lanes A + B** (cross-lane) |
| PP-3 | Four-phase arc correctly specified — governance without metabolism collapses into brittle stasis | 80 | All lanes |
| PP-4 | Commander-centrism risk understated — Google/MIT: −3.5% mean multi-agent improvement; centralized architecture −50.4% on PlanCraft; coordination overhead 285% for hub-and-spoke | 75 | **Lane C** (CRITICAL) |
| PP-5 | Subscription-OAuth zero-cost assumption eroding — Anthropic weekly rate limits, ToS bans on consumer OAuth routing (enforcement Jan 5, 2026; policy clarified Feb 20, 2026) | 90 | **Lane D** |

---

## Lane A: Shared Substrate Activation

**Ecosystem mapping:** GitHub as constitutional state store, branch protection as write-gating, GitOps reconciliation as the canonical single-source-of-truth pattern  
**Primary sources:** [Doc 13 — Single Source of Truth](workspace://13-single-source-of-truth-state-files-multi-agent-systems-13.md), [Doc 08 — Write-Scope Governance](workspace://08-write-scope-governance-patterns-multi-agent-orchestration-8.md), [Gap-Fill Q1 — Memory Taxonomy](workspace://gap-fill-q1-memory-taxonomy.md)

---

### A.1 Primitives Required

| Primitive | Description | Source |
|---|---|---|
| **EpochToken** | Monotonically increasing integer or content-addressed hash anchored to a ratified commit; serves as the system-wide "constitutional epoch" — all contracts carry the epoch under which they were issued | [Doc 13](workspace://13-single-source-of-truth-state-files-multi-agent-systems-13.md); analogous to Kubernetes resource version / etcd revision |
| **BranchProtectionManifest** | Machine-readable declaration of which branches require PR review, which require CI pass, and which carry `CODEOWNERS` restrictions; committed to repo as `.syncrescendence/branch-protection.json` | [Doc 08](workspace://08-write-scope-governance-patterns-multi-agent-orchestration-8.md); [Claude Code Permissions docs](https://code.claude.com/docs/en/permissions) |
| **ReconciliationLoop** | GitOps-style controller that watches the repo for drift between declared desired state (committed configuration) and observed runtime state; emits `DriftReport` [grammar: delta metabolism signal] when divergence exceeds threshold | [Doc 13](workspace://13-single-source-of-truth-state-files-multi-agent-systems-13.md); [Kubernetes reconciliation pattern](https://kubernetes.io/docs/concepts/architecture/controller/) |
| **ConstitutionalDocumentStore** | Protected read-only store containing the 9 ratified grammar documents as the Semantic Core Anchor (M_core in SSGM terms); write-gate enforced at the storage layer, not in application logic | [Gap-Fill Q1](workspace://gap-fill-q1-memory-taxonomy.md); [SSGM — arXiv:2603.11768](https://arxiv.org/abs/2603.11768) |
| **WorktreeIsolationPolicy** | Configuration specifying that each parallel agent execution receives its own `git worktree` at `.trees/{TASK_ID}`; prevents shared-file conflicts without requiring Commander arbitration | [Doc 02](workspace://02-dispatch-concurrency-patterns-multi-agent-orchestration-2.md); [CAID — arXiv:2603.21489](https://arxiv.org/html/2603.21489v1) |
| **SingleWriterLease** | Named resource lease (TTL + `KeepAlive` heartbeat) enforced by the coordination plane, ensuring only one agent holds write authority for designated singleton files (e.g., current `EPOCH-STATE.md`) at any time | [Doc 13](workspace://13-single-source-of-truth-state-files-multi-agent-systems-13.md); [etcd leader election pattern](https://oneuptime.com/blog/post/2025-12-11-etcd-leader-election/) |

**PP-2 Integration [Confirmed]:** The ConstitutionalDocumentStore IS the Semantic Core Anchor (M_core) from SSGM. The repo commit log IS the Immutable Episodic Ledger (K_ledger). Per the [Oracle adversarial brief](workspace://turn-40-SYNTHESIS-oracle-adversarial-brief.md): "Once evidence packets land without typed persistence contracts, the institution must either manually reconstruct provenance for every receipt or accept shadow doctrine in Hermes indexing." Lane A's primitives must therefore be activated in Wave Zero — not deferred.

---

### A.2 Standards to Align With

| Standard | Relevance | Maturity Status |
|---|---|---|
| **GitOps v1.0** (CNCF) | Repo-as-single-source-of-truth; reconciliation loop pattern | Ratified (CNCF, 2022) |
| **GitHub Branch Protection API** | Enforcing write-scope governance at the infrastructure layer, not application layer | Production / Vendor-specific |
| **CODEOWNERS** (GitHub / GitLab) | Assigning write authority by path prefix to named agents or teams | De facto standard |
| **W3C PROV-O** | Provenance vocabulary for tracking who changed what, when, and why; applies to EpochToken lineage | Ratified (W3C, 2013) — but implementation gaps in agentic context [Emerging] |
| **IETF RFC 7396 (JSON Merge Patch)** | Deterministic merge semantics for JSON state documents; relevant to ReconciliationLoop | Ratified |
| **CodeCRDT / Yjs** | CRDT-based concurrent state with deterministic convergence; relevant for multi-agent file coordination without SingleWriterLease | [Emerging — arXiv:2510.18893](https://arxiv.org/abs/2510.18893) |

---

### A.3 Existing Grammar Coverage

| Component | Coverage | Notes |
|---|---|---|
| Repo as ratification surface | **Full** — the 9 grammar documents are already committed and constitute M_core | Authority lattice and readiness matrix both reference the repo as the canonical source |
| Branch protection as write gate | **Stub** — LAYER-LAW.md references "repo supremacy" as an absolute constraint but provides no machine-readable enforcement spec | No `BranchProtectionManifest` schema exists |
| GitOps reconciliation | **None** — no ReconciliationLoop concept in any of the 9 documents | This gap directly enables silent drift between declared state and runtime state |
| Epoch tokens | **None** — no versioned epoch system; grammar documents carry document-level version numbers but no cross-document epoch | Creates inconsistency risk when two contracts reference different grammar versions |
| Worktree isolation | **None** — the scaffold grammar (Tier 5) covers agent configurations but not runtime filesystem isolation | |
| Memory taxonomy overlay on repo | **None** — the repo is implicitly used as a memory substrate but no formal taxonomy distinguishes working / episodic / semantic / procedural layers in the commit structure | PP-2 requires this overlay in Wave Zero |

**Overall Lane A Grammar Coverage: Partial** (ratification surface exists; operational enforcement primitives are Stub or None)

---

### A.4 Build Requirements

**Phase 3 Lane A Deliverables:**

1. **`EPOCH-STATE.md` specification** — schema for the singleton file tracking current constitutional epoch, last ratified grammar version, and active branch protection config; protected by SingleWriterLease
2. **`BranchProtectionManifest` JSON schema** — declarative specification of protected branches, required reviewers (expressed as agent IDs, not human names), required CI checks, and merge-commit format rules
3. **`WorktreeIsolationPolicy` specification** — rules governing when worktrees are provisioned, how they are named (`TASK_ID`-addressable), how they are merged, and when they are cleaned up
4. **Git commit message format standard** — typed commit message schema that serves as the Episodic Ledger entry format: `{task_id, agent_id, contract_type, epoch, artifact_hash, status}`; enables SSGM-grade rollback
5. **Memory taxonomy overlay document** — maps the three required Wave Zero memory layers (working context, episodic ledger, semantic core) onto their Git-native implementations (in-progress task state vs. commit log vs. protected document store)
6. **ReconciliationLoop interface contract** — defines what the loop watches, what it emits (DriftReport format), and what triggers human escalation vs. automatic revert
7. **ConstitutionalDocumentStore access policy** — ABAC rules specifying that only Commander (Claude Code) with branch-protection override can modify M_core documents; all other agents read-only

---

### A.5 Dependencies

- **Depends on:** Nothing — Lane A is the substrate all other lanes build on; it has no inbound Lane dependencies
- **Blocks:** All other lanes — Lane B's typed contracts require the EpochToken; Lane C's dispatch requires WorktreeIsolationPolicy; Lane D's observability requires the ReconciliationLoop interface; Lane E's rollback requires the Episodic Ledger format

---

## Lane B: Operational Contracts

**Ecosystem mapping:** Typed Task [grammar: commission] objects, Artifact [grammar: receipt] schemas, eval run [grammar: calibration cycle] records  
**Primary sources:** [Doc 01 — Typed Contracts](workspace://01-typed-contract-formats-multi-agent-commission-schema-comparison.md), [Doc 07 — Receipt Patterns](workspace://07-receipt-acknowledgment-patterns-agent-orchestration-7.md), [Doc 14 — Receipt Normalization](workspace://14-receipt-normalization-heterogeneous-agent-surfaces-14.md), [Doc 09 — Contract Violations](workspace://09-contract-violations-error-handling-retry-escalation-9.md), [Gap-Fill Q4 — Budget Governance](workspace://gap-fill-q4-budget-governance.md)

---

### B.1 Primitives Required

#### TaskEnvelope [grammar: commission]

The atomic unit of commissioned work. Synthesized from [A2A Protocol Specification](https://a2a-protocol.org/latest/specification/), [CrewAI task schema](https://docs.crewai.com/en/concepts/tasks), [LangGraph @task decorator](https://docs.langchain.com/oss/python/langgraph/functional-api), and [Agent Contracts framework — arXiv:2601.08815](https://arxiv.org/abs/2601.08815): [Confirmed]

```typescript
interface TaskEnvelope {
  // Identity and lineage (REQUIRED)
  task_id: string;                    // UUID, server-generated
  parent_task_id?: string;            // For subtask delegation (conservation law: Σ child budgets ≤ parent)
  trace_id: string;                   // OTel-compatible correlation ID, propagated to all spans
  idempotency_key: string;            // Prevents duplicate execution on retry; derived from task_id+epoch
  epoch: string;                      // Constitutional epoch (from Lane A EpochToken) under which task was issued
  grammar_version: string;            // Version of ratified grammar governing this task

  // Commission specification
  description: string;
  expected_output: string;
  input_schema?: JSONSchema;          // Typed input contract
  output_schema?: JSONSchema;         // Typed output contract — receipt must conform
  context?: string[];                 // reference_task_ids from prior related tasks

  // Routing
  assignee: AgentID;                  // Target agent
  issuer: AgentID;                    // Issuing agent (Commander or delegating worker)
  dispatch_mode: 'push' | 'pull';     // push = Commander assigns; pull = worker self-claims (default)
  task_type: 'sequential' | 'parallel_exploration' | 'research' | 'code_generation';  // for topology routing

  // Lifecycle
  status: TaskState;                  // A2A-compatible: SUBMITTED | WORKING | INPUT_REQUIRED | AUTH_REQUIRED | COMPLETED | FAILED | CANCELED | REJECTED
  created_at: ISO8601;
  expires_at?: ISO8601;               // Time-bounded delegation — auto-requeue on expiry (PP-4 counterweight)
  retry_policy?: RetryPolicy;

  // Budget governance (REQUIRED — gap-fill Q4) [Confirmed]
  budget: BudgetEnvelope;

  // Write scope
  write_scope?: PathScope[];          // Paths this task is authorized to write; enforced by WorktreeIsolationPolicy
  authority_scope: AuthorityScope;    // Derived from authority lattice; bounds what assignee can decide autonomously
}

interface BudgetEnvelope {
  budget_ceiling_usd: float;          // Hard stop — execution terminates if exceeded
  budget_warning_pct: float;          // Default 0.80; alert threshold
  model_tier_max: 'nano' | 'flash' | 'haiku' | 'sonnet' | 'opus';  // Max permitted model tier for this task
  token_ceiling_input?: int;          // Optional per-task input token limit
  token_ceiling_output?: int;         // Optional per-task output token limit
  conservation_reserve_pct: float;    // Reserve buffer for coordination overhead (recommended: 0.10–0.15)
}

type TaskState = 'SUBMITTED' | 'WORKING' | 'INPUT_REQUIRED' | 'AUTH_REQUIRED' |
                 'COMPLETED' | 'COMPLETED_WITH_ERRORS' | 'FAILED' | 'FAILED_TERMINAL' |
                 'TIMED_OUT' | 'CANCELED' | 'REJECTED';
```

**Missing fields from current ecosystem schemas [Confirmed]:** Correlation IDs, idempotency keys, and budget constraints are absent from all reviewed schemas (A2A, CrewAI, LangGraph, OpenAI Agents SDK) — they live in tracing infrastructure or environment config. The TaskEnvelope must carry all three to be governance-grade. Per [Mission 1 audit](workspace://syncrescendence-phase3-research-audit.pplx.md): "correlation IDs, schema versioning, and idempotency keys are load-bearing infrastructure across all twenty questions but are absent from every question's formulation."

---

#### ArtifactReceipt [grammar: receipt]

The durable, self-describing record of a completed (or failed) Task [grammar: commission]. Synthesized from [MCP CallToolResult](https://modelcontextprotocol.io/specification/2025-06-18/server/tools), [A2A Artifact schema](https://a2a-protocol.org/latest/specification/), [OTel GenAI spans](https://opentelemetry.io/docs/specs/semconv/gen-ai/), [Anthropic effective harnesses](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents): [Confirmed]

```typescript
interface ArtifactReceipt {
  // Identity (REQUIRED)
  receipt_id: string;                 // UUID
  task_id: string;                    // Backlink to TaskEnvelope
  trace_id: string;                   // OTel correlation ID — same as TaskEnvelope.trace_id
  idempotency_key: string;            // Echoed from TaskEnvelope; enables deduplication
  epoch: string;                      // Constitutional epoch

  // Outcome
  status: 'ACCEPTED' | 'REJECTED' | 'PARTIAL';
  is_error: boolean;                  // MCP-compatible isError flag
  error_type?: string;                // OTel error.type attribute
  error_message?: string;

  // Content
  content_type: string;               // MIME type
  content: Part[];                    // A2A-compatible Part array: text | bytes | url | data
  output_schema_version?: string;     // Version of output_schema against which content was validated

  // Provenance
  producing_agent: AgentID;
  produced_at: ISO8601;
  git_commit_hash: string;            // Content-addressed pointer to Episodic Ledger (PP-2 requirement)
  artifact_hash: string;              // SHA-256 of content; enables integrity verification

  // Cost accounting (REQUIRED — gap-fill Q4) [Confirmed]
  cost_ledger: CostLedgerEntry;

  // Cross-surface normalization fields (Doc 14)
  source_surface: 'cli' | 'web' | 'desktop' | 'protocol';  // Which surface produced this receipt
  normalized_at?: ISO8601;            // If receipt was normalized from heterogeneous format

  // Memory linkage (PP-2)
  memory_entry_ids?: string[];        // IDs of MemoryEntry records this receipt generated
}

interface CostLedgerEntry {
  input_tokens_consumed: int;
  output_tokens_consumed: int;
  reasoning_tokens_consumed?: int;    // Anthropic thinking tokens
  cached_tokens_read?: int;
  model_used: string;                 // Actual model (may differ from task's model_tier_max)
  estimated_cost_usd: float;
  budget_ceiling_usd: float;
  budget_remaining_usd: float;
  rollback_cost_not_recovered?: float;  // Non-zero if receipt is for a subsequently rolled-back task
}
```

**Three-layer receipt architecture [Confirmed]:** Production systems need receipts at transport (HTTP 200), application (task state → SUBMITTED), and business (COMPLETED + Artifact) layers. The ArtifactReceipt covers the business layer. The OTel `invoke_agent` span covers the transport + application layers. Per [Doc 07](workspace://07-receipt-acknowledgment-patterns-agent-orchestration-7.md): "a receipt implies accountability; a trace implies observability."

---

#### CalibrationCycleRecord [grammar: calibration cycle]

The structured record of an eval run [grammar: calibration cycle]. Per the [Mission 1 audit](workspace://syncrescendence-phase3-research-audit.pplx.md), "calibration cycle" maps to **eval run** / **regression trial** in ecosystem terminology. [Confirmed]

```typescript
interface CalibrationCycleRecord {
  cycle_id: string;
  trace_id: string;
  epoch: string;                      // Constitutional epoch of the grammar being evaluated
  
  // Eval configuration
  eval_type: 'regression' | 'ab_comparison' | 'golden_dataset' | 'adversarial';
  golden_dataset_version?: string;    // Reference dataset for regression comparison
  prompt_version_baseline: string;    // "Pre-grammar" version
  prompt_version_treatment?: string;  // "Grammar-aligned" version (null for baseline-only runs)

  // Participants
  orchestrator: AgentID;              // Always Commander (Claude Code)
  executors: AgentID[];               // 2-3 CLI agents: Codex, Gemini, Grok

  // Lifecycle
  started_at: ISO8601;
  completed_at?: ISO8601;
  status: TaskState;                  // Uses same TaskState enum

  // Results
  task_results: TaskResult[];         // Per-executor results
  aggregate_outcome: AggregateOutcome;
  cost_report: CostReport;           // Per-gap-fill Q4
  
  // Hermes shadow record (PP-1)
  hermes_observation_log?: string;    // Path to Hermes shadow-mode observation dump; NO active routing
}

interface CostReport {
  total_tokens_consumed: int;
  total_cost_usd: float;
  cost_by_agent: Record<AgentID, float>;
  cost_by_model: Record<string, float>;
  budget_ceiling_usd: float;
  budget_consumed_pct: float;
}
```

---

#### EscalationRequest

Typed escalation contract. Synthesized from [Doc 04 — Constitutional Limits](workspace://04-constitutional-limits-multi-agent-orchestration-4.md), [blind-spot audit P-10 HITL patterns](workspace://grammar-layer-blindspot-audit.pplx.md): [Confirmed]

```typescript
interface EscalationRequest {
  escalation_id: string;
  task_id: string;                    // Task [commission] triggering escalation
  trace_id: string;
  epoch: string;

  // Trigger classification
  trigger: EscalationTrigger;
  confidence_score?: float;           // Agent's confidence at time of escalation (0-1)
  escalation_threshold_exceeded?: float;  // Domain-specific: 0.80 general; 0.90 financial; 0.95 safety-critical

  // Content
  summary: string;                    // Compressed context for human reviewer
  options: EscalationOption[];        // Presented choices; prevents open-ended human burden
  blocking: boolean;                  // True = execution paused; false = async review while execution continues
  auto_resolve_after?: ISO8601;       // If unreviewed, apply default_resolution at this time

  // Accountability
  requesting_agent: AgentID;
  escalation_target: 'human' | 'commander' | 'adjudicator';  // Separation of Powers (SoP)
}

type EscalationTrigger =
  | 'CONFIDENCE_BELOW_THRESHOLD'
  | 'BUDGET_CEILING_APPROACHING'
  | 'NEGATIVE_ROUTING_LAW_HIT'
  | 'AUTH_REQUIRED'
  | 'WRITE_SCOPE_VIOLATION'
  | 'CONTRACT_VIOLATION'
  | 'DRIFT_THRESHOLD_EXCEEDED'
  | 'OPERATOR_REQUESTED';
```

---

#### DriftReport [grammar: delta metabolism signal]

Synthesized from [Doc 10 — Drift Detection](workspace://10-drift-detection-production-agent-systems-10.md), [Gap-Fill Q2 — Vocabulary Translation](workspace://gap-fill-q2-vocabulary-translation.md): [Confirmed]

```typescript
interface DriftReport {
  report_id: string;
  trace_id: string;
  epoch: string;

  // Drift classification
  drift_type: 'semantic' | 'coordination' | 'behavioral' | 'goal_role';
  drift_direction: 'degradation' | 'authorized_expansion' | 'unauthorized_expansion';
  // ⚠️ NOTE: drift_direction is a REQUIRED field because ecosystem "drift" is exclusively negative,
  // while grammar "delta metabolism" includes healthy capability throughput.
  // Omitting this field would conflate degradation with authorized growth. [Gap-Fill Q2]

  drift_magnitude: float;             // Normalized 0-1 against baseline
  baseline_metric: string;            // What metric is being compared
  measured_at: ISO8601;

  // Source
  detecting_agent: AgentID;
  affected_agents: AgentID[];

  // Action required
  severity: 'INFO' | 'WARNING' | 'CRITICAL';
  recommended_action: 'MONITOR' | 'CALIBRATE' | 'ESCALATE' | 'ROLLBACK';
}
```

---

### B.2 Standards to Align With

| Standard | Relevance | Maturity Status |
|---|---|---|
| **A2A Protocol v0.3** (Linux Foundation / AAIF) | Task object, Artifact schema, AgentCard; 50+ enterprise partners | Experimental (governance-ratified but spec evolving) |
| **MCP Specification 2025-06-18** (Anthropic) | CallToolResult as cross-surface receipt format; tool schema | Experimental |
| **OpenTelemetry GenAI Semantic Conventions** (CNCF) | `invoke_agent` + `execute_tool` spans as transport-layer receipts; `gen_ai.usage.*` attributes | Experimental — multi-agent coordination attributes (`gen_ai.task.*`, `gen_ai.team.*`) remain Proposal stage only ([OTel Issue #2664](https://github.com/open-telemetry/semantic-conventions/issues/2664)) |
| **Agent Contracts framework** (arXiv:2601.08815) | Formal resource-constraint model `C=(I,O,S,R,T,Φ,Ψ)`; budget conservation laws | Academic / Emerging |
| **W3C PROV-O** | Provenance attributes for artifact lineage | Ratified |
| **Conductor OSS task state machine** | Richest published terminal/non-terminal state taxonomy including `COMPLETED_WITH_ERRORS` | Production / Open-source |

**Critical gap in OTel [Confirmed]:** The official OTel spec has **no cost or budget attributes**. There is no `gen_ai.usage.cost`, `gen_ai.budget.*`, or equivalent. Per [Gap-Fill Q4](workspace://gap-fill-q4-budget-governance.md): cost tracking must be implemented in application code on top of the token count attributes. The `CostLedgerEntry` in ArtifactReceipt fills this gap for Syncrescendence's governance layer.

---

### B.3 Existing Grammar Coverage

| Component | Coverage | Notes |
|---|---|---|
| TaskEnvelope [commission] concept | **Partial** — LAYER-LAW.md Tier 3 names "commission" as a contract type but provides no typed schema | No field inventory, no lifecycle states, no budget fields |
| ArtifactReceipt [receipt] concept | **Partial** — artifact grammar document defines artifact classes (Canon, Specification, etc.) but as qualitative descriptors, not typed output contracts | No Pydantic-equivalent runtime validation |
| CalibrationCycleRecord concept | **Stub** — "calibration cycle" is named in the grammar but has no schema | No state machine, no cost attribution, no Hermes shadow fields |
| EscalationRequest | **None** — no escalation contract schema exists | Authority lattice defines WHO can approve; does not define WHEN/HOW to ask |
| DriftReport | **None** | Delta metabolism document describes drift conceptually but no typed report schema |
| Budget governance | **None** | Explicitly flagged as undefined in LAYER-LAW.md; "the proximate cause of documented $47,000+ production incidents" per [blind-spot audit](workspace://grammar-layer-blindspot-audit.pplx.md) |
| Idempotency keys | **None** | No idempotency concept in any of the 9 grammar documents |
| Schema versioning | **None** | Grammar documents are versioned individually; no cross-document schema version tracking |

**Overall Lane B Grammar Coverage: Partial** (contract types named; typed schemas, lifecycle states, budget fields, and idempotency all absent)

---

### B.4 Build Requirements

**Phase 3 Lane B Deliverables:**

1. **TaskEnvelope JSON Schema** — complete field inventory with required vs. optional classification; JSON Schema Draft 2020-12 format; includess BudgetEnvelope as required nested object
2. **ArtifactReceipt JSON Schema** — cross-surface normalized receipt with CostLedgerEntry; MCP CallToolResult-compatible content Part array
3. **CalibrationCycleRecord JSON Schema** — eval run record with Hermes shadow-mode observation log pointer; CostReport sub-object
4. **EscalationRequest JSON Schema** — typed escalation with EscalationTrigger enum; SoP-compatible escalation_target field
5. **DriftReport JSON Schema** — drift_direction field required to preserve delta metabolism polarity distinction
6. **TaskState state machine specification** — adopting Conductor OSS state taxonomy extended with `COMPLETED_WITH_ERRORS` and `FAILED_TERMINAL`; maps A2A interrupt states (`INPUT_REQUIRED`, `AUTH_REQUIRED`) as non-failure pause states
7. **Schema versioning protocol** — how schemas evolve; backward-compatibility rules; version field on all contracts
8. **Vocabulary translation manifest** — machine-readable mapping of grammar terms to ecosystem terms, embedded in each contract as a `grammar_term` annotation; implements the FIPA Ontology Agent pattern for internal vocabulary bridging

---

### B.5 Dependencies

- **Depends on Lane A:** EpochToken (all contracts carry epoch); BranchProtectionManifest (write_scope validation in TaskEnvelope); Git commit format (ArtifactReceipt.git_commit_hash)
- **Blocks Lane C:** Dispatch patterns require typed TaskEnvelope to self-claim
- **Blocks Lane D:** Observability requires ArtifactReceipt and DriftReport schemas
- **Blocks Lane E:** Rollback requires ArtifactReceipt artifact_hash for content-addressed recovery; EscalationRequest is the handoff primitive for trust boundary crossings

---

## Lane C: Coordination and Choreography

**Ecosystem mapping:** Dispatch patterns, concurrency management, pull-based task queues, Commander-centrism mitigation  
**Primary sources:** [Doc 02 — Dispatch/Concurrency](workspace://02-dispatch-concurrency-patterns-multi-agent-orchestration-2.md), [Gap-Fill Q3 — Commander-Centrism](workspace://gap-fill-q3-commander-centrism.md)

**⚠️ CRITICAL — Oracle Pressure Point PP-4:** The Commander-centrism risk is the most acute Phase 3 build risk. Evidence from [Kim et al. 2025 — arXiv:2512.08296](https://arxiv.org/html/2512.08296v1) (Google Research / MIT / Google DeepMind, 180 configurations across 3 LLM providers): hub-and-spoke centralized architecture produces **−50.4% performance on sequential planning** (PlanCraft); coordination overhead for centralized architecture = **285%** of single-agent baseline; maximum tolerable overhead for T=16 tool SWE environment = **150%** — nearly half the centralized overhead budget. The Claude Code → Codex CLI / Gemini CLI / Grok CLI pattern operates in the double-danger zone where both the tool-coordination trade-off (β = −0.330, p < 0.001) and capability ceiling (β = −0.408, p < 0.001) penalties apply simultaneously. [Confirmed]

---

### C.1 Primitives Required

| Primitive | Description | Source |
|---|---|---|
| **TaskQueue** | Shared append-only list of available (unclaimed) tasks; workers self-claim by atomic file-lock; Commander assigns only for security-classified or cross-worker dependency tasks | [Claude Code Agent Teams](https://code.claude.com/docs/en/agent-teams); [Doc 02](workspace://02-dispatch-concurrency-patterns-multi-agent-orchestration-2.md) |
| **DispatchPolicy** | Configuration object specifying which TaskEnvelope.task_type routes to which topology: `sequential` → single-agent path; `parallel_exploration` → multi-agent fan-out; `research` → MCO-style broadcast; `code_generation` → CAID-style async coroutine | [Kim et al. 2025 architecture selection rule (87% accuracy)](https://arxiv.org/html/2512.08296v1); [CAID — arXiv:2603.21489](https://arxiv.org/html/2603.21489v1) |
| **DependencyDAG** | Directed acyclic graph of task dependencies; validated before execution begins; must be acyclic (circular → caught at design time, not runtime); cyclic checks prevent deadlock | [CAID — arXiv:2603.21489](https://arxiv.org/html/2603.21489v1); [AgentNet — arXiv:2504.00587](https://arxiv.org/html/2504.00587v1) |
| **PeerMessageEnvelope** | Typed A2A-compatible message for direct worker-to-worker communication; Commander NOT in critical path for execution-detail coordination; must carry trace_id for OTel correlation | [A2A Protocol](https://a2a-protocol.org/latest/specification/); [Doc 02](workspace://02-dispatch-concurrency-patterns-multi-agent-orchestration-2.md) |
| **CoordinationOverheadMonitor** | Runtime metric tracking `C_coordination / C_execution` ratio per task; emits DriftReport when ratio > 0.50 (medium coupling threshold); triggers EscalationRequest when ratio > 0.68 (κ_break threshold) | [IJISRT 2026 coordination overhead analysis](https://www.ijisrt.com/assets/upload/files/IJISRT26MAR061.pdf); [Gap-Fill Q3](workspace://gap-fill-q3-commander-centrism.md) |
| **CommanderContextBudget** | Hard limit on Commander context window; compress at 75% utilization via `LLMSummarizingCondenser`; prevents Commander context saturation as the primary hub-and-spoke failure mode | [CAID — arXiv:2603.21489](https://arxiv.org/html/2603.21489v1); [Gap-Fill Q3](workspace://gap-fill-q3-commander-centrism.md) |
| **SelfVerificationContract** | Schema requiring workers to self-verify before marking complete; Commander receives only `{status, artifact_pointer, confidence_score}` — not full content; reads full artifact only on failure | [CAID — arXiv:2603.21489](https://arxiv.org/html/2603.21489v1); MAST FM-3.2/3.3 mitigation |

---

### C.2 Standards to Align With

| Standard | Relevance | Maturity Status |
|---|---|---|
| **A2A Protocol — Agent-to-Agent Communication** | PeerMessageEnvelope format; horizontal peer coordination without central broker | Experimental |
| **MCO dispatch modes** (mco-org/mco) | 5 dispatch modes: parallel, chain, debate, divide-by-files, divide-by-dimensions | Open-source / Production |
| **Claude Code Agent Teams** (self-claim queue) | Pull-based task claiming; file-lock concurrency; peer-to-peer messaging already implemented | Production (vendor-specific) |
| **CAID — Centralized Asynchronous Isolated Delegation** (arXiv:2603.21489) | +26.7% on PaperBench; async event loop; git worktrees; structured JSON; self-verification | Emerging (published March 2026) |
| **AgentNet** (arXiv:2504.00587) | DAG-based routing; dynamically evolving topology; NeurIPS 2025 | Emerging |
| **Kim et al. architecture selection rule** (arXiv:2512.08296) | 87% accurate prediction of optimal topology by task type | Confirmed / Academic |

---

### C.3 Existing Grammar Coverage

| Component | Coverage | Notes |
|---|---|---|
| Relay / dispatch | **None** — Tier 5 (Coordination and Event Choreography) is explicitly flagged as an open slot in LAYER-LAW.md | No node/edge primitive, no state schema that flows through execution steps |
| Pull-based dispatch | **None** — self-claim task queue mechanism not mentioned | Only push-based Commander-assigns pattern is implied |
| Peer-to-peer bypass | **None** | A2A-style horizontal coordination has no grammar equivalent |
| Task-type routing classifier | **None** | No mechanism for routing sequential tasks to single-agent path and parallel tasks to multi-agent path |
| Concurrency ceilings | **None** — Oracle brief specifically calls out "concurrency ceilings" as a required constitutional artifact (PP-4) | |
| Commander-centrism mitigations | **Partial** — Claude Code Agent Teams documentation references self-claim and peer messaging as optional features, but these are not constitutionally bound | "Optional features rather than binding constraints" per [Gap-Fill Q3](workspace://gap-fill-q3-commander-centrism.md) |
| Fan-out patterns | **None** | No typed fan-out dispatch schema; no merge/conflict resolution primitives |

**Overall Lane C Grammar Coverage: None to Stub** (highest priority lane for new specification work)

**⚠️ CONTRADICTION [Gap-Fill Q3]:** Kim et al. 2025 shows Centralized architecture is best at error containment (4.4× vs 17.2× for independent agents) on parallelizable tasks, yet worst (−50.4%) on sequential tasks. Going fully decentralized without verification checkpoints is WORSE than the current Commander design — independent agents amplify errors 17.2×. The counterweights must preserve Commander's error-containment function. **No single architecture choice resolves both simultaneously** — the hybrid pattern (task-type routing) is the only escape from this dilemma.

---

### C.4 Build Requirements

**Phase 3 Lane C Deliverables:**

1. **DispatchPolicy specification** — four task_type → topology routing rules with thresholds; adopts Kim et al. 87%-accuracy selection rule; includes single-agent bypass for sequential constraint-satisfaction tasks where single-agent baseline > 45%
2. **Pull-based dispatch constitutional rule** — elevated from "optional feature" to "binding constraint" in the authority lattice: *workers MUST self-claim from TaskQueue by default; Commander direct assignment is only permitted for security-classified tasks or those with explicit cross-worker dependencies*
3. **DependencyDAG schema + validation gate** — pre-execution acyclicity check; must run before any multi-agent TaskEnvelope is issued; circular dependency = rejected at dispatch with typed `REJECTED` state and EscalationRequest
4. **PeerMessageEnvelope schema** — A2A Message-compatible typed envelope for worker-to-worker coordination; Commander explicitly excluded from message routing path
5. **CoordinationOverheadMonitor specification** — metrics formula, thresholds, and escalation triggers; integrates with Lane D observability infrastructure
6. **CommanderContextBudget enforcement hook** — lane-level specification of compression trigger at 75% context utilization; specification of `LLMSummarizingCondenser` interface
7. **SelfVerificationContract schema** — required fields workers must populate before marking task COMPLETED; passes only `{status, artifact_pointer, confidence_score, self_verification_passed}` to Commander
8. **Separation of Powers (SoP) specification** — trifurcation of Commander authority into Legislation (grammar/objective setting), Execution (bounded task delegation), and Adjudication (independent verification); per [arXiv:2603.25100](https://arxiv.org/html/2603.25100v1) — "Logic Monopoly" prevention

---

### C.5 Dependencies

- **Depends on Lane A:** WorktreeIsolationPolicy (parallel agent isolation)
- **Depends on Lane B:** TaskEnvelope (dispatch requires typed commission); task_type field routes to topology; budget fields enforce CoordinationOverheadMonitor thresholds
- **Blocks Lane D:** CoordinationOverheadMonitor feeds into Lane D's drift detection pipeline
- **Partially blocked by Lane E:** Trust validation (per-worker authority scope) must be in place before pull-based dispatch can be made the constitutional default

---

## Lane D: Observability and Intervention

**Ecosystem mapping:** LLM observability stack, OTel GenAI spans, drift detection, budget circuit breakers, kill switch architecture  
**Primary sources:** [Doc 05 — Observability](workspace://05-minimal-viable-observability-stack-multi-agent-systems-5.md), [Doc 10 — Drift Detection](workspace://10-drift-detection-production-agent-systems-10.md), [Doc 11 — Intervention Models](workspace://11-intervention-models-production-multi-agent-systems-11.md), [Gap-Fill Q4 — Budget Governance](workspace://gap-fill-q4-budget-governance.md)

**PP-5 Integration [Confirmed]:** The subscription-OAuth zero-cost assumption is structurally invalid. Per [Gap-Fill Q5](workspace://gap-fill-q5-subscription-economics.md): Anthropic ToS §3.7 + Feb 20, 2026 explicit clarification bans OAuth tokens in any third-party tool or Agent SDK. An 11-avatar distributed cognition system must use API keys. Realistic optimized API cost: **$76–$440/month** depending on session density. Budget governance primitives in Lane D are therefore not optional observability features — they are economically load-bearing infrastructure.

---

### D.1 Primitives Required

| Primitive | Description | Source |
|---|---|---|
| **HealthSignal** | Periodic heartbeat emitted by each active agent; includes `agent_id`, `status`, `context_utilization_pct`, `budget_consumed_pct`, `last_task_id`, `timestamp`; absence for > TTL triggers intervention | [Doc 11](workspace://11-intervention-models-production-multi-agent-systems-11.md); [AutoGen lifecycle](https://microsoft.github.io/autogen/stable/user-guide/core-user-guide/core-concepts/agent-identity-and-lifecycle.html) |
| **OTelSpanContract** | Specification of required OTel attributes for every agent operation: `gen_ai.agent.id`, `gen_ai.agent.name`, `gen_ai.conversation.id` (= trace_id), `gen_ai.usage.input_tokens`, `gen_ai.usage.output_tokens`, `gen_ai.response.finish_reasons[]`, `error.type`; supplemented by community-adopted `gen_ai.usage.cost` | [OTel GenAI Semconv](https://opentelemetry.io/docs/specs/semconv/gen-ai/); [Doc 05](workspace://05-minimal-viable-observability-stack-multi-agent-systems-5.md) |
| **BudgetCircuitBreaker** | Three-state FSM (CLOSED → OPEN → HALF-OPEN) wrapping each agent call; triggers on: (1) budget_ceiling exceeded, (2) loop detection (`max_identical_calls: 5` within `window_seconds: 30`), (3) rate limit 429, (4) timeout; halt behaviors: `notify`, `halt`, or `require_approval` | [Gap-Fill Q4](workspace://gap-fill-q4-budget-governance.md); [SupraWall circuit breaker pattern](https://www.supra-wall.com/learn/how-to-set-token-limits-ai-agents) |
| **DriftDetectionPipeline** | Three-type drift monitoring: semantic drift (output alignment vs. golden dataset), coordination drift (handoff quality degradation), behavioral drift (unauthorized strategy emergence); emits DriftReport with severity classification | [Doc 10](workspace://10-drift-detection-production-agent-systems-10.md); [arXiv:2601.04170](https://arxiv.org/abs/2601.04170) |
| **KillSwitchHierarchy** | Three-level intervention taxonomy: (1) TaskInterrupt — pause specific task (LangGraph `interrupt()` equivalent); (2) AgentSuspend — suspend specific agent; (3) GatewayShutdown — full system halt via API gateway kill; each level requires different authorization in authority lattice | [Doc 11](workspace://11-intervention-models-production-multi-agent-systems-11.md) |
| **CostAttributionLedger** | Per-agent, per-task, per-model cost tracking; daily rollup; 50/80/100 alert thresholds; reset at midnight UTC; integrates with OTel `gen_ai.budget.daily_spend` community attribute | [Gap-Fill Q4](workspace://gap-fill-q4-budget-governance.md); [OneUptime OTel guide](https://oneuptime.com/blog/post/2026-02-06-track-token-usage-prompt-costs-model-latency-opentelemetry/view) |
| **ModelCascadePolicy** | Routing rules sending tasks to cheapest qualifying model; escalates to more expensive model only on quality gate failure; Syncrescendence tier: Haiku/Flash (dispatch) → Sonnet (execution) → Opus (complex reasoning/Oracle) | [Gap-Fill Q4](workspace://gap-fill-q4-budget-governance.md); [CascadeFlow](https://github.com/lemony-ai/cascadeflow) (69% cost savings on MT-Bench) |
| **ProviderFailoverChain** | API gateway fallback: Primary (Anthropic Sonnet/Opus) → Fallback 1 (OpenAI GPT-5/4.1) → Fallback 2 (Google Gemini Flash/Pro) → Fallback 3 (local via Ollama); implemented via LiteLLM proxy | [Gap-Fill Q5](workspace://gap-fill-q5-subscription-economics.md); [LiteLLM](https://github.com/BerriAI/litellm) |

---

### D.2 Standards to Align With

| Standard | Relevance | Maturity Status |
|---|---|---|
| **OpenTelemetry GenAI Semantic Conventions** | Transport layer for all agent telemetry | **Experimental** — major gap: no official cost/budget attributes |
| **OpenInference** (Arize AI) | Richer supplemental convention; agent run, LLM span, retrieval span types | Emerging |
| **Langfuse** (open-source) | Trace storage + cost attribution + prompt versioning; recommended for Wave Zero | Production / Open-source |
| **Braintrust** | Evaluation harness with regression gate CI/CD integration; recommended for CalibrationCycleRecord scoring | Production |
| **Arize Phoenix** | Local observability for offline eval; no cloud dependency | Production / Open-source |
| **LiteLLM** | Provider-agnostic API gateway; budget enforcement per agent; failover chains | Production / Open-source |
| **SupraWall** | Third-party budget enforcement wrapper (fills the gap that no native framework provides) | Production (commercial) |
| **OWASP Agent Observability Standard (AOS)** | Audit-trail receipt standard: hierarchical spans with `agent.run` → turn → step structure | Emerging |
| **Palisade Research findings** | Frontier models (GPT-5, Grok 4, Gemini 2.5 Pro) actively resist shutdown in some settings; system-prompt safety instructions can backfire [Doc 11](workspace://11-intervention-models-production-multi-agent-systems-11.md) | **Emerging — requires architectural response** |

**⚠️ CRITICAL GAP [Confirmed]:** OTel GenAI multi-agent coordination attributes (`gen_ai.task.*`, `gen_ai.team.*`) remain Proposal stage only ([OTel GitHub Issue #2664](https://github.com/open-telemetry/semantic-conventions/issues/2664)). Any system built on these standards is building on a moving foundation. Phase 3 must track the proposal status and pin to a specific OTel spec version.

---

### D.3 Existing Grammar Coverage

| Component | Coverage | Notes |
|---|---|---|
| Observability layer (Tier 6) | **None** — explicitly flagged as open slot in LAYER-LAW.md | No Trace primitive, no Span type, no correlation ID |
| Drift detection | **Stub** — delta metabolism document describes drift conceptually | No measurement framework, no threshold specification, no DriftReport schema |
| Kill switches | **None** | No circuit breaker, no interrupt mechanism, no gateway shutdown |
| Budget governance | **None** | Explicitly acknowledged gap in LAYER-LAW.md |
| Health monitoring | **None** | No HealthSignal primitive, no heartbeat concept |
| Cost attribution | **None** | No CostAttributionLedger; no per-agent cost tracking |

**Overall Lane D Grammar Coverage: None to Stub** (second-highest priority for new specification work, tied with Lane C)

---

### D.4 Build Requirements

**Phase 3 Lane D Deliverables:**

1. **OTelSpanContract specification** — required attributes for every agent operation; community-adopted cost attributes included; version-pinned to OTel spec; tracks [Issue #2664](https://github.com/open-telemetry/semantic-conventions/issues/2664) progress
2. **BudgetCircuitBreaker state machine** — CLOSED/OPEN/HALF-OPEN FSM with loop detection; three halt behaviors with authority lattice authorization requirements for `require_approval` vs. `halt`
3. **CostAttributionLedger schema** — per-agent + per-task + per-model tracking; 50/80/100 alert pattern; daily reset; rollback accounting rule (token costs irrecoverable; `rollback_cost_not_recovered` field explicitly non-zero for rolled-back tasks)
4. **DriftDetectionPipeline specification** — three drift types with measurement formulas; Agent Stability Index (ASI) integration; threshold calibration for semantic/coordination/behavioral dimensions
5. **KillSwitchHierarchy specification** — three levels with authority lattice authorization requirements; addresses Palisade Research finding that model-internal safety instructions can backfire (structural enforcement required, not prompt-level)
6. **ModelCascadePolicy specification** — tier routing rules; quality gate thresholds; escalation trigger conditions
7. **ProviderFailoverChain configuration** — LiteLLM-based gateway spec; per-agent budget caps; provider-agnostic interface to prevent lock-in
8. **HealthSignal schema** — heartbeat format; absence detection TTL; intervention trigger thresholds
9. **Minimum Viable Observability (MVO) stack selection** — ratified choice of: Langfuse (trace storage + cost) + Braintrust (eval scoring) + OTel (transport); or Phoenix (offline-only alternative for Wave Zero)

---

### D.5 Dependencies

- **Depends on Lane A:** ReconciliationLoop interface (DriftDetectionPipeline integrates with it); Git commit format (CostAttributionLedger uses commit hashes as anchors)
- **Depends on Lane B:** ArtifactReceipt (CostLedgerEntry feeds CostAttributionLedger); DriftReport (emitted into observation pipeline); EscalationRequest (BudgetCircuitBreaker triggers escalation)
- **Depends on Lane C:** CoordinationOverheadMonitor output feeds DriftDetectionPipeline
- **Blocks Lane E:** KillSwitchHierarchy authority requirements are defined in terms of Lane E trust levels

---

## Lane E: Trust, Reversibility, and Escalation

**Ecosystem mapping:** Agent-to-agent trust hierarchy, delegation chains, rollback patterns, saga/compensating transactions, human-to-protocol transition  
**Primary sources:** [Doc 03 — Trust/Auth](workspace://03-trust-authorization-models-multi-agent-systems-3.md), [Doc 12 — Rollback](workspace://12-rollback-reversibility-patterns-multi-agent-orchestration-12.md), [Doc 15 — Human-to-Protocol Transition](workspace://15-failure-modes-human-to-protocol-transition-15.md), [Gap-Fill Q1 — Memory Taxonomy](workspace://gap-fill-q1-memory-taxonomy.md)

**PP-1 Integration [Confirmed]:** Hermes Agent is in shadow-mode during Wave Zero. The first calibration cycle [grammar: calibration cycle] is the sole unadulterated pre-constitutional traffic corpus. Any live routing or skill promotion by Hermes before the grammar-aligned ArtifactReceipt normal form exists injects second-order learning artifacts. The [Oracle brief](workspace://turn-40-SYNTHESIS-oracle-adversarial-brief.md) is explicit: "passive ingestion produces summarization but no skill promotion or self-nudging. No credible middle ground survives." Lane E must encode the shadow-mode boundary as a typed AuthBoundary in the trust model — not a soft preference.

---

### E.1 Primitives Required

| Primitive | Description | Source |
|---|---|---|
| **AgentIdentity** | Compound identifier: `{agent_type, agent_key, trust_tier}`; `agent_type` = one of `{commander, codex-cli, gemini-cli, grok-cli, hermes-shadow, hermes-active}`; `trust_tier` = T1 (untrusted) → T4 (constitutional) | [Doc 03](workspace://03-trust-authorization-models-multi-agent-systems-3.md); [AutoGen agent identity model](https://microsoft.github.io/autogen/stable/user-guide/core-user-guide/core-concepts/agent-identity-and-lifecycle.html) |
| **DelegationChain** | Ordered list of `{delegator, delegatee, scope, authority_scope, issued_at, expires_at}`; models how authority flows from human → Commander → worker agents; conservation law: delegatee scope ⊆ delegator scope | [Gap-Fill Q2](workspace://gap-fill-q2-vocabulary-translation.md); [DIF Trusted AI Agents Working Group](https://blog.identity.foundation/building-ai-trust-at-scale-4/) |
| **AuthBoundary** | Named, typed boundary that an agent must present credentials to cross; types: `{write_scope, model_tier, trust_tier, constitutional_document}`; crossing without authorization generates EscalationRequest of type `AUTH_REQUIRED` | [Doc 03](workspace://03-trust-authorization-models-multi-agent-systems-3.md); [OWASP Agentic Top 10](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/) |
| **HermesBoundary** | Special AuthBoundary encoding the shadow/active distinction for the Hermes Learning Runtime; while `status = shadow`, Hermes has: read access to all artifacts, write access to observation_log only, NO access to TaskQueue, NO authority to issue TaskEnvelopes or modify MemoryEntry records | [Oracle brief PP-1](workspace://turn-40-SYNTHESIS-oracle-adversarial-brief.md); [Doc 06 — Skill Promotion](workspace://06-skill-promotion-ladders-self-improving-agent-systems-6.md) |
| **RollbackCheckpoint** | Named snapshot of complete system state at a specific git commit; includes `{commit_hash, epoch, active_task_ids, memory_state_hash, circuit_breaker_states}`; the target for a rollback operation | [Doc 12](workspace://12-rollback-reversibility-patterns-multi-agent-orchestration-12.md); [SSGM arXiv:2603.11768](https://arxiv.org/abs/2603.11768) |
| **CompensatingAction** | Typed record of a compensating transaction (saga pattern) for a rolled-back task; covers external side effects (file writes, API calls) but NOT API token costs (irrecoverable); `{original_task_id, compensated_effects[], executed_at, token_cost_not_recovered}` | [Doc 12](workspace://12-rollback-reversibility-patterns-multi-agent-orchestration-12.md); [Temporal saga pattern](https://temporal.io/blog/mastering-saga-patterns-for-distributed-transactions-in-microservices) |
| **SkillPromotionGate** | Typed gate in the promotion ladder [grammar: promotion ladder]; four stages: ObservedPattern → CandidateSkill → ValidatedSkill → AuthorizedSkill; each stage transition requires explicit gate evaluation; no stage can be skipped; Hermes in shadow mode cannot advance past ObservedPattern stage | [Doc 06](workspace://06-skill-promotion-ladders-self-improving-agent-systems-6.md); [ARISE — arXiv:2603.16060](https://arxiv.org/html/2603.16060v1) |
| **NegativeRoutingLaw** [grammar: negative routing law] | Machine-enforceable hard gate; NOT a prompt instruction; typed as `{law_id, prohibited_action_class, enforcement_layer, override_requirements}`; enforcement_layer must be `infrastructure` or `tool_layer` — prompt-level enforcement is categorically insufficient per [Doc 03](workspace://03-trust-authorization-models-multi-agent-systems-3.md) | [Doc 04](workspace://04-constitutional-limits-multi-agent-orchestration-4.md); [Simon Willison lethal trifecta](https://simonw.substack.com/p/the-lethal-trifecta-for-ai-agents) |

---

### E.2 Standards to Align With

| Standard | Relevance | Maturity Status |
|---|---|---|
| **OWASP Agentic Top 10 (2026)** | Agent-to-agent trust, least-agency constraints, zero-trust continuous verification | Ratified (OWASP, 2026) |
| **A2A Security Model** (Google/AAIF) | AgentCard as cryptographic capability declaration; OAuth 2.0 + API key authentication schemes | Experimental |
| **W3C Verifiable Credentials (VC) + DIDs** | Cryptographic agent identity portable across organizational boundaries; formal standard for DelegationChain | Ratified (W3C) |
| **ZCAP-LD** | Linked Data capability-based authorization; formal model for authority lattice (closest to lattice semantics) | Draft / Emerging |
| **IETF WIMSE** | Workload Identity and Multi-Service Environments; cross-boundary workload auth | In progress |
| **ESAA (Event-Sourced Agent Architecture)** | Memory and state rollback via event sourcing; each agent action = an event; rollback = re-play to prior event | [Doc 12](workspace://12-rollback-reversibility-patterns-multi-agent-orchestration-12.md) — Emerging |
| **SagaLLM** | LLM-native saga pattern implementation; typed compensating transactions per step | [Doc 12](workspace://12-rollback-reversibility-patterns-multi-agent-orchestration-12.md) — Emerging |
| **ReAgent (minimal conflict sets)** | Identifies minimum set of agent actions that, if reversed, restore consistent state; avoids over-rollback | [Doc 12](workspace://12-rollback-reversibility-patterns-multi-agent-orchestration-12.md) — Emerging |
| **PROV-AGENT** | W3C PROV extended for agent provenance; entity + activity + agent relationships | Emerging |

---

### E.3 Existing Grammar Coverage

| Component | Coverage | Notes |
|---|---|---|
| Authority lattice (Tier 9) | **Partial** — 9 grammar documents include authority lattice defining decision authority per tier | Does NOT cover agent-to-agent trust, capability discovery, least-agency constraints, or zero-trust continuous verification per [blind-spot audit](workspace://grammar-layer-blindspot-audit.pplx.md) |
| Negative routing laws | **Partial** — named in grammar; referenced as absolute constraints | Not machine-enforceable as specified; exist as prompt instructions rather than infrastructure-layer gates |
| Promotion ladder | **Partial** — conceptual framework exists | No typed four-stage schema with hard gates; Hermes shadow boundary not defined as typed AuthBoundary |
| Rollback / reversibility | **None** — grammar's reversibility gate is a constitutional principle, not an operational primitive | No RollbackCheckpoint schema, no CompensatingAction, no saga pattern |
| Agent-to-agent trust | **None** — grammar models human-to-agent delegation; agent-to-agent trust is architecturally silent | "The grammar was designed for a Commander-dispatches-avatar model; the production ecosystem has built a peer-delegation model" per [blind-spot audit](workspace://grammar-layer-blindspot-audit.pplx.md) |
| Memory rollback (PP-2) | **None** — no typed rollback primitive for memory state | SSGM dual-track (MAG + episodic ledger) is not yet formalized in the grammar |

**Overall Lane E Grammar Coverage: Partial** (authority lattice exists but covers only human-to-agent direction; agent-to-agent, rollback, and memory governance are None)

---

### E.4 Build Requirements

**Phase 3 Lane E Deliverables:**

1. **AgentIdentity schema** — compound identifier with trust_tier taxonomy (T1–T4); lifecycle states (UNREGISTERED → REGISTERED → ACTIVE → IDLE → SHUTDOWN) per [AutoGen lifecycle model](https://microsoft.github.io/autogen/stable/user-guide/core-user-guide/core-concepts/agent-identity-and-lifecycle.html)
2. **DelegationChain schema** — ordered delegation record with scope attenuation guarantee; human → Commander → worker hierarchy explicitly encoded
3. **AuthBoundary registry** — named boundaries in machine-readable format; enforcement_layer required field preventing downgrade to prompt-level enforcement
4. **HermesBoundary specification** — typed, enforced shadow/active boundary; explicit list of permissions in shadow mode (read-only observation); explicit list of prohibitions (TaskQueue access, TaskEnvelope issuance, MemoryEntry writes); transition criteria to active mode
5. **NegativeRoutingLaw registry** — five absolute constraints from authority lattice elevated to machine-enforceable infrastructure gates; each carries `enforcement_layer: 'infrastructure' | 'tool_layer'`
6. **RollbackCheckpoint schema** — snapshot specification; content-addressed with git commit hash; triggers for automatic checkpoint creation (every TaskEnvelope completion, every CalibrationCycleRecord, every EscalationRequest resolution)
7. **CompensatingAction schema** — typed saga pattern record; explicitly distinguishes reversible external side effects from irrecoverable token costs; `token_cost_not_recovered` field required
8. **SkillPromotionGate specification** — four-stage ladder with explicit gate criteria; Hermes boundary enforcement at ObservedPattern stage; human approval required for ValidatedSkill → AuthorizedSkill transition
9. **Memory rollback specification** — SSGM dual-track (MAG + K_ledger) formally mapped onto Git substrate; reconciliation trigger criteria from CalibrationCycleRecord outcomes
10. **Agent-to-agent trust extension of authority lattice** — extends existing lattice from human-delegation-only to peer-delegation model; adds A2A AgentCard as the runtime capability declaration primitive

---

### E.5 Dependencies

- **Depends on Lane A:** Git commit format as Episodic Ledger (K_ledger) — required for RollbackCheckpoint content-addressing; BranchProtectionManifest enforces NegativeRoutingLaw write-scope constraints
- **Depends on Lane B:** TaskEnvelope (DelegationChain is the authorization provenance for each task); ArtifactReceipt (artifact_hash enables content-addressed rollback); EscalationRequest (AUTH_REQUIRED trigger)
- **Depends on Lane D:** KillSwitchHierarchy (defines authorization requirements for SkillPromotionGate and CompensatingAction)
- **Blocks nothing** — Lane E is terminal in the dependency chain; all other lanes must be partially built before E can be fully specified

---

## Build-Order Dependency Graph

### Dependency Matrix

```
Lane A ──────────────────────────────────────────────────────► Blocks: B, C, D, E
Lane B ─────────────────────────────────────────────────────► Blocks: C, D, E
                                         Depends on: A
Lane C ──────────────────────────────────────────────────────► Blocks: D (partial)
                                         Depends on: A (full), B (full)
Lane D ──────────────────────────────────────────────────────► Blocks: E (partial)
                                         Depends on: A, B, C
Lane E ──────────────────────────────────────────────────────► Blocks: nothing
                                         Depends on: A, B, D (KillSwitchHierarchy)
                                         C is a soft dependency (not hard-blocking)
```

**Critical Path:** A → B → C → D → E  
**Maximum Parallel Paths:** A alone in Wave Zero; B+E(partial) in parallel after A; C+D in parallel after B

---

### Wave Sequencing

#### Wave Zero (Pre-Calibration — Must Complete Before First Eval Run)

**Objective:** Establish the minimum viable substrate that makes the first calibration cycle [grammar: calibration cycle] safe and the evidence non-ephemeral.

**Rationale:** Per [Oracle PP-2](workspace://turn-40-SYNTHESIS-oracle-adversarial-brief.md) (confidence 90): "the cycle *generates* the evidence that needs storage; deferral forces oral-tradition scaffolding." Per [Gap-Fill Q1](workspace://gap-fill-q1-memory-taxonomy.md): coordination failures compound 17× without inter-agent verification; systems that launched without memory strategy report exactly this debt.

| Deliverable | Lane | Priority |
|---|---|---|
| `EPOCH-STATE.md` specification | A | Critical |
| `BranchProtectionManifest` schema | A | Critical |
| Git commit message format standard (Episodic Ledger entry format) | A | Critical |
| Memory taxonomy overlay document | A | Critical — PP-2 |
| `WorktreeIsolationPolicy` specification | A | High |
| **TaskEnvelope JSON Schema** (with BudgetEnvelope) | B | Critical |
| **ArtifactReceipt JSON Schema** (with CostLedgerEntry) | B | Critical |
| **CalibrationCycleRecord JSON Schema** (with Hermes shadow fields) | B | Critical |
| **TaskState state machine** | B | Critical |
| Schema versioning protocol | B | High |
| **HermesBoundary specification** (PP-1 enforcement) | E | Critical — PP-1 |
| **NegativeRoutingLaw registry** (machine-enforceable gates) | E | Critical |
| Minimum viable memory substrate: working context + episodic ledger + semantic core | A+E | Critical — PP-2 |
| **BudgetCircuitBreaker state machine** | D | Critical — PP-5 |
| **ProviderFailoverChain configuration** (LiteLLM gateway) | D | Critical — PP-5 |
| **HealthSignal schema** | D | High |
| Pull-based dispatch constitutional rule | C | High — PP-4 |
| **DependencyDAG schema + validation gate** (deadlock prevention) | C | High — PP-4 |

---

#### Wave 1 (Operational Contracts — After First Calibration Cycle)

**Objective:** Formalize all five typed contracts; harden coordination against Commander-centrism; activate drift detection.

| Deliverable | Lane | Priority |
|---|---|---|
| **EscalationRequest JSON Schema** | B | Critical |
| **DriftReport JSON Schema** | B | Critical |
| Vocabulary translation manifest | B | High |
| **DispatchPolicy specification** (task-type routing) | C | Critical — PP-4 |
| **PeerMessageEnvelope schema** | C | High |
| **CoordinationOverheadMonitor specification** | C | High — PP-4 |
| **SelfVerificationContract schema** | C | High |
| **OTelSpanContract specification** | D | Critical |
| **DriftDetectionPipeline specification** | D | High |
| **CostAttributionLedger schema** | D | High |
| **KillSwitchHierarchy specification** | D | High |
| **ModelCascadePolicy specification** | D | High |
| **AgentIdentity schema** | E | High |
| **DelegationChain schema** | E | High |
| **AuthBoundary registry** | E | High |
| **RollbackCheckpoint schema** | E | High |

---

#### Wave 2 (Full Trust and Reversibility — After Stable Calibration Baseline)

**Objective:** Complete the trust model extension for agent-to-agent coordination; formalize rollback and saga patterns; specify SkillPromotionGate.

| Deliverable | Lane | Priority |
|---|---|---|
| **Separation of Powers (SoP) specification** | C | High |
| **CommanderContextBudget enforcement hook** | C | Medium |
| MVO stack ratification (Langfuse + Braintrust + OTel) | D | High |
| **CompensatingAction schema** | E | High |
| **SkillPromotionGate specification** | E | High |
| **Memory rollback specification** (SSGM dual-track) | E | High |
| **Agent-to-agent trust extension** of authority lattice | E | High |
| ReconciliationLoop interface contract | A | Medium |
| ConstitutionalDocumentStore access policy | A | Medium |
| W3C VC + DID integration for DelegationChain | E | Medium — [Emerging] |

---

#### Wave 3 (Steady State — Phase 4 Metabolism Preparation)

**Objective:** Activate Hermes from shadow to adviser mode; establish promotion ladder gates for capability escalation; complete budget optimization.

| Deliverable | Lane | Priority |
|---|---|---|
| HermesBoundary transition criteria (shadow → adviser) | E | High |
| Full SkillPromotionGate with four validated stages | E | High |
| CodeCRDT / CRDT coordination integration (optional) | A | Medium — [Emerging] |
| Token auction budget allocation (optional) | D | Low — [Emerging] |
| A2A AgentCard publication for each Syncrescendence agent | E | Medium |
| BAMAS cost optimization integration | D | Low — [Emerging] |

---

### Critical Path Diagram

```
WAVE ZERO
┌─────────────────────────────────────────────────────────────────────┐
│  Lane A: EpochToken + BranchProtection + Episodic Ledger Format      │
│  Lane B: TaskEnvelope + ArtifactReceipt + CalibrationCycleRecord     │
│  Lane E: HermesBoundary + NegativeRoutingLaw registry (hard gates)   │
│  Lane D: BudgetCircuitBreaker + ProviderFailoverChain               │
│  Lane C: Pull-dispatch rule + DependencyDAG gate                    │
└──────────────────────────────┬──────────────────────────────────────┘
                               │ First calibration cycle safe to run
                               ▼
WAVE 1
┌─────────────────────────────────────────────────────────────────────┐
│  Lane B: EscalationRequest + DriftReport                            │
│  Lane C: DispatchPolicy + CoordinationOverheadMonitor               │
│  Lane D: OTelSpanContract + DriftDetectionPipeline + CostLedger     │
│  Lane E: AgentIdentity + DelegationChain + AuthBoundary             │
└──────────────────────────────┬──────────────────────────────────────┘
                               │ Calibration baseline established
                               ▼
WAVE 2
┌─────────────────────────────────────────────────────────────────────┐
│  Lane C: Separation of Powers specification                         │
│  Lane D: MVO stack ratification                                     │
│  Lane E: CompensatingAction + SkillPromotionGate + memory rollback  │
│  Lane A: ReconciliationLoop + ConstitutionalDocumentStore policy    │
└──────────────────────────────┬──────────────────────────────────────┘
                               │ Trust model complete; rollback safe
                               ▼
WAVE 3 (Phase 4 preparation)
┌─────────────────────────────────────────────────────────────────────┐
│  Lane E: Hermes shadow → adviser transition                         │
│  Lane E: A2A AgentCard publication                                  │
│  Lane D: Full budget optimization stack                             │
└─────────────────────────────────────────────────────────────────────┘
```

**Critical path:** Lane A (Wave Zero) → Lane B (Wave Zero) → Lane C/D (Wave 1) → Lane E (Wave 2) → Hermes active (Wave 3)

**Parallel paths safe to start simultaneously in Wave Zero:** Lane D (BudgetCircuitBreaker, ProviderFailoverChain) + Lane E (HermesBoundary, NegativeRoutingLaw) can begin immediately after Lane A is committed, without waiting for Lane B to complete.

---

## Cross-Lane Structural Findings

### Finding 1: The Grammar Layer Has No Agent-to-Agent Coordination Vocabulary [Confirmed]

The grammar was designed for a Commander-dispatches-avatar model. The production ecosystem has converged on a peer-delegation model with cryptographic identity, typed state machines, and zero-trust continuous verification. Per the [blind-spot audit](workspace://grammar-layer-blindspot-audit.pplx.md): "Four of the seven structural assumptions tested in Dimension 5 are contradicted at high severity, and three of those four contradictions involve precisely this agent-to-agent coordination gap." Phase 3 must add Lane E's agent-to-agent trust extension as a first-class deliverable — not a post-hoc retrofit.

### Finding 2: Budget Governance Is Not Optional Observability [Confirmed]

Every major framework (LangChain, CrewAI, AutoGen) lacks native cumulative spend tracking. Per [Gap-Fill Q4](workspace://gap-fill-q4-budget-governance.md): "there are no built-in hard limits or budget controls, which can result in unexpected charges of $5k–$10k in a month when something goes awry." The $47,000+ documented runaway-loop incidents are not corner cases — they are the expected failure mode of a system without budget governance primitives. BudgetEnvelope on TaskEnvelope and CostLedgerEntry on ArtifactReceipt are Wave Zero requirements.

### Finding 3: "Multi-agent coordination is the unsolved layer" [Confirmed]

Per [Mission 1 audit](workspace://syncrescendence-phase3-research-audit.pplx.md): "every current tool and protocol solves single-agent governance. Multi-agent write coordination, multi-agent consistent rollback, cross-agent trust delegation, and coordinated drift detection all lack production-grade implementations." Phase 3 is not building on a solved problem — it is building the missing layer. This means the primitives specified here will in many cases be ahead of available OSS implementations, and must be designed for future adoption of emerging standards (ESAA, ReAgent, SagaLLM) without requiring re-architecture.

### Finding 4: The Subscription-OAuth Path Is Permanently Closed [Confirmed]

Per [Gap-Fill Q5](workspace://gap-fill-q5-subscription-economics.md): Anthropic ToS §3.7 + February 20, 2026 enforcement action permanently closes consumer OAuth routing for automated multi-agent systems. The realistic optimized API cost for the Syncrescendence system at production intensity is **$80–$440/month** with caching + model routing + batch processing — within the range of 1–2 Max subscriptions that are themselves legally unusable for this deployment pattern. The ProviderFailoverChain (Lane D, Wave Zero) must be built before the first calibration cycle.

### Finding 5: ⚠️ CONTRADICTION — Error Containment vs. Coordination Overhead [Confirmed, unresolved]

Per [Gap-Fill Q3](workspace://gap-fill-q3-commander-centrism.md): Kim et al. 2025 (arXiv:2512.08296) shows Centralized architecture produces the best error containment (4.4× amplification vs. 17.2× for independent agents) but the worst sequential planning performance (−50.4% on PlanCraft). Going fully decentralized is worse than the current Commander design for error-prone workloads. The hybrid pattern (task-type routing via DispatchPolicy) is the only architectural escape. **Phase 3 must not resolve this contradiction by eliminating the Commander** — it must resolve it by routing sequentially-dependent tasks to single-agent execution while routing parallel exploration tasks to multi-agent fan-out.

### Finding 6: OTel Standards Are Moving Foundation [Confirmed]

OTel GenAI Semantic Conventions remain Experimental. Multi-agent coordination attributes (`gen_ai.task.*`, `gen_ai.team.*`) exist only as proposals ([OTel GitHub Issue #2664](https://github.com/open-telemetry/semantic-conventions/issues/2664)). The OTelSpanContract deliverable (Lane D, Wave 1) must pin to a specific OTel spec version and include a monitoring mechanism for standard evolution.

---

## Summary Table: Lane Coverage vs. Build Priority

| Lane | Grammar Coverage | Phase 3 Priority | Wave Zero Deliverables | Wave 1 Deliverables | Critical Path? |
|---|---|---|---|---|---|
| **A: Shared Substrate** | Partial | CRITICAL | EpochToken, BranchProtection, Episodic Ledger, Memory taxonomy overlay | ReconciliationLoop, ConstitutionalDocumentStore policy | YES — blocks all |
| **B: Operational Contracts** | Partial | CRITICAL | TaskEnvelope, ArtifactReceipt, CalibrationCycleRecord, TaskState machine | EscalationRequest, DriftReport | YES — blocks C, D, E |
| **C: Coordination** | None/Stub | CRITICAL (PP-4) | Pull-dispatch rule, DependencyDAG gate | DispatchPolicy, PeerMessageEnvelope, CoordinationOverheadMonitor | Parallel to D after B |
| **D: Observability** | None/Stub | CRITICAL (PP-5) | BudgetCircuitBreaker, ProviderFailoverChain, HealthSignal | OTelSpanContract, DriftPipeline, CostLedger, KillSwitch | Parallel to C after B |
| **E: Trust/Reversibility** | Partial | HIGH | HermesBoundary (PP-1), NegativeRoutingLaw registry | AgentIdentity, DelegationChain, AuthBoundary, RollbackCheckpoint | Terminal — no outbound blocks |

---

*Document compiled from: [Syncrescendence Phase 3 Research Audit](workspace://syncrescendence-phase3-research-audit.pplx.md) (733 lines, 182 URLs), [Grammar Layer Blind-Spot Audit](workspace://grammar-layer-blindspot-audit.pplx.md) (736 lines, 156 URLs), 15 primary research documents (Docs 01–15), Gap-Fill Q1–Q5, and [Oracle Adversarial Brief](workspace://turn-40-SYNTHESIS-oracle-adversarial-brief.md). All inline citations link to primary sources. Contradictions preserved; not resolved.*
