# KNOWLEDGE-ARCHITECTURE-ROOT.md

**Class:** Canon  
**Domain:** Syncrescendence knowledge architecture  
**Last updated:** 2026-03-12  
**Downstream:** All grammar documents, all scaffolds, all registries, all specifications  
**Epistemic floor:** Verified for grammar-layer structure; open slots declared for immature tiers  

---

## § 1. The Endeavor

Syncrescendence is the deliberate construction of a sovereign cognitive institution in which a human operator and many AI agents function as one durable organization — with externalized memory, lawful promotion, differentiated roles, and explicit governance — without surrendering semantic authority to transient model sessions, chat threads, SaaS surfaces, or connector state.

The institution exists because frontier-model work is structurally unstable. Context evaporates at session boundaries. Models change on vendor schedules. Interfaces churn. Agents proliferate faster than doctrine stabilizes. Raw semantic volume accumulates faster than it can be metabolized into wisdom. Without an externalized constitutional core, the system decays into chat-local memory, hidden authority, duplicated doctrine, and strategic amnesia. The project treats continuity as an engineering problem, not a hope.

The boundary law governing the entire institution: **the repo ratifies, the exocortex coordinates, the ontology projects.** The repo is where meaning, legitimacy, and promotion become lawful. The exocortex is where live operational state accumulates and moves across external surfaces. The ontology is where institutional state becomes typed and queryable without inheriting sovereignty. No surface outside the repo may become a hidden source of constitutional authority.

The current phase: the constitution of knowledge can harden now. The constitution of operations cannot yet. The grammar layer — artifact types, promotion rules, tier model, scaffold specification, delta metabolism, method engine, naming conventions, readiness tracking, and authority assignments — is being constructed. The operational layers (per-surface teleological manuals, adapter contracts, cross-entity taxonomies, typed middle-layer contracts) remain open until their descriptive substrate reaches sufficient fidelity.

---

## § 2. The Environmental Physics

Four variables govern the institution's control environment, instantiated from first-principles analysis of the actual operating conditions.

**Requirement volatility (ρ): very high** at the capability and operational tier, with more than 25% of operational assumptions invalidated per month. Model generations shift quarterly; harness capabilities shift biweekly; SaaS APIs shift monthly; prompting consensus inverts quarterly. At the constitutional tier, ρ is low — boundary law, promotion rules, and the artifact taxonomy change slowly if at all. The system exhibits two distinct volatility regimes simultaneously.

**Cost of iteration (κ): low overall,** since the system is primarily text, configuration, and software with full git reversibility. Moderate pockets exist for deep SaaS integrations and custom-instruction engineering, where craft cost per character is high. Constitutional revision carries the highest effective κ because architectural decisions propagate into many downstream artifacts.

**Feedback latency (λ): mixed and tier-dependent.** Minutes for repo-native code. Sessions to days for CI/configuration engineering. Days to weeks for coordination and automation patterns. Weeks to months for constitutional decisions. Different tiers need different control cadences.

**Systemic variance (σ): high across all tiers.** Work items are wildly heterogeneous, human-operator capacity is variable, and dependencies are loosely coupled but numerous. No tier operates in a low-variance regime with predictable throughput.

The composite assessment — high-ρ, low-κ, mixed-λ, high-σ — structurally predicts a hybrid control architecture: fast empirical loops for volatile operational state, governance-grade stability for constitutional structure. This is the environmental justification for the two-track architecture (stable structural track and volatile temporal track) and for the bounded-context operating law (every step must be resumable from artifacts alone, because a system under high σ with attention-bounded capacity that cannot survive interruption will lose accumulated value).

---

## § 3. The Tier Model

Seven functional tiers and three orthogonal concerns compose the institution. Each tier has a declared scope, and each is populated by specific artifact classes. Maturity varies by tier — the grammar layer declares open slots rather than faking maturity where substrate is thin.

**Tier 1 — Environmental physics.** What kind of system this is and what failure envelope governs it. The four control variables (ρ, κ, λ, σ) and their instantiated values. Artifact classes: first-principles analytical frameworks. Current maturity: ESTABLISHED (instantiation complete in pre-build memo).

**Tier 2 — Constitutional law.** What is sovereign, what can ratify, what must never become hidden authority, what promotion means. The boundary law, the enduring strategic pillars, the artifact grammar, the naming law. Artifact classes: canon, method. Current maturity: IN PROGRESS (grammar-layer construction underway).

**Tier 3 — Typed middle layer.** The contracts, envelopes, receipts, and schemas that enforce constitutional law at interface boundaries. TaskEnvelope, RoutingDecision, ArtifactReceipt, AuthBoundary, RiskClass. Artifact classes: specification, schema. Current maturity: OPEN SLOT (named but unspecified; requires operational proof before prescription).

**Tier 4 — Execution surfaces.** Everything that does work, organized by modality class:

| Modality Class | Entities | Scaffold Status |
|---|---|---|
| Repo-native coding harnesses | Aider, Claude Code, Gemini CLI, Codex, OpenHands | MATURE |
| Reasoning / chat surfaces | Claude, ChatGPT, Gemini, Grok | PARTIAL |
| SaaS work / knowledge / automation | Slack, Notion, Airtable, Jira, Confluence, Coda, Linear, and others | PARTIAL |
| Daemon / runtime surfaces | OpenClaw, Claude Cowork | NONE |
| Autonomous operator surfaces | Manus | NONE |
| Recon / sensing surfaces | Perplexity | MATURE (single surface) |
| Cloud / backend substrates | Supabase, Cloudflare, and others | NONE |
| Model-routing / memory | LiteLLM, Mem0, vector stores | NONE |
| *Solopreneur stack (open slot)* | Finance, accounting, ecommerce, HR-for-agents | NOT YET ENUMERATED |

Artifact classes: enduring descriptive scaffolds, cross-entity taxonomies, teleological manuals, adapter contracts, registry rows. Current maturity: ranges from MATURE (coding harnesses) through PARTIAL (reasoning surfaces, SaaS platforms) to NONE (daemon/runtime, operators, cloud/backend, memory).

**Tier 5 — Coordination and event choreography.** Messaging and dispatch surfaces (Slack, Discord), automation engines (Make, Zapier), webhook/event systems, inter-agent communication, approval flows, receipt routing. Artifact classes: layer scaffold, coordination contracts, event schemas. Current maturity: OPEN SLOT (Slack and Discord have surface-level exegeses but no operational specification for their coordination role).

**Tier 6 — Observability and evaluation.** Traces, metrics, logs, receipts, golden tasks, eval harnesses, adoption telemetry. Artifact classes: specification, dashboard schemas, alert definitions. Current maturity: OPEN SLOT (ARCHITECTURE.md specifies observability for the coding-harness modality only; broader system observability is unspecified). Activates in proportion to the operational maturity of the surfaces it monitors.

**Tier 7 — Projection and terminal.** The ontology as typed projection surface over institutional state. The syncrescendence.com human terminal. Dashboards, query surfaces, progressive disclosure views. Artifact classes: projection contracts, schema specifications, interface designs. Current maturity: PARTIAL (ontology has a working implementation as SQLite + FastAPI projection layer over exocortex/control-plane state; target object model not yet decomposed at scaffold grade; human terminal unspecified).

**Orthogonal concern: Trust and identity boundaries.** What auth models exist across surfaces, what trust zones they create, where boundaries leak, where they must be hardened. Cross-cuts all tiers. Current maturity: NONE (scattered auth information in surface exegeses; no systematic cross-surface mapping).

**Orthogonal concern: Reversibility and migration.** How every tier can be rolled back or replaced. ARCHITECTURE.md carries a reversibility map for the coding-harness modality. No equivalent for other tiers. Current maturity: PARTIAL for coding harnesses; NONE elsewhere.

**Orthogonal concern: Epistemic status.** What is verified, inferred, provisional, or aspirational at every tier. The practice is proven (ARCHITECTURE.md's epistemic status table). Applies as a standard across all artifacts. Current maturity: ESTABLISHED as a practice; not yet formalized as a cross-cutting specification.

---

## § 4. The Artifact Taxonomy

Nine classes. Each carries a distinct structural function, authority level, and relationship to the others.

**Canon** — defines stable law or primitives. Highest earned authority. Revision requires deliberate ratification. Examples: this document, LAYER-LAW.md, AUTHORITY-LATTICE.md.

**Enduring descriptive scaffold** — the permanent high-resolution substrate from which canonical and prescriptive artifacts are synthesized. Describes what things are and how they work. Does not prescribe institutional role. Three species: surface scaffold, layer scaffold, cross-cutting scaffold. Validated against the scaffold grammar's twelve-check schema. Example: harness-taxonomy.md.

**Scaffold (provisional)** — generates understanding. Provisional by nature. Discardable once its value is extracted into downstream artifacts. Default meaning of "scaffold" when unqualified.

**Dossier** — aggregates evidence or provenance. Includes primitive exegeses (scholarly-register decompositions of individual surfaces), provenance records, and analytical reports. Example: CANONICAL-CI-PROVENANCE-REPORT.md.

**Compression** — condenses understanding without losing governing structure. Registries at maximum compression; domain cards at medium compression.

**Specification** — prescribes implementation or policy. Includes teleological manuals (operational specs for active surfaces), adapter contracts (manipulation-path specs), and grammar documents (specs for the knowledge system itself). Example: ARCHITECTURE.md (specification for the coding-harness modality).

**Ledger** — records decisions, deltas, or lineage. Includes the canonical-delta domain ledgers (temporal track), compaction snapshots, handoff packets, and decision logs.

**Registry** — catalogs typed entities. Includes the Teleology Registry (surface roles and anti-roles), the readiness matrix (per-tier maturity tracking), and future entity registries.

**Method** — defines a repeatable analytical operation or inquiry program. Includes the research-packet grammar, sensing-directive templates, and the compaction protocol. Example: METHOD-ENGINE.md.

---

## § 5. The Artifact Ladder

Two tracks share a common identifier spine and interact through a defined contract.

**Structural track** (stable, revision-cadenced): inquiry lineage → enduring descriptive scaffold → cross-entity taxonomy → teleological manual → adapter/manipulation contract → registry row → canonical law. Each level compresses the level below while preserving structural traceability. The track carries the institution's durable knowledge.

**Temporal track** (volatile, freshness-cadenced): delta domain ledgers (append-only, timestamped, source-attributed, confidence-labeled, freshness-decayed) → compaction snapshots (periodic summaries of aging entries) → sensing directives (instructions driving future delta population). The track carries the institution's current-state awareness.

**Interface between tracks:** The scaffold's stable primitive identifiers serve as the indexing key for delta entries. Delta observations that meet structural-change criteria (new primitive, removed primitive, restructured composition rules, new manipulation path, restructured auth model) generate scaffold revision requests that enter the structural track's editorial process. Scaffold staleness markers generate sensing-priority signals that enter the temporal track. The two tracks co-evolve without collapsing.

---

## § 6. The Three Tracks

**Stable substrate.** Enduring descriptive scaffolds are the permanent quarry. They describe what things are and how they work, decomposed to their primitive floor along fixed axes. They are permanent because they remain useful: canonical artifacts, teleological manuals, adapter contracts, and registry rows keep being synthesized from them. Their authority is evidential, not legislative — they describe but do not prescribe.

**Volatile deltas.** The canonical-delta layer is the refresh metabolism for volatile reality. Pricing changes, capability shifts, benchmark drift, API updates, security incidents, and operational findings accumulate as timestamped, source-attributed entries in domain ledgers. Freshness is computed, not felt. Contradictions are preserved as signal, not smoothed as noise. The delta layer absorbs the high-ρ environment's volatility so the scaffold layer does not have to.

**Generative method.** The method track carries the abstracted research engine — the reusable procedures for producing scaffolds, populating deltas, running compaction, and conducting cross-entity synthesis. It is derived from the research lineage that produced the strongest artifacts in the corpus, with the accidental prompting patterns discarded and the structural primitives preserved. The old prompts are honored as pedigree for the method, then archived. The method is the durable asset; its specific invocations are ephemeral.

---

## § 7. The Bounded-Context Operating Law

Documents are the substrate. Project memory is boot-loader cache. Chat history is convenience. Handoff packets carry resumable operational state across threads. Nothing in memory or chat continuity outranks an authored artifact.

Every construction step must be resumable from artifacts alone. If a thread dies, if context compacts, if a fresh agent starts cold, the build resumes by loading the already-ratified grammar documents plus the current handoff packet plus the named source files. The conversation is where reasoning happens; the artifacts are where conclusions land. Any conclusion that matters must exit thread context into an authored document before the thread ends.

---

## § 8. The Naming Law

One term maps to one role. Artifacts are named by function, authority level, and structural position. Ambiguity is a design problem, not a stylistic preference.

Standardized terms: **tier** for institutional decomposition (not "layer" or "stratum"). **Surface** for exocortical entities (not "tool," "platform," or "app"). **Render** for generated config files derived from canonical law (not "veneer"). **Projection** exclusively for the ontology's function. **Avatar** for the result of identity assignment via avatarization.

Surface primitives carry stable identifiers in the format `[surface-slug:primitive-name]`. These identifiers are the spine that connects scaffolds to deltas, registries, adapter contracts, and ontology entities. All cross-references between artifacts use these identifiers rather than prose descriptions or positional references.

Polysemous terms are split, not averaged: "scaffold" splits into provisional scaffold (ephemeral) and enduring descriptive scaffold (permanent). "Canon" operates on two orthogonal dimensions — artifact class (structural type) and maturity level (earned authority in the promotion hierarchy).

Full reconciliation of terminological collisions across the corpus is specified in NAMING-AND-ADDRESSING.md.

---

## § 9. The Promotion Rules

Authority is earned, not declared. An artifact's self-declared class does not determine its authority — its evidential substrate, adversarial testing, and ratification history do.

The promotion path: evidence (from scaffolds, dossiers, operational experience) → synthesis (cross-entity taxonomy, analytical framework) → adversarial testing (contradiction resolution, refutation cycles, epistemic status review) → ratification (human operator via repo, producing a canonical artifact with explicit scope boundary).

Scaffolds never promote to canon directly. Their content promotes through downstream artifacts that earn authority independently — teleological manuals through operational validation, specifications through implementation testing, registry rows through consistency checking. The scaffold remains the permanent substrate; the canon is what the promotion pipeline extracts from it.

An artifact that declares itself canon without having traversed this pipeline is overclaiming. The validation grammar and the authority lattice enforce this structurally.

---

## § 10. The Readiness Map

Current per-tier and per-modality-class maturity, assessed by structural completeness rather than quality judgment.

**Tier 1 (Environmental physics):** ESTABLISHED. Four variables instantiated. Composite assessment complete.

**Tier 2 (Constitutional law):** IN PROGRESS. Grammar-layer construction underway. Enduring strategic pillars identified but not yet extracted from the Holistic Strategic Endeavor into a clean canonical artifact.

**Tier 3 (Typed middle layer):** OPEN SLOT. Named contracts exist as placeholders. Specification blocked on operational proof.

**Tier 4 (Execution surfaces):** Mixed by modality class. Coding harnesses: MATURE (enduring layer scaffold + derived specification). Reasoning surfaces: PARTIAL (strong operational evidence, no fixed-axis scaffold). SaaS platforms: PARTIAL (fourteen surface-level exegeses, no cross-entity taxonomy). Daemon/runtime: NONE. Autonomous operators: NONE. Recon/sensing: MATURE for Perplexity (teleological manual exists). Cloud/backend: NONE. Model-routing/memory: NONE.

**Tier 5 (Coordination):** OPEN SLOT. Surface-level exegeses exist for Slack and Discord. No coordination-layer scaffold or operational specification.

**Tier 6 (Observability):** OPEN SLOT. Coding-harness observability specified in ARCHITECTURE.md. Broader system unspecified. Deferred until operational surfaces mature.

**Tier 7 (Projection/terminal):** PARTIAL. Working ontology implementation exists. Target object model undecomposed. Human terminal unspecified.

**Trust/auth (orthogonal):** NONE. Requires cross-surface mapping before typed middle layer can specify AuthBoundary contracts.

**Reversibility (orthogonal):** PARTIAL for coding harnesses; NONE elsewhere.

**Epistemic status (orthogonal):** Practice established; formalization pending.

---

## § 11. The Open Slots

Each entry names a domain that requires future scaffolds, explains why it matters, and identifies what research would fill it.

**Reasoning surfaces in chat roles** (Claude, ChatGPT, Gemini, Grok). Strong operational evidence exists in the corpus. Gap: no fixed-axis scaffold in enduring-descriptive-scaffold format. Fill: define reasoning-surface decomposition axes, extract from existing dossiers, normalize. Primarily editorial, not new external research.

**Daemon/runtime surfaces** (OpenClaw, Claude Cowork). Partial evidence exists (harness taxonomy covers OpenClaw's primitives under wrong classification; Cowork has minimal documentation). Fill: Level 1 research per surface using the method engine's research packet.

**Autonomous operator surfaces** (Manus). Headline characterization exists in the Teleology Registry. Fill: Level 1 research.

**Coordination and event choreography** (Make, Zapier, webhook systems, inter-agent communication). Slack and Discord have surface exegeses but no coordination-tier specification. Make and Zapier are entirely unresearched. Fill: Level 1 research for automation engines; teleological manual for Slack in its coordination role; specification of inter-agent communication patterns from operational experience.

**Trust/auth boundary topology.** No systematic cross-surface analysis exists. Scattered auth information in surface exegeses. Fill: cross-cutting scaffold drawing auth-boundary axis content from all surface scaffolds.

**Cloud/backend substrates** (Supabase, Cloudflare, GitHub infrastructure). Mentioned but unresearched. Fill: Level 1 research.

**Model-routing/memory layers** (LiteLLM, Mem0, vector stores). Mentioned in prior architectural documents. Fill: Level 1 research.

**Solopreneur stack** (finance, accounting, ecommerce, HR-for-agents). Not yet enumerated. This is a declared open slot for a domain category that has not yet been scoped. Fill: domain scoping first, then Level 1 research.

---

## § 12. The Build Sequence

**Completed:** Four pre-build memos — terminology reconciliation, environmental physics instantiation, reasoning-surface micro-pass, runtime modality normalization. These are consumed as input by grammar documents and archived as pedigree afterward.

**Current wave (grammar layer):** Nine documents in dependency order — this root schema (complete), then LAYER-LAW.md, ARTIFACT-GRAMMAR.md, NAMING-AND-ADDRESSING.md, SCAFFOLD-GRAMMAR.md, DELTA-METABOLISM.md, METHOD-ENGINE.md, READINESS-MATRIX.md, AUTHORITY-LATTICE.md. Opus drafts canon and method documents; Sonnet drafts specification and registry documents from explicit construction briefs under Opus ratification.

**Transition criterion to second wave:** Readiness matrix populated, method engine ratified, scaffold grammar ratified, naming/addressing ratified. At that point, scaffold production for open-slot domains begins — starting with the exocortex cross-entity synthesis (retroactive axis alignment of the fourteen existing surface exegeses), then teleological manuals for active operational organs, then primary research for unscaffolded modality classes.

**Purge criterion:** Lineage documents are archived only when five conditions are met — functional subsumption by grammar documents, method pedigree preserved, no active downstream dependency, retrieval topology exists, and bounded-context resumability verified.

The grammar layer is the machine that generates the rest of the corpus correctly. Once it is ratified, every subsequent artifact is produced into a known slot in a known structure, validated against a known grammar, and addressable from this root.
