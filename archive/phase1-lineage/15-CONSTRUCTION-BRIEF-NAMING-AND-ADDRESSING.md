# CONSTRUCTION BRIEF: NAMING-AND-ADDRESSING.md

## Document Identity
**Name:** NAMING-AND-ADDRESSING.md
**Artifact class:** Specification (prescribes naming and addressing rules for all artifact producers)
**Teleology:** Defines the institution's complete identifier system: how entities, primitives, artifacts, signals, and cross-references are named, formatted, addressed, and resolved. Operationalizes root § 8's naming law into a concrete scheme that makes the indexing spine (ARTIFACT-GRAMMAR.md § 5.1) functional, distinguishes all typed signals introduced by the artifact grammar, and resolves terminological collisions flagged across the grammar layer. This is structural infrastructure, not a glossary.

## Relationship to Upstream Documents

**KNOWLEDGE-ARCHITECTURE-ROOT.md § 8 (The Naming Law)** gives five headline rules: one-term-one-role, naming by function/authority/position, standardized terms (tier, surface, render, projection, avatar), the `[surface-slug:primitive-name]` format, and the polysemous-term split principle. Root § 8 explicitly defers "full reconciliation of terminological collisions" to this document. NAMING-AND-ADDRESSING.md operationalizes these rules into a concrete addressing scheme and enforces them across all identifier types the grammar layer has created. It must not restate root § 8; it must implement it.

**LAYER-LAW.md** provides the tier structure (seven tiers, three orthogonal concerns) that defines the namespace topology. Tier membership determines which namespace a surface, artifact, or signal belongs to. Modality classes within Tier 4 provide the grouping axis for surface slugs.

**ARTIFACT-GRAMMAR.md § 2 (Class Grammar)** defines nine artifact classes, each requiring identifiers: artifact names, scope-boundary references, upstream/downstream dependency pointers. The document's required-component lists implicitly specify what must be addressable. NAMING-AND-ADDRESSING.md must provide the identifier format for artifact-level references.

**ARTIFACT-GRAMMAR.md § 3 (Sigma Reconciliation)** defines four authority levels (0–3) and two lateral positions (playbooks/operators/validated-patterns, pedigree). Authority-level indicators and lifecycle-state markers must be part of the artifact addressing scheme.

**ARTIFACT-GRAMMAR.md § 5 (Track Interface Contract)** introduces three typed signals — scaffold revision requests (§ 5.2), sensing directives (§ 5.3), and delta entry references (§ 5.1) — that cross the track boundary. Each needs a specified format. The track interface contract specifies the semantics; NAMING-AND-ADDRESSING.md specifies the syntax and format.

**Existing identifier patterns in the corpus** that must be reconciled or normatively extended:
- Surface primitive identifiers: `[surface-slug:primitive-name]` (root § 8, artifact grammar § 5.1) — declared but not yet applied in existing scaffolds
- Delta entry identifiers: `[DOMAIN-NNN]` (LIVE-LEDGER-ARCHITECTURE-PRECIS § 3) — applied in the live ledger format
- Surface entity identifiers: `snake_case_surface` (EXOCORTEX-TELEOLOGY-REGISTRY-CC90) — applied in the teleology registry
- Artifact file names: `UPPER-KEBAB-CASE.md` (grammar layer documents) — applied by convention, not yet codified

These four existing patterns must be reconciled into a coherent addressing scheme. Where they conflict, NAMING-AND-ADDRESSING.md resolves; where they are compatible, it codifies.

## The Core Design Problem

The institution now has multiple identifier namespaces that evolved independently: surface-slug identifiers from the naming law, delta-entry identifiers from the live ledger, surface-entity identifiers from the teleology registry, artifact-file identifiers from grammar-layer convention, and three new typed signals from the track interface contract (scaffold revision requests, sensing directives, unanchored-entry references). These namespaces must compose into a single coherent addressing scheme where:

1. Any entity, primitive, signal, or artifact can be unambiguously identified by its address.
2. Cross-references between artifacts resolve to specific targets (not prose descriptions or positional references, per root § 8).
3. The indexing spine actually works — a delta entry can reference a scaffold primitive, a sensing directive can reference a stale primitive, a scaffold revision request can reference the delta entry that triggered it, and all these references resolve correctly.
4. The addressing scheme scales — adding new surfaces, new domains, new artifact classes, and new signal types does not require restructuring the scheme.

This is an infrastructure design problem, not a terminology cleanup exercise. The output is a specification that artifact producers and signal producers can implement against.

## Required Section Structure

### § 0. Query Handle
Domain: institutional identifier system and naming conventions. Class: specification. Upstream: KNOWLEDGE-ARCHITECTURE-ROOT.md § 8, ARTIFACT-GRAMMAR.md §§ 2, 3, 5, LAYER-LAW.md §§ 2–8. Downstream: all artifact producers, all signal producers, SCAFFOLD-GRAMMAR.md (primitive identifier format), DELTA-METABOLISM.md (entry identifier format, revision-request format, sensing-directive format), AUTHORITY-LATTICE.md (authority-level indicators), the ontology projection layer.

### § 1. Governing Principles (≤3 paragraphs)
Restate root § 8's principles operationally: one-term-one-role as a naming discipline, identifier stability as a design constraint (once assigned, an identifier does not change except through a governed aliasing process), compositionality (complex addresses are built from simpler identifiers via declared composition rules), and resolvability (every identifier points to exactly one target that can be located).

Source: root § 8. Artifact grammar § 1 (class × authority orthogonality creates two dimensions of identification). Layer law § 1 (tier structure as namespace topology).

### § 2. The Identifier Taxonomy

Define the distinct identifier types the institution uses, organized by what they identify:

**Surface identifiers** — identify exocortical entities (Slack, Claude, Aider, etc.). Reconcile the teleology registry's `snake_case_surface` format with the naming law's surface-slug concept. Specify the canonical format. Specify how surface identifiers relate to modality classes (Tier 4 grouping).

**Primitive identifiers** — identify structural elements within a surface's decomposition. The `[surface-slug:primitive-name]` format from root § 8 and artifact grammar § 5.1. Specify the slug construction rules (what characters, what length constraints, what uniqueness scope). Specify how primitive identifiers compose with surface identifiers to form fully qualified references.

**Artifact identifiers** — identify knowledge-architecture artifacts (documents, scaffolds, registries, etc.). Specify the naming convention for artifact files: what format, what information the name encodes (class? tier? sequence?), what the uniqueness scope is. Codify the existing `UPPER-KEBAB-CASE.md` convention or revise it with structural justification.

**Delta entry identifiers** — identify individual entries in domain ledgers. Reconcile the live ledger's `[DOMAIN-NNN]` format with the broader identifier scheme. Specify how delta entries cross-reference scaffold primitives (the anchoring requirement from artifact grammar § 5.1).

**Signal identifiers** — identify the typed signals introduced by the track interface contract. Scaffold revision requests, sensing directives, and unanchored-entry references each need a format that encodes their type, origin, target, and timestamp. These formats do not exist yet — this is new specification.

**Domain identifiers** — identify the thematic domains in the temporal track (the delta-metabolism's domain structure from the Live Ledger Architecture Précis § 2). Specify format and uniqueness scope.

**Authority-level indicators** — how an artifact's authority level (0–3) and lifecycle state (active, pedigree) are encoded or declared. Not necessarily part of the identifier itself (authority can be tracked in metadata rather than embedded in the name), but the convention must be specified.

Source per type:
- Surface: root § 8 (surface term), EXOCORTEX-TELEOLOGY-REGISTRY-CC90 (applied pattern), layer law § 5 Tier 4 (modality classes)
- Primitive: root § 8 (`[surface-slug:primitive-name]`), artifact grammar § 5.1 (indexing spine), harness-taxonomy.md (primitives that need identifiers but currently lack them)
- Artifact: grammar-layer convention (observed pattern), artifact grammar § 2 (class names)
- Delta entry: LIVE-LEDGER-ARCHITECTURE-PRECIS § 3 (`[DOMAIN-NNN]` format)
- Signal: artifact grammar §§ 5.2–5.3 (semantic definitions, no format yet)
- Domain: LIVE-LEDGER-ARCHITECTURE-PRECIS § 2 (domain architecture)
- Authority: artifact grammar § 3 (four levels, pedigree lifecycle state)

### § 3. Composition and Resolution Rules

How identifiers compose into addresses, and how addresses resolve to targets:

**Fully qualified references.** When an artifact cross-references a primitive in another artifact, the reference must be fully qualified: `artifact-id:section-ref:primitive-id` or equivalent. Specify the composition syntax.

**Resolution order.** When a reference is ambiguous (e.g., a primitive name that appears in multiple surfaces), specify the resolution rules — namespace scoping, explicit qualification, or error.

**Cross-track references.** How a delta entry references a scaffold primitive, and vice versa. The artifact grammar's § 5.1 establishes the semantic contract (both tracks use the same identifiers); this section specifies the syntactic contract (what the reference looks like in a delta entry vs. in a scaffold vs. in a signal).

**Alias governance.** If an entity is renamed (a surface changes its product name, a primitive is reorganized), the old identifier becomes an alias that resolves to the new identifier. Specify the aliasing mechanism, its limitations, and the governance process for creating aliases.

Source: root § 8 (cross-references use identifiers, not prose descriptions). Artifact grammar § 5.1 (indexing spine requires both tracks to use the same identifiers). Artifact grammar § 5.2 (scaffold revision requests reference both a scaffold and a delta entry).

### § 4. The Terminological Ledger

Root § 8 establishes the polysemous-term split principle and names specific standardized terms. This section extends that into a maintained ledger of terminological decisions:

**Standardized terms** — the complete list of terms where the institution has made a specific naming choice (tier, surface, render, projection, avatar, scaffold split, canon dual-dimension, and any additional terms formalized during the grammar-layer build).

**Retired terms** — the complete list of terms that are no longer used and what replaced them (federal stack, veneer, tributary, layer-as-tier-synonym, and any additional retirements).

**Collision resolution: compaction vs. compression.** The artifact grammar creates a proximity between "compaction" (temporal track's aging-entry summarization, a ledger-class operation) and "compression" (structural track's resolution reduction, the compression artifact class). Specify the terminological boundary: compaction is a *process* applied to ledger entries; compression is an *artifact class* applied to structural content. These terms must not be used interchangeably.

**Open terminological questions** — any terms where the naming decision is deferred with a stated structural hypothesis and the evidence that would resolve it.

This section is a maintained reference, not a one-time cleanup. It specifies the process for adding new entries to the terminological ledger as future grammar documents and scaffolds introduce new terms.

Source: root § 8 (standardized terms, polysemous splits). PREBUILD-MEMO-1 (terminology collisions, if available — otherwise derivable from root § 8, layer law § 10 config-mereology scoping, layer law § 11 "office" resolution, and artifact grammar § 3 Sigma reconciliation). Artifact grammar §§ 2.5, 2.7 (compression/compaction proximity).

### § 5. Identifier Format Specifications

For each identifier type defined in § 2, provide the concrete format specification:

**Syntax rules** — character set, length constraints, case convention, delimiter rules.

**Uniqueness scope** — within what boundary must identifiers be unique (per-surface, per-domain, per-tier, institution-wide).

**Stability rules** — what can change about an identifier and what cannot. What triggers an alias vs. what triggers a new identifier.

**Examples** — one or two concrete examples per identifier type, drawn from existing artifacts where possible, showing well-formed and ill-formed instances.

This section is the implementable specification that artifact producers and tooling can validate against.

## Anti-Patterns
- Do NOT produce a glossary or terminology dictionary — the document specifies identifier infrastructure
- Do NOT restate root § 8 — operationalize it
- Do NOT restate artifact grammar § 5's track interface semantics — specify the syntax and format
- Do NOT produce a style guide for prose writing — this is about identifiers and addressing, not prose
- Do NOT resolve the directory-layout conflict (deferred to specification phase)
- Do NOT assign surfaces to teleological roles (that is teleological manuals' job)
- Do NOT embed artifact-class definitions (those are artifact grammar § 2's domain)
- Do NOT define the delta-metabolism's internal rules (that is DELTA-METABOLISM.md's scope)
- Do NOT define the scaffold validation schema (that is SCAFFOLD-GRAMMAR.md's scope)
- Do NOT overpromote ARCHITECTURE.md — its identifier patterns are specimens, not standards
- Do NOT use retired terminology
- Do NOT let the terminological ledger (§ 4) become the document's center of gravity — it is a reference appendix, not the document's purpose

## Source Documents to Load
1. KNOWLEDGE-ARCHITECTURE-ROOT.md § 8 (ratified — naming law headline)
2. LAYER-LAW.md §§ 2–8 (ratified — tier structure as namespace topology)
3. ARTIFACT-GRAMMAR.md §§ 2, 3, 5 (ratified — class names, authority levels, track interface contract with typed signals)
4. LIVE-LEDGER-ARCHITECTURE-PRECIS §§ 2–3 (domain architecture, entry format — existing identifier patterns)
5. EXOCORTEX-TELEOLOGY-REGISTRY-CC90 (existing surface identifier patterns: `snake_case_surface`)
6. harness-taxonomy.md (existing primitive descriptions that need identifiers — specimen only)
7. ARCHITECTURE.md (existing identifier conventions in specification context — specimen only, scope-bounded)
8. PREBUILD-MEMO-1-TERMINOLOGY-RECONCILIATION.md (if available — naming collisions; if unavailable, the collisions are recoverable from root § 8, layer law §§ 10–11, and artifact grammar § 3)
9. SYNCRESCENDENCE-OPERATIONAL-TAXONOMY.md (config-mereology naming: atoms, modules, instructional structures, etc. — scoped within Tier 2 terminology)

## Validation Checks (post-draft)
- [ ] Every identifier type from § 2 has a concrete format specification in § 5
- [ ] Surface identifiers reconcile the teleology registry's `snake_case_surface` with the naming law's surface-slug concept
- [ ] Primitive identifiers follow `[surface-slug:primitive-name]` and connect to the indexing spine
- [ ] Delta entry identifiers reconcile with or extend the live ledger's `[DOMAIN-NNN]` format
- [ ] Signal identifiers (scaffold revision requests, sensing directives) have specified formats
- [ ] Cross-track references resolve correctly in both directions
- [ ] The terminological ledger includes all standardized terms, all retired terms, and the compaction/compression split
- [ ] Composition and resolution rules are specified for fully qualified cross-references
- [ ] No identifier type exists in the grammar layer that lacks a format specification
- [ ] Existing identifier patterns in the corpus are reconciled (not silently replaced or ignored)
- [ ] Root § 8 is operationalized, not restated
- [ ] Artifact grammar § 5's typed signals have syntactic formats, not just semantic definitions
- [ ] Total length: 2500–4500 words (concrete enough to implement against, not exhaustively encyclopedic)

## Downstream Artifacts This Document Unlocks
SCAFFOLD-GRAMMAR.md uses this document's primitive identifier format to specify how scaffolds reference their primitives and how the twelve-check schema validates identifier compliance. DELTA-METABOLISM.md uses this document's delta entry format, domain identifier format, scaffold revision request format, and sensing directive format to specify the temporal track's internal rules. AUTHORITY-LATTICE.md uses this document's authority-level indicators to specify how authority is encoded and tracked. The ontology projection layer uses this document's identifier formats to map institutional entities into typed queryable state. All artifact producers use this document's naming conventions to name and cross-reference their outputs.

## Drafter
Opus for §§ 1–4 (governing principles, identifier taxonomy, composition rules, terminological ledger — these involve architectural judgment about namespace topology, collision resolution, and cross-track reference semantics). Sonnet may assist with § 5 (format specifications) under a tightly scoped sub-brief once the architectural decisions in §§ 1–4 are made, since format specification is detailed but non-architectural work.
