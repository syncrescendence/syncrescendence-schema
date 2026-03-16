# NAMING-AND-ADDRESSING.md

**Class:** Specification  
**Domain:** Institutional identifier system and naming conventions  
**Upstream:** KNOWLEDGE-ARCHITECTURE-ROOT.md § 8, ARTIFACT-GRAMMAR.md §§ 2, 3, 5, LAYER-LAW.md §§ 2–8  
**Downstream:** SCAFFOLD-GRAMMAR.md, DELTA-METABOLISM.md, AUTHORITY-LATTICE.md, all artifact producers, ontology projection layer  
**Last updated:** 2026-03-13  

---

## § 1. Governing Principles

Identifiers are institutional handles, not editorial conveniences. Every named entity in the knowledge architecture — every surface, primitive, artifact, delta entry, domain, and typed signal — carries an identifier that serves as its permanent address. Addresses enable cross-reference resolution, track interface linkage, and institutional memory. Without stable addresses, the bounded-context operating law collapses: a cold-start builder cannot resolve references, the indexing spine between structural and temporal tracks cannot function, and cross-artifact dependencies dissolve into prose interpretation.

Three principles govern the identifier system. First, **stability**: once assigned, an identifier does not change. Renaming is accomplished through governed aliasing (the old identifier becomes an alias that resolves to the new), not through reassignment. Second, **compositionality**: complex addresses are built from simpler identifiers via declared composition rules. A primitive address composes a surface slug with a primitive name; a delta entry address composes a domain slug with a sequence number; a cross-reference composes an artifact identifier with a section path and a primitive address. Third, **resolvability**: every identifier points to exactly one target that can be located. Ambiguous identifiers — those that could resolve to more than one target — are malformed. The resolution rules in § 3 specify how ambiguity is prevented and how scoped references are expanded to fully qualified form.

The naming law from root § 8 provides the headline discipline: one term maps to one role. The identifier system operationalizes this discipline across all entity types the grammar layer has defined.

---

## § 2. The Identifier Taxonomy

Seven identifier types compose the institution's addressing scheme. Each identifies a different kind of entity, carries its own format rules, and participates in composition differently.

### 2.1 Surface Identifiers

Surface identifiers name exocortical entities — the tools, platforms, models, and services that populate Tier 4's modality classes. Every surface carries two identifier forms:

The **registry form** is the surface's institution-wide unique name as cataloged in the Teleology Registry: `{name}_surface`, rendered in `snake_case`. Examples: `slack_surface`, `claude_anthropic_surface`, `aider_surface`. The registry form includes a vendor-disambiguation segment where multiple surfaces share a common product name (`chatgpt_openai_surface` vs. a hypothetical `chatgpt_azure_surface`). The `_surface` suffix is mandatory in the registry form — it marks the identifier as belonging to the surface namespace and prevents collision with other entity types.

The **slug form** is a shortened derivative used as a component in composite identifiers (primitive addresses, delta entry anchors). Slugs are `lowercase-kebab-case`, omit the `_surface` suffix, and retain only enough specificity to be unambiguous within their usage context. Examples: `slack`, `claude-chat`, `aider`, `notion`. Where the short form would be ambiguous (e.g., `claude` could denote the chat surface or Claude Code), the slug includes a disambiguating segment (`claude-chat` vs. `claude-code`). The mapping from registry form to slug form is declared in the Teleology Registry entry for each surface and does not change once assigned.

### 2.2 Primitive Identifiers

Primitive identifiers name structural elements within a surface's decomposition — the capabilities, config surfaces, object types, manipulation paths, and architectural features that scaffolds describe. Format: `[surface-slug:primitive-name]`, where `surface-slug` is the slug form from § 2.1 and `primitive-name` is a `lowercase-kebab-case` descriptor of the primitive. Examples: `[aider:repo-map-context]`, `[slack:channel-object-model]`, `[claude-chat:context-window-architecture]`, `[notion:block-primitive]`.

Primitive identifiers are the indexing spine that connects the structural and temporal tracks (ARTIFACT-GRAMMAR.md § 5.1). A scaffold assigns identifiers to its primitives at creation. A delta entry references a primitive identifier to anchor its observation to the structural track. A sensing directive references a primitive identifier to target re-observation. The identifier is the bridge; if it is missing, malformed, or ambiguous, the track interface contract breaks.

Uniqueness scope: primitive names must be unique within their surface. The fully qualified form `[surface-slug:primitive-name]` is institution-wide unique by construction, since surface slugs are institution-wide unique and primitive names are surface-unique.

### 2.3 Artifact Identifiers

Artifact identifiers name knowledge-architecture documents — canon, scaffolds, dossiers, specifications, ledgers, registries, methods, and compressions. Format: `UPPER-KEBAB-CASE.extension`, where the name encodes the artifact's functional identity and the extension indicates its format (`.md` for prose documents, `.json` for schema files, `.yaml` for configuration). Examples: `KNOWLEDGE-ARCHITECTURE-ROOT.md`, `LAYER-LAW.md`, `ARTIFACT-GRAMMAR.md`, `EXOCORTEX-TELEOLOGY-REGISTRY-CC90.json`.

Artifact identifiers do not encode class, tier, or authority level in their name. Class and authority are metadata tracked in the artifact's header block (the query-handle section), not structural components of the identifier. This avoids identifier churn on promotion — an artifact's name does not change when its authority level advances or its class is reassigned through transformation.

Sequence prefixes (e.g., `11-`, `12-`, `13-` as used in the grammar-layer build sequence) are permissible as build-order markers during active construction campaigns. They are organizational conveniences, not components of the canonical identifier. The canonical identifier is the name without the sequence prefix: `KNOWLEDGE-ARCHITECTURE-ROOT.md`, not `11-KNOWLEDGE-ARCHITECTURE-ROOT.md`. Cross-references between artifacts use the canonical form.

Uniqueness scope: artifact identifiers are institution-wide unique. No two artifacts may share an identifier regardless of their location in the repository.

### 2.4 Delta Entry Identifiers

Delta entry identifiers name individual observations in domain ledgers — the temporal track's primary content. Format: `[DOMAIN-SLUG-NNN]`, where `DOMAIN-SLUG` is the domain identifier (§ 2.6) and `NNN` is a zero-padded sequential number within that domain. Examples: `[CAPABILITIES-001]`, `[TOKEN-ECONOMICS-042]`, `[HARNESS-CONFIG-017]`.

Sequential numbers are append-only: once assigned, an entry number is never reused, even if the entry is later contradicted by a subsequent observation. The sequence encodes temporal order within the domain — `[CAPABILITIES-042]` was observed after `[CAPABILITIES-041]`.

Each delta entry must carry at least one **anchor reference** — a primitive identifier (`[surface-slug:primitive-name]`) or a domain identifier (`DOMAIN-SLUG`) — that connects the observation to the structural track's scope map. The anchor reference appears in the entry's metadata, not in the entry identifier itself. Unanchored entries (those with no connection to any structural-track entity) are valid as Level 0 intake but cannot trigger scaffold revision requests until anchored.

### 2.5 Domain Identifiers

Domain identifiers name the thematic domains that organize the temporal track's delta ledgers. Format: `UPPER-KEBAB-CASE`. Examples: `CAPABILITIES`, `TOKEN-ECONOMICS`, `HARNESS-CONFIG`, `TOOL-ECOSYSTEM`, `PROMPTING-CONSENSUS`.

Domains are defined by what changes independently (LIVE-LEDGER-ARCHITECTURE-PRECIS § 2). A domain identifier is assigned when a new domain ledger is created and does not change thereafter. If a domain is split (because two independently changing concerns were previously conflated), the original domain identifier becomes an alias that resolves to both successor domains, and the original ledger is preserved as pedigree.

Uniqueness scope: domain identifiers are institution-wide unique.

### 2.6 Signal Identifiers

Signal identifiers name the typed signals that cross the track interface boundary. Two signal types are defined by ARTIFACT-GRAMMAR.md § 5:

**Scaffold revision requests** (temporal → structural). Format: `SRR:{delta-entry-id}→{artifact-id}:{change-category}`. The identifier encodes: the delta entry that triggered the request, the scaffold artifact targeted for revision, and the structural-change category (one of: `new-primitive`, `removed-primitive`, `restructured-composition`, `new-manipulation-path`, `restructured-auth`). Example: `SRR:[HARNESS-CONFIG-017]→HARNESS-TAXONOMY.md:new-primitive`.

**Sensing directives** (structural → temporal). Format: `SD:{primitive-id}:{staleness-grade}`. The identifier encodes: the scaffold primitive that needs re-observation and the staleness severity grade (computed from the gap between last-observed timestamp and the tier's freshness threshold). Staleness grades: `watch` (approaching threshold), `stale` (threshold exceeded), `critical` (threshold exceeded by more than 2× the freshness window). Example: `SD:[notion:block-primitive]:stale`.

Signal identifiers are ephemeral — they exist as references within the editorial queue (for scaffold revision requests) or the observation queue (for sensing directives) and are consumed when acted upon. They are not archived in the manner of delta entries or artifact identifiers. Their purpose is routing, not institutional memory.

### 2.7 Authority and Lifecycle Markers

Authority level (0–3) and lifecycle state (active, pedigree) are metadata properties tracked in an artifact's header block, not components of the artifact's identifier. This design choice preserves identifier stability across promotions and retirements: an artifact's address does not change when it advances from Level 1 to Level 2, or when it transitions to pedigree status.

The header block carries: `Authority: {level}` where level is `0-intake`, `1-curated`, `2-operational`, or `3-constitutional`. And: `Lifecycle: active` or `Lifecycle: pedigree`. For classes outside the standard authority ladder (ledgers, registries), the authority field is omitted and replaced with a completeness indicator appropriate to the class.

When an artifact transitions to pedigree status, its identifier is preserved unchanged. The lifecycle marker in the header block changes to `pedigree`, and a `Superseded-by: {successor-artifact-id}` field is added. The old identifier remains resolvable — it points to the pedigree artifact, which points to its successor. This is the institutional equivalent of a redirect: the handle still works, but the reader is informed that authority has migrated.

---

## § 3. Composition and Resolution Rules

### 3.1 Fully Qualified References

When one artifact references a specific element in another artifact, the reference must be fully qualified to prevent ambiguity. Composition format: `{artifact-id} § {section-number}` for section-level references, and `{artifact-id} § {section-number} :: {primitive-id}` for primitive-level references within a section. Examples: `KNOWLEDGE-ARCHITECTURE-ROOT.md § 3` references the tier model section; `HARNESS-TAXONOMY.md § A :: [aider:repo-map-context]` references a specific primitive within a specific section of the harness taxonomy.

For references within the same artifact, the artifact-id component may be omitted: `§ 5.2` is a valid intra-document reference. Cross-artifact references always include the artifact identifier.

### 3.2 Scope-Defaulting

When a primitive identifier appears without an explicit artifact context, it is resolved against the canonical scaffold for that surface. The canonical scaffold is the highest-authority enduring descriptive scaffold whose scope includes that surface. If multiple scaffolds cover the same surface (a surface scaffold and a layer scaffold that includes the surface), the surface scaffold takes precedence for primitive resolution because it carries finer-grained decomposition.

When a domain slug appears without an explicit ledger context, it resolves to the active (non-pedigree) domain ledger for that domain. If a domain has been split, the reference is ambiguous and must be explicitly qualified.

### 3.3 Cross-Track References

Delta entries reference scaffold primitives using the primitive identifier format: the entry's anchor reference field carries `[surface-slug:primitive-name]`. Scaffold staleness markers reference delta entries using the delta entry identifier format: the primitive's last-observed metadata field carries `[DOMAIN-SLUG-NNN]` pointing to the most recent relevant observation.

Scaffold revision requests reference both tracks: `SRR:{delta-entry-id}→{artifact-id}:{change-category}` connects a temporal observation to a structural artifact. The resolution path: the delta entry identifier resolves to a specific entry in a domain ledger (temporal track); the artifact identifier resolves to a specific scaffold (structural track); the change category specifies what kind of structural revision is warranted.

Sensing directives reference the structural track only: `SD:{primitive-id}:{staleness-grade}` targets a specific primitive for re-observation. The temporal track receives this as an input to its observation queue without needing to resolve any structural-track internal references.

### 3.4 Alias Governance

Aliasing is a governed act, not an editorial convenience. An alias is created when an entity is renamed, when a domain is split, or when an artifact is superseded. The alias record contains: the old identifier, the new identifier(s), the date of creation, and the reason.

Alias records are maintained in the Teleology Registry for surface identifiers and in a dedicated alias section of the affected ledger for domain identifiers. For artifact identifiers, the alias is recorded in the pedigree artifact's `Superseded-by` field. Aliases are permanent — they are never deleted, because references in historical artifacts may use the old form and must remain resolvable.

Creation of an alias requires an explicit governance act: a commit to the repo that creates the alias record. No identifier is silently redirected.

---

## § 4. The Terminological Ledger

Root § 8 establishes the one-term-one-role principle and names specific standardized terms. This section maintains the institution's terminological decisions as a governed reference.

### 4.1 Standardized Terms

**Tier** — institutional functional decomposition (not "layer" or "stratum" or "level" when referring to the seven-tier model). **Surface** — exocortical entity (not "tool," "platform," or "app"). **Render** — generated configuration file derived from canonical law (not "veneer"). **Projection** — exclusively the ontology's function of making institutional state queryable (not "view" or "dashboard" when describing the ontology's structural role). **Avatar** — the result of identity assignment via avatarization at Stratum 4 of the config mereology.

**Class** — an artifact's structural kind (one of nine defined in ARTIFACT-GRAMMAR.md § 2). **Authority level** — an artifact's earned institutional weight (Level 0 through 3, defined in ARTIFACT-GRAMMAR.md § 3.1). **Lifecycle state** — an artifact's temporal status (active or pedigree). These three terms are orthogonal and must not be conflated: an artifact has a class AND an authority level AND a lifecycle state.

**Scaffold** splits into two distinct classes: **enduring descriptive scaffold** (permanent high-resolution substrate) and **provisional scaffold** (finite-lived working artifact). Unqualified "scaffold" is ambiguous and should be avoided in formal contexts; use the qualified form.

### 4.2 Retired Terms

**Federal stack** — retired; replaced by the seven-tier model. **Veneer** — retired; replaced by "render." **Tributary** — retired; replaced by domain-specific references to the corpus elements it formerly denoted. **Layer** as a synonym for tier in the institutional decomposition — retired; "layer" is reserved for the grammar layer (a construction-phase concept) and the config mereology's internal usage, not for the seven-tier model.

### 4.3 Collision Resolutions

**Compaction vs. compression.** These terms are close enough to cause confusion and must be kept distinct. **Compaction** is a temporal-track process: the periodic summarization of aging delta-ledger entries into snapshot form. It operates on ledger-class artifacts and produces compaction snapshots that remain within the ledger apparatus. **Compression** is a structural-track artifact class: the lossy derivation of a lower-resolution artifact from higher-resolution source artifacts. It operates across all classes and produces compression-class artifacts (domain cards, executive summaries, registry entries). Compaction is a *process* within the delta metabolism. Compression is a *class* within the artifact grammar. The two never substitute for each other.

**Canon as class vs. canon as authority.** "Canon" names both an artifact class (structural kind: institutional law) and the highest authority level (Level 3 — Constitutional). These are distinct uses on orthogonal dimensions: the class definition says what the artifact does, the authority level says how much weight it carries. Only canon-class artifacts reach Level 3, but this is a constraint of the promotion ladder, not an identity between the terms. In formal contexts, "canon-class" refers to the structural kind and "Level 3" or "constitutional authority" refers to the authority level.

**Office.** Resolved in LAYER-LAW.md § 11: "office" denotes the avatarization pattern at Stratum 4 of the config mereology, applied within the reasoning-surface and daemon-runtime modality classes. It is not a synonym for "group," "cluster," or "modality class."

### 4.4 Process for New Entries

New standardized terms, retirements, and collision resolutions are added to this section as part of the grammar-layer build or subsequent specification work. Each entry requires: the term, its defined meaning, what it replaces or disambiguates, and the source decision. The terminological ledger is a maintained reference — it grows as the institution's vocabulary grows.

---

## § 5. Identifier Format Specifications

### 5.1 Surface Identifiers

**Registry form.** Syntax: `{name}_surface` where `{name}` is `snake_case`, composed of ASCII lowercase letters, digits, and underscores. Maximum length: 64 characters including the `_surface` suffix. Vendor-disambiguation segments are included when product names collide. Uniqueness scope: institution-wide. Stability: permanent once assigned; renaming requires alias.

**Slug form.** Syntax: `lowercase-kebab-case`, composed of ASCII lowercase letters, digits, and hyphens. Maximum length: 32 characters. Derived from the registry form by a declared mapping in the Teleology Registry entry. Uniqueness scope: institution-wide. Stability: permanent; follows registry-form aliasing if the surface is renamed.

Well-formed: `slack_surface` / `slack`, `claude_anthropic_surface` / `claude-chat`, `aider_surface` / `aider`.  
Ill-formed: `Slack_Surface` (case violation), `claude` without disambiguator when ambiguous, `slack-surface` (hyphen in registry form).

### 5.2 Primitive Identifiers

Syntax: `[{surface-slug}:{primitive-name}]` where both components are `lowercase-kebab-case`. Maximum primitive-name length: 64 characters. The brackets are structural delimiters, not optional punctuation — they mark the identifier as a primitive reference in all contexts.

Uniqueness scope: primitive-name unique within its surface-slug. Fully qualified form is institution-wide unique by construction. Stability: permanent once assigned by the canonical scaffold. Removal of a primitive from a scaffold does not delete its identifier — it transitions the primitive to a `removed` epistemic status in the scaffold and ceases generating sensing directives.

Well-formed: `[aider:repo-map-context]`, `[slack:channel-object-model]`, `[notion:block-primitive]`.  
Ill-formed: `aider:repo-map-context` (missing brackets), `[Aider:RepoMap]` (case violation), `[aider:repo map context]` (spaces).

### 5.3 Artifact Identifiers

Syntax: `UPPER-KEBAB-CASE.{extension}` where the name is composed of ASCII uppercase letters, digits, and hyphens, and the extension indicates format. Maximum name length: 80 characters excluding extension. Sequence prefixes (e.g., `11-`, `12-`) are organizational markers that are not part of the canonical identifier.

Uniqueness scope: institution-wide. Stability: permanent; supersession creates a pedigree alias, not a reassignment. No encoding of class, tier, or authority level in the name.

Well-formed: `KNOWLEDGE-ARCHITECTURE-ROOT.md`, `HARNESS-TAXONOMY.md`, `EXOCORTEX-TELEOLOGY-REGISTRY-CC90.json`.  
Ill-formed: `knowledge-architecture-root.md` (lowercase), `KNOWLEDGE_ARCHITECTURE_ROOT.md` (underscores), `11-KNOWLEDGE-ARCHITECTURE-ROOT.md` (sequence prefix in cross-reference context).

### 5.4 Delta Entry Identifiers

Syntax: `[{DOMAIN-SLUG}-{NNN}]` where `DOMAIN-SLUG` is the domain identifier in `UPPER-KEBAB-CASE` and `NNN` is a zero-padded sequential number (minimum three digits; expand to four digits if the domain exceeds 999 entries). Brackets are structural delimiters.

Uniqueness scope: the sequence number is unique within its domain. The fully qualified form is institution-wide unique by construction. Stability: permanent and append-only — once assigned, never reused or reassigned.

Well-formed: `[CAPABILITIES-001]`, `[TOKEN-ECONOMICS-042]`, `[HARNESS-CONFIG-0017]`.  
Ill-formed: `CAPABILITIES-001` (missing brackets), `[capabilities-001]` (domain slug lowercase), `[CAPABILITIES-42]` (unpadded sequence number).

### 5.5 Domain Identifiers

Syntax: `UPPER-KEBAB-CASE`, composed of ASCII uppercase letters, digits, and hyphens. Maximum length: 48 characters. Matches the domain-slug component in delta entry identifiers.

Uniqueness scope: institution-wide. Stability: permanent; domain splitting creates aliases on the predecessor.

Well-formed: `CAPABILITIES`, `TOKEN-ECONOMICS`, `HARNESS-CONFIG`, `PROMPTING-CONSENSUS`.  
Ill-formed: `Model Capabilities` (spaces, mixed case), `token_economics` (underscores, lowercase).

### 5.6 Signal Identifiers

**Scaffold revision requests.** Syntax: `SRR:{delta-entry-id}→{artifact-id}:{change-category}`. Components: `SRR` type prefix; the triggering delta entry identifier (without outer brackets in this context — brackets delimit the entry ID in its native context, but within a signal identifier the `SRR:` prefix provides the namespace); the target scaffold artifact identifier; and one of five change categories: `new-primitive`, `removed-primitive`, `restructured-composition`, `new-manipulation-path`, `restructured-auth`. The arrow `→` is the structural delimiter between source (temporal) and target (structural).

Well-formed: `SRR:HARNESS-CONFIG-017→HARNESS-TAXONOMY.md:new-primitive`.  
Ill-formed: `SRR:[HARNESS-CONFIG-017]→HARNESS-TAXONOMY.md:new-primitive` (nested brackets), `SRR:HARNESS-CONFIG-017→HARNESS-TAXONOMY.md:capability-added` (non-standard change category).

**Sensing directives.** Syntax: `SD:{surface-slug}:{primitive-name}:{staleness-grade}`. Components: `SD` type prefix; the surface slug and primitive name (decomposed from the primitive identifier, without brackets); and one of three staleness grades: `watch`, `stale`, `critical`. The grade is computed, not assigned — it derives from the gap between last-observed timestamp and the tier's freshness threshold.

Well-formed: `SD:aider:repo-map-context:stale`.  
Ill-formed: `SD:[aider:repo-map-context]:stale` (brackets embedded), `SD:aider:repo-map-context:old` (non-standard grade).

Signal identifiers are ephemeral and do not require institution-wide uniqueness. Multiple identical signals may exist in the queue simultaneously (e.g., two different delta entries triggering revision requests against the same scaffold for the same change category). They are consumed on processing.

---

*Assessment as of 2026-03-13: all sections drafted. Pending operator review and ratification. The identifier taxonomy (§ 2) and composition rules (§ 3) are the load-bearing sections — downstream grammar documents build their format requirements against them. The signal identifier formats (§ 5.6) are new specifications with no existing precedent and may need adjustment as DELTA-METABOLISM.md operationalizes the track interface.*
