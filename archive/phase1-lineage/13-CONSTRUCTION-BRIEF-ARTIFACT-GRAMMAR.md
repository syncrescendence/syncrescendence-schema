# CONSTRUCTION BRIEF: ARTIFACT-GRAMMAR.md

## Document Identity
**Name:** ARTIFACT-GRAMMAR.md
**Artifact class:** Canon
**Teleology:** Defines the internal grammar of each artifact class — what makes an instance of that class well-formed — and the lawful promotion ladder by which content moves between authority levels and artifact kinds. Reconciles the repo's operational Sigma/feedstock promotion hierarchy with the root schema's nine-class artifact taxonomy by making explicit the orthogonality of structural kind (class) and earned authority (promotion level). Specifies the structural/temporal track interface contract at operational resolution.

## Relationship to Upstream Documents

**KNOWLEDGE-ARCHITECTURE-ROOT.md §4 (Artifact Taxonomy)** gives nine headline class definitions, each in one to three sentences. ARTIFACT-GRAMMAR.md deepens each class to a full structural grammar: required components, well-formedness criteria, internal structure, relationship to other classes, and what evidence or process distinguishes this class from adjacent ones. It must not repeat the root's definitions; it must specify what the root names.

**KNOWLEDGE-ARCHITECTURE-ROOT.md §5 (Artifact Ladder)** gives the two-track model (structural and temporal) and their interface contract in one paragraph each. ARTIFACT-GRAMMAR.md deepens the interface contract to operational resolution: what primitive identifiers connect the tracks, what structural-change criteria trigger scaffold revision from delta observations, what freshness signals flow back, what the handoff protocol is. It does not fully specify the temporal track's internal metabolism (that is DELTA-METABOLISM.md) or the scaffold track's validation schema (that is SCAFFOLD-GRAMMAR.md). It specifies the contract between the two tracks and the promotion ladder within the structural track.

**KNOWLEDGE-ARCHITECTURE-ROOT.md §9 (Promotion Rules)** gives the abstract promotion path: evidence → synthesis → adversarial testing → ratification. ARTIFACT-GRAMMAR.md operationalizes this path: what evidence looks like for each class, what the synthesis step produces, what adversarial testing means concretely, what ratification requires, and what artifacts change class during promotion versus what artifacts are produced anew at a higher class.

**LAYER-LAW.md §§2-8 (Per-Tier Specifications)** specify which artifact classes populate each tier and what artifact kinds each tier emits. ARTIFACT-GRAMMAR.md must be consistent with these per-tier populations but does not re-specify them. The artifact grammar defines what a class is; the layer law defines where instances of that class live.

**SYNCRESCENDENCE-HOLISTIC-STRATEGIC-ENDEAVOR-v1.md §6 (Strategic Hierarchy)** defines the repo's operational Sigma/feedstock promotion ladder: feedstock → Sigma references → Sigma → canon → playbooks/operators/validated-patterns → pedigree. This is the existing operational practice that ARTIFACT-GRAMMAR.md must reconcile with the nine-class taxonomy. The reconciliation must map each Sigma rung to a combination of artifact class and authority level, demonstrating that the Sigma hierarchy and the artifact taxonomy are orthogonal axes (kind vs. authority) rather than competing hierarchies.

**LIVE-LEDGER-ARCHITECTURE-PRECIS.md** provides the temporal track's operational design: domain architecture, entry format, staleness computation, compaction protocol, sensing directives. ARTIFACT-GRAMMAR.md draws on this for the track interface specification but does not subsume the précis — DELTA-METABOLISM.md will canonize the temporal track's internal rules.

## The Core Reconciliation Problem

The project carries two promotion hierarchies that evolved independently:

**The Sigma/feedstock hierarchy** (from the repo's operational practice) is a linear authority ladder: feedstock (raw intake) → Sigma references (evidence-rich compendia) → Sigma (repeated-use secondary doctrine) → canon (bind-on-default operative scripture). It also names lateral positions: playbooks/operators/validated-patterns (executable operational forms) and pedigree (ancestry and caution). This hierarchy tracks **authority level** — how much institutional weight an artifact carries.

**The nine-class artifact taxonomy** (from the root schema) is a type system organized by **structural function**: canon, enduring descriptive scaffold, scaffold (provisional), dossier, compression, specification, ledger, registry, method. This taxonomy tracks **what kind of thing an artifact is** — its structural role in the knowledge architecture.

The reconciliation hypothesis: these are orthogonal axes. An artifact has both a class (structural kind) and a promotion level (earned authority). A dossier can be feedstock-grade (raw evidence dump) or Sigma-reference-grade (curated, cross-referenced evidence compendium). A specification can be Sigma-grade (repeated-use operational doctrine) or canon-grade (ratified institutional law). The Sigma rungs map onto a single authority dimension that applies across all classes; they do not compete with the class taxonomy.

ARTIFACT-GRAMMAR.md must either confirm this hypothesis with a worked-out mapping (showing where each Sigma rung intersects each artifact class), identify exceptions where the mapping breaks (classes that don't participate in all authority levels, or Sigma rungs that imply specific classes), or reject the hypothesis and propose an alternative reconciliation. The document must not silently retire the Sigma hierarchy (it represents real operational practice) or silently subsume it (it is not isomorphic to the artifact taxonomy).

## The Scaffold-Species Question

The project doctrine's artifact taxonomy lists eight classes, treating "scaffold" as one class. The root schema's taxonomy lists nine, splitting scaffold into two species: "enduring descriptive scaffold" (permanent high-resolution substrate) and "scaffold (provisional)" (ephemeral, discardable once value is extracted). ARTIFACT-GRAMMAR.md must resolve this: are these two classes or two species of one class? The answer has structural consequences — two classes means two separate grammars, two positions on the promotion ladder, two different well-formedness criteria. Two species of one class means a shared grammar with a speciation marker that governs lifecycle and authority. The root schema's treatment (separate entries with distinct descriptions) leans toward two classes. The project doctrine's treatment (one entry) leans toward one class with species. The resolution must be explicit.

## Required Section Structure

### § 0. Query Handle
Domain: artifact type system and promotion law. Class: canon. Upstream: KNOWLEDGE-ARCHITECTURE-ROOT.md §§4, 5, 9. Downstream: SCAFFOLD-GRAMMAR.md, DELTA-METABOLISM.md, NAMING-AND-ADDRESSING.md, AUTHORITY-LATTICE.md, all artifact producers.

### § 1. Governing Principles (≤3 paragraphs)
Two orthogonal dimensions govern every artifact: its class (structural kind — what role it plays in the knowledge architecture) and its promotion level (earned authority — how much institutional weight it carries). Class is assigned by structure; promotion level is earned by evidence, testing, and ratification. An artifact's self-declared class does not determine its authority; its evidential substrate and ratification history do.

The artifact grammar specifies the class dimension. The promotion ladder specifies the authority dimension. The two dimensions compose: every artifact has a class and a position on the authority ladder for its class.

Source: root §§4, 9. Holistic Strategic Endeavor §4.2, §6.

### § 2. The Class Grammar (one subsection per class)

For each of the nine classes (or eight, if the scaffold-species question is resolved toward unification), specify:

**Structural definition** — what this class IS, in terms of its function in the knowledge architecture. One paragraph maximum. Must go beyond the root's headline definition to specify structural role.

**Required components** — what a well-formed instance of this class must contain. Structural elements that define class membership. For canon: scope boundary, upstream/downstream dependencies, epistemic floor declaration, ratification record. For scaffold: decomposition axes, primitive inventory, epistemic status labels, staleness markers. For method: input specification, procedure steps, output specification, validation criteria. Each class has its own required-component set.

**Well-formedness criteria** — what distinguishes a well-formed instance from a malformed one. Checkable assertions. These are the structural tests that a validation grammar can apply. Not quality judgments (good vs. bad) but structural compliance (well-formed vs. ill-formed).

**Relationship to other classes** — what this class produces, consumes, or transforms into. What downstream classes depend on this class. What upstream classes feed this class. This is the class-level analog of the per-tier interface specifications in LAYER-LAW.md.

**Promotion behavior** — how content of this class participates in the promotion ladder. Does this class's content promote by transforming into a different class (scaffold → specification → canon), by deepening within the same class (dossier gaining evidence until it earns higher authority), or by extraction (content extracted from a scaffold into a separate higher-authority artifact)? The root's §9 states "scaffolds never promote to canon directly — their content promotes through downstream artifacts." This principle must be made concrete for each class.

Source per class:
- Canon: root §4 definition, root §9 (promotion as destination), Holistic Strategic Endeavor §6 ("bind-on-default operative scripture")
- Enduring descriptive scaffold: root §4, root §6 ("permanent quarry"), harness-taxonomy.md as specimen
- Scaffold (provisional): root §4, project doctrine class definition
- Dossier: root §4, existing surface exegeses as specimens (report-*.md files)
- Compression: root §4, EXOCORTEX-TELEOLOGY-REGISTRY as specimen
- Specification: root §4, ARCHITECTURE.md as specimen
- Ledger: root §4, LIVE-LEDGER-ARCHITECTURE-PRECIS as temporal-track substrate
- Registry: root §4, readiness matrix as future specimen
- Method: root §4, method engine as future specification

### § 3. The Sigma Reconciliation

Explicit mapping of the Sigma/feedstock authority hierarchy onto the class × authority matrix. The section must:

1. State the Sigma ladder rungs (feedstock, Sigma references, Sigma, canon) and the lateral positions (playbooks/operators/validated-patterns, pedigree) with their operational definitions from the Holistic Strategic Endeavor §6.

2. State the authority dimension as a formal axis independent of class. Define what each authority level means structurally (not just by name): what evidential requirements, what ratification process, what institutional weight.

3. Produce the reconciliation mapping — either as a matrix (class × authority level → what this combination looks like) or as a per-rung analysis (for each Sigma rung: which classes can occupy this level, and what distinguishes a class instance at this level from an instance at adjacent levels).

4. Identify edge cases: classes that participate in only some authority levels (does a method artifact go through feedstock stage? does a registry have a Sigma-reference phase?), and Sigma rungs that map to specific classes (does "playbooks/operators/validated-patterns" imply the specification class?).

5. Resolve or explicitly defer the relationship between the Sigma hierarchy's "pedigree" rung and the archive/lineage preservation rules in root §12 (purge criterion).

Source: Holistic Strategic Endeavor §§4.2, 6. Root §§4, 5, 9. RESPONSE-ORACLE-SCAFFOLD_CONSENSUS_.md (repo directory structure with feedstock/Sigma/canon directories). RESPONSE-ORACLE-MEMORY_ARCHITECTURE_SENSING_.md (memory types with feedstock references).

### § 4. The Promotion Ladder

Operationalize root §9's abstract path (evidence → synthesis → adversarial testing → ratification) into a concrete ladder with:

**Promotion gates** — what evidence, process, or test an artifact must pass to advance from one authority level to the next. Not a bureaucratic checklist; a structural specification of what "readiness to promote" means.

**Promotion modes** — three structural modes of promotion: (a) transformation (artifact changes class during promotion — e.g., scattered evidence consolidated into a dossier), (b) extraction (content extracted from one artifact into a new artifact of higher class — e.g., teleological manual synthesized from a scaffold), (c) deepening (artifact gains authority within its class through evidential accumulation and testing). Specify which classes use which modes.

**Demotion and retirement** — under what conditions an artifact loses authority or is archived. The root's purge criterion (five conditions for lineage archival) is part of this. Demotion is not failure — it is structural response to changed evidence or scope.

**Ratification authority** — who or what can ratify promotion. Root §1: "the repo ratifies." What this means concretely: human operator commits to repo with explicit scope boundary and class assignment. No artifact self-promotes.

Source: root §9, root §12 (purge criterion). Holistic Strategic Endeavor §4.2 (lawful promotion). §7 ("confuse eloquent prose with live authority" as anti-pattern).

### § 5. The Track Interface Contract

Deepen root §5's one-paragraph interface specification between structural and temporal tracks to operational resolution:

**Indexing spine** — surface primitive identifiers in [surface-slug:primitive-name] format serve as the shared key between scaffolds and delta entries. A delta observation references the scaffold primitive it updates. A scaffold primitive carries a staleness marker computed from its delta coverage.

**Structural-change criteria** — what delta observations qualify as structural changes that trigger scaffold revision requests. Root §5 names five: "new primitive, removed primitive, restructured composition rules, new manipulation path, restructured auth model." Formalize these as typed change categories.

**Freshness signal flow** — how scaffold staleness markers generate sensing-priority signals that enter the temporal track. What "stale" means computationally (time since last delta observation against the tier's ρ-appropriate threshold). How sensing directives are generated from staleness patterns.

**Non-collapse guarantee** — the structural mechanism that prevents the two tracks from collapsing. Scaffolds do not become append-only ledgers; ledgers do not become revision-cadenced scaffolds. The interface is the narrow bridge, not a merger.

Source: root §5 (artifact ladder), root §6 (three tracks). LIVE-LEDGER-ARCHITECTURE-PRECIS §§0-3 (temporal track design). LAYER-LAW §1 (per-tier scaffold/delta partition).

### § 6. The Scaffold-Species Resolution

Explicit resolution of whether "enduring descriptive scaffold" and "scaffold (provisional)" are two classes or two species of one class. Present the structural argument for each option, state the resolution, and specify the consequences for the class grammar (§2) and the promotion ladder (§4).

Source: root §4 (nine-class taxonomy with scaffold split). Project doctrine artifact_taxonomy (eight classes with unified scaffold). Root §6 (three tracks — "enduring descriptive scaffolds are the permanent quarry" vs. provisional scaffolds as "discardable once value is extracted").

## Anti-Patterns
- Do NOT repeat root §4's headline class definitions — deepen them into grammars
- Do NOT repeat root §5's artifact ladder description — operationalize it
- Do NOT collapse the class and authority dimensions into a single hierarchy
- Do NOT silently retire the Sigma/feedstock hierarchy — map it explicitly
- Do NOT silently subsume the Sigma hierarchy — it may not be isomorphic to the artifact taxonomy
- Do NOT define the temporal track's internal metabolism (that is DELTA-METABOLISM.md)
- Do NOT define the scaffold's validation schema (that is SCAFFOLD-GRAMMAR.md)
- Do NOT assign artifacts to tiers (that is LAYER-LAW.md's domain)
- Do NOT produce a registry of existing artifacts (that is READINESS-MATRIX.md)
- Do NOT drift into naming conventions (that is NAMING-AND-ADDRESSING.md)
- Do NOT let the Sigma reconciliation become a separate type system — it must integrate into the existing class grammar as an authority dimension
- Do NOT overpromote ARCHITECTURE.md — it is a specimen of the specification class, not the grammar of specifications
- Do NOT use retired terminology (federal stack, veneer, tributary)

## Source Documents to Load
1. KNOWLEDGE-ARCHITECTURE-ROOT.md (ratified) — §§4, 5, 6, 9 primary
2. LAYER-LAW.md (ratified or pending) — per-tier artifact populations
3. SYNCRESCENDENCE-HOLISTIC-STRATEGIC-ENDEAVOR-v1.md — §§4.2, 6, 7 (Sigma hierarchy, lawful promotion, non-goals)
4. LIVE-LEDGER-ARCHITECTURE-PRECIS.md — §§0-3 (temporal track design, entry format, domain architecture)
5. RESPONSE-ORACLE-SCAFFOLD_CONSENSUS_.md — repo directory structure showing feedstock/Sigma/canon lanes
6. RESPONSE-ORACLE-MEMORY_ARCHITECTURE_SENSING_.md — memory types with feedstock/compaction references
7. harness-taxonomy.md — specimen of enduring descriptive scaffold class (structure reference only)
8. ARCHITECTURE.md — specimen of specification class (structure reference only, scope-bounded)
9. EXOCORTEX-TELEOLOGY-REGISTRY-CC90.md — specimen of compression/registry class
10. CANONICAL-CI-PROVENANCE-REPORT.md — specimen of dossier class
11. Project doctrine artifact_taxonomy (eight classes, embedded in system prompt)

## Validation Checks (post-draft)
- [ ] Every class has: structural definition, required components, well-formedness criteria, inter-class relationships, promotion behavior
- [ ] The class grammar covers all nine classes from root §4 (or eight, with explicit scaffold-species resolution in §6)
- [ ] The Sigma reconciliation produces an explicit mapping, not a verbal wave
- [ ] The promotion ladder specifies concrete gates, modes, and ratification requirements
- [ ] The track interface contract specifies: indexing spine, structural-change criteria, freshness signal flow, non-collapse guarantee
- [ ] The scaffold-species question is explicitly resolved with stated consequences
- [ ] No artifact class is defined only by example — each has structural criteria independent of any specimen
- [ ] No repetition of root §4 headline definitions — every class section adds operational resolution
- [ ] No repetition of root §5 track descriptions — the interface contract adds operational specificity
- [ ] Authority dimension (Sigma reconciliation) is orthogonal to class dimension — no collapse
- [ ] Retired terminology absent
- [ ] ARCHITECTURE.md referenced only as specimen, not as grammar
- [ ] Total length: 3500–6000 words (detailed enough for downstream grammars to build against, not exhaustive)

## Downstream Artifacts This Document Unlocks
SCAFFOLD-GRAMMAR.md uses the enduring-descriptive-scaffold class grammar and the well-formedness criteria to build its twelve-check validation schema. DELTA-METABOLISM.md uses the track interface contract and the ledger class grammar to specify the temporal track's internal rules. NAMING-AND-ADDRESSING.md uses the class definitions to specify artifact naming conventions. AUTHORITY-LATTICE.md uses the promotion ladder and the Sigma reconciliation to assign decision rights per authority level. All future artifact producers use this document's class grammars as the structural specification for what they are building.

## Drafter
Opus only. Class definitions, promotion-ladder design, and the Sigma reconciliation involve non-delegable architectural judgment — the reconciliation in particular requires weighing operational practice against emerging formal structure, and errors here propagate into every downstream grammar document. Sonnet may assist with the class × authority mapping table and the track interface specification table under a tightly scoped sub-brief after the architectural decisions are made.
