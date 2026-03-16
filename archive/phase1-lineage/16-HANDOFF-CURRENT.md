# HANDOFF-CURRENT.md

## Phase
Grammar-layer first-wave construction. Documents 1–3 ratified. Document 4 drafted, pending operator review.

## Last Completed Step
NAMING-AND-ADDRESSING.md drafted. Five sections: governing principles with stability/compositionality/resolvability triad (§ 1), seven-type identifier taxonomy covering surfaces, primitives, artifacts, delta entries, domains, signals, and authority/lifecycle markers (§ 2), composition and resolution rules including fully qualified references, scope-defaulting, cross-track references, and alias governance (§ 3), terminological ledger with standardized terms, retirements, and collision resolutions including compaction/compression split (§ 4), concrete format specifications with syntax, uniqueness scope, stability rules, and well-formed/ill-formed examples for every identifier type (§ 5). Approximately 3600 words.

Key design decisions in the draft: surface identifiers carry two forms (registry form `snake_case_surface` and slug form `lowercase-kebab-case`); authority and lifecycle are metadata in artifact headers, not encoded in identifiers (preserving stability across promotions); signal identifiers are ephemeral routing handles, not permanent institutional records; sequence prefixes on grammar-layer files are organizational conveniences excluded from canonical identifiers; the arrow delimiter `→` in scaffold revision requests structurally separates temporal-track source from structural-track target.

## Canonical Active Artifacts
Grammar documents (ratified): KNOWLEDGE-ARCHITECTURE-ROOT.md, LAYER-LAW.md, ARTIFACT-GRAMMAR.md
Grammar documents (drafted, pending ratification): NAMING-AND-ADDRESSING.md
Construction briefs (consumed): CONSTRUCTION-BRIEF-ROOT-SCHEMA.md, CONSTRUCTION-BRIEF-LAYER-LAW.md, CONSTRUCTION-BRIEF-ARTIFACT-GRAMMAR.md, CONSTRUCTION-BRIEF-NAMING-AND-ADDRESSING.md
Pre-build memos (active inputs): PREBUILD-MEMO-2 through PREBUILD-MEMO-4
Handoff: this file — sole present-state artifact

## Next Action
Operator reviews NAMING-AND-ADDRESSING.md. Key review targets: (a) whether the dual-form surface identifier design (registry form vs. slug form) is acceptable or overengineered, (b) whether the signal identifier formats (§ 5.6) are specific enough for DELTA-METABOLISM.md to build against, (c) whether the composition and resolution rules (§ 3) are strong enough for bounded-context builders to resolve references without prose interpretation, (d) whether the terminological ledger (§ 4) correctly resolves the compaction/compression collision. On ratification: proceed to SCAFFOLD-GRAMMAR.md (Document 5).

## Authoritative Inputs for Next Action (SCAFFOLD-GRAMMAR.md)
- KNOWLEDGE-ARCHITECTURE-ROOT.md § 4 (ratified — enduring descriptive scaffold definition)
- KNOWLEDGE-ARCHITECTURE-ROOT.md § 6 (ratified — "enduring descriptive scaffolds are the permanent quarry")
- ARTIFACT-GRAMMAR.md § 2.2 (ratified — enduring scaffold class grammar with required components and well-formedness criteria)
- ARTIFACT-GRAMMAR.md § 5 (ratified — track interface contract, structural-change criteria, staleness markers)
- NAMING-AND-ADDRESSING.md § 2.2, § 5.2 (if ratified — primitive identifier format)
- LAYER-LAW.md § 5 (ratified — Tier 4 modality classes and per-class decomposition axes)
- harness-taxonomy.md (specimen of mature enduring scaffold — structural reference)
- Existing surface exegeses (report-*.md files) as specimens of dossier-class artifacts that scaffolds must improve upon

## Decisions in Force
- Seven-tier model with three orthogonal concerns (root, layer law)
- Nine-class artifact taxonomy with scaffold split into two distinct classes (artifact grammar §§ 2, 6)
- Four authority levels: Intake (0), Curated (1), Operational (2), Constitutional (3) (artifact grammar § 3)
- Level 3 reserved for canon-class artifacts only (artifact grammar § 3.3)
- Sigma hierarchy reconciled as authority dimension orthogonal to class (artifact grammar § 3)
- Pedigree = lifecycle state, not authority level (artifact grammar § 3.2)
- Three promotion modes: extraction, deepening, transformation (artifact grammar § 4.2)
- Track interface via scaffold revision requests and sensing directives (artifact grammar § 5)
- Seven identifier types: surface, primitive, artifact, delta entry, domain, signal, authority/lifecycle (naming § 2)
- Dual-form surface identifiers: registry form (`snake_case_surface`) and slug form (`lowercase-kebab-case`) (naming § 2.1)
- Primitive identifier format: `[surface-slug:primitive-name]` (naming § 2.2)
- Authority/lifecycle as header metadata, not identifier components (naming § 2.7)
- Signal identifiers ephemeral, not archived (naming § 2.6)
- Compaction = temporal-track process; compression = structural-track artifact class (naming § 4.3)
- Draft canon documents are specification-class or provisional-scaffold-class until ratified; canon class is assigned at ratification (artifact grammar § 3.3, interpretive note)
- Config mereology: six strata scoped within Tier 2 (layer law § 10)
- "Office" = avatarization pattern (layer law § 11)
- Boundary law, naming law, promotion rules (root §§ 1, 8, 9)

## Unresolved Contradictions
- Directory-layout conflict between OPERATIONAL-TAXONOMY and FEDERAL_STACK — deferred to specification phase
- Project doctrine artifact_taxonomy lists eight classes; should be updated to nine — editorial debt, not architectural question
- Signal identifier formats (naming § 5.6) are new specifications with no precedent — may need revision when DELTA-METABOLISM.md operationalizes the track interface

## Active Constraints
- Documents are substrate; memory is cache
- Every step resumable from artifacts alone
- Do not revise project doctrine yet
- Do not purge lineage documents
- Do not overpromote ARCHITECTURE.md
- SCAFFOLD-GRAMMAR.md must define the twelve-check validation schema referenced by ARTIFACT-GRAMMAR.md § 2.2
- SCAFFOLD-GRAMMAR.md must specify scaffold production procedure (how scaffolds are built), not just validation (how they are checked)
- SCAFFOLD-GRAMMAR.md scope is enduring descriptive scaffolds only — provisional scaffolds have their own minimal criteria in ARTIFACT-GRAMMAR.md § 2.3

## Do Not
- Let SCAFFOLD-GRAMMAR.md become a restatement of artifact grammar § 2.2 — it must specify the twelve-check schema and production procedure
- Let it become a template or form to fill in — it must specify structural requirements and validation logic
- Let old handoff shards regain authority — this file is the singular present-state artifact
- Reopen root, layer law, or artifact grammar architecture
