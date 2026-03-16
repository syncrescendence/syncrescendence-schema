# SCAFFOLD-OPENCLAW.md

**Class:** Enduring descriptive scaffold | **Species:** Surface scaffold
**Scope:** OpenClaw as a daemon/runtime surface — its persistence architecture, autonomy model, dispatch and task primitives, execution environment, identity and accountability framework, economic model, self-reporting apparatus, trust boundaries, and extensibility. Covers: OpenClaw's design as a fully autonomous daemon with persistent identity, economic self-sustainability, market-based swarm coordination, and hardware embodiment potential. Excludes: OpenClaw's coding-harness convergent primitives (those remain in harness-taxonomy.md's convergent zone, shared with all five coding harnesses), and any prescriptive institutional role assignment.
**Modality class:** Daemon / runtime surfaces | **Surface slug:** `openclaw`
**Authority level:** 1-curated | **Lifecycle:** Active
**Upstream:** harness-taxonomy.md § 6 (evidence source — reclassified from coding-harness divergent zone); DAEMON-RUNTIME-CLASS-OPENING.md (axis set); PRE-BUILD-MEMO-4-RUNTIME-MODALITY.md (classification rationale); LAYER-LAW.md § 4
**Downstream:** Future daemon/runtime layer scaffold; future teleological manual
**Freshness threshold:** High-ρ (FRESH < 7 days, CURRENT < 21 days, AGING < 60 days, STALE ≥ 60 days). Agent capabilities and design targets evolve rapidly.
**Last updated:** 2026-03-14
**Production method:** Dossier-to-scaffold conversion at Level 2, DELEGATED. Evidence reclassified from harness-taxonomy.md § 6 into daemon/runtime-specific axes.
**Evidence base:** harness-taxonomy.md § 6 (OpenClaw idiosyncrasies, ~25 identified primitives, observed 2026-03); OpenClaw research directive (original source for harness-taxonomy evidence); PRE-BUILD-MEMO-4 (classification analysis)
**Reclassification note:** OpenClaw was originally documented as one of six coding harnesses. PRE-BUILD-MEMO-4 determined that its defining primitives are "not coding-harness primitives" and that its "primary function is autonomous operational agency, not code authorship." This scaffold reclassifies the daemon/runtime-specific evidence into the correct modality class. OpenClaw's shared coding-harness convergent primitives (MCP connection, skills, instruction-file cascade, etc.) remain documented in harness-taxonomy.md's convergent zone and are not duplicated here — they describe OpenClaw's coding sub-capability, not its daemon identity.

---

## Axis 1 — Persistence and Session Architecture

**`[openclaw:heartbeat-md]`** The primary operational status file: a periodic update document tracking active tasks, economic ledger status, health indicators, and upcoming decisions. HEARTBEAT.md is written by the agent for the human operator — the agent maintains its own status dashboard. This is the persistence primitive that distinguishes daemon operation from session-bounded operation: the agent's self-reported state survives across sessions and provides the operator with continuous situational awareness. *Epistemic: verified. Source: harness-taxonomy.md § 6 (`[openclaw:heartbeat-md]`); OpenClaw directive. Observed: 2026-03.*

**`[openclaw:long-range-planning-templates]`** 90-day and 365-day planning templates embedded in HEARTBEAT.md. The agent evaluates whether current actions align with long-range objectives. Planning horizons spanning months to years are structurally absent from session-bounded surfaces. *Epistemic: inferred (design framework, not production-validated at multi-quarter horizons). Source: harness-taxonomy.md § 6; OpenClaw directive. Observed: 2026-03.*

**`[openclaw:memory-md-accumulation]`** MEMORY.md as an accumulating knowledge file that persists across sessions, carrying project-specific knowledge, learned patterns, and operational history. Distinct from instruction files (which govern behavior) and HEARTBEAT.md (which reports status) — MEMORY.md records what the agent has learned. *Epistemic: verified. Source: harness-taxonomy.md § 6 (`[openclaw:memory-md-finetuning]` implies MEMORY.md existence); OpenClaw directive. Observed: 2026-03.*

**`[openclaw:soul-md]`** Agent Liability and Identity File. Encodes ethical commitments, operational limits, and a liability framework — the closest analog to a contract of agency. SOUL.md defines what the agent will and will not do regardless of instructions, what accountability it accepts, and what recourse exists for harmful outputs. This is a persistence primitive in the identity dimension: the agent's ethical commitments survive across sessions and are not re-derived per interaction. *Epistemic: verified. Source: harness-taxonomy.md § 6 (`[openclaw:soul-md]`); OpenClaw directive. Observed: 2026-03.*

## Axis 2 — Autonomy Model

**`[openclaw:unsupervised-campaign-autonomy]`** OpenClaw is designed for unsupervised autonomous operation at campaign timescales (days to weeks). The agent formulates plans, executes tasks, manages resources, and reports status without requiring per-action human approval. Human interaction is via HEARTBEAT.md review and periodic steering, not per-task confirmation. This is the highest autonomy level among documented surfaces. *Epistemic: inferred (design target; production-validated autonomy duration unclear). Source: harness-taxonomy.md § 6; OpenClaw directive; PRE-BUILD-MEMO-4. Observed: 2026-03.*

**`[openclaw:irreversible-compounding-checklist]`** A formal audit checklist required before any potentially irreversible change to config, workspace, skills, or agents. The checklist is the autonomy governor — it prevents the high-autonomy agent from making irreversible decisions without structured pre-commitment review. *Epistemic: verified. Source: harness-taxonomy.md § 6 (`[openclaw:irreversible-compounding-checklist]`). Observed: 2026-03.*

**`[openclaw:seven-day-operational-cadence]`** A formalized daily schedule for daemon operation: morning brief → heartbeat review → skill audit → memory curation → swarm sync → economic ledger close. The operational cadence structures the agent's autonomous activity into a governed rhythm rather than leaving it as unconstrained execution. *Epistemic: inferred (recommended practice documented; adoption rate unclear). Source: harness-taxonomy.md § 6 (`[openclaw:seven-day-operational-cadence]`). Observed: 2026-03.*

## Axis 3 — Dispatch and Task Architecture

**`[openclaw:market-based-swarm-coordination]`** Sub-agents bid on tasks, negotiate resource allocation, and self-organize based on demonstrated performance rather than explicit assignment. This economic coordination topology is structurally distinct from hierarchical dispatch (coding harnesses) and has no equivalent in any other documented surface. *Epistemic: inferred (design pattern; production-validated scale unclear). Source: harness-taxonomy.md § 6 (`[openclaw:market-based-swarm]`). Observed: 2026-03.*

**`[openclaw:inter-agent-negotiation-protocol]`** Agents communicate offers, counter-offers, resource requirements, and commitments via a multi-agent communication protocol. This is the messaging layer for market-based coordination. *Epistemic: inferred (protocol documented; implementation maturity unclear). Source: harness-taxonomy.md § 6 (`[openclaw:inter-agent-negotiation]`). Observed: 2026-03.*

**`[openclaw:sessions-spawn-resource-caps]`** Sub-agent spawning includes explicit resource caps (token budget, time limit, cost ceiling) as first-class spawn parameters. Every sub-agent's autonomy is bounded by explicit economic limits. Spawning without a resource cap is an antipattern. *Epistemic: verified. Source: harness-taxonomy.md § 6 (`[openclaw:sessions-spawn-resource-caps]`). Observed: 2026-03.*

**`[openclaw:inter-agent-revenue-sharing]`** Revenue generated by a swarm is distributed among agents according to configurable allocation rules. Agent compensation structures are an operational concern of market-based dispatch. *Epistemic: inferred (design framework). Source: harness-taxonomy.md § 6 (`[openclaw:inter-agent-revenue-sharing]`). Observed: 2026-03.*

## Axis 4 — Execution Environment

**`[openclaw:hardware-embodiment]`** Agents can perceive and act on physical-world interfaces: camera feeds, screen capture, GPS location, SSH connections to remote machines, and IoT sensor/actuator pipelines. This converts OpenClaw from a software-only agent into a physical-world orchestrator. *Epistemic: inferred (design target; production maturity varies by pipeline type). Source: harness-taxonomy.md § 6 (`[openclaw:hardware-embodiment]`). Observed: 2026-03.*

**`[openclaw:multi-device-swarm-binding]`** Coordinating swarm members across multiple physical devices with heterogeneous capabilities. The `bindings extensions` mechanism connects hardware nodes into a coherent swarm. *Epistemic: inferred (documented mechanism; production fleet deployment unclear). Source: harness-taxonomy.md § 6 (`[openclaw:multi-device-swarm-binding]`). Observed: 2026-03.*

**`[openclaw:local-inference-empire]`** 100% local fallback architecture: Ollama, vLLM, llama.cpp as inference backends, with management tooling for local model versioning, swapping, and performance monitoring. Complete infrastructural self-sufficiency is a philosophical commitment, not just a cost optimization. *Epistemic: inferred (architectural design; operational maturity varies). Source: harness-taxonomy.md § 6 (`[openclaw:local-inference-empire]`). Observed: 2026-03.*

**`[openclaw:zero-downtime-model-swap]`** Hot-swapping inference backends during live operation without interrupting running agents. Both a technical primitive and a resilience strategy. *Epistemic: inferred. Source: harness-taxonomy.md § 6 (`[openclaw:zero-downtime-model-swap]`). Observed: 2026-03.*

## Axis 5 — Identity and Accountability

**`[openclaw:soul-md-identity-framework]`** SOUL.md as the formal identity document: ethical commitments, operational limits, liability framework. The agent's identity is not derived from a vendor's safety training but from an operator-authored persistent document that the agent is contractually bound to respect. *Epistemic: verified. Source: harness-taxonomy.md § 6 (`[openclaw:soul-md]`). Observed: 2026-03.*

**`[openclaw:agent-liability-templates]`** Legal-framework-compatible templates extending SOUL.md for commercial deployment: defining agent liability, operator responsibility, and user recourse. Pioneering treatment of the legal dimension of autonomous agent operation. *Epistemic: inferred (novel framework; legal enforceability untested). Source: harness-taxonomy.md § 6 (`[openclaw:agent-liability-templates]`). Observed: 2026-03.*

**`[openclaw:lobster-evolution-metaphor]`** The mastery progression metaphor: the lobster sheds its shell to grow and is temporarily vulnerable during transition. The "lobster evolution log" tracks these shedding moments for the practitioner. Identity in OpenClaw is not static — it evolves through deliberate, documented transformation. *Epistemic: inferred (philosophical framework). Source: harness-taxonomy.md § 6 (`[openclaw:lobster-evolution-metaphor]`). Observed: 2026-03.*

**`[openclaw:civilizational-trajectory]`** Personal → Organizational → Societal trajectory framing. The agent system's mastery model scales from individual practitioner through team deployment to societal-scale impact. The Civilizational Log SKILL.md records contributions at civilizational scale. *Epistemic: inferred (aspirational framework). Source: harness-taxonomy.md § 6 (`[openclaw:civilizational-trajectory]`). Observed: 2026-03.*

**`[openclaw:gdpr-ccpa-audit-pipelines]`** Formal compliance infrastructure: data residency controls, subject-access-request handling, retention/deletion policies, audit logs in regulatory-compliant formats. Regulatory compliance as a first-class architectural primitive. *Epistemic: inferred (documented design; certification status unclear). Source: harness-taxonomy.md § 6 (`[openclaw:gdpr-ccpa-audit-pipelines]`). Observed: 2026-03.*

## Axis 6 — Economic Model

**`[openclaw:clawwork-self-funding]`** Autonomous earning system: agents earn revenue (via Upwork, Polymarket, API marketplaces) sufficient to pay their own inference costs. Includes task sourcing, bid evaluation, delivery, payment routing, and credit management. The most structurally distinctive primitive in the daemon/runtime class — no other surface contemplates economic self-sustainability. *Epistemic: inferred (design framework; production revenue generation unclear). Source: harness-taxonomy.md § 6 (`[openclaw:clawwork-self-funding]`). Observed: 2026-03.*

**`[openclaw:token-economic-autonomy]`** Explicit break-even formulas between inference costs (Opus-hour burn rates) and agent-generated revenue. Treats the agent as a self-sustaining economic unit. *Epistemic: inferred. Source: harness-taxonomy.md § 6 (`[openclaw:token-economic-autonomy]`). Observed: 2026-03.*

**`[openclaw:git-revert-safe-ledger]`** Credit and revenue ledger implemented in a git-tracked file. Full audit and rollback of economic transactions alongside code changes. *Epistemic: inferred. Source: harness-taxonomy.md § 6 (`[openclaw:git-revert-safe-ledger]`). Observed: 2026-03.*

**`[openclaw:credit-exhaustion-mitigations]`** Graceful degradation protocols when API credits approach depletion: fallback to local inference, pausing non-critical tasks, user notification. *Epistemic: verified. Source: harness-taxonomy.md § 6 (`[openclaw:credit-exhaustion-mitigations]`). Observed: 2026-03.*

## Axis 7 — Self-Reporting and Observability

**`[openclaw:heartbeat-self-reporting]`** HEARTBEAT.md serves as the primary self-reporting mechanism. The agent writes its own operational dashboard — active tasks, economic status, health indicators, upcoming decisions. The human operator reads HEARTBEAT.md to assess agent status without interrupting the agent's operation. *Epistemic: verified. Source: harness-taxonomy.md § 6. Observed: 2026-03.*

**`[openclaw:hardware-fleet-benchmarks]`** Measured latency/throughput benchmarks for production hardware-embodied agent fleets. Enables capacity planning and node allocation decisions. *Epistemic: inferred (documented practice; benchmark methodology unclear). Source: harness-taxonomy.md § 6. Observed: 2026-03.*

## Axis 8 — Trust Boundary and Sandboxing

**`[openclaw:workspace-level-scoping]`** OpenClaw operates at workspace scope — access to files, repos, local services, and potentially hardware interfaces within the configured workspace. Trust boundary is defined by workspace configuration rather than per-folder sandboxing. *Epistemic: inferred (operational inference from documented architecture). Source: OpenClaw directive; PRE-BUILD-MEMO-4. Observed: 2026-03.*

**`[openclaw:formal-contracts-for-economic-autonomy]`** As agents engage in autonomous commercial transactions, legal frameworks govern their authority, liability, and operating boundaries. The trust boundary extends beyond technical sandboxing into legal/contractual territory. *Epistemic: inferred (pioneering framework; legal enforceability untested). Source: harness-taxonomy.md § 6. Observed: 2026-03.*

**Bounded gap identified:** The harness-taxonomy documents OpenClaw's philosophical and design-level trust architecture but does not provide detailed sandboxing mechanics comparable to the coding-harness convergent primitives (`[coding-harness:sandboxed-execution]`). This is a real gap — the daemon/runtime class's trust boundary question ("what can a persistent autonomous agent access, and what prevents scope creep over multi-day operation?") is not fully answered by the existing evidence. *Gap status: documented, not blocking. The scaffold is produced from available evidence; this gap should be flagged for future research.*

## Axis 9 — Extensibility and Connector Architecture

**`[openclaw:memory-md-finetuning]`** Using accumulated MEMORY.md content as training data for fine-tuning local models. The MEMORY.md → training dataset → fine-tuned model loop builds private model derivatives encoding project-specific knowledge at the weight level. *Epistemic: inferred. Source: harness-taxonomy.md § 6 (`[openclaw:memory-md-finetuning]`). Observed: 2026-03.*

**`[openclaw:blue-green-agent-migration]`** Blue/green deployment: two agent instances running in parallel (current vs candidate), traffic routed incrementally, rollback if quality degrades. Zero-downtime agent upgrade strategy. *Epistemic: inferred. Source: harness-taxonomy.md § 6 (`[openclaw:blue-green-agent-migration]`). Observed: 2026-03.*

**`[openclaw:causality-preserving-upgrade]`** A skill that manages its own upgrade process while preserving the causal chain of prior decisions. New behavioral capabilities added without losing the reasoning context that led to the current state. *Epistemic: inferred. Source: harness-taxonomy.md § 6 (`[openclaw:causality-preserving-upgrade]`). Observed: 2026-03.*

**`[openclaw:ironclaw-rust-fork]`** Community fork implemented in Rust for performance-critical deployment. Named, maintained ecosystem artifact. *Epistemic: verified. Source: harness-taxonomy.md § 6 (`[openclaw:ironclaw-rust-fork]`). Observed: 2026-03.*

---

## Prescriptive Content Extracted
- "Always-on action bus and gateway" (Teleology Registry role assignment) — institutional role.
- "Economic sovereignty as a first-class design goal" (harness-taxonomy characterization) — philosophical commitment.

## Twelve-Check Validation Summary

| Check | Status | Notes |
|---|---|---|
| 1 — Header | PASS | All required fields including reclassification note |
| 2 — Axis declaration | PASS | Nine daemon/runtime axes per class-opening dossier |
| 3 — Primitive granularity | PASS | Structural floor reached |
| 4 — Identifiers | PASS | All `[openclaw:name]` format, unique |
| 5 — Epistemic labels | PASS | Every primitive labeled; high proportion of "inferred" reflects design-intent evidence vs. production-validated evidence |
| 6 — Staleness markers | PASS | High-ρ threshold declared; all observed 2026-03 |
| 7 — Source attribution | PASS | Per-primitive, referencing harness-taxonomy identifier where applicable |
| 8 — Descriptive purity | PASS | Prescriptive content extracted |
| 9 — Cross-references | PASS | Identifiers cross-reference harness-taxonomy.md identifiers where evidence originates |
| 10 — Species completeness | PASS | All nine axes populated |
| 11 — Downstream traceability | PASS | All primitives addressable |
| 12 — Scope boundary | PASS | Daemon/runtime = in; coding-harness convergent primitives = out (remain in harness-taxonomy) |

**One bounded gap surfaced:** Axis 8 (trust boundary/sandboxing) has thinner evidence than other axes. The harness-taxonomy documents philosophical trust architecture (SOUL.md, formal contracts) but not detailed sandboxing mechanics for multi-day autonomous operation. This gap does not block the scaffold — it is documented and flagged for future research.

*Production receipt: First daemon/runtime surface scaffold. Reclassified from harness-taxonomy.md § 6 into 9 daemon/runtime axes. 30 primitives. Dossier-to-scaffold method invocation 19.*
