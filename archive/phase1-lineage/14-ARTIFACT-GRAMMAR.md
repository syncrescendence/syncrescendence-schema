# ARTIFACT-GRAMMAR.md

**Class:** Canon  
**Domain:** Artifact type system and promotion law  
**Upstream:** KNOWLEDGE-ARCHITECTURE-ROOT.md §§ 4, 5, 6, 9  
**Downstream:** SCAFFOLD-GRAMMAR.md, DELTA-METABOLISM.md, NAMING-AND-ADDRESSING.md, AUTHORITY-LATTICE.md, all artifact producers  
**Last updated:** 2026-03-12  

---

## § 1. Governing Principles

Every artifact in the institution is governed by two orthogonal dimensions. The first is **class** — its structural kind, determined by the role the artifact plays in the knowledge architecture. Class answers the question: what does this artifact do? The second is **authority level** — its earned institutional weight, determined by evidential substrate, operational testing, and ratification history. Authority answers the question: how much should the institution rely on this artifact? Class is assigned by structure; authority is earned by process. A dossier is a dossier whether it is raw intake or a curated compendium. A specification is a specification whether it is an untested draft or ratified operational law. The two dimensions compose: every artifact occupies a position in a class × authority matrix, and the grammar of each dimension is independent of the other.

The artifact grammar specifies both dimensions and their interaction. Section 2 defines the class dimension: what makes an instance of each class well-formed, what it must contain, what it produces, and how it relates to other classes. Section 3 defines the authority dimension by reconciling the institution's operational Sigma/feedstock promotion hierarchy with the formal class taxonomy. Section 4 specifies the promotion ladder — the concrete gates and modes by which artifacts move along the authority dimension. Section 5 specifies the interface contract between the stable structural track and the volatile temporal track, which governs how durable knowledge and current-state awareness co-evolve without collapsing into each other.

---

## § 2. The Class Grammar

Nine classes compose the artifact type system. Each carries distinct structural requirements, well-formedness criteria, inter-class relationships, and promotion behavior. The root schema (§ 4) names and headlines each class; what follows specifies the internal grammar that determines class membership.

### 2.1 Canon

**Structural definition.** An artifact that defines stable institutional law: boundary rules, tier structure, naming conventions, promotion rules, artifact grammars, or constitutional primitives. Canon artifacts are the load-bearing skeleton of the knowledge architecture. Their authority is earned through the full promotion pipeline, never self-declared.

**Required components.** Explicit scope boundary (what this artifact governs and what it excludes). Upstream and downstream dependency declarations. Epistemic floor statement (what level of verification has been applied). Ratification record (date, ratifying authority, revision history). Internal section structure that is navigable and cross-referenceable.

**Well-formedness criteria.** (a) Every claim is either definitional (this is what X means) or structural (X relates to Y in this way); no unanchored assertions. (b) Scope boundary is testable — a reader can determine whether a given question falls inside or outside this artifact's jurisdiction. (c) No prescriptive content that belongs in a specification, no evidential content that belongs in a scaffold or dossier. (d) Dependencies are explicit and acyclic at the document level.

**Relationship to other classes.** Canon consumes: evidence from scaffolds and dossiers, operational proof from specifications, validation results from methods. Canon produces constraints consumed by: specifications (implementation boundaries), scaffolds (decomposition scope), registries (typed entry schemas), methods (procedural boundaries). Canon does not consume other canon directly — if two canon artifacts conflict, the conflict is a constitutional design problem escalated to the operator, not resolved by one canon artifact overriding another.

**Promotion behavior.** Canon is the destination, not a waypoint. Content arrives at canon through extraction from lower-authority artifacts (a boundary rule synthesized from operational evidence across multiple scaffolds) or through deepening (a specification that proves stable enough to harden into law). Canon artifacts do not promote further; they are revised in place under governance-grade deliberation.

### 2.2 Enduring Descriptive Scaffold

**Structural definition.** The permanent high-resolution substrate from which canonical, prescriptive, and compressed artifacts are synthesized. Describes what things are and how they work, decomposed to a primitive floor along fixed axes. Three species: surface scaffold (one entity along class-specific axes), layer scaffold (cross-entity taxonomy synthesizing convergent and divergent primitives across a modality class), cross-cutting scaffold (a concern that intersects multiple tiers or classes). The defining structural property: an enduring scaffold remains useful indefinitely because downstream artifacts keep being synthesized from it.

**Required components.** Declared decomposition axes. Primitive inventory at the finest granularity the evidence supports. Epistemic status labels on each claim (verified, inferred, provisional). Staleness markers tied to the temporal track via surface-primitive identifiers. Source attribution for each primitive. Scope and species declaration (surface, layer, or cross-cutting).

**Well-formedness criteria.** (a) Decomposition axes are declared and fixed — primitives are organized along stated dimensions, not accumulated ad hoc. (b) Primitive identifiers follow the `[surface-slug:primitive-name]` format and connect to the temporal track's delta entries. (c) Every primitive carries an epistemic status label. (d) The scaffold does not prescribe institutional role, operational procedure, or policy — it describes structural character. (e) Passes the scaffold grammar's twelve-check validation schema (specified in SCAFFOLD-GRAMMAR.md).

**Relationship to other classes.** Enduring scaffolds consume: evidence from dossiers, delta observations from the temporal track that trigger revision, method-engine procedures that govern their production. Enduring scaffolds produce the evidential substrate from which specifications, compressions, registry rows, and canon artifacts are synthesized. The scaffold is the quarry; downstream artifacts are what is quarried from it.

**Promotion behavior.** Enduring scaffolds do not promote by being consumed or archived. They remain as permanent substrate. Their *content* promotes through downstream artifacts: a teleological manual synthesized from a scaffold earns specification-class authority independently; a cross-entity taxonomy extracted from multiple surface scaffolds earns layer-scaffold authority. The scaffold itself gains authority through evidential deepening — more primitives identified, more claims verified, more staleness markers resolved.

### 2.3 Scaffold (Provisional)

**Structural definition.** A working artifact that generates understanding during active inquiry. Provisional by nature. Its value is extracted into downstream artifacts (enduring scaffolds, specifications, canon documents, compressions), after which the provisional scaffold may be archived. The defining structural property: a provisional scaffold has a finite useful life bounded by the completion of the inquiry it supports.

**Required components.** Statement of the inquiry or synthesis it supports. Whatever internal structure serves that inquiry (no fixed schema — provisional scaffolds are structurally diverse). Downstream-extraction markers: what content from this scaffold has been extracted, into what artifact, and what remains unextracted.

**Well-formedness criteria.** (a) The inquiry or synthesis purpose is stated. (b) The artifact does not self-declare as enduring or canonical. (c) Extracted content is marked to prevent re-extraction or double-counting. Provisional scaffolds are not validated against the scaffold grammar's twelve-check schema — that schema governs enduring scaffolds only.

**Relationship to other classes.** Provisional scaffolds consume: raw evidence, operational observations, exploratory analysis. They produce content that feeds into enduring scaffolds (structured primitive decompositions), dossiers (organized evidence), specifications (tested procedures), and compressions (distilled findings). They are the workshop floor of the knowledge architecture.

**Promotion behavior.** Provisional scaffolds promote by extraction: their valuable content is lifted into downstream artifacts of appropriate class, and the scaffold itself is archived once extraction is complete. A provisional scaffold never promotes directly to canon — its content promotes through the artifacts it generates. The root's subsumption test (five conditions for archival) governs when a provisional scaffold's lineage obligations are discharged.

### 2.4 Dossier

**Structural definition.** An artifact that aggregates evidence or provenance around a declared subject. Includes primitive exegeses (scholarly-register decompositions of individual surfaces), provenance records, analytical reports, and research packets. The defining structural property: a dossier's value is in the evidence it collects and organizes, not in the conclusions it draws.

**Required components.** Declared subject (what entity, surface, domain, or question this dossier covers). Source attribution for each piece of evidence. Internal organization that supports retrieval (by topic, date, source, or relevance — the schema varies by dossier species). Epistemic status labels distinguishing observation from inference.

**Well-formedness criteria.** (a) Evidence is attributed to specific sources. (b) The dossier's subject boundary is stated — a reader can determine what falls inside and outside its scope. (c) The dossier does not prescribe action or policy; it assembles evidence. (d) Observations and inferences are distinguished.

**Relationship to other classes.** Dossiers consume: raw observations, primary sources, operational records. They provide the evidential substrate for scaffolds (which structure the evidence into primitive decompositions), specifications (which draw on evidence to prescribe action), and canon (which draws on evidence to define law). Dossiers are the evidentiary layer beneath the structural layer.

**Promotion behavior.** Dossiers promote by deepening (accumulating and organizing more evidence at higher confidence) and by extraction (evidence from a dossier is structured into a scaffold or synthesized into a specification). A dossier at high authority is a curated, cross-referenced compendium whose evidence base is comprehensive and well-sourced.

### 2.5 Compression

**Structural definition.** An artifact that condenses understanding without losing governing structure. Compressions reduce the resolution of source material while preserving the structural relationships and key distinctions that make the source material useful. Registries at maximum compression; domain cards at medium compression; executive summaries at light compression. The defining structural property: a compression is lossily derived from higher-resolution artifacts and remains traceable to them.

**Required components.** Declaration of source artifact(s). Compression ratio indicator (what resolution level relative to the source). Structural skeleton — the governing relationships and key distinctions that survive compression. Pointers back to source artifacts for readers who need full resolution.

**Well-formedness criteria.** (a) Source artifacts are declared. (b) The governing structure of the source survives — compression loses detail, not architecture. (c) No novel claims appear that are not present in or derivable from the source material. (d) The compression is traceable: a reader can map any claim in the compression back to its source.

**Relationship to other classes.** Compressions consume: scaffolds, dossiers, specifications, canon — any artifact that carries more resolution than the compression's target. They produce: accessible summaries for progressive disclosure, registry entries, domain cards, and operational quick-references. Compressions feed the projection tier (Tier 7) and the temporal track's compaction process.

**Promotion behavior.** Compressions do not promote in the standard authority ladder. Their authority is inherited from and bounded by their source artifacts. A compression cannot exceed the authority of its sources. Compressions are revised when their sources are revised.

### 2.6 Specification

**Structural definition.** An artifact that prescribes implementation or policy for a declared scope. Includes teleological manuals (operational specs for active surfaces), adapter contracts (manipulation-path specs), grammar documents that prescribe knowledge-system rules, and operational policies. The defining structural property: a specification tells you what to do, not what something is.

**Required components.** Declared scope (what domain, surface, or process this specification governs). Prescriptive content organized for implementability. Upstream dependencies (what canon, scaffold, or evidence this specification draws on). Validation criteria (how compliance with the specification can be tested). Epistemic floor (what operational proof has been applied).

**Well-formedness criteria.** (a) Scope is declared and testable. (b) Prescriptions are actionable — an implementer can determine what to do from reading the specification. (c) The specification traces its prescriptions to upstream evidence or canon, not to unsupported assertion. (d) Validation criteria exist.

**Relationship to other classes.** Specifications consume: structural understanding from scaffolds, constitutional constraints from canon, evidence from dossiers. They produce: operational practice that generates receipts for the observability tier, evidence of success or failure that feeds back into scaffolds and canon. A specification that proves stable and structurally important across the institution may contribute content to canon through the promotion pipeline.

**Promotion behavior.** Specifications promote by operational validation: a specification that survives sustained operational use and proves structurally sound can contribute its stable principles to canon. The specification itself may remain as the operational artifact while its constitutional content is extracted into canon. Specifications can also deepen within class — an untested draft specification gains authority through operational testing.

### 2.7 Ledger

**Structural definition.** An artifact that records decisions, deltas, or lineage as an append-only sequence. Includes canonical-delta domain ledgers (the temporal track's primary storage), compaction snapshots, handoff packets, and decision logs. The defining structural property: entries accumulate; nothing is deleted or overwritten; sequence and timestamp are structural.

**Required components.** Declared domain or scope. Entry format with mandatory fields: timestamp, source attribution, and confidence label. Sequential entry identifiers. Append-only discipline — no retroactive modification of existing entries.

**Well-formedness criteria.** (a) Entries are timestamped and source-attributed. (b) Entry identifiers are sequential and unique within the ledger's scope. (c) No entry has been retroactively modified (contradictions are preserved as new entries, not as edits to old ones). (d) The ledger's domain boundary is declared.

**Relationship to other classes.** Ledgers consume: delta observations from all operational tiers, decisions from the promotion pipeline, lineage records from artifact production. They provide: temporal state to the track interface contract (feeding scaffold staleness computation and sensing directives), decision history to the authority lattice, provenance records to archival processes. Ledgers are the temporal substrate beneath the structural substrate.

**Promotion behavior.** Ledgers do not promote in the standard authority ladder. They accumulate. A ledger's authority is a function of its completeness, consistency, and operational coverage, not its position on a promotion hierarchy. Compaction snapshots periodically distill aging ledger entries into summary form, but the ledger itself remains as the append-only record.

### 2.8 Registry

**Structural definition.** An artifact that catalogs typed entities against a declared schema. Each entry follows the same structural template. The registry's value is in its coverage and consistency, not in the depth of any individual entry. Registries are maximum-compression views over the institution's entity space.

**Required components.** Declared entity type and entry schema. Per-entry fields that are mandatory across all entries. Coverage statement (what population the registry claims to cover, and known gaps). Source attribution per entry (what scaffold, dossier, or specification the entry was derived from).

**Well-formedness criteria.** (a) Every entry conforms to the declared schema. (b) Entity identifiers are unique within the registry. (c) The coverage statement is honest — gaps are declared, not silently omitted. (d) Entries are traceable to source artifacts.

**Relationship to other classes.** Registries consume: compressions extracted from scaffolds, specifications, and dossiers. They provide: typed entity inventories for the projection tier, quick-reference lookups for operational use, coverage maps for the readiness matrix. A registry is downstream of nearly everything and upstream of the projection/terminal tier.

**Promotion behavior.** Registries do not promote in the standard authority ladder. Their authority is a function of schema compliance, coverage completeness, and source traceability. A registry is revised when its schema changes (triggered by canon revision) or when new entries are added from newly produced artifacts.

### 2.9 Method

**Structural definition.** An artifact that defines a repeatable analytical operation or inquiry program. Methods abstract the reusable procedure from specific invocations: what inputs are required, what steps are performed, what outputs are produced, and how outputs are validated. The defining structural property: a method is invoked repeatedly to produce artifacts of other classes, and its value lies in the repeatability and quality of its procedure.

**Required components.** Input specification (what the method requires to begin). Procedural steps (what the method does, in enough detail that a competent executor can follow without improvisation). Output specification (what the method produces, including artifact class of the output). Validation criteria (how the output is checked). Scope declaration (what domain or artifact type this method governs).

**Well-formedness criteria.** (a) Inputs, steps, outputs, and validation criteria are all specified. (b) The method is executable by a competent agent without requiring the method's author to be present. (c) The method does not embed domain-specific content that should live in a scaffold or specification — it specifies procedure, not substance.

**Relationship to other classes.** Methods consume: constitutional constraints from canon (what the method must respect), structural patterns from proven operational experience. They produce: procedures invoked by artifact producers to generate scaffolds, dossiers, specifications, ledger entries, and registry rows. The method engine is the generative track of the three-track architecture.

**Promotion behavior.** Methods promote by operational validation: a method that repeatedly produces high-quality artifacts across diverse domains gains authority. A method that proves structurally important to the institution's production capacity may contribute its governing principles to canon. Draft methods gain authority through testing against real production tasks.

---

## § 3. The Sigma Reconciliation

The institution's operational practice carries a promotion hierarchy inherited from the repo's history: feedstock → Sigma references → Sigma → canon, with lateral positions for playbooks/operators/validated-patterns and pedigree. The nine-class artifact taxonomy carries a type system organized by structural function. These are not competing hierarchies. They are orthogonal dimensions: the Sigma ladder tracks earned authority, while the class taxonomy tracks structural kind. This section makes the orthogonality explicit and maps their interaction.

### 3.1 The Authority Dimension

Four authority levels, derived from the Sigma hierarchy and formalized as a dimension independent of class:

**Level 0 — Intake.** Raw material entering the system. Unprocessed, unvalidated, uncurated. The "feedstock" rung. Institutional weight: none — intake material informs but does not bind. Any class of artifact can exist at intake level: a raw dossier of unprocessed evidence, a first-draft specification, an untested method, an unstructured provisional scaffold. The defining property: no editorial or evidential process has been applied beyond initial capture.

**Level 1 — Curated.** Material that has been organized, cross-referenced, and editorially processed. The "Sigma references" rung. Institutional weight: evidential — this material can be relied upon as structured input for synthesis and decision-making, though it does not prescribe or bind. The defining property: editorial process has organized raw intake into retrievable, attributed, structurally coherent form.

**Level 2 — Operational.** Material that has been validated through repeated operational use and is relied upon as secondary doctrine. The "Sigma" rung. Institutional weight: operational — this material guides practice and is consulted as authoritative within its scope, though it remains revisable without constitutional process. The defining property: operational testing has confirmed the artifact's utility and accuracy across multiple uses or contexts.

**Level 3 — Constitutional.** Material that has been ratified as institutional law. The "canon" rung, applied to canon-class artifacts specifically. Institutional weight: binding — this material defines the rules other artifacts must respect. The defining property: the full promotion pipeline (evidence → synthesis → adversarial testing → ratification) has been traversed, and the human operator has ratified via repo commit. Only canon-class artifacts reach Level 3; for all other classes, Level 2 is the authority ceiling.

### 3.2 The Lateral Positions

Two positions in the Sigma hierarchy do not map to authority levels. They map to lifecycle states or class-specific authority positions:

**Playbooks, operators, and validated patterns** are specification-class artifacts (teleological manuals, adapter contracts, operational procedures) at authority Level 2 (operational). They are distinguished from other Level 2 specifications not by authority but by their validation basis — they have been confirmed through "repeated operational wins" rather than through one-time verification. They do not form a separate authority level; they are specifications whose operational validation is especially strong.

**Pedigree** is a lifecycle state, not an authority level. An artifact in pedigree status is retired from active institutional authority but preserved for provenance, ancestry, and cautionary reference. Pedigree applies to artifacts of any class at any prior authority level: a retired canon document that has been superseded, a historical dossier whose evidence has been fully extracted, a deprecated specification replaced by a successor. The transition to pedigree is governed by the root's five-condition archival test (functional subsumption, method pedigree preserved, no active downstream dependency, retrieval topology exists, bounded-context resumability verified). Pedigree is the institution's memory of what came before, kept readable but no longer authoritative.

### 3.3 Class × Authority Interaction

Not all classes participate equally across all authority levels. The interaction rules:

Canon-class artifacts exist only at Level 3. An artifact at Level 0, 1, or 2 that contains law-like content is not yet canon — it is a draft specification or provisional scaffold whose content may eventually be extracted into canon. No artifact self-promotes to canon class by declaring itself canonical.

Enduring descriptive scaffolds operate at Levels 1 and 2. At Level 1 a scaffold has been structured along its decomposition axes with attributed evidence but has not yet been operationally validated. At Level 2 a scaffold has been validated against the twelve-check schema and has demonstrated utility as synthesis substrate through successful downstream artifact production. Scaffolds do not reach Level 3 — their content promotes into canon through extraction, but the scaffold itself remains a Level 2 substrate artifact.

Provisional scaffolds operate at Levels 0 and 1 only. At Level 0 they are raw working documents. At Level 1 they have been organized enough to support extraction. They never reach Level 2 because reaching operational authority would mean they should have been structured as enduring scaffolds instead.

Dossiers operate at Levels 0 through 2. Raw evidence aggregation at Level 0. Curated, cross-referenced compendium at Level 1. Comprehensive, operationally relied-upon evidence base at Level 2.

Specifications operate at Levels 0 through 2, with Level 2 content potentially extractable into canon (Level 3) for its stable constitutional principles. Draft at Level 0. Tested at Level 1. Operationally validated and relied upon at Level 2.

Compressions inherit the authority level of their source artifacts and cannot exceed it.

Ledgers and registries do not participate in the standard authority ladder. Their authority is a function of completeness and consistency, not promotion. A ledger is well-formed or ill-formed, comprehensive or partial — but "authoritative" and "provisional" are not meaningful distinctions for an append-only record or a schema-governed catalog.

Methods operate at Levels 0 through 2. Draft at Level 0. Tested against sample tasks at Level 1. Operationally validated through repeated successful production at Level 2. A method's governing principles may be extracted into canon at Level 3.

---

## § 4. The Promotion Ladder

Root schema § 9 defines the abstract promotion path: evidence → synthesis → adversarial testing → ratification. This section operationalizes that path into concrete gates, modes, and governance.

### 4.1 Promotion Gates

Each authority-level transition requires specific evidence:

**Level 0 → Level 1 (Intake → Curated).** Gate: editorial processing. The artifact has been organized according to its class grammar's required components, source-attributed, and internally consistent. For scaffolds: decomposition axes are declared and primitives are identified. For dossiers: evidence is organized and attributed. For specifications: scope is declared and prescriptions are stated. For methods: input/output/steps are specified. The gate is structural completeness relative to the class grammar, not quality or correctness.

**Level 1 → Level 2 (Curated → Operational).** Gate: operational validation. The artifact has been tested against real use and demonstrated fitness. For enduring scaffolds: the twelve-check validation schema passes and at least one downstream artifact has been successfully synthesized from the scaffold. For specifications: the specification has been implemented and the implementation has been verified against the specification's own validation criteria. For methods: the method has been invoked on at least one real production task and the output has been validated. For dossiers: the evidence base has been used as input for synthesis or decision-making and found reliable. The gate is demonstrated utility in actual institutional operation.

**Level 2 → Level 3 (Operational → Constitutional).** Gate: ratification. Applies only to the promotion of content into canon-class artifacts. Requires: (a) the content has been stable at Level 2 long enough to demonstrate durability, (b) adversarial testing has been applied — the content has been challenged, edge cases examined, contradictions with existing canon checked, (c) the human operator ratifies via explicit repo commit with scope boundary and class assignment declared. This gate is deliberately high-friction: constitutional change propagates into many downstream artifacts and is effectively irreversible at short timescales.

### 4.2 Promotion Modes

Three structural modes describe how promotion occurs:

**Extraction.** Content is lifted from a source artifact into a new artifact of different (typically higher) class. The source artifact remains; the new artifact earns authority independently. This is the primary mode for scaffold → specification, scaffold → canon, and dossier → scaffold transitions. Extraction preserves the source as permanent substrate while generating downstream artifacts that carry their own authority trajectory.

**Deepening.** An artifact gains authority within its class through evidential accumulation and operational testing. A dossier grows from raw evidence to curated compendium. A specification gains authority through operational validation. The artifact's class does not change; its authority level advances. Deepening is the primary mode for authority advancement within a single class.

**Transformation.** An artifact changes class during promotion. This is structurally rare and occurs mainly at the early stages: raw observations (unclassified intake) are organized into a dossier (class assignment), or a provisional scaffold's extracted content is restructured into an enduring scaffold (class migration). Transformation should be explicit — the artifact receives a new class assignment, and the relationship to the prior form is recorded.

### 4.3 Demotion and Retirement

Authority is not permanent. Three mechanisms reduce an artifact's institutional standing:

**Demotion.** An artifact's authority level decreases in response to changed evidence — a specification that fails operational testing, a scaffold whose primitives are invalidated by new research, a method whose procedure is found to produce unreliable outputs. Demotion is a structural response, not a judgment. The artifact retains its class; its authority level reverts to the highest level its current evidence supports.

**Supersession.** A new artifact of the same class and scope replaces an older one. The predecessor transitions to pedigree status if it meets the five-condition archival test. The successor inherits the predecessor's structural position but earns its own authority from Level 0.

**Retirement to pedigree.** An artifact exits active institutional authority and enters pedigree status. Governed by the five-condition archival test from root § 12: functional subsumption by a successor artifact, method pedigree preserved, no active downstream dependency, retrieval topology exists (the retired artifact remains findable), and bounded-context resumability verified (the institution can still function if this artifact is needed for reference). Retirement preserves provenance without maintaining active authority.

### 4.4 Ratification Authority

The boundary law governs: the repo ratifies. Concretely: the human operator commits to the repo with an explicit scope boundary and class assignment. No artifact self-promotes. No AI agent ratifies — agents draft, test, and recommend; the operator decides. Promotion to Level 2 (operational) can be recorded by any authorized committer but requires documented operational evidence. Promotion to Level 3 (constitutional) requires explicit operator ratification as a deliberate governance act.

---

## § 5. The Track Interface Contract

The root schema (§§ 5–6) defines two tracks — the stable structural track carrying durable knowledge and the volatile temporal track carrying current-state awareness. They share a common identifier spine and interact through a defined contract. This section specifies that contract at operational resolution. It does not specify the temporal track's internal metabolism (DELTA-METABOLISM.md) or the scaffold's validation schema (SCAFFOLD-GRAMMAR.md). It specifies the bridge between the two tracks.

### 5.1 The Indexing Spine

Surface primitive identifiers in `[surface-slug:primitive-name]` format serve as the shared key between tracks. A scaffold primitive and a delta entry that reference the same identifier describe the same real-world element from different temporal perspectives: the scaffold describes its structural character (what it is), and the delta records its current state (what it is doing now, what changed, what was observed). The identifier format is specified in NAMING-AND-ADDRESSING.md; the structural requirement here is that both tracks use the same identifiers, and that any delta entry can be traced to the scaffold primitive it observes.

Not all delta entries reference scaffold primitives. Domain-level observations (market shifts, model releases, pricing changes) may reference a domain identifier rather than a surface primitive. The contract requires that every delta entry carry at least one typed reference — either a surface-primitive identifier or a domain identifier — that connects it to the structural track's scope map. Unanchored delta entries (observations that reference nothing in the structural track) are valid as intake but cannot trigger scaffold revision until they are anchored.

### 5.2 Structural-Change Criteria

A delta observation qualifies as a structural change when it reports one of the following against a scaffold primitive:

**New primitive.** A previously undocumented capability, config surface, object type, or manipulation path is observed. The scaffold's primitive inventory is incomplete.

**Removed primitive.** A previously documented primitive is no longer present — a deprecated API, a removed config option, a discontinued capability. The scaffold's primitive inventory is overcomplete.

**Restructured composition.** The relationships between existing primitives have changed — a config cascade has been reordered, an auth model has been reorganized, a data model has been restructured. Individual primitives may be unchanged, but their composition is different.

**New manipulation path.** A new way of interacting with an existing primitive has appeared — a new API endpoint, a new UI surface, a new integration channel. The scaffold's manipulation-path inventory is incomplete.

**Restructured auth model.** The trust, permission, or identity structure governing a primitive or surface has changed. Auth boundary shifts have cross-cutting implications and are treated as high-priority structural changes.

A delta observation that meets any of these criteria generates a **scaffold revision request** — a typed signal that enters the structural track's editorial queue. The revision request references the affected scaffold, the delta entry that triggered it, the structural-change category, and the evidence supporting the change. Scaffold revision requests accumulate; they do not trigger immediate revision. The editorial process determines when accumulated revision requests warrant a scaffold update, based on volume, severity, and the tier's revision cadence.

### 5.3 Freshness Signal Flow

In the reverse direction, the structural track generates sensing-priority signals that enter the temporal track. Freshness is computed, not felt. Each scaffold primitive carries a **last-observed timestamp** derived from the most recent delta entry referencing that primitive's identifier. Staleness is the gap between the last-observed timestamp and the current date, evaluated against the tier's ρ-appropriate freshness threshold: high-ρ domains (model capabilities, pricing, tool ecosystem) decay fast and have short freshness windows; low-ρ domains (constitutional structure, environmental physics) decay slowly and have long freshness windows.

When a scaffold primitive's staleness exceeds its tier's threshold, the primitive generates a **sensing directive** — a typed signal that enters the temporal track's observation queue. The sensing directive specifies: what primitive needs re-observation, what scaffold it belongs to, what the last observation was, and what confidence level the next observation should target. Sensing directives are prioritized by staleness severity and by the primitive's structural importance (primitives that feed many downstream artifacts are higher priority than isolated ones).

### 5.4 Non-Collapse Guarantee

The two tracks remain structurally distinct through three mechanisms:

**Temporal discipline.** Scaffolds are revision-cadenced (updated through editorial process at intervals appropriate to their tier's λ). Ledgers are freshness-cadenced (entries accumulate continuously as observations arrive). A scaffold never becomes an append-only stream; a ledger never becomes a revision-cadenced document. The cadence type is a structural property of the track, not a choice made per-artifact.

**Authority asymmetry.** The structural track carries institutional authority (scaffolds and canon define what things are). The temporal track carries observational authority (ledgers record what was seen). A delta entry does not override a scaffold claim — it signals that the scaffold may need revision. The revision happens through the structural track's editorial process, not through temporal track accumulation.

**Interface narrowness.** The tracks interact only through the typed signals defined in §§ 5.2–5.3: scaffold revision requests (temporal → structural) and sensing directives (structural → temporal). No other communication channel exists between the tracks. A scaffold author does not browse the delta ledger for updates; the revision-request pipeline delivers structurally significant changes. A sensing-directive author does not browse the scaffold for gaps; the staleness computation identifies where observation is needed. The interface is narrow by design — wide coupling between the tracks would collapse them into a single undifferentiated knowledge stream.

---

## § 6. The Scaffold-Species Resolution

The root schema lists nine artifact classes, splitting "scaffold" into two: enduring descriptive scaffold and scaffold (provisional). The project doctrine's artifact taxonomy lists eight classes, treating "scaffold" as unified. This section resolves the discrepancy.

**Resolution: two classes.** Enduring descriptive scaffolds and provisional scaffolds are distinct classes, not species of a single class. The root schema's nine-class treatment is authoritative.

**Structural argument.** The two artifact types differ on every dimension that constitutes class membership. They have different lifecycles: enduring scaffolds are permanent; provisional scaffolds are finite-lived. They have different well-formedness criteria: enduring scaffolds must pass the twelve-check validation schema with fixed decomposition axes and primitive identifiers; provisional scaffolds have no fixed structural requirement beyond stating their inquiry purpose. They have different promotion behaviors: enduring scaffolds remain as permanent substrate while their content is extracted into downstream artifacts; provisional scaffolds are consumed by extraction and archived when spent. They have different authority ceilings: enduring scaffolds reach Level 2; provisional scaffolds reach Level 1. They occupy different positions in the three-track architecture: enduring scaffolds are the core of the stable structural track; provisional scaffolds are workshop artifacts that exist alongside the structural track but are not part of its permanent inventory.

**Consequence for the class grammar.** Each class has its own section in § 2 (2.2 and 2.3) with independent required components, well-formedness criteria, inter-class relationships, and promotion behavior. A scaffold artifact must be classified as one or the other at creation; ambiguity between the two is a design problem to be resolved, not a state to be tolerated.

**Consequence for the promotion ladder.** The authority ceiling for enduring scaffolds is Level 2. The authority ceiling for provisional scaffolds is Level 1. A provisional scaffold that proves structurally important enough to be permanent should be reclassified as an enduring scaffold (a transformation-mode promotion) and restructured to meet the enduring scaffold's well-formedness criteria, not left as a provisional artifact carrying enduring authority.

**Reconciliation with project doctrine.** The project doctrine's eight-class taxonomy is updated to reflect the nine-class resolution. The unified "scaffold" entry in the doctrine splits into two entries that match the root schema. This is a terminological correction to the doctrine, not a substantive change — the doctrine's single description already implicitly covered both roles ("generates understanding, provisional by nature" describes the provisional species; the more enduring connotation of "scaffold" aligns with the enduring species). Making the split explicit resolves the ambiguity.

---

*Assessment as of 2026-03-12: all sections drafted. Pending operator review and ratification. The Sigma reconciliation (§ 3) and the track interface contract (§ 5) are the highest-stakes sections — downstream grammar documents (DELTA-METABOLISM.md, SCAFFOLD-GRAMMAR.md, AUTHORITY-LATTICE.md) build directly against them.*
