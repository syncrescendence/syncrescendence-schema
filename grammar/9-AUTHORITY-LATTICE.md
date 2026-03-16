# AUTHORITY-LATTICE.md

**Class:** Canon  
**Domain:** Institutional decision-rights structure  
**Upstream:** ARTIFACT-GRAMMAR.md §§ 3, 4; LAYER-LAW.md §§ 2–8; READINESS-MATRIX.md; METHOD-ENGINE.md §§ 4, 5; KNOWLEDGE-ARCHITECTURE-ROOT.md § 1  
**Downstream:** All governance acts, teleological manuals, the operator  
**Last updated:** 2026-03-13  

---

## § 1. Governing Principles

Decision authority in the institution is graduated by two structural properties of each decision: its **propagation scope** (how many downstream artifacts, surfaces, or processes are affected) and its **reversibility** (how easily the decision can be undone without cascading consequences). Decisions with wide propagation and low reversibility — constitutional decisions — require centralized human governance. Decisions with bounded propagation and high reversibility — operational decisions — are delegable to agents under method constraints. Between these poles, intermediate decisions are delegable with review, where delegation breadth scales with the maturity of the structural substrate the decision operates on.

Two dimensions of authority govern every institutional act. **Decision authority** is the right to determine whether something should happen — whether a scaffold should be produced for Slack, whether a domain should be created, whether a method should be revised. **Execution authority** is the right to perform the work — to invoke the method, to write the entries, to produce the artifact. These are separable. An agent may hold execution authority (it can run the scaffold production method) without holding decision authority (it cannot decide which scaffolds to produce). The operator may hold decision authority (this scaffold should be produced) and delegate execution authority to an agent. Conflating the two leads to the failure mode where delegation of execution is confused with delegation of decision, and an agent authorized to run a method begins autonomously deciding which methods to run on which targets.

The boundary law from ROOT § 1 governs absolutely: the repo ratifies, the exocortex coordinates, the ontology projects. No AI agent holds constitutional authority. No exocortical surface acquires hidden sovereignty through accumulation of operational state or decision frequency.

---

## § 2. Decision-Rights Taxonomy

The institution's decisions fall into three governance families, derived from consolidating five decision types by shared governance logic.

### 2.1 Constitutional Decisions

Decisions that change the institution's structural frame. Two types compose this family:

**Ratification decisions** advance artifacts to Level 3 (constitutional) authority, committing them as binding institutional law. The promotion gate (ARTIFACT-GRAMMAR.md § 4.1): the content has been stable at Level 2, adversarial testing has been applied, and the human operator ratifies via explicit repo commit with scope boundary and class assignment declared.

**Architectural decisions** create new structural elements that extend the grammar layer: new tiers, new modality classes, new artifact classes, new methods, new identifier types. These are not promotions within existing structure — they change the structure itself.

**Shared governance logic.** Constitutional decisions are irreversible at short timescales (changing a tier model or revoking a canon document propagates revision into many downstream artifacts). They carry the widest propagation scope. They are always CENTRALIZED to the human operator regardless of maturity. No AI agent makes constitutional decisions under any circumstance.

### 2.2 Intermediate Decisions

Decisions that are consequential but reversible, operating within the existing structural frame. Three types compose this family:

**Promotion decisions** advance artifacts from Level 0 to Level 1 (editorial completion gate) or from Level 1 to Level 2 (operational validation gate). These are consequential — a Level 2 artifact is relied upon as secondary doctrine — but reversible through demotion (ARTIFACT-GRAMMAR.md § 4.3) if the promotion proves premature.

**Assessment decisions** assign maturity levels in the readiness matrix, evaluate scaffolds against the twelve-check schema, and evaluate method authority advancement. These are judgment calls that consume upstream structural criteria and produce institutional self-knowledge.

**Production decisions** determine that a specific artifact should be produced — that a scaffold for Slack should be built, that a new delta domain should be created, that a method should be revised. These are the commissioning decisions that precede execution.

**Shared governance logic.** Intermediate decisions are reversible (promotions can be demoted, assessments can be revised, production decisions can be rescinded) but consequential (a premature promotion degrades institutional trust; a missed production target leaves a gap). Their delegation state varies with maturity per the delegation framework (§ 3).

### 2.3 Operational Decisions

Decisions that execute bounded, reversible work within the constraints of ratified methods and specifications. Two types compose this family:

**Method invocation decisions** execute a ratified method against specific inputs: invoking the scaffold production method for a commissioned surface, invoking the sensing method for a triggered directive, invoking the compaction method for a volume-triggered domain.

**Routine recording decisions** create delta entries during normal operational work (opportunistic observation, not directive-triggered), process sensing directives into observation tasks, and perform editorial operations within already-commissioned scope.

**Shared governance logic.** Operational decisions are bounded (they produce one artifact or one entry), reversible (entries can be contradicted by subsequent entries, scaffolds can be revised, compacted entries are archived), and governed by method constraints (the method's output contract specifies what the operation must produce and how it is validated). Their delegation state is the most permissive of the three families at sufficient maturity.

### 2.4 Type-to-Family Mapping

| Decision Type | Governance Family | Examples |
|---|---|---|
| Ratification | Constitutional | Level 2→3 promotion, grammar-layer amendment |
| Architectural creation | Constitutional | New tier, new artifact class, new method type |
| Promotion (Levels 0→2) | Intermediate | Scaffold authority advancement, method validation |
| Assessment | Intermediate | Readiness-matrix update, twelve-check evaluation |
| Production commissioning | Intermediate | "Build a scaffold for Slack," "Create domain CAPABILITIES" |
| Method invocation | Operational | Run scaffold production, run sensing, run compaction |
| Routine recording | Operational | Opportunistic delta entry, editorial correction |

---

## § 3. Delegation Framework

### 3.1 Delegation States

Three states define the delegation breadth for any decision:

**CENTRALIZED.** The human operator both decides and executes, or decides and explicitly delegates execution to a named agent for a bounded task. No standing delegation exists. Every instance requires operator involvement.

**REVIEW.** An agent may decide and execute, but the output undergoes operator review before acquiring institutional effect. For scaffold production: the agent produces the scaffold, the operator reviews against the twelve-check schema before ratifying the scaffold at Level 1. For promotion decisions: the agent recommends promotion with evidence, the operator approves or rejects. Review is post-hoc verification, not pre-approval — the agent proceeds without waiting for permission but the output does not become authoritative until reviewed.

**DELEGATED.** An agent may decide and execute within method constraints, and the output acquires institutional effect on validation against the method's output contract. No per-instance operator review is required. The operator monitors delegated operations through the readiness matrix (coverage changes, freshness distributions) and through receipt aggregation, not through individual output inspection.

### 3.2 Maturity-Calibrated Delegation

The delegation state for each governance family is determined by the maturity of the structural substrate the decision operates on, as assessed by the readiness matrix:

| Maturity Level | Constitutional | Intermediate | Operational |
|---|---|---|---|
| NONE / OPEN SLOT | CENTRALIZED | CENTRALIZED | CENTRALIZED |
| PARTIAL | CENTRALIZED | REVIEW | REVIEW |
| IN PROGRESS | CENTRALIZED | REVIEW | DELEGATED |
| MATURE / ESTABLISHED | CENTRALIZED | REVIEW | DELEGATED |

Constitutional decisions are always CENTRALIZED regardless of maturity. This is the sovereignty constraint — it does not relax.

Intermediate decisions are always at least REVIEW — they never reach DELEGATED status because the consequences of premature promotion, incorrect assessment, or miscommissioned production require human judgment even in mature domains. The operator's review load decreases as maturity increases (review becomes faster when the structural substrate provides clear validation criteria), but the review gate does not disappear.

Operational decisions scale with maturity: CENTRALIZED at NONE/OPEN SLOT (the substrate is too thin for agents to operate safely), REVIEW at PARTIAL (some structure exists but not enough for unsupervised operation), DELEGATED at IN PROGRESS or higher (sufficient structure exists for method-governed autonomous operation).

### 3.3 Delegation Constraints

Four constraints apply to all delegated operations regardless of maturity:

**Method compliance.** Every delegated operation must follow a ratified method from METHOD-ENGINE.md. An operation that lacks a governing method cannot be delegated — it is an unstructured task that requires operator governance. This constraint ensures that delegation is always bounded by the method's input contract, procedural steps, and output contract.

**Receipt emission.** Every delegated operation must produce a verifiable output that serves as the governance receipt. For scaffold production: the scaffold itself, validated against the twelve-check schema. For delta entry creation: the entry, validated against DELTA-METABOLISM.md § 3.1. For compaction: the compacted ledger with archived originals, verified for provenance preservation per DELTA-METABOLISM.md § 4.3. For method invocation generally: the output, validated against the method's output contract. A delegated operation that produces no verifiable output is ungoverned and the delegation is void.

**Scope binding.** An agent's delegated authority is bounded to the scope declared in its teleological manual. Delegation of operational authority for sensing in domain X does not grant authority for scaffold production in domain Y. Scope crosses are governance violations.

**Revocability.** All delegation is revocable. Delegation is reduced when: the readiness matrix records a maturity downgrade for the relevant tier or domain, a delegated operation produces output that fails validation, or an agent operates outside its delegated scope. Revocation does not require cause beyond the structural conditions — it is a calibration adjustment, not a disciplinary action.

---

## § 4. Per-Tier Authority Profiles

Each tier's authority profile applies the delegation framework (§ 3) to the tier's current maturity (from READINESS-MATRIX.md) and volatility regime (from LAYER-LAW.md). These profiles are living — they change when the readiness matrix is updated.

**Tier 1 — Environmental Physics.** Maturity: ESTABLISHED. ρ: very low. Profile: constitutional decisions centralized (re-instantiation of control variables is a constitutional act). Intermediate decisions at REVIEW (assessment of environmental-physics claims requires operator judgment). Operational decisions delegated (any routine observation about environmental conditions can be recorded autonomously). Governance cadence: annual re-assessment unless a structural shift is detected.

**Tier 2 — Constitutional Law.** Maturity: IN PROGRESS. ρ: very low. Profile: constitutional decisions centralized (grammar-layer amendment is the paradigm case of constitutional decision). Intermediate decisions at REVIEW (promotion of grammar documents, assessment of grammar-layer completeness). Operational decisions delegated for routine work (recording observations about grammar-layer performance). Governance cadence: quarterly re-assessment of grammar documents; immediate revision on structural-flaw detection. This tier's authority profile is the most centralized because its decisions have the widest propagation scope and lowest reversibility.

**Tier 3 — Typed Middle Layer.** Maturity: OPEN SLOT. ρ: low. Profile: all decisions centralized. The structural substrate is too thin for any delegation. First contracts must be specified by the operator from operational proof before delegation becomes possible.

**Tier 4 — Execution Surfaces.** Maturity: mixed by modality class. ρ: high for capabilities, moderate for structural primitives. Profile varies by modality class:
Coding harnesses (MATURE): intermediate decisions at REVIEW, operational decisions delegated. Scaffold remediation and specification production can proceed with agent execution under operator review.
Reasoning surfaces (PARTIAL): intermediate decisions at REVIEW, operational decisions at REVIEW. Dossier-to-scaffold conversion is the immediate Phase 2 target — delegable with review because the method is Level 1.
SaaS platforms (PARTIAL): same as reasoning surfaces. Fourteen exegeses ready for conversion.
All other modality classes (NONE): all decisions centralized until Level 1 research produces sufficient substrate.

**Tier 5 — Coordination.** Maturity: OPEN SLOT. ρ: moderate. Profile: all decisions centralized. Coordination-layer scaffolds require Tier 4 SaaS scaffolds as prerequisites.

**Tier 6 — Observability.** Maturity: OPEN SLOT. ρ: low for contracts, high for metrics. Profile: all decisions centralized. Observability specification deferred until operational surfaces mature.

**Tier 7 — Projection/Terminal.** Maturity: PARTIAL. ρ: moderate. Profile: intermediate decisions at REVIEW (ontology object-model decomposition), operational decisions at REVIEW (projection-rule updates). The working implementation provides enough substrate for reviewed delegation.

**Orthogonal concerns (Trust/Auth, Reversibility, Epistemic Status).** Maturity: NONE to PARTIAL. Profile: all decisions centralized for trust/auth and reversibility (no cross-surface mapping exists). Epistemic status: intermediate decisions at REVIEW (formalization of the practice into a cross-cutting specification).

---

## § 5. Governance Constraints

Five absolute constraints apply regardless of maturity, delegation state, or operational context.

**Constitutional sovereignty.** No AI agent ratifies Level 3 promotion. No AI agent amends the grammar layer. No AI agent creates new tiers, artifact classes, or identifier types. No AI agent assigns or revokes decision authority. These acts require human operator commitment via repo. This constraint is not maturity-calibrated — it holds at MATURE as firmly as at NONE.

**Repo supremacy.** The repo is the sole ratification surface. No exocortical surface, chat thread, project memory, or operational accumulation acquires constitutional authority. A decision made in Slack, recorded in Notion, or accumulated in a chat session has no institutional weight until it exits into a repo-committed artifact. Per ROOT § 1: the repo ratifies, the exocortex coordinates, the ontology projects.

**Reversibility gate.** Decisions that are irreversible at short timescales (constitutional decisions, plus any operational decision whose effects cannot be undone within one revision cycle of the affected tier) require CENTRALIZED authority regardless of the delegation framework's maturity-calibrated assignment. The reversibility assessment is made per the tier's revision cadence from LAYER-LAW.md — a change that cannot be undone within that cadence is treated as irreversible for governance purposes.

**Receipt verification.** Every delegated decision must produce a receipt that can be verified against upstream validation criteria. The receipt types are defined by the grammar layer: twelve-check validation results for scaffolds, entry well-formedness checks for delta entries, provenance-preservation verification for compaction, method output-contract validation for all method invocations. An operation that emits no receipt is ungoverned regardless of its delegation state.

**Scope containment.** Decision authority does not propagate beyond its declared scope. An agent with delegated operational authority in one modality class does not thereby acquire authority in another. An agent with REVIEW-level intermediate authority in Tier 4 does not thereby hold any authority in Tier 2. Authority assignments are per-tier, per-scope, and per-governance-family. Cross-scope authority requires explicit assignment.

---

## § 6. Phase 2 Operating Posture

The authority lattice, applied to the readiness matrix's current state, produces the following operating posture for the institution's transition to Phase 2 scaffold production:

**Grammar-layer maintenance (Tier 2).** Constitutional decisions remain centralized. The operator governs all grammar-layer amendments, including the deferred naming-law registration of compaction-entry identifiers, modality-class slugs, and concern slugs. Grammar-layer documents are revised only on structural-flaw detection, not on calendar.

**Scaffold production (Tier 4 PARTIAL modality classes).** The dossier-to-scaffold conversion method is at Level 1 (curated, untested under the grammar layer). Decision authority for commissioning conversions: REVIEW (operator commissions, or agent recommends and operator approves). Execution authority: REVIEW (agent executes the method, operator reviews the output scaffold against the twelve-check schema before Level 1 authority is assigned). As the method advances to Level 2 through successful diverse invocations, execution authority for routine conversions may shift to DELEGATED.

**Scaffold remediation (Tier 4 MATURE coding harnesses).** harness-taxonomy.md fails 7 of 12 grammar-layer checks. Remediation is an intermediate decision — the operator commissions the work, an agent executes (adding headers, identifiers, epistemic labels, staleness markers, source attribution, cross-references). Output is reviewed against the twelve-check schema.

**Temporal-track activation (Axis 4).** Zero domains currently exist. Domain creation is an intermediate decision — the operator decides which domains to create, referencing the recommended candidates in READINESS-MATRIX.md § 4.4. Entry creation within established domains is operational — delegable at REVIEW until the sensing method advances to Level 2.

This section describes the operating posture that the lattice's rules produce when applied to the current readiness state. It is not a project plan — it does not sequence actions, assign timelines, or prioritize targets. It demonstrates that the lattice is operational: given the readiness matrix as input and the governance rules as law, the institution's decision-rights structure for Phase 2 is deterministic.

---

*Assessment as of 2026-03-13: all sections drafted. Pending operator review and ratification. On ratification, all nine grammar-layer documents are complete and the transition criterion to Phase 2 is met. The decision-rights taxonomy consolidated to three governance families from five decision types, with the mapping preserved in § 2.4. Decision authority and execution authority are explicitly distinguished in § 1. The Phase 2 operating posture (§ 6) demonstrates the lattice's operational output without becoming a project plan.*
