# CONSTRUCTION BRIEF: SCAFFOLD-GRAMMAR.md

## Document Identity
**Name:** SCAFFOLD-GRAMMAR.md
**Artifact class:** Specification (prescribes how enduring descriptive scaffolds are structured, produced, and validated)
**Teleology:** Defines the twelve-check validation schema referenced by ARTIFACT-GRAMMAR.md § 2.2, the production procedure for building enduring descriptive scaffolds from evidence, and the three scaffold species (surface, layer, cross-cutting) at operational resolution. This document is both the quality gate and the production manual for the institution's most important substrate artifacts.

## Relationship to Upstream Documents

**ARTIFACT-GRAMMAR.md § 2.2 (Enduring Descriptive Scaffold)** gives the class grammar: structural definition, required components (decomposition axes, primitive inventory, epistemic labels, staleness markers, source attribution, scope/species declaration), well-formedness criteria (five conditions including "passes the scaffold grammar's twelve-check validation schema"), inter-class relationships, and promotion behavior. SCAFFOLD-GRAMMAR.md operationalizes the required components into a production procedure and the well-formedness criteria into a concrete validation schema. It must not repeat the class grammar; it must specify the schema and procedure that the class grammar references.

**ARTIFACT-GRAMMAR.md § 5 (Track Interface Contract)** specifies that enduring scaffolds carry staleness markers computed from the temporal track, receive scaffold revision requests triggered by structural-change observations, and generate sensing directives for stale primitives. The scaffold grammar must specify how these mechanisms are embedded in the scaffold's structure — where staleness markers live, how revision requests are processed into editorial changes, and how sensing directives are generated from the scaffold's primitive inventory.

**NAMING-AND-ADDRESSING.md § 2.2 (Primitive Identifiers)** specifies the `[surface-slug:primitive-name]` format. The scaffold grammar must specify how primitives are identified during scaffold production: when identifiers are assigned, how they are formatted, and how they connect to the indexing spine.

**NAMING-AND-ADDRESSING.md § 2.7 (Authority/Lifecycle Markers)** specifies that authority and lifecycle are tracked in artifact headers. The scaffold grammar must specify the scaffold's header requirements.

**LAYER-LAW.md § 5 (Tier 4)** specifies per-modality-class decomposition axes. The scaffold grammar must specify how decomposition axes are selected and declared for each scaffold species, drawing on the per-class axes documented in the layer law.

**harness-taxonomy.md** is the mature specimen: a layer scaffold covering six coding harnesses across nineteen unified-primitive clusters and per-surface idiosyncratic sections, plus a cross-cutting synthesis. The scaffold grammar should be reverse-engineerable from this specimen — every structural requirement should hold true of the harness taxonomy, and every structural feature of the harness taxonomy that is generalizable should appear as a requirement.

**Existing surface exegeses (report-*.md files)** are dossier-class artifacts, not scaffolds. They are scholarly decompositions of individual surfaces that carry rich evidence but do not follow fixed decomposition axes, do not assign primitive identifiers, and do not carry staleness markers. The scaffold grammar must articulate what transforms a dossier into a scaffold: the structural operations (axis declaration, primitive identification, epistemic labeling, identifier assignment) that the method engine will execute on dossier evidence to produce scaffold-grade output.

## The Core Design Problem

The twelve-check validation schema must serve two functions simultaneously. First, it must be a quality gate that a finished scaffold can be validated against — a checker can run the twelve checks and produce a pass/fail/partial result with specific deficiencies identified. Second, it must implicitly encode the production procedure — a scaffold producer who understands what the twelve checks test will know what structural features to build into the scaffold during production. The challenge is designing checks that are both validatable (specific enough to test) and generative (informative enough to guide production).

The production procedure itself must bridge the gap between dossier-grade evidence (rich but unstructured) and scaffold-grade structure (fixed axes, identified primitives, epistemic labels, staleness markers). The method engine (METHOD-ENGINE.md) will later abstract this procedure into a reusable operation, but SCAFFOLD-GRAMMAR.md must specify the structural transformation regardless of method abstraction.

The three scaffold species — surface, layer, cross-cutting — share the twelve-check schema but differ in scope, source material, and synthesis operations. A surface scaffold decomposes one entity along modality-class axes. A layer scaffold synthesizes convergent and divergent primitives across multiple entities within a modality class. A cross-cutting scaffold maps a concern (trust/auth, reversibility, epistemic status) across multiple tiers or classes. The grammar must specify the species-specific requirements without producing three separate schemas.

## Required Section Structure

### § 0. Query Handle
Domain: enduring descriptive scaffold structure, production, and validation. Class: specification. Upstream: ARTIFACT-GRAMMAR.md § 2.2, § 5; NAMING-AND-ADDRESSING.md §§ 2.2, 2.7; LAYER-LAW.md § 5. Downstream: METHOD-ENGINE.md, all scaffold producers, READINESS-MATRIX.md (scaffold maturity assessment criteria).

### § 1. Governing Principles (≤3 paragraphs)
Enduring descriptive scaffolds are the institution's permanent quarry. Their structural integrity determines the quality of everything synthesized from them: specifications, compressions, registry rows, and canon. The scaffold grammar specifies what makes a scaffold structurally sound (the validation schema) and how to build one (the production procedure). Both serve the same end: ensuring that the institution's descriptive substrate is decomposed to its primitive floor, correctly labeled, properly connected to the temporal track, and navigable by any bounded-context builder.

Provisional scaffolds are explicitly out of scope. Their minimal criteria are specified in ARTIFACT-GRAMMAR.md § 2.3. This document governs enduring descriptive scaffolds only — the artifacts that populate the stable structural track.

Source: root § 6 ("enduring descriptive scaffolds are the permanent quarry"), artifact grammar § 2.2 (class grammar), artifact grammar § 5 (track interface requirements on scaffolds).

### § 2. The Three Scaffold Species

For each species (surface, layer, cross-cutting), specify:

**Scope definition** — what a scaffold of this species covers. A surface scaffold covers one entity. A layer scaffold covers a modality class. A cross-cutting scaffold covers a concern across tiers or classes.

**Source material** — what evidence the scaffold is built from. Surface scaffolds: dossier-class primitive exegeses, primary documentation, operational experience. Layer scaffolds: multiple surface scaffolds within the same modality class (the layer scaffold synthesizes, not duplicates). Cross-cutting scaffolds: per-tier evidence for the concern in question, drawn from scaffolds and dossiers across the tier model.

**Synthesis operations** — what structural operations distinguish this species. Surface scaffolds decompose along declared axes. Layer scaffolds identify convergent primitives (present across most entities in the class), divergent primitives (structurally distinct to one or few entities), and interaction patterns. Cross-cutting scaffolds map per-tier manifestations of the concern and identify where the concern creates structural requirements on other tiers.

**Relationship between species** — a layer scaffold depends on surface scaffolds as input. A cross-cutting scaffold draws from scaffolds and dossiers across tiers. No species outranks another — they serve different analytical purposes.

**Specimen analysis** — harness-taxonomy.md is a layer scaffold. Its Section 1 (Unified Primitives) carries the convergent-primitive synthesis. Sections 2–7 carry the per-surface divergent analysis. Section 8 (Cross-Cutting Synthesis) carries the interaction-pattern analysis. The grammar must specify these structural regions as requirements for the layer-scaffold species (convergent zone, divergent zone, synthesis zone), derived from but not limited to this specimen.

Source: artifact grammar § 2.2 (three species named), layer law § 5 (Tier 4 modality classes with per-class decomposition axes), harness-taxonomy.md (specimen).

### § 3. The Twelve-Check Validation Schema

The twelve checks. Each check must specify: what structural property is tested, how the test is applied (what a validator looks for), what a pass looks like, what a fail looks like, and what remediation is required on failure.

The checks should cover (and the drafter should derive the exact twelve from these structural requirements, combining or splitting as needed for testability):

- Decomposition axes declared and fixed (artifact grammar § 2.2 criterion a)
- Primitive inventory at appropriate granularity (artifact grammar § 2.2 required component)
- Primitive identifiers in `[surface-slug:primitive-name]` format (artifact grammar § 2.2 criterion b, naming § 2.2)
- Epistemic status labels on every claim (artifact grammar § 2.2 criterion c)
- Staleness markers tied to the temporal track (artifact grammar § 2.2 required component, artifact grammar § 5.3)
- Source attribution for each primitive (artifact grammar § 2.2 required component)
- Scope and species declaration in header (artifact grammar § 2.2 required component)
- No prescriptive content — the scaffold describes, it does not prescribe (artifact grammar § 2.2 criterion d)
- Cross-reference integrity — all references resolve per NAMING-AND-ADDRESSING.md § 3
- Authority and lifecycle markers in header (naming § 2.7)
- Species-specific structural completeness (§ 2's per-species requirements are met)
- Downstream traceability — the scaffold's primitive inventory is addressable by downstream artifacts (specifications, compressions, registries) that will synthesize from it

The drafter must produce exactly twelve checks, numbered and named, that collectively ensure a scaffold meeting all twelve is well-formed per the artifact grammar's definition. The number twelve is a target that should be met by combining closely related requirements and splitting requirements that test distinct structural properties. If the structural requirements genuinely yield eleven or thirteen, the drafter should note the deviation and justify it rather than padding or collapsing to force the count.

Source: artifact grammar § 2.2 (required components and well-formedness criteria). Naming § 2.2, § 2.7, § 3 (identifier and cross-reference formats). Artifact grammar § 5 (track interface mechanisms). harness-taxonomy.md (specimen to validate the checks against — every check should pass when applied to the harness taxonomy).

### § 4. The Production Procedure

Specify the structural transformation from evidence to scaffold. This is the procedure that transforms dossier-grade evidence into scaffold-grade structure. It should cover:

**Input requirements** — what evidence must exist before scaffold production begins. Minimum: one or more dossier-class artifacts covering the scaffold's scope, or equivalent primary-source access. For layer scaffolds: multiple surface scaffolds or sufficient per-surface dossiers to enable cross-entity synthesis.

**Axis selection** — how decomposition axes are chosen. For surface scaffolds: axes are drawn from the modality class's declared decomposition axes in LAYER-LAW.md § 5. For layer scaffolds: axes are the convergent/divergent/interaction-pattern structure. For cross-cutting scaffolds: axes are the per-tier manifestation structure.

**Primitive identification** — how primitives are discovered, named, and granularity-calibrated. The primitive floor is the level at which further decomposition does not yield structurally distinct elements. Primitives are identified by analyzing the evidence along the declared axes and extracting the structural elements that recur, distinguish, or define the entity or class.

**Identifier assignment** — when and how `[surface-slug:primitive-name]` identifiers are assigned. Identifiers are assigned during production, following NAMING-AND-ADDRESSING.md § 2.2 and § 5.2 format rules.

**Epistemic labeling** — how each claim receives its epistemic status (verified, inferred, provisional). The labeling should be based on the evidence quality: verified means confirmed by primary documentation or direct observation; inferred means derived from indirect evidence or cross-entity comparison; provisional means hypothesized from limited evidence and requiring further validation.

**Staleness initialization** — how staleness markers are set on initial production. Each primitive receives a last-observed timestamp derived from the evidence that supports it. Primitives with stale evidence are flagged immediately, generating sensing directives upon scaffold publication.

**Editorial structure** — how the scaffold's internal document structure is organized. Not a rigid template (scaffolds are structurally diverse across species and domains), but structural requirements: header block, scope declaration, axis declaration, primitive sections organized by axis, epistemic status visible inline, staleness markers accessible, cross-references following naming conventions.

**Validation** — production concludes with a twelve-check validation pass. Deficiencies are remediated or declared as known gaps with remediation plans.

Source: harness-taxonomy.md (reverse-engineer the production procedure from the specimen — what structural decisions were made during its production?). Existing surface exegeses (what structural gap separates a dossier from a scaffold?). Artifact grammar § 2.2 (required components as production targets). Artifact grammar § 5 (track interface mechanisms as production requirements).

### § 5. The Dossier-to-Scaffold Bridge (brief section)

Explicitly specify the structural delta between a dossier-class artifact and a surface-scaffold-class artifact, using the existing surface exegeses (report-*.md) as the dossier specimen and the harness taxonomy's per-surface sections as the scaffold specimen. This section should make visible what operations transform one into the other:

- Axis declaration (dossiers have no fixed axes; scaffolds require them)
- Primitive extraction (dossiers describe features narratively; scaffolds identify primitives at structural granularity)
- Identifier assignment (dossiers have no primitive identifiers; scaffolds require `[surface-slug:primitive-name]`)
- Epistemic labeling (dossiers may distinguish observation from inference but do not use standardized labels; scaffolds require verified/inferred/provisional)
- Staleness connection (dossiers have no temporal-track connection; scaffolds require staleness markers)
- Prescriptive content removal (some dossiers contain recommendations; scaffolds must be purely descriptive)

This section serves two audiences: scaffold producers (who need to know what additional work transforms dossier evidence into scaffold structure) and the method engine (which will abstract this transformation into a reusable operation).

Source: report-slack.md, report-notion.md, or similar surface exegeses as dossier specimens. harness-taxonomy.md Sections 2–7 as per-surface scaffold specimens.

## Anti-Patterns
- Do NOT repeat artifact grammar § 2.2's class grammar — operationalize it
- Do NOT produce a template or form to fill in — specify structural requirements and production logic
- Do NOT include provisional scaffolds in scope (their criteria are in artifact grammar § 2.3)
- Do NOT assign specific surfaces to specific scaffolds (that is operational work, not grammar)
- Do NOT define the method engine's abstraction layer (that is METHOD-ENGINE.md)
- Do NOT define the delta metabolism's compaction or freshness rules (that is DELTA-METABOLISM.md)
- Do NOT overpromote ARCHITECTURE.md — it is a specification-class artifact derived from the harness taxonomy scaffold, not a scaffold itself
- Do NOT let the twelve-check schema become so abstract that it cannot produce pass/fail results when applied to a real scaffold
- Do NOT let the production procedure become so rigid that it constrains scaffold diversity across species and domains
- Do NOT use retired terminology

## Source Documents to Load
1. ARTIFACT-GRAMMAR.md § 2.2, § 5 (ratified — class grammar, track interface contract)
2. NAMING-AND-ADDRESSING.md §§ 2.2, 2.7, 3, 5.2 (ratified — primitive identifier format, authority markers, cross-reference rules, format specs)
3. LAYER-LAW.md § 5 (ratified — Tier 4 modality classes and per-class decomposition axes)
4. KNOWLEDGE-ARCHITECTURE-ROOT.md § 6 (ratified — three tracks, "permanent quarry")
5. harness-taxonomy.md (specimen: mature layer scaffold — load in full for structural analysis)
6. report-slack.md or report-notion.md (specimen: dossier-class surface exegesis — load for dossier-to-scaffold gap analysis)
7. ARCHITECTURE.md (specimen: specification-class artifact derived from a scaffold — reference only, demonstrates scaffold→specification extraction path)

## Validation Checks (post-draft)
- [ ] The twelve-check schema is specified with: property tested, test method, pass criteria, fail criteria, and remediation per check
- [ ] Every check passes when applied to harness-taxonomy.md (or the failure is a documented known gap in the specimen, not a design flaw in the schema)
- [ ] The production procedure covers: input requirements, axis selection, primitive identification, identifier assignment, epistemic labeling, staleness initialization, editorial structure, and validation
- [ ] The three scaffold species each have: scope definition, source material, synthesis operations, inter-species relationships
- [ ] The dossier-to-scaffold bridge specifies the structural delta using real specimens
- [ ] Provisional scaffolds are explicitly excluded from scope
- [ ] No prescriptive template — structural requirements and production logic, not fill-in forms
- [ ] Track interface mechanisms (staleness markers, revision requests, sensing directives) are embedded in the scaffold structure per artifact grammar § 5
- [ ] Primitive identifiers follow NAMING-AND-ADDRESSING.md § 2.2 and § 5.2
- [ ] Cross-references follow NAMING-AND-ADDRESSING.md § 3
- [ ] The schema is both validatable (a checker can run it) and generative (a producer can build from it)
- [ ] Total length: 3500–5500 words (detailed enough for scaffold producers and validators, not exhaustively procedural)

## Downstream Artifacts This Document Unlocks
METHOD-ENGINE.md uses this document's production procedure as the structural basis for the scaffold-production method. DELTA-METABOLISM.md uses this document's staleness-marker specification to know what scaffolds carry and how the temporal track connects to them. READINESS-MATRIX.md uses the twelve-check schema as the maturity assessment criteria for scaffolds. All scaffold producers use this document as their structural specification and quality gate.

## Drafter
Opus only. The twelve-check schema and the production procedure involve non-delegable judgment about what structural properties matter, what granularity of testing is appropriate, and how to balance validatability with generativity. Sonnet may assist with the dossier-to-scaffold bridge (§ 5) under a tightly scoped sub-brief, since that section involves comparative analysis of existing specimens rather than architectural decision-making.
