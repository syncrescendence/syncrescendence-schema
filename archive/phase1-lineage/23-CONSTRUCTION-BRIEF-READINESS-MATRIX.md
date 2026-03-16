# CONSTRUCTION BRIEF: READINESS-MATRIX.md

## Document Identity
**Name:** READINESS-MATRIX.md
**Artifact class:** Registry (catalogs typed entities against a declared schema)
**Teleology:** Provides a typed, multi-axis assessment of the institution's current structural maturity. Absorbs the deferred current-status assessments from LAYER-LAW.md. Provides the surface-to-scaffold lookup identified as a gap in the NAMING-AND-ADDRESSING.md review. Catalogs readiness across four distinct axes: tier/modality-class maturity, scaffold coverage, method coverage, and temporal-domain coverage. This is the institution's self-knowledge about its own completeness — not a roadmap or a plan, but a governed registry of what exists, what is missing, and what maturity level each component has reached.

## Relationship to Upstream Documents

**LAYER-LAW.md §§ 2–8** define per-tier maturity semantics (what ESTABLISHED, IN PROGRESS, PARTIAL, OPEN SLOT, MATURE, and NONE mean for each tier). LAYER-LAW.md's current-status lines (dated 2026-03-12) are bootstrap assessments that this document absorbs as the authoritative maturity record. The readiness matrix applies the maturity semantics; it does not redefine them.

**SCAFFOLD-GRAMMAR.md § 3** defines the twelve-check validation schema. Scaffold maturity is assessed by validation-pass rate: how many of the twelve checks does each scaffold pass? The readiness matrix uses this schema as its scaffold-readiness criteria without restating the checks.

**DELTA-METABOLISM.md §§ 2, 3.2** define domain architecture and freshness computation. Temporal-domain readiness is assessed by domain health: how many domains exist, what is their freshness distribution, what is their compaction status? The readiness matrix uses the delta metabolism's domain criteria without restating them.

**METHOD-ENGINE.md § 3** defines the initial method catalog with authority levels. Method readiness is assessed by catalog coverage and authority levels: which methods exist, at what authority level, which open slots remain unfilled?

**ARTIFACT-GRAMMAR.md §§ 2, 3** define the nine artifact classes and four authority levels. The readiness matrix's entry schema must be able to classify every assessed entity by class and authority level.

**NAMING-AND-ADDRESSING.md §§ 2, 5** define identifier formats. The readiness matrix's entries must use correct identifiers for every entity they catalog: surface identifiers, scaffold identifiers, method identifiers, domain identifiers.

**KNOWLEDGE-ARCHITECTURE-ROOT.md § 10 (Readiness Map)** provides the headline per-tier and per-modality-class maturity assessment. The readiness matrix replaces this headline assessment with a granular, schema-governed registry.

**KNOWLEDGE-ARCHITECTURE-ROOT.md § 11 (Open Slots)** enumerates domains requiring future scaffolds. The readiness matrix absorbs this enumeration as its scaffold-coverage gap inventory.

## The Core Design Problem

The readiness matrix must assess institutional maturity across multiple axes without collapsing them into a single blurred "readiness" score. The institution is mature in some dimensions (coding-harness scaffolding is MATURE; the grammar layer is nearly complete) and immature in others (most Tier 4 modality classes lack scaffolds; the temporal track has no operational domains yet; most methods are at Level 0 or 1). A single readiness score would hide this heterogeneity. The matrix must preserve it.

Simultaneously, the matrix must be a registry — a schema-governed catalog with typed entries — not a narrative assessment essay. Each entry follows a declared schema. Coverage gaps are explicit rows, not prose observations. The matrix is queryable: "which modality classes lack a layer scaffold?" produces a list, not a paragraph.

The secondary design problem: the readiness matrix must provide the surface-to-scaffold lookup that the NAMING-AND-ADDRESSING.md review (Check 3) identified as a gap. When a primitive identifier resolves against "the canonical scaffold for that surface" (NAMING-AND-ADDRESSING.md § 3.2), the readiness matrix is where that mapping lives. This means the matrix must catalog not just maturity levels but entity relationships: which scaffold covers which surface, which method governs which operation, which domain maps to which tier.

## Required Section Structure

### § 0. Query Handle
Domain: institutional maturity assessment. Class: registry. Upstream: all seven prior grammar documents. Downstream: AUTHORITY-LATTICE.md (consults maturity assessments for decision-rights calibration), all scaffold producers (consult coverage gaps to identify production targets), the operator (consults for Phase 2 transition readiness).

### § 1. Governing Principles (≤2 paragraphs)
The readiness matrix is the institution's self-assessment. It catalogs what exists and what is missing across four maturity axes, using the criteria defined in upstream grammar documents. It is a registry, not a narrative — entries follow a declared schema, gaps are explicit, and maturity levels are assigned by structural criteria rather than qualitative judgment. The matrix is the authoritative home for current-status assessments that were bootstrapped in LAYER-LAW.md and ROOT § 10 and are now maintained here.

Source: root § 10 (headline readiness map to be replaced), layer law §§ 2–8 (maturity semantics), artifact grammar § 2.8 (registry class grammar).

### § 2. The Four Maturity Axes

Define the four axes and what each assesses:

**Axis 1 — Tier and modality-class maturity.** Assesses structural completeness at the tier level and, within Tier 4, at the modality-class level. Maturity levels: ESTABLISHED, IN PROGRESS, PARTIAL, OPEN SLOT, MATURE, NONE — per LAYER-LAW.md maturity semantics. Each tier entry includes: tier number, current maturity level, what structural conditions define each level for this tier (by reference to LAYER-LAW.md), what the next maturity milestone is, and what blocks advancement. For Tier 4, per-modality-class sub-entries using the same schema.

**Axis 2 — Scaffold coverage.** Assesses which entities have enduring descriptive scaffolds and at what quality level. Entry schema: entity identifier (surface slug or modality-class slug or concern slug), scaffold identifier (if a scaffold exists) or gap marker, scaffold species (surface, layer, or cross-cutting), scaffold authority level (0–2), twelve-check pass count (how many of twelve checks the scaffold passes), known check failures, and remediation status. This axis provides the surface-to-scaffold lookup: given a surface slug, the matrix returns the scaffold that covers it (or a gap marker if none exists).

**Axis 3 — Method coverage.** Assesses which methods exist and at what authority level. Entry schema: method name, method-engine section reference, authority level (0–2), invocation count (if tracked), validation status (untested, tested-once, operationally-validated), and open-slot indicator for methods that are declared but unspecified.

**Axis 4 — Temporal-domain coverage.** Assesses which delta domains exist and their health. Entry schema: domain identifier, tier mapping, freshness-window class (high-ρ, moderate-ρ, low-ρ), current freshness distribution (how many entries at each freshness grade), last-compaction date, and active/pedigree lifecycle status. This axis also identifies domains that should exist (based on the tier model and modality classes) but do not yet — domain-coverage gaps.

Source: layer law §§ 2–8 (tier maturity semantics), scaffold grammar § 3 (twelve-check schema), method engine § 3 (method catalog), delta metabolism §§ 2, 3.2 (domain architecture, freshness computation).

### § 3. Entry Schema

Define the formal schema for each axis's entries. Each entry type must specify: mandatory fields, optional fields, field types (identifier, enumeration, integer, date, free text), and field constraints (valid values, uniqueness requirements, referential integrity to other axes).

The schema should be concrete enough that a tooling layer could validate entries programmatically, even though the initial implementation is likely a markdown table. The schema is the structural requirement; the rendering format is an implementation choice.

Cross-axis references: a scaffold-coverage entry (Axis 2) references a tier/modality-class entry (Axis 1) for its tier context. A temporal-domain entry (Axis 4) references a tier entry (Axis 1) for its freshness-window derivation. These cross-references use the identifier formats from NAMING-AND-ADDRESSING.md.

Source: artifact grammar § 2.8 (registry class grammar: declared entity type, entry schema, per-entry mandatory fields, coverage statement, source attribution).

### § 4. The Initial Population

Populate the registry with all entities currently known to the institution. This is the initial state assessment that replaces ROOT § 10 and absorbs LAYER-LAW.md's current-status lines.

**Axis 1 population:** All seven tiers with their current maturity levels, sourced from LAYER-LAW.md's dated assessments. All eight Tier 4 modality classes plus the open slot, with maturity levels sourced from ROOT § 10 and LAYER-LAW.md § 5.

**Axis 2 population:** All surfaces with known scaffolds (harness-taxonomy.md covering six coding harnesses) and all surfaces without scaffolds (the fourteen surface-exegesis surfaces, plus surfaces enumerated in the Teleology Registry that lack even dossier coverage). The harness taxonomy entry should record its twelve-check pass count (5 of 12) and known failures.

**Axis 3 population:** All five initial methods plus two open slots from METHOD-ENGINE.md § 3, with their declared authority levels.

**Axis 4 population:** Initially empty — no delta domains have been operationally established under the grammar layer. The section should declare the gap explicitly: zero operational domains, with the recommended initial domain set from the Live Ledger Précis as the reference for future population.

Source: root § 10 (headline assessments), layer law §§ 2–8 (per-tier current status), layer law § 5 (per-modality-class status), method engine § 3 (method catalog), EXOCORTEX-TELEOLOGY-REGISTRY-CC90 (surface inventory for scaffold-coverage gaps).

### § 5. Maintenance Rules

Specify how the readiness matrix is updated:

**Trigger-based updates.** The matrix is updated when: a new artifact is ratified (scaffold, specification, method), a scaffold passes additional validation checks, a method advances in authority level, a new delta domain is created, or a domain's freshness distribution changes significantly.

**Assessment cadence.** The matrix is re-assessed comprehensively at quarterly intervals. Between assessments, it is updated incrementally on trigger events.

**Authority.** The readiness matrix is a registry-class artifact outside the standard authority ladder (per ARTIFACT-GRAMMAR.md § 3.3). Its authority is a function of coverage completeness and assessment recency, not promotion level. The human operator is the assessment authority — maturity levels are assigned by operator judgment applying the criteria defined in upstream grammar documents, not by automated computation (though automated checks like twelve-check pass counts can inform the assessment).

Source: artifact grammar § 2.8 (registry class promotion behavior — registries are revised when schemas change or new entries are added), delta metabolism § 2.3 (freshness computation as a model for matrix freshness).

## Anti-Patterns
- Do NOT produce a narrative assessment essay — the matrix is a schema-governed registry with typed entries
- Do NOT produce a roadmap or project plan — the matrix assesses current state, not future intent
- Do NOT collapse the four maturity axes into a single "readiness score" — heterogeneous maturity is the reality and must be preserved
- Do NOT restate tier maturity semantics from LAYER-LAW.md — apply them
- Do NOT restate the twelve-check schema from SCAFFOLD-GRAMMAR.md — reference it
- Do NOT restate method authority levels from METHOD-ENGINE.md — catalog them
- Do NOT overpromote ARCHITECTURE.md — it is one entry in the scaffold-coverage axis (a specification derived from a scaffold), not the institutional readiness benchmark
- Do NOT include aspirational or planned entries — catalog what exists and what is missing, not what is intended
- Do NOT use retired terminology

## Source Documents to Load
1. LAYER-LAW.md §§ 2–8 (ratified — per-tier maturity semantics and current-status assessments)
2. SCAFFOLD-GRAMMAR.md § 3 (ratified — twelve-check schema as scaffold maturity criteria)
3. DELTA-METABOLISM.md §§ 2, 3.2 (ratified — domain architecture and freshness computation)
4. METHOD-ENGINE.md § 3 (ratified — method catalog with authority levels)
5. ARTIFACT-GRAMMAR.md §§ 2, 3 (ratified — class grammar and authority levels)
6. NAMING-AND-ADDRESSING.md §§ 2, 5 (ratified — identifier formats for all cataloged entities)
7. KNOWLEDGE-ARCHITECTURE-ROOT.md §§ 10, 11 (ratified — headline readiness map and open-slot enumeration to be absorbed)
8. EXOCORTEX-TELEOLOGY-REGISTRY-CC90 (surface inventory for Axis 2 population)
9. harness-taxonomy.md (specimen: the one scaffold to be assessed against the twelve checks)

## Validation Checks (post-draft)
- [ ] All four maturity axes are defined with distinct assessment criteria
- [ ] Entry schemas are specified for each axis with mandatory fields, types, and constraints
- [ ] Axis 1 is populated with all seven tiers and all Tier 4 modality classes
- [ ] Axis 2 provides the surface-to-scaffold lookup (given a surface, returns its scaffold or a gap marker)
- [ ] Axis 2 includes the harness taxonomy's twelve-check assessment (5 pass, 7 fail with known failures)
- [ ] Axis 3 catalogs all five methods plus two open slots with their authority levels
- [ ] Axis 4 honestly records zero operational domains with the gap declared
- [ ] Current-status assessments from LAYER-LAW.md are absorbed and superseded
- [ ] Open slots from ROOT § 11 are absorbed as scaffold-coverage gaps in Axis 2
- [ ] Maintenance rules specify trigger-based and cadence-based update mechanisms
- [ ] No narrative essay, roadmap, or project plan content
- [ ] No collapsed single-score readiness assessment
- [ ] Cross-axis references use correct identifier formats
- [ ] Total length: 2500–4500 words (registry entries are compact; the schema definition and initial population are the bulk)

## Downstream Artifacts This Document Unlocks
AUTHORITY-LATTICE.md consults the readiness matrix for maturity-informed decision-rights calibration (where maturity is low, decision rights may be more centralized; where maturity is high, delegation is safe). The operator consults the matrix for Phase 2 transition readiness: are all nine grammar documents ratified? Is the method engine operational? Is scaffold coverage sufficient to begin production? Scaffold producers consult Axis 2 to identify production targets. Sensing agents consult Axis 4 to identify domain gaps. The readiness matrix is the institution's dashboard — not in the projection-tier sense (that is the ontology) but in the governance sense (what do we know about our own completeness?).

## Drafter
Opus for §§ 1–3 and § 5 (governing principles, axis definitions, entry schemas, maintenance rules — these involve architectural judgment about what maturity means across heterogeneous dimensions). Sonnet may assist with § 4 (initial population) under a tightly scoped sub-brief, since the population involves cataloging known entities from existing documents — substantive but non-architectural work.
