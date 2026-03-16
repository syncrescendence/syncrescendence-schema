# LAYER-LAW.md

**Class:** Canon  
**Domain:** Institutional tier model  
**Upstream:** KNOWLEDGE-ARCHITECTURE-ROOT.md § 3  
**Downstream:** All per-tier scaffolds, tier-scoped specifications, READINESS-MATRIX.md  
**Last updated:** 2026-03-12  

---

## § 1. Governing Principles

The tier model decomposes the institution by function, not by surface, team, or vendor. Each tier carries a single governing purpose. Tiers interact through declared interfaces: what one tier provides, consuming tiers receive. Adjacent tiers interact by default; observability (Tier 6), projection (Tier 7), and coordination (Tier 5) receive from non-adjacent tiers where their cross-cutting function requires it. No tier reaches into another tier's internals — interaction is always mediated by the interface contract.

The environmental physics shape the tier law directly. The institution operates under two simultaneous volatility regimes: very high requirement volatility (ρ > 25% of assumptions invalidated per month) at the capability and operational tiers, very low ρ at the constitutional tier. Each tier therefore carries its own characteristic feedback latency (λ) and operates under the control cadence appropriate to its volatility: fast empirical cycles for high-ρ tiers, governance-grade deliberation for low-ρ tiers. The two-track architecture (stable structural track, volatile temporal track) applies per tier. Every tier has scaffolds (stable, revision-cadenced) and may have deltas (volatile, freshness-cadenced). The scaffold/delta partition is governed by the same question at every tier: does this knowledge describe what kind of thing something is (scaffold), or what that thing is currently doing (delta)?

Seven tiers and three orthogonal concerns. What follows specifies each at one resolution level below the root schema. Current-status assessments throughout this document reflect conditions as of 2026-03-12; authoritative per-tier maturity tracking migrates to READINESS-MATRIX.md when that document is constructed.

---

## § 2. Tier 1 — Environmental Physics

**Purpose.** The analytical ground for the institution's control architecture. This tier answers: what kind of environment are we governing, where does this architecture fail first, and what kind of control law is needed? It establishes the variables against which every other tier's design is justified.

**Scope boundary.** The four control variables (requirement volatility ρ, cost of iteration κ, feedback latency λ, systemic variance σ) and their instantiated values for the Syncrescendence operating environment. The feasibility-region analysis that maps the composite assessment (high-ρ, low-κ, mixed-λ, high-σ) to a predicted control architecture (hybrid: empirical for volatile tiers, governance for stable tiers). Explicitly excluded: specific methodological prescriptions (Scrum, Kanban, Shape Up) — this tier provides the physics, not the methodology.

**Interfaces.** Receives: nothing from above — this tier IS the environment. Provides downward: control-variable values consumed by all other tiers to calibrate their revision cadences, volatility regimes, and delegation breadth. Provides to Tier 2 specifically: the ρ-regime split that justifies the two-track architecture and the promotion pipeline's governance grade.

**Artifact populations.** First-principles analytical frameworks (the project management report). Instantiation memos (pre-build Memo 2). Environmental re-assessments (delta-class: produced when the system's operating character changes significantly).

**Volatility and revision cadence.** ρ: very low — the environmental physics change only if the system's fundamental character shifts (e.g., moving from solopreneur to team operation, or from AI-augmented to fully autonomous). λ: months to years. Revision cadence: annual re-assessment unless a structural shift is detected.

**Maturity semantics.** ESTABLISHED means: all four variables are instantiated with justified values, the composite assessment is complete, and the control-architecture implications are stated. The tier is ESTABLISHED. Re-instantiation is required only upon fundamental environmental shift.

**Open-slot logic.** No open slots currently. Future need: if the institution scales from single-operator to multi-operator, or from solopreneur to organizational, ρ and σ values will shift and the tier must be re-instantiated.

---

## § 3. Tier 2 — Constitutional Law

**Purpose.** The sovereign legislative core. This tier defines what can ratify meaning, what must never become hidden authority, what promotion means, how artifacts are classified and governed, how names are assigned, and how the knowledge system itself is structured. Everything in the grammar layer lives here.

**Scope boundary.** The boundary law. The enduring strategic pillars. The artifact grammar (taxonomy, ladder, promotion rules). The scaffold grammar. The delta metabolism. The method engine. The naming law. The authority lattice. The config-mereology sub-domain (the operational taxonomy's six strata: atoms → modules → instructional structures → agentic entities → platform/workflow architectures → ecosystem — scoped as a grammar for how behavioral instructions compose, not as a rival tier model). Explicitly excluded: per-surface teleological assignments (those are Tier 4 teleological manuals); per-surface adapter contracts (those are Tier 4 specifications); operational governance (agent routing, scheduling, approval flows — those are Tier 5 coordination specifications once that tier matures).

**Interfaces.** Receives from Tier 1: control-variable values and ρ-regime split that calibrate the governance grade. Provides downward to all tiers: constitutional constraints (what is permitted, what is prohibited, what must emit receipts), artifact grammar (what kinds of things can be produced and how they promote), naming conventions (how things are identified and cross-referenced), the scaffold grammar and method engine (how descriptive substrate is produced and maintained).

**Artifact populations.** Canon-class: this document, the root schema, the authority lattice, the boundary law, the enduring strategic pillars (once extracted). Specification-class: scaffold grammar, delta metabolism, naming/addressing. Method-class: method engine. Registry-class: readiness matrix. The grammar-layer documents collectively define the constitution of knowledge.

**Volatility and revision cadence.** ρ: very low — constitutional law changes only when a structural flaw is detected or when the environmental physics shift enough to require architectural adaptation. λ: weeks to months — the feedback on whether a constitutional decision was correct comes only after downstream artifacts have been produced against it and either succeeded or failed. Revision cadence: quarterly re-assessment of grammar documents; immediate revision only upon structural-flaw detection.

**Maturity semantics.** IN PROGRESS means: the grammar-layer documents are under construction. MATURE means: all nine grammar documents are ratified, the readiness matrix is populated, and the method engine is operational for scaffold production. The tier reaches MATURE when the grammar layer is complete.

**Open-slot logic.** Enduring strategic pillars from the Holistic Strategic Endeavor have not yet been extracted into a clean canon artifact (they remain embedded in a document that mixes enduring law with ephemeral progress accounting). This extraction is deferred until the grammar layer is complete — the grammar provides the structural frame within which the pillars can be correctly classified and located.

---

## § 4. Tier 3 — Typed Middle Layer

**Purpose.** The contract enforcement surface between constitutional law and operational execution. This tier translates abstract constitutional constraints into concrete typed contracts that govern how tiers interact: what a task looks like, what a receipt looks like, what a routing decision looks like, what an authorization boundary looks like.

**Scope boundary.** Typed contracts: TaskEnvelope, RoutingDecision, ArtifactReceipt, SurfaceActionReceipt, PromotionDecision, ConfigSnapshot, ProjectionRecord, AuthBoundary, RiskClass. Schema definitions that implement these contracts. Validation logic that enforces them. Explicitly excluded: the constitutional law the contracts enforce (that is Tier 2); the operational surfaces that produce and consume the contracts (that is Tier 4); the coordination logic that routes contracts between surfaces (that is Tier 5).

**Interfaces.** Receives from Tier 2: the constitutional constraints that contracts must enforce. Provides to Tiers 4–7: typed envelopes, receipt schemas, and validation rules that every operational surface must respect. Provides to Tier 6 specifically: the receipt and event schemas that observability instruments against.

**Artifact populations.** Specification-class: contract definitions, schema files (JSON Schema, Pydantic models, or equivalent). The config cascade ordering — law → typed contracts → surface renders → runtime receipts → ontology projection — describes this tier's position in the information flow.

**Volatility and revision cadence.** ρ: low — contracts change only when the tier model or constitutional law changes, or when operational experience reveals that a contract shape does not fit actual usage. λ: weeks — contract-shape feedback comes from operational use of the contracts in Tier 4 and Tier 5 surfaces. Revision cadence: revision-triggered by operational proof, not by calendar.

**Maturity semantics.** OPEN SLOT means: contracts are named as placeholders but no schemas are specified. PARTIAL means: some contracts are specified and in operational use. MATURE means: all named contracts are specified, validated against operational use, and consumed by Tier 4 and Tier 5 surfaces. Current status: OPEN SLOT. Specification is blocked on operational proof — building the contracts requires having enough Tier 4 and Tier 5 surfaces operational to generate the envelope and receipt traffic the contracts must govern. Premature specification would produce contracts that do not fit actual operational reality.

**Open-slot logic.** The entire tier is an open slot. First step: identify the minimum set of contracts needed for the first operational surface cluster (likely: ArtifactReceipt for scaffold production, SurfaceActionReceipt for exocortex operations, PromotionDecision for the promotion pipeline). Build those contracts from operational experience, test them, then expand to the full set.

---

## § 5. Tier 4 — Execution Surfaces

**Purpose.** Everything that does work. This is the largest and most heterogeneous tier, organized into modality classes that group surfaces by how they operate rather than what they are for.

**Scope boundary.** All surfaces, tools, models, and runtime environments that execute tasks, produce artifacts, or process information for the institution. Organized into modality classes, each with its own decomposition axes and scaffold requirements. Explicitly excluded: the coordination logic that routes work between surfaces (Tier 5); the observability logic that inspects surfaces (Tier 6); the projection logic that renders surface state into queryable form (Tier 7). A surface's presence in Tier 4 describes its structural character; its institutional role is assigned by a teleological manual (a Tier 4 artifact) that draws on the surface's scaffold, not by the tier model itself.

**Interfaces.** Receives from Tier 2: constitutional constraints (boundary law, naming conventions, scaffold grammar). Receives from Tier 3: typed contracts (receipt schemas, envelope formats). Provides to Tier 5: execution outputs and receipts for coordination and routing. Provides to Tier 6: instrumentation data for observability. Provides to Tier 7: state snapshots for ontology projection.

**Modality classes.** Eight named classes plus one open slot. Each class groups surfaces that share structural primitives and decomposition axes. Surfaces within a class can be compared; surfaces across classes generally cannot (different axes yield incommensurable descriptions). Adding a new surface means classifying it into an existing class or, rarely, defining a new class (per the open-world extension law in the scaffold grammar).

*Repo-native coding harnesses* (Aider, Claude Code, Gemini CLI, Codex, OpenHands). Defining primitives: git-centric execution, instruction-file cascade, repo-map context scoping, worktree isolation, commit/rollback atomicity. Decomposition axes: configuration architecture, memory/context architecture, execution loop, multi-agent orchestration, self-improvement loops, MCP integration, skills/extensibility, prompting formalism, security/sandbox, observability, large-scale engineering, swarm topologies. Status: MATURE — full layer scaffold (harness-taxonomy.md) and derived specification (ARCHITECTURE.md) exist.

*Reasoning / chat surfaces* (Claude, ChatGPT, Gemini, Grok in consumer chat roles). Defining primitives: context-window processing, instruction-steered behavioral shaping, cognitive-signature specialization, session-bounded stateless operation with platform memory as partial persistence. Decomposition axes differ from SaaS and coding-harness axes: context-window architecture, steering surface (custom instructions / system prompts / memory), cognitive signature and failure modes, output scaling behavior, tool-use capabilities, inter-model handoff contract, platform constraint surface. Status: PARTIAL — strong operational evidence across the corpus (CI provenance report, prompting guides, operational experience); no fixed-axis scaffold in enduring-descriptive-scaffold format. Gap is structural formatting, not evidential depth.

*SaaS work / knowledge / automation surfaces* (Slack, Notion, Airtable, Jira, Confluence, Coda, Linear, ClickUp, Basecamp, Obsidian, Discord, Todoist, TickTick, Telegram, and others). Defining primitives: external data/workflow platforms with APIs, proprietary object models, and vendor-controlled auth. Decomposition axes: primitive object model, data sovereignty model, manipulation surface, auth and trust boundary, receipt and audit surface, design teleology and anti-role, failure modes, power-user ceiling, reversibility. Status: PARTIAL — fourteen surface-level exegeses exist as dossier-class primitive decompositions; no cross-entity taxonomy (the harness-taxonomy.md equivalent) has been produced; no retroactive axis alignment across the fourteen exegeses.

*Daemon / runtime surfaces* (OpenClaw, Claude Cowork). Defining primitives: persistent autonomous operation across sessions, self-reporting status, task dispatch, variable autonomy levels, identity and accountability frameworks. Status: NONE — OpenClaw's primitives are partially documented under the wrong modality classification (harness taxonomy §6); Cowork has minimal documentation. Requires dedicated Level 1 research.

*Autonomous operator surfaces* (Manus). Defining primitives: browser-mediated multi-step execution, authenticated session management across external UIs, task-packet-in / evidence-artifact-out interaction pattern. Structurally distinct from daemon/runtime (operates on remote web UIs, not local machine state). Status: NONE — headline characterization only.

*Recon / sensing surfaces* (Perplexity). Defining primitives: research discovery, domain-corpus routing, inline citation, multi-model harness wrapping. Status: single-surface maturity — Perplexity has a teleological manual at full resolution, but the class contains only one entity and no cross-entity taxonomy is possible until additional recon surfaces are scaffolded (NotebookLM is the nearest candidate).

*Cloud / backend substrates* (Supabase, Cloudflare Workers, GitHub infrastructure, and others). Defining primitives: infrastructure services providing compute, storage, auth, edge networking, and deployment substrate. Status: NONE — mentioned in prior documents but unscaffolded.

*Model-routing / memory layers* (LiteLLM, Mem0, vector stores, and others). Defining primitives: provider/model routing, request brokerage, persistent memory substrates, embedding and retrieval infrastructure. Status: NONE — mentioned in prior documents but unscaffolded.

*Solopreneur stack (open slot).* Finance, accounting, ecommerce, HR-for-agents, and related domains. Not yet enumerated. This slot exists to declare that the institution's operational needs extend beyond the currently scaffolded domains. Fill: domain scoping first, then Level 1 research per surface, then modality-class definition if structurally warranted.

**Artifact populations per class.** Each modality class can produce: surface scaffolds (per-surface decomposition along class-specific axes), a layer scaffold (cross-entity taxonomy synthesizing convergent/divergent primitives across the class), teleological manuals (per-surface operational specifications for active institutional organs), adapter/manipulation contracts (per-surface control-path specifications), and registry rows (compressed entries for the Teleology Registry).

**Volatility and revision cadence.** Two-regime: high ρ for surface capabilities and configurations (refresh via delta domain ledgers, freshness-cadenced); low-to-moderate ρ for structural primitives and object models (refresh via scaffold revision triggered by structural-change deltas). λ varies by modality: minutes for coding harnesses, sessions to days for reasoning surfaces, days to weeks for SaaS platform integrations. The delta metabolism handles the high-ρ regime; scaffold revision handles the structural regime.

**Maturity semantics.** MATURE for a modality class means: an enduring layer scaffold exists (cross-entity taxonomy with convergent/divergent primitives), the scaffold passes the twelve-check validation grammar, and at least one derived specification exists. PARTIAL means: per-surface evidence exists but the cross-entity synthesis has not been performed, or the evidence exists but has not been normalized to the scaffold grammar. NONE means: insufficient evidence for scaffold production.

---

## § 6. Tier 5 — Coordination and Event Choreography

**Purpose.** The institution's nervous system. This tier routes information between execution surfaces, dispatches work, handles events, manages inter-agent communication, and enforces approval flows. It is where surfaces cease to be isolated tools and become organs in a coordinated body.

**Scope boundary.** Messaging and dispatch surfaces in their coordination role (a surface like Slack appears in Tier 4 as a SaaS platform with its own object model, and in Tier 5 as a coordination mechanism — these are different analytical frames on the same surface). Automation engines (Make, Zapier). Webhook and event systems. Inter-agent communication protocols (MCP, ACP, A2A as they converge). Approval and receipt routing. Explicitly excluded: the execution surfaces themselves (Tier 4); the observability of coordination (Tier 6); the typed contracts that coordination enforces (Tier 3). The distinction between Tier 4 and Tier 5 for a surface like Slack: Tier 4 describes what Slack is (primitives, object model, manipulation surface); Tier 5 describes how Slack functions as institutional wiring (channel ontology, event routing, approval flows, dispatch patterns).

**Interfaces.** Receives from Tier 4: execution outputs and receipts from all modality classes. Receives from Tier 2: approval rules, routing policies, receipt-format requirements. Receives from Tier 3: typed coordination contracts (when they exist). Provides to Tier 4: dispatched work, routed context, approval decisions. Provides to Tier 6: event streams for observability. Provides to Tier 7: coordination state for ontology projection.

**Artifact populations.** Layer scaffold (cross-surface coordination taxonomy). Coordination contracts. Event schemas. Automation-engine specifications. Inter-agent communication pattern specifications.

**Volatility and revision cadence.** Moderate ρ: coordination patterns evolve as new surfaces are integrated and as inter-agent protocols mature (MCP/ACP/A2A convergence). λ: days to weeks — whether a coordination pattern works correctly requires observing operational use over time. Revision cadence: monthly re-assessment of active coordination patterns; immediate revision on integration of new surfaces.

**Maturity semantics.** OPEN SLOT means: no coordination-tier scaffold exists. PARTIAL means: some surfaces have been characterized in their coordination role (e.g., a teleological manual for Slack as a dispatch surface). MATURE means: a layer scaffold exists covering all active coordination surfaces, with coordination contracts and event schemas specified. Current status: OPEN SLOT.

**Open-slot logic.** This tier has the widest gap between its importance (it is the nervous system) and its evidential maturity (almost entirely unresearched at the operational level). Priority research: teleological manual for Slack in its coordination role; Level 1 research on Make/Zapier as automation engines; specification of inter-agent communication patterns from operational experience. The Tier 5 scaffold depends on Tier 4 SaaS surface scaffolds existing first (you must understand what the surfaces are before specifying how they coordinate).

---

## § 7. Tier 6 — Observability and Evaluation

**Purpose.** The institution's capacity to inspect its own operation. This tier ensures that the system can see what is happening, detect failure, measure performance, and evaluate quality across all other tiers.

**Scope boundary.** Traces, metrics, and logs from execution surfaces and coordination mechanisms. Receipt aggregation from Tier 3 contracts. Eval harnesses and golden-task suites. Adoption telemetry. Sensing-pipeline health monitoring. Staleness detection across scaffolds and delta ledgers. Explicitly excluded: the execution that produces the observable data (Tier 4); the coordination that routes it (Tier 5); the constitutional rules that define what should be observed (Tier 2).

**Interfaces.** Receives from all tiers: instrumentation data, receipt streams, event logs. Provides to Tier 2: evaluation results that inform promotion decisions (does this scaffold pass validation? did this specification survive operational testing?). Provides to Tier 5: health signals that trigger adaptive routing (a failing surface should have work re-routed away from it). Provides to Tier 7: observability state for ontology projection and dashboard display.

**Artifact populations.** Specification-class: observability contracts (what must be instrumented at each tier). Dashboard schemas. Alert definitions. Eval harness specifications.

**Volatility and revision cadence.** Low ρ for observation contracts (what to observe changes only when new surfaces or tiers activate). High ρ for specific metric values (metric readings are volatile by nature and live in the delta layer, not in scaffolds). λ: short for alert-triggering observations (minutes to hours), long for systemic evaluation (weeks to months). Revision cadence: observability contracts are revised when new surfaces are integrated; metric thresholds are calibrated continuously.

**Maturity semantics.** OPEN SLOT means: no observability specification exists beyond a single modality class. PARTIAL means: observability is specified for some modality classes and some coordination patterns. MATURE means: every active surface and coordination pattern has an observability contract, and evaluation results feed back into the promotion pipeline. Current status: OPEN SLOT — ARCHITECTURE.md specifies observability for the coding-harness modality; no broader specification exists. This tier activates in proportion to the operational maturity of the surfaces it monitors.

**Open-slot logic.** Defer until Tier 4 and Tier 5 have enough operational surfaces to make observability meaningful. The coding-harness observability spec in ARCHITECTURE.md serves as the template: it specifies what metrics to collect (velocity, cost, error rate, context utilization), what alerts to fire (cost ceiling, velocity floor), and what dashboards to maintain. Extending this template to other modality classes and to the coordination tier is the path forward.

---

## § 8. Tier 7 — Projection and Terminal

**Purpose.** Making institutional state legible. This tier renders the institution's accumulated structural and temporal knowledge into forms that humans and agents can query, browse, and act on — without becoming a hidden source of constitutional authority.

**Scope boundary.** The ontology as a typed projection surface: entity types, relationship types, projection rules, query APIs. The syncrescendence.com human terminal: progressive-disclosure dashboards, operator views, approval interfaces. Explicitly excluded: the constitutional law the ontology reflects (Tier 2); the operational state the ontology projects (Tiers 4–6); any write path from the ontology back into constitutional law (the boundary law is absolute: the ontology projects, it does not legislate). The cascade ordering places the ontology last: scaffold → memory → config → communications/runtime ledger → ontology. This is not a hierarchy of importance but a hierarchy of derivation — the ontology derives from all prior tiers.

**Interfaces.** Receives from all tiers: state snapshots, receipt streams, artifact inventories, scaffold content, delta observations. Provides to human operator: progressive-disclosure views at macroscopic resolution (dashboards, summaries, anomaly flags). Provides to agents: typed queryable state at microscopic resolution (entity lookups, relationship traversals, state queries). Provides no write path to any other tier — queries only, never mutations.

**Artifact populations.** Projection contracts (what entity types the ontology recognizes, what relationship types it supports, what projection rules it applies). Schema specifications (the ontology's data model). Interface designs (the human terminal's progressive-disclosure architecture). The current implementation: SQLite + FastAPI projection layer over exocortex/control-plane state, projecting entity types including AgentState, ConfigSnapshot, ExocortexRegistry, ExocortexTeleology, ExoEvent, Task, KnowledgeItem, SurfaceState.

**Volatility and revision cadence.** Moderate ρ for projection rules (new entity types are added as new surfaces are scaffolded). Low ρ for ontology architecture (the structural decision to be a projection layer, not a sovereign kernel, is constitutional and changes only under Tier 2 revision). Long λ — whether the ontology's projections are useful is assessable only through sustained use. Revision cadence: projection rules updated when new surfaces or entity types enter the system; architecture revisited quarterly.

**Maturity semantics.** PARTIAL means: a working implementation exists that projects some entity types, but the target object model has not been decomposed at scaffold grade and the human terminal is unspecified. MATURE means: the ontology's entity types and projection rules are specified, validated against operational use, and consumed by the human terminal and agent query surfaces. Current status: PARTIAL.

**Open-slot logic.** The ontology's target object model needs primitive-level decomposition: what entity types should exist, what relationship types connect them, what projection rules map from source state to ontology entities. This decomposition should use the scaffold grammar's method, treating the ontology's object model as a domain to be scaffolded — not designed by architectural fiat. The human terminal design depends on the ontology being specified first. Both are deferred until the grammar layer is complete and the ontology team can produce scaffold-grade decompositions.

---

## § 9. The Three Orthogonal Concerns

These are properties of every tier, not standalone functional units. Each cross-cuts the entire tier model.

### Trust and Identity Boundaries

**What it governs.** What auth models exist at each tier, what trust zones they create, where permissions are inherited versus explicit, where boundaries leak, and where they must be hardened.

**Per-tier intersection.**
- Tier 1: no trust boundary (analytical framework, no operational surface).
- Tier 2: the repo as identity root. Git auth and repo access controls are the constitutional trust boundary. Who can commit to the repo can change constitutional law.
- Tier 3: typed contracts must carry auth-boundary fields (AuthBoundary, RiskClass) that encode what trust zone a given action occurs in.
- Tier 4: each modality class has its own auth topology. Coding harnesses inherit repo auth. Reasoning surfaces use platform-specific auth (API keys, OAuth, subscription tiers). SaaS platforms use workspace-level auth with varying models (Slack workspace, Notion teamspace, Jira project permissions). Daemon/runtime surfaces carry their own identity (OpenClaw's SOUL.md). These are not the same class of auth — the cross-cutting scaffold must map each class's model.
- Tier 5: coordination surfaces inherit auth from the surfaces they connect. Slack's workspace auth governs who can dispatch. Make/Zapier scenarios inherit OAuth tokens from connected surfaces. Inter-agent communication protocols must carry provenance tags that identify the originating auth context.
- Tier 6: observability surfaces must have read access to all tiers they monitor without acquiring write access. The observability trust boundary is read-only by design.
- Tier 7: the ontology inherits read access from its projection sources. The human terminal inherits the operator's auth level. Neither should carry independent write paths.

**Current state:** NONE. Scattered auth information exists in surface exegeses (Confluence's open-by-default, Jira's permission schemes, Slack's workspace auth). No cross-surface mapping exists. This is a prerequisite for Tier 3 typed-middle-layer specification: AuthBoundary contracts cannot be designed without knowing what auth boundaries actually exist.

### Reversibility and Migration

**What it governs.** How each tier can be rolled back, how surfaces can be replaced, what state is lost on rollback, and what the replacement cost is.

**Per-tier intersection.**
- Tier 1: fully reversible (re-instantiate the four variables).
- Tier 2: effectively irreversible once downstream artifacts depend on constitutional decisions. This is the highest-κ tier — changing the tier model requires revising most grammar documents.
- Tier 3: reversible at the contract level (change a schema, update consumers). Moderate κ proportional to the number of surfaces consuming the contract.
- Tier 4: varies by modality class. Coding harnesses: fully reversible via git (ARCHITECTURE.md's reversibility map documents this). SaaS platforms: partially reversible — data migration and integration reconfiguration have real switching costs. Daemon/runtime: state loss depends on the surface's persistence model.
- Tier 5: coordination patterns are reversible by reconfiguring routing rules. Automation scenarios are individually reversible. The switching cost is proportional to the number of workflows that depend on a given pattern.
- Tier 6: observability contracts are fully reversible (stop collecting, or collect differently).
- Tier 7: ontology projections are reversible (re-project from source state). Human terminal design is reversible (redesign the interface).

**Current state:** PARTIAL for coding harnesses (ARCHITECTURE.md's reversibility map); NONE elsewhere.

### Epistemic Status

**What it governs.** What is verified, inferred, provisional, or aspirational at every tier and in every artifact.

**Per-tier intersection.** Applies uniformly: every artifact at every tier carries inline epistemic labels. The specific verification cadence varies by tier λ — a Tier 4 coding-harness claim verified by primary documentation has longer validity than a Tier 4 SaaS-capability claim that may change with the next vendor release. The staleness markers in scaffolds and the freshness computation in deltas are the mechanisms that make epistemic status temporally responsive.

**Current state:** ESTABLISHED as a practice — ARCHITECTURE.md's epistemic status table is the gold standard. Not yet formalized as a cross-cutting specification with per-tier verification cadences.

---

## § 10. Config Mereology: The Six Strata Within Tier 2

The operational taxonomy's six strata — atomic primitives, configural modules, instructional structures, agentic entities, platform/workflow architectures, ecosystem — constitute a mereological grammar for configuration architecture. They describe how behavioral instructions compose from their smallest indivisible units (a single directive, a config key-value pair) through intermediate assemblies (skill definitions, hook definitions, database schemas) into complete behavioral genomes (custom instruction blocks, CLAUDE.md project constitutions) that animate identity-bearing operational units (avatars, named agents) operating within integrated execution environments (CLI harnesses, chat workflows, sensing pipelines) coordinated under one institutional telos.

This grammar is scoped within Tier 2 as a sub-domain of constitutional law. It governs how configuration artifacts are structured, not how the institution is structured. The six strata are not a tier model — they do not decompose the institution into functional levels. They decompose one specific kind of artifact (behavioral instructions) into its mereological layers. The seven-tier model and the six-stratum config mereology are orthogonal: the tier model says where a config artifact lives (Tier 4 execution surface, rendered per Tier 2 law); the config mereology says how that artifact is internally constructed.

The enduring descriptive scaffold for this sub-domain is SYNCRESCENDENCE-OPERATIONAL-TAXONOMY.md. Its structural findings (the stratum definitions, the format-to-consumer mapping, the composition and governance rules) are valid evidence within this scope. Its directory layout proposals are input to future specification work, not constitutional law.

---

## § 11. The "Office" Concept

The Holistic Strategic Endeavor uses "office" to describe a governed organizational unit with local memory, bindings, and governance — analogous to a department in a federal government. The question is whether "office" survives as a structural concept in the tier model.

Assessment: "office" maps to the avatarization primitive at Stratum 4 of the config mereology — the point where an instructional structure receives identity (name, epithet, mission), cognitive function, and constellation positioning to become an autonomous, accountable actor. The named avatars (Vizier Lens, Oracle Lens, Vanguard Lens) are instances of offices in this sense: they carry local identity, differentiated cognitive functions, and explicit relationships to other constellation members.

Offices are not tiers. They are an organizational pattern within Tier 4 modality classes where avatar-level identity and local governance exist. Specifically, offices apply to the reasoning/chat-surface modality class (where avatars like Vizier, Oracle, and Vanguard operate) and potentially to the daemon/runtime class (where OpenClaw carries SOUL.md identity). They do not apply to SaaS platforms or cloud substrates, which carry institutional roles (assigned by teleological manuals) but not local identity or local governance.

The term is retained for the specific context where it applies — reasoning surfaces and daemon runtimes with avatar-level identity — and should not be used as a generic synonym for "group," "cluster," or "modality class."
