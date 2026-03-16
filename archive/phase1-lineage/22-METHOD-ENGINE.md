# METHOD-ENGINE.md

**Class:** Method  
**Domain:** Institutional generative operations  
**Upstream:** ARTIFACT-GRAMMAR.md § 2.9; SCAFFOLD-GRAMMAR.md §§ 4, 5; DELTA-METABOLISM.md §§ 4, 5; KNOWLEDGE-ARCHITECTURE-ROOT.md § 6  
**Downstream:** READINESS-MATRIX.md, all method invocations, teleological manuals  
**Last updated:** 2026-03-13  

---

## § 1. Governing Principles

The generative method track is the institution's abstracted research engine. It carries the reusable procedures for producing knowledge artifacts, sensing temporal observations, running compaction, and conducting cross-entity synthesis. Methods are derived from operational experience — the research lineage that produced the corpus's strongest artifacts — with the accidental prompting patterns discarded and the structural primitives preserved. The method engine is not a research-methodology textbook. It is a governed catalog of tested, invocable operations that produce well-formed artifacts under the grammar layer's constraints.

Methods are distinct from the procedures they abstract and from the operational contexts that invoke them. The scaffold production procedure (SCAFFOLD-GRAMMAR.md § 4) specifies seven structural operations for building a scaffold. The scaffold production method wraps that procedure in an invocation protocol: what typed inputs the method requires, what parameterization varies per invocation, and what output contract the result must satisfy. The procedure lives in the scaffold grammar. The invocable method lives here. The operational context — who invokes the method, with what tools, on what schedule — lives in teleological manuals. The method engine occupies the middle layer: more abstract than the procedure specification, more concrete than the operational assignment.

This document is itself a method-class artifact and must satisfy the method architecture it defines.

---

## § 2. Method Architecture

Every method in the institution carries the following structural components. These constitute the method-class grammar's required components (ARTIFACT-GRAMMAR.md § 2.9) at operational resolution.

### 2.1 Input Contract

The typed inputs the method requires to begin. Each input specifies: what it is (an artifact class, an evidence set, a signal, a parameter), what format or schema it must satisfy, and whether it is mandatory or optional. The input contract defines the method's invocation boundary — a method cannot be invoked without its mandatory inputs.

### 2.2 Procedural Steps

The structural operations the method performs, specified at the operation level. Each step identifies: what transformation occurs, what upstream specification governs that step (by reference, not restatement), and what the step produces as input for the next step. Steps reference upstream documents — the scaffold grammar, the delta metabolism, the naming conventions — rather than restating their content. A method consumer reads the method engine to know what to invoke; they read the upstream document to know how each step is executed.

### 2.3 Output Contract

The typed output the method produces. Specifies: what artifact class the output belongs to, what identifier format it carries (per NAMING-AND-ADDRESSING.md), and what validation the output must pass. The output contract connects the method to the grammar layer's validation apparatus: a scaffold production method's output must pass the twelve-check schema; a sensing method's output must be a well-formed delta entry; a compaction method's output must satisfy provenance-preservation constraints.

### 2.4 Validation Criteria

How the method's output is verified. Specifies: what checks are applied (referencing the relevant validation schema), what pass/fail means, and what remediation is required on failure. Validation criteria are the method's quality gate — an invocation whose output fails validation has not successfully completed the method.

### 2.5 Scope Declaration

What domain, artifact type, or operation the method governs, and what it does not. Scope prevents method creep — a scaffold production method does not govern specification production, even though both produce knowledge artifacts.

### 2.6 Method and Invocation

A **method** is an abstract reusable operation. It exists once in the catalog, carries an authority level, and is governed by the method lifecycle (§ 4). The scaffold production method is one method regardless of how many times it is invoked.

A **method invocation** is a specific operational occurrence of a method — a particular execution with particular inputs producing a particular output. "Invoke the scaffold production method for Slack, using report-slack.md as evidence, targeting surface-scaffold species" is an invocation. Invocations are operational events, not institutional objects; they are tracked by operational mechanisms (receipts, logs, readiness assessments), not by the method engine.

The method engine governs methods. Teleological manuals and operational specifications govern invocations. This document defines no invocation-tracking apparatus — that belongs to the readiness matrix or to future operational specifications.

---

## § 3. The Initial Method Set

Five methods compose the founding catalog. Each is derived from a procedure already specified in the grammar layer. Each is specified per the architecture in § 2. Two additional methods are declared as open slots awaiting upstream procedure specification.

### 3.1 Scaffold Production Method

**Authority level:** 2-operational (derived from the research lineage that produced harness-taxonomy.md, validated through the grammar-layer build itself).

**Input contract.** Mandatory: (a) evidence set — one or more dossier-class artifacts, primary documentation, or operational experience records covering the scaffold's scope; (b) scope and species declaration — what entity, class, or concern is being scaffolded, and which species (surface, layer, or cross-cutting); (c) axis set — the modality class's declared decomposition axes from LAYER-LAW.md § 5 (for surface scaffolds), the three-zone structure (for layer scaffolds), or the per-tier manifestation structure (for cross-cutting scaffolds). Optional: existing partial scaffolds or prior scaffold versions to revise against.

**Procedural steps.** The seven structural operations specified in SCAFFOLD-GRAMMAR.md § 4: scope declaration (§ 4.1) → axis selection (§ 4.2) → primitive identification (§ 4.3) → identifier assignment (§ 4.4) → epistemic labeling (§ 4.5) → staleness initialization (§ 4.6) → editorial assembly and validation (§ 4.7). The scaffold grammar carries the full specification of each step; this method references, not restates.

**Output contract.** One enduring descriptive scaffold at authority Level 1 (curated), carrying identifiers per NAMING-AND-ADDRESSING.md § 2.2, in the declared species, passing the twelve-check validation schema (SCAFFOLD-GRAMMAR.md § 3). Advancement to Level 2 occurs when downstream artifacts are successfully synthesized from the scaffold.

**Validation criteria.** The twelve-check validation schema applied to the output scaffold. All twelve must pass, or every failure must have a documented remediation plan.

**Scope.** Governs the production of enduring descriptive scaffolds of all three species. Does not govern provisional scaffolds, specifications, compressions, or any other artifact class.

### 3.2 Dossier-to-Scaffold Conversion Method

**Authority level:** 1-curated (the structural delta is specified in SCAFFOLD-GRAMMAR.md § 5, but this method has not yet been invoked on a real conversion task under the grammar layer).

**Input contract.** Mandatory: (a) one or more dossier-class surface exegeses covering the target surface; (b) the target surface's modality-class axis set from LAYER-LAW.md § 5; (c) the surface's slug form from the Teleology Registry. Optional: primary documentation for verification of dossier claims.

**Procedural steps.** The six structural deltas specified in SCAFFOLD-GRAMMAR.md § 5: axis declaration (replace narrative organization with modality-class axes) → primitive extraction (identify primitives at structural granularity from narrative evidence) → identifier assignment (assign `[surface-slug:primitive-name]` per NAMING-AND-ADDRESSING.md § 2.2) → epistemic labeling (apply verified/inferred/provisional labels) → staleness connection (add last-observed timestamps, declare freshness threshold) → prescriptive content removal (extract recommendations into notes for future specifications). Then execute the scaffold production method's step 7 (editorial assembly and validation) to assemble and validate the result.

**Output contract.** One enduring surface scaffold at authority Level 1 (curated), passing the twelve-check validation schema.

**Validation criteria.** The twelve-check schema, plus verification that the output scaffold's primitive inventory accounts for the structural content of the input dossier(s) — no significant structural evidence from the dossier should be missing from the scaffold without documented justification.

**Scope.** Governs the conversion of existing dossier-class surface exegeses into enduring surface scaffolds. This is a specialized variant of the scaffold production method, optimized for the specific case where the source material is the institution's existing fourteen surface exegeses. It does not govern the production of layer scaffolds or cross-cutting scaffolds from dossiers.

### 3.3 Sensing Method

**Authority level:** 1-curated (the processing procedure is specified in DELTA-METABOLISM.md § 5, but no sensing invocation has been executed under the grammar layer).

**Input contract.** Mandatory: (a) a sensing directive in `SD:{surface-slug}:{primitive-name}:{staleness-grade}` format per NAMING-AND-ADDRESSING.md § 5.6; (b) access to observation sources appropriate to the targeted primitive's domain (primary documentation, vendor channels, operational observation, or research tools). Optional: the target scaffold for context on what the primitive's prior state was.

**Procedural steps.** Derived from DELTA-METABOLISM.md § 5.3: identify observation sources for the targeted primitive → observe the primitive's current state through those sources → record the observation as a delta entry per DELTA-METABOLISM.md § 3.1 (entry identifier, observation date, source attribution, confidence level, anchor reference to the targeted primitive identifier) → evaluate the observation against the five structural-change criteria (ARTIFACT-GRAMMAR.md § 5.2) → if criteria are met, generate a scaffold revision request in `SRR:` format per NAMING-AND-ADDRESSING.md § 5.6.

**Output contract.** One well-formed delta entry anchored to the targeted primitive identifier, recorded in the appropriate domain ledger, with observation date more recent than the primitive's prior last-observed timestamp. If structural-change criteria are met: additionally, one scaffold revision request.

**Validation criteria.** Entry well-formedness per DELTA-METABOLISM.md § 3.1 (all mandatory fields present, anchor reference resolves, confidence level meets or exceeds the directive's minimum). Sensing-directive completion conditions per DELTA-METABOLISM.md § 5.4.

**Scope.** Governs the production of delta entries in response to sensing directives. Does not govern opportunistic observation (entries created during normal operational work without a triggering directive) — opportunistic entries follow the same entry-creation requirements but are not method-governed.

### 3.4 Compaction Method

**Authority level:** 1-curated (the protocol is specified in DELTA-METABOLISM.md § 4, but no compaction has been executed under the grammar layer).

**Input contract.** Mandatory: (a) a domain ledger that has triggered a compaction condition — volume exceeds budget or cadence trigger fires (DELTA-METABOLISM.md § 4.1); (b) the domain's declared freshness window for entry classification.

**Procedural steps.** Derived from DELTA-METABOLISM.md § 4.2–4.4: classify all entries by freshness tier (FRESH/CURRENT preserved verbatim, AGING conditional, STALE compacted) → produce a compaction snapshot entry `[DOMAIN-SLUG-C{NNN}]` summarizing STALE entries (date range, count, key observations, cross-references to significant entries, unresolved contradictions) → archive compacted entries to the ledger's archive section or companion file → verify provenance preservation (original entries retrievable, identifiers unchanged, contradictions unresolved in the snapshot).

**Output contract.** A compacted domain ledger with: FRESH/CURRENT entries preserved verbatim, one compaction snapshot replacing the STALE entries, archived originals retrievable with original identifiers intact.

**Validation criteria.** Provenance-preservation verification per DELTA-METABOLISM.md § 4.3: no original entries destroyed, no identifiers changed, no contradictions resolved, cross-references in the snapshot resolve to archived entries.

**Scope.** Governs the compaction of domain ledgers. Does not govern the compression of structural-track artifacts (that is a different operation on a different track, per NAMING-AND-ADDRESSING.md § 4.3).

### 3.5 Cross-Entity Synthesis Method

**Authority level:** 0-intake (no layer scaffold has been produced under the grammar layer; this method is derived from the structural requirements in SCAFFOLD-GRAMMAR.md § 2.2 and the harness taxonomy's observed structure, but has not been tested in production).

**Input contract.** Mandatory: (a) three or more surface scaffolds within the same modality class (or, where surface scaffolds do not yet exist, sufficient per-surface dossiers to support cross-entity comparison); (b) the modality class's axis set. Optional: the modality class's existing layer scaffold to revise against.

**Procedural steps.** Three-zone synthesis per SCAFFOLD-GRAMMAR.md § 2.2: identify convergent primitives present across most entities in the class, organized by thematic cluster → identify per-entity divergent primitives representing each entity's distinctive architectural commitments → synthesize cross-cutting observations about patterns, trends, and structural relationships that emerge only from the cross-entity comparison → assign convergent-primitive identifiers using modality-class slugs per SCAFFOLD-GRAMMAR.md § 4.4 → execute the scaffold production method's steps 5–7 (epistemic labeling, staleness initialization, assembly and validation) on the assembled layer scaffold.

**Output contract.** One enduring layer scaffold with three mandatory zones (convergent, divergent, synthesis), passing the twelve-check validation schema with layer-scaffold species-specific instantiation on Checks 2, 4, and 10.

**Validation criteria.** The twelve-check schema. Additionally: the convergent zone must identify primitives shared across at least the majority of input surfaces; the divergent zone must cover every input surface; the synthesis zone must contain observations not derivable from any single surface scaffold alone.

**Scope.** Governs the production of layer scaffolds from multiple surface scaffolds. Does not govern cross-cutting scaffolds (which synthesize across tiers, not across surfaces within a class).

### 3.6 Open Slots

Two methods are declared as open slots — operations the institution will need but whose upstream procedures are not yet specified:

**Specification production method.** The extraction of prescriptive content from scaffolds into specification-class artifacts (teleological manuals, adapter contracts, operational policies). ARTIFACT-GRAMMAR.md § 4.2 describes extraction as a promotion mode, and § 2.6 defines the specification class grammar, but no document specifies the production procedure. This method will be created when the specification-production procedure is specified, likely as part of the second wave when scaffold-to-specification extraction becomes the primary production operation.

**Compression production method.** The lossy derivation of lower-resolution artifacts from higher-resolution sources. ARTIFACT-GRAMMAR.md § 2.5 defines the compression class grammar, but no production procedure exists. This method will be created when compression production becomes operationally necessary — likely when the readiness matrix or the ontology projection layer requires compressed views of scaffold content.

---

## § 4. Method Lifecycle

### 4.1 Method Creation

A new method is created when a repeatable production pattern is identified from operational experience. The method is drafted per the architecture in § 2 (input contract, procedural steps, output contract, validation criteria, scope declaration) and enters the catalog at authority Level 0 (intake). Creation requires: identifying the upstream procedure or evidential basis the method abstracts, specifying the method per § 2, and recording the method in this catalog with its authority level and creation date.

A method may also be created prospectively — specified before its procedure has been tested — when the upstream procedure specification is sufficiently detailed to support abstraction. Prospective methods enter the catalog at Level 0 and advance only through operational validation.

### 4.2 Method Validation

A method advances from Level 0 to Level 1 (curated) when it has been invoked on at least one real production task and the output has been verified against the method's validation criteria. The validation evidence is recorded: what task was performed, what inputs were supplied, what output was produced, and whether the output passed validation.

A method advances from Level 1 to Level 2 (operational) when it has been invoked successfully across multiple tasks with diverse inputs — different surfaces, different evidence sets, different operational contexts — demonstrating that the method generalizes beyond its initial test case. The diversity criterion prevents a method from reaching Level 2 on the basis of repeated invocation against a single easy case.

Methods whose governing principles prove structurally important to the institution may contribute those principles to canon through extraction (ARTIFACT-GRAMMAR.md § 4.2), but the method itself remains a method-class artifact at Level 2.

### 4.3 Method Revision

A method is revised when its upstream procedure changes (the scaffold grammar is amended, the delta metabolism is revised), when operational experience reveals that its parameterization is insufficient (a new scaffold species requires parameters the method does not accept), or when its validation criteria prove too lax or too strict. Revision produces a new version of the method. The revised method earns its authority from Level 0 under the new version — it does not inherit the predecessor's authority. If the revision is minor (parameterization adjustment, validation-criteria refinement), the operator may accelerate re-validation based on the prior version's operational record, but the re-validation must occur.

Revision is triggered by upstream changes, operational experience, or structural-flaw detection. It is not triggered by calendar — methods do not have revision cadences. They are revised when something changes.

### 4.4 Method Retirement

A method transitions to pedigree status when it is superseded by a more effective method for the same operation, when the operation it governs is no longer performed, or when its upstream procedure specification is retired. Retirement follows the five-condition archival test from ARTIFACT-GRAMMAR.md § 4.3. The retired method remains in the catalog with `Lifecycle: pedigree` status for provenance — future method creators can consult it as precedent.

---

## § 5. Boundary with Operational Configuration

Methods specify what structural operations to perform and what well-formed output looks like. They are silent on who performs them, with what tools, on what schedule, and under what operational conditions. This boundary is enforced by a structural constraint: no method in this catalog contains a surface name, agent name, tool name, or scheduling directive. If any of these appear, the method has crossed into teleological-manual territory and must be revised.

The separation exists because methods and operational assignments change at different rates and for different reasons. If the institution reassigns sensing from one surface to another, only the teleological manual changes — the sensing method remains stable because it specifies the structural operation, not the operational context. If the institution changes how scaffolds are produced (amends the scaffold grammar), only the method changes — the teleological manual remains stable because it specifies who invokes the method, not what the method does.

Teleological manuals consume methods: "This agent executes the sensing method (METHOD-ENGINE.md § 3.3) for domains X, Y, and Z, using sources A, B, and C, on a weekly cadence." The method provides the structural specification; the manual provides the operational binding.

---

*Assessment as of 2026-03-13: all sections drafted. Pending operator review and ratification. This document is itself a method-class artifact and satisfies the method architecture it defines in § 2: its input contract is the upstream grammar documents, its procedural steps are the method specifications in § 3, its output contract is a governed catalog of reusable operations, its validation criteria are the checks listed in the construction brief, and its scope is the generative method track. The cross-entity synthesis method (§ 3.5) is honestly labeled Level 0 — it has not been tested in production. The two open slots (§ 3.6) declare methods the institution will need but cannot yet specify.*
