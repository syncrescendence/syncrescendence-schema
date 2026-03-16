# SCAFFOLD-GRAMMAR.md

**Class:** Specification  
**Domain:** Enduring descriptive scaffold structure, production, and validation  
**Upstream:** ARTIFACT-GRAMMAR.md §§ 2.2, 5; NAMING-AND-ADDRESSING.md §§ 2.2, 2.7, 3, 5.2; LAYER-LAW.md § 5  
**Downstream:** METHOD-ENGINE.md, READINESS-MATRIX.md, all scaffold producers  
**Last updated:** 2026-03-13  

---

## § 1. Governing Principles

Enduring descriptive scaffolds are the institution's permanent quarry — the high-resolution descriptive substrate from which specifications, compressions, registry rows, and canonical law are synthesized. Their structural integrity determines the quality of everything downstream. A scaffold that decomposes its subject to the primitive floor, assigns stable identifiers, labels its epistemic status honestly, and connects to the temporal track through staleness markers enables the entire two-track architecture to function. A scaffold that lacks these properties forces every downstream consumer to improvise, and improvisation under bounded context does not compound.

This document specifies three things. First, the three scaffold species and their structural requirements (§ 2). Second, the twelve-check validation schema that determines whether a scaffold is well-formed (§ 3). Third, the production procedure that transforms evidence into scaffold-grade structure (§ 4). The validation schema and the production procedure serve the same end from opposite directions: the schema tests the finished product, the procedure guides the builder. Together they define what it means to produce a scaffold correctly.

Provisional scaffolds are out of scope. Their minimal criteria are specified in ARTIFACT-GRAMMAR.md § 2.3. Everything in this document governs enduring descriptive scaffolds only.

---

## § 2. The Three Scaffold Species

All enduring scaffolds share the twelve-check validation schema (§ 3) and the production procedure (§ 4). They differ in scope, source material, and synthesis operations. Species is declared in the scaffold's header and determines how certain checks are instantiated.

### 2.1 Surface Scaffold

**Scope.** One entity — a single surface decomposed along the modality class's declared axes. A surface scaffold for Slack decomposes Slack. A surface scaffold for Aider decomposes Aider. The scope boundary is the entity itself; everything that is structurally part of the surface is inside, everything that is not is outside.

**Source material.** Dossier-class primitive exegeses (the report-*.md surface exegeses), primary documentation (vendor docs, changelogs, API references), and operational experience (direct use of the surface in institutional work). A surface scaffold can be built from a single well-developed dossier plus primary-source verification.

**Synthesis operations.** Decomposition along fixed axes. The axes are drawn from the modality class's declared set in LAYER-LAW.md § 5 — for coding harnesses: configuration architecture, memory/context architecture, execution loop, multi-agent orchestration, self-improvement loops, MCP integration, and so on. The surface scaffold applies each axis to the specific entity and identifies the primitives that exist at each axis.

**Structural regions.** A surface scaffold has one primary region: the per-axis decomposition. It does not have convergent/divergent zones (that is the layer scaffold's structure) or per-tier zones (that is the cross-cutting scaffold's structure). Per-axis sections may be grouped into clusters where axes are closely related.

### 2.2 Layer Scaffold

**Scope.** One modality class — multiple entities within the same class, synthesized to reveal convergent primitives (shared across most entities), divergent primitives (structurally specific to one or few entities), and interaction patterns (how convergent and divergent primitives relate across entities). A layer scaffold for the coding-harness modality class covers Aider, Claude Code, Gemini CLI, Codex, OpenClaw, and OpenHands.

**Source material.** Multiple surface scaffolds within the modality class, or — where surface scaffolds do not yet exist — multiple dossier-class exegeses plus primary-source evidence sufficient to support cross-entity comparison. A layer scaffold cannot be built from a single surface's evidence; it requires enough entities to make convergence/divergence analysis meaningful (minimum three entities for a useful comparison).

**Synthesis operations.** Three-zone synthesis: (a) identify convergent primitives present across most entities in the class, organized by thematic cluster; (b) identify per-entity divergent primitives that represent each entity's distinctive architectural commitments; (c) synthesize cross-cutting observations about patterns, trends, and structural relationships that emerge only from the cross-entity comparison.

**Structural regions.** Three mandatory zones. The convergent zone presents shared primitives organized by cluster (the harness taxonomy's Section 1). The divergent zone presents per-entity idiosyncrasies (the harness taxonomy's Sections 2–7). The synthesis zone presents cross-cutting structural observations (the harness taxonomy's Section 8). The convergent zone comes first because it establishes the structural vocabulary that the divergent zone then specializes against.

### 2.3 Cross-Cutting Scaffold

**Scope.** One concern that intersects multiple tiers or modality classes — mapped per-tier or per-class to reveal how the concern manifests differently at each level and where it creates structural requirements. A cross-cutting scaffold for trust/auth boundaries maps auth models across all seven tiers.

**Source material.** Per-tier or per-class evidence drawn from scaffolds, dossiers, and operational experience at each level where the concern manifests. A cross-cutting scaffold draws from the broadest range of sources — it may need evidence from coding harnesses, SaaS platforms, coordination surfaces, and constitutional documents to map a single concern.

**Synthesis operations.** Per-tier/per-class mapping: for each tier or class where the concern manifests, identify the concern's structural character, its primitives, and its interaction with tier-specific elements. Then synthesize: where does the concern create cross-tier requirements (e.g., auth decisions at Tier 4 that constrain Tier 3 contracts)? Where does it reveal gaps? Where does it produce structural conflicts?

**Structural regions.** Two mandatory zones. The per-tier (or per-class) mapping zone presents the concern at each level. The synthesis zone identifies cross-cutting patterns, requirements, and gaps. The mapping zone comes first because synthesis depends on having the per-level analysis in view.

---

## § 3. The Twelve-Check Validation Schema

Each check specifies: what property is tested, how the test is applied, what pass looks like, what fail looks like, and what remediation is required on failure. Where a check's test criteria differ by species, the species-specific instantiation is noted. The checks are numbered for reference but are not ordered by priority — all twelve must pass for a scaffold to be well-formed.

**Check 1 — Header compliance.** Tests whether the scaffold carries a complete header block. Test method: inspect the document's opening metadata. Pass: the header declares class (enduring descriptive scaffold), species (surface, layer, or cross-cutting), scope (what the scaffold covers and what it excludes), authority level and lifecycle state per NAMING-AND-ADDRESSING.md § 2.7, upstream dependencies, downstream consumers, and last-updated date. Fail: any required header field is missing. Remediation: add the missing fields. *Specimen gap: harness-taxonomy.md predates the header convention and lacks a formal header block.*

**Check 2 — Axis declaration.** Tests whether decomposition axes are explicitly declared and fixed. Test method: locate the axis declaration (typically in the opening section or header). Pass: axes are named, the list is closed (not open-ended), and each axis is defined clearly enough that a reader can determine whether a given structural feature falls under a given axis. Fail: axes are implicit (the scaffold is organized by topic without declaring what the organizing dimensions are), or the axis list is open-ended ("and other aspects"). Remediation: declare axes explicitly; close the list. Species instantiation — surface scaffolds: axes drawn from the modality class's declared set in LAYER-LAW.md § 5. Layer scaffolds: the three-zone structure (convergent/divergent/synthesis) is the implicit axis declaration; the convergent zone's thematic clusters are sub-axes. Cross-cutting scaffolds: per-tier or per-class manifestation is the axis structure.

**Check 3 — Primitive granularity.** Tests whether the primitive inventory reaches the appropriate floor — the level at which further decomposition does not yield structurally distinct elements. Test method: sample primitives from each axis and ask whether any could be decomposed further into structurally distinct sub-elements. Pass: primitives are at a level where subdivision would produce either redundancy or implementation detail rather than new structural distinctions. Fail: primitives are too coarse (a single "memory architecture" primitive where context compaction, instruction-file cascade, and checkpoint semantics are structurally distinct) or too fine (individual config key-value pairs that are not structurally distinct from their neighbors). Remediation: decompose coarse primitives or consolidate fine ones. *This check requires judgment — it is the least mechanical of the twelve and the most dependent on domain expertise.*

**Check 4 — Primitive identifiers.** Tests whether every primitive carries a stable identifier in the `[surface-slug:primitive-name]` format specified by NAMING-AND-ADDRESSING.md § 2.2. Test method: scan all primitives and verify format compliance. Pass: every named primitive has an identifier, the surface-slug matches the surface's declared slug form, primitive-names are `lowercase-kebab-case`, and identifiers are unique within their surface scope. Fail: primitives are described in prose without identifiers, or identifiers are malformed. Remediation: assign identifiers to all primitives. *Specimen gap: harness-taxonomy.md does not use the `[surface-slug:primitive-name]` format — primitives are described by prose headings. This is a pre-grammar-layer gap that would require remediation.*

**Check 5 — Epistemic status labeling.** Tests whether every substantive claim carries an epistemic status label: verified (confirmed by primary documentation or direct observation), inferred (derived from indirect evidence or cross-entity comparison), or provisional (hypothesized from limited evidence). Test method: sample claims from each section and check for inline status markers. Pass: every claim that describes a structural feature, capability, behavior, or relationship carries a status label. Fail: claims are presented without epistemic qualification, or labels are applied inconsistently. Remediation: apply labels to all substantive claims. *Specimen gap: harness-taxonomy.md uses implicit epistemic grading (e.g., "experimental frontier" implies provisional) but does not use standardized labels.*

**Check 6 — Staleness markers.** Tests whether every primitive carries a last-observed timestamp and whether staleness computation is possible from the scaffold alone. Test method: check each primitive for temporal metadata. Pass: every primitive carries a last-observed date derived from its supporting evidence, and the scaffold's tier-appropriate freshness threshold is declared (or inheritable from the tier's volatility regime in LAYER-LAW.md). Fail: no temporal metadata exists, or timestamps are present but no freshness threshold is declared. Remediation: add last-observed dates and declare the freshness threshold. *Specimen gap: harness-taxonomy.md carries no staleness markers.*

**Check 7 — Source attribution.** Tests whether each primitive's evidence is attributed to specific sources. Test method: check each primitive for source references. Pass: every primitive identifies where its structural claims come from — vendor documentation, primary-source analysis, operational observation, or cross-entity comparison. Attribution may be inline or collected per-section, but must be traceable to specific sources rather than generic references. Fail: claims are unattributed, or attribution is too vague ("based on documentation"). Remediation: add specific source attribution. *Specimen note: harness-taxonomy.md attributes at the document level ("Triangulated from directives for...") but not at the per-primitive level.*

**Check 8 — Descriptive purity.** Tests whether the scaffold contains only descriptive content — what things are and how they work — without prescriptive content (what to do, what to choose, how to operate). Test method: scan for imperative language, recommendations, comparative evaluations that imply preference, or institutional role assignments. Pass: the scaffold describes structural character without telling the reader what to do with it. Teleological manuals prescribe; scaffolds describe. Fail: the scaffold contains recommendations ("use X for Y"), operational instructions, or institutional role assignments ("Slack should be the operator bus"). Remediation: extract prescriptive content into specification-class artifacts. *Specimen note: harness-taxonomy.md is largely descriptive but its Section 8 synthesis includes evaluative statements ("understanding which problem each platform is solving first tells you which to choose") that border on prescriptive.*

**Check 9 — Cross-reference integrity.** Tests whether all cross-references within the scaffold and to external artifacts resolve correctly per NAMING-AND-ADDRESSING.md § 3. Test method: enumerate all references and verify each resolves to a real target. Pass: every reference uses the correct identifier format, points to an existing target, and is fully qualified for cross-artifact references. Fail: references use prose descriptions instead of identifiers, or identifiers point to nonexistent targets. Remediation: replace prose references with identifier-based references; verify all targets exist.

**Check 10 — Species-specific structural completeness.** Tests whether the scaffold meets its species-specific structural requirements from § 2. Test method: check structural regions against species requirements. Pass criteria by species — surface scaffold: per-axis decomposition is present for every declared axis. Layer scaffold: all three zones (convergent, divergent, synthesis) are present with substantive content. Cross-cutting scaffold: per-tier (or per-class) mapping zone and synthesis zone are present. Fail: required structural regions are missing or empty. Remediation: produce the missing regions. *Specimen note: harness-taxonomy.md passes this check — all three layer-scaffold zones are present and substantive.*

**Check 11 — Downstream traceability.** Tests whether the scaffold's primitive inventory is addressable by downstream artifacts. Test method: verify that specifications, compressions, or registry rows could reference individual primitives using the scaffold's identifiers. Pass: every primitive has a stable identifier (Check 4) and is located in a navigable section structure that downstream artifacts can reference using fully qualified addresses (NAMING-AND-ADDRESSING.md § 3.1). Fail: primitives are buried in prose without addressable handles, or the scaffold's section structure does not support precise referencing. Remediation: restructure to ensure addressability. *This check depends on Check 4 passing — without primitive identifiers, downstream traceability is structurally impossible.*

**Check 12 — Scope boundary testability.** Tests whether the scaffold's declared scope boundary is precise enough that a reader can determine what falls inside and outside. Test method: take three domain questions and test whether the scope declaration unambiguously classifies each as in-scope or out-of-scope. Pass: the scope declaration resolves all three test questions without ambiguity. Fail: the scope is too vague ("covers Slack"), too broad ("covers all SaaS platforms"), or too narrow (excludes elements that are structurally part of the entity). Remediation: sharpen the scope declaration. *Specimen note: harness-taxonomy.md's implicit scope (six named coding harnesses) is precise enough to pass, though it is not formally declared in a header.*

### Specimen Validation Summary

Applied to harness-taxonomy.md, the twelve checks yield: pass on Checks 2, 3, 8, 10, 12 (with minor notes on 8 and 12). Fail on Checks 1, 4, 5, 6, 7, 9, 11 (all structural gaps that predate the grammar layer — the harness taxonomy was produced before the identifier system, epistemic labeling convention, staleness mechanism, and header standard existed). These failures are not design flaws in the schema; they are remediation targets for the specimen. A scaffold produced under this grammar would pass all twelve checks at first publication.

---

## § 4. The Production Procedure

Seven structural operations transform evidence into a well-formed enduring scaffold. The operations are sequenced by dependency — each operation's output feeds the next — but a producer may iterate between operations as understanding deepens. The procedure specifies what must be decided and produced at each step, not how to think about the domain.

### 4.1 Scope and Species Declaration

**Input:** A research commission or identified gap that specifies what entity, class, or concern needs scaffolding.

**Operation:** Declare the scaffold's scope (what it covers, what it excludes) and species (surface, layer, or cross-cutting). For surface scaffolds, identify the entity and its modality class. For layer scaffolds, identify the modality class and the entities to be compared. For cross-cutting scaffolds, identify the concern and the tiers or classes where it manifests.

**Output:** A header block with scope, species, modality class (if applicable), and the entity or concern being scaffolded. Authority level is set to `0-intake` at this stage.

**Completion criterion:** A reader can determine what falls inside and outside the scaffold's scope without consulting external documents.

### 4.2 Axis Selection

**Input:** The scope and species declaration from 4.1, plus the modality class's declared decomposition axes from LAYER-LAW.md § 5 (for surface and layer scaffolds) or the tier model (for cross-cutting scaffolds).

**Operation:** Select and declare the decomposition axes. For surface scaffolds: adopt the modality class's axes, omitting any that are structurally inapplicable to the specific entity and noting the omission. For layer scaffolds: the three-zone structure (convergent/divergent/synthesis) is fixed; within the convergent zone, identify thematic clusters that organize the shared primitives. For cross-cutting scaffolds: per-tier manifestation is the primary axis; within each tier, identify sub-axes appropriate to the concern.

**Output:** A closed, ordered list of axes, declared in the scaffold's opening section.

**Completion criterion:** The axis list is finite, each axis is defined, and a reader can classify any structural feature of the subject under exactly one axis (or identify it as out of scope).

### 4.3 Primitive Identification

**Input:** Declared axes from 4.2, plus source material (dossiers, primary documentation, operational experience).

**Operation:** For each axis, identify the structural elements — the capabilities, config surfaces, object types, manipulation paths, and architectural features — that the evidence reveals. Decompose to the primitive floor: the level at which further decomposition yields implementation detail rather than structural distinction. Name each primitive descriptively.

**Output:** A per-axis primitive inventory in prose, with each primitive as a distinct, named element. At this stage, primitives have names but not formal identifiers.

**Completion criterion:** Every structural feature visible in the evidence is captured as a primitive under one axis, and no primitive can be meaningfully subdivided further into structurally distinct sub-elements.

### 4.4 Identifier Assignment

**Input:** The primitive inventory from 4.3, plus the surface-slug mapping from the Teleology Registry (for surface and layer scaffolds) or a concern-specific slug (for cross-cutting scaffolds).

**Operation:** Assign a `[surface-slug:primitive-name]` identifier to each primitive per NAMING-AND-ADDRESSING.md § 2.2 and § 5.2. For layer scaffolds, convergent primitives that appear across surfaces carry the modality-class slug rather than a surface-specific slug (e.g., `[coding-harness:persistent-instruction-file]` for a convergent primitive). For cross-cutting scaffolds, use a concern-specific slug (e.g., `[trust-auth:repo-identity-root]`). Verify uniqueness within scope.

**Output:** Every primitive now has a stable, formatted identifier that connects it to the indexing spine.

**Completion criterion:** Every primitive has an identifier; no identifier is duplicated within scope; all identifiers comply with NAMING-AND-ADDRESSING.md § 5.2 format rules.

### 4.5 Epistemic Labeling

**Input:** The identified primitives from 4.4, plus the evidence sources that support each.

**Operation:** Assign an epistemic status to every substantive claim: **verified** (confirmed by primary documentation or direct observation — the source can be cited and the claim can be independently checked), **inferred** (derived from indirect evidence, cross-entity comparison, or operational experience that is not independently verifiable from public sources), **provisional** (hypothesized from limited evidence and requiring further validation). Label inline, adjacent to the claim.

**Output:** Every primitive and every structural claim about it carries an explicit epistemic status.

**Completion criterion:** No substantive claim is unlabeled. The distribution of labels reflects actual evidence quality — a scaffold whose every claim is "verified" when some derive from inference is mislabeled.

### 4.6 Staleness Initialization

**Input:** The labeled primitives from 4.5, plus the source material's observation dates.

**Operation:** Assign a last-observed timestamp to each primitive, derived from the date of the evidence that supports it. Where a primitive is supported by multiple sources, use the most recent. Declare the scaffold's freshness threshold — the period after which a primitive's observation is considered stale — derived from the tier's volatility regime (LAYER-LAW.md §§ 2–8). Identify primitives that are already stale at scaffold publication (evidence older than the freshness threshold). For stale primitives, note that a sensing directive will be generated upon publication.

**Output:** Every primitive carries a last-observed date. The scaffold declares its freshness threshold. Stale primitives are flagged.

**Completion criterion:** Staleness is computable for every primitive from the scaffold alone — no external lookup is required to determine whether a primitive is fresh, aging, or stale.

### 4.7 Editorial Assembly and Validation

**Input:** All outputs from 4.1–4.6.

**Operation:** Assemble the scaffold into its final document structure: header block, scope and axis declarations, per-axis (or per-zone, for layer scaffolds) primitive sections with identifiers, epistemic labels, staleness markers, and source attribution inline. Organize the section structure for navigability — downstream consumers must be able to locate specific primitives via fully qualified references (NAMING-AND-ADDRESSING.md § 3.1). Run the twelve-check validation schema (§ 3) against the assembled scaffold. Document any check failures and their remediation plans.

**Output:** A complete, validated enduring descriptive scaffold at authority Level 1 (curated). Known gaps are documented. The scaffold is ready for operational testing (which will advance it to Level 2 when downstream artifacts are successfully synthesized from it).

**Completion criterion:** All twelve checks pass, or every failure has a documented remediation plan with a timeline.

---

## § 5. The Dossier-to-Scaffold Bridge

The institution currently holds fourteen surface exegeses (report-*.md) as dossier-class artifacts at roughly Level 1 authority. These are the raw material from which enduring surface scaffolds will be produced. This section specifies the structural delta between a dossier and a scaffold — what a scaffold producer must add, restructure, or remove to transform dossier evidence into scaffold-grade structure.

**Axis declaration.** Dossiers organize by topic, theme, or narrative arc. The Slack exegesis opens with "ontological primitives" and proceeds through "visual grammar," "power-user workflows," and other thematic sections. These are not decomposition axes in the scaffold sense — they were chosen for expository effect, not for structural completeness or fixed dimensional analysis. The scaffold producer must replace the dossier's narrative organization with the modality class's declared decomposition axes, then redistribute the dossier's evidence under those axes. Evidence that does not fit any axis is either out of scope (exclude) or reveals a missing axis (escalate to the layer-law's axis list for the modality class).

**Primitive extraction.** Dossiers describe features narratively — the Slack exegesis discusses Block Kit at length with tables and examples but does not isolate `[slack:block-kit-framework]` as a named primitive with defined structural boundaries. The scaffold producer must read the narrative, identify the structural elements at primitive granularity, and extract each as a distinct named entity. The dossier's rich description becomes the evidence base for the primitive; the primitive identifier becomes the handle.

**Identifier assignment.** Dossiers carry no primitive identifiers. The scaffold producer assigns identifiers during production per the procedure in § 4.4. Every structural element that qualifies as a primitive receives an identifier at this stage.

**Epistemic labeling.** Dossiers may distinguish observation from inference implicitly (the Slack exegesis marks some claims with footnote references and presents others as analytical observations) but do not use the standardized verified/inferred/provisional labels. The scaffold producer must evaluate each claim against the evidence quality and assign explicit labels. Claims supported by primary documentation with specific citations are verified; claims derived from the exegesis author's analysis are inferred; claims that extrapolate beyond the evidence are provisional.

**Staleness connection.** Dossiers have no temporal-track connection — no last-observed timestamps, no freshness thresholds, no sensing directive generation. The scaffold producer adds these during production per § 4.6, using the dossier's source dates as the initial evidence timestamps. Where the dossier's sources are undated, the producer uses the dossier's own creation date as a conservative last-observed estimate.

**Prescriptive content removal.** Some dossiers contain evaluative or prescriptive content — recommendations for how to use the surface, comparative judgments about quality, or institutional role suggestions. The scaffold producer must identify and extract this content. Descriptive structural observations remain in the scaffold. Prescriptive, evaluative, and teleological content is extracted into notes for future specification-class artifacts (teleological manuals, adapter contracts) rather than discarded — the evidence is valuable, just misclassified.

**The summary transformation.** A dossier becomes a scaffold when: its evidence is reorganized under declared axes instead of narrative themes, its structural elements are identified as primitives with formal identifiers, its claims carry standardized epistemic labels, its primitives carry temporal metadata connecting them to the delta track, and its prescriptive content is separated from its descriptive content. The dossier remains in the corpus as the evidential substrate — it is not consumed or archived. The scaffold synthesizes from it while the dossier continues to serve as the detailed evidence record.

---

*Assessment as of 2026-03-13: all sections drafted. Pending operator review and ratification. The twelve-check validation schema (§ 3) is the highest-stakes section — it defines the quality gate that all future scaffolds must pass. The specimen validation summary documents six failing checks against harness-taxonomy.md, all attributable to pre-grammar-layer production rather than schema design flaws. The production procedure (§ 4) and the dossier-to-scaffold bridge (§ 5) are the most operationally consequential sections for near-term institutional work.*
