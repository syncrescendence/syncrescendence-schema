# PRE-BUILD MEMO 1: Terminology Reconciliation

**Purpose:** Inventory terminological collisions across the corpus and propose resolutions. Consumed by NAMING-AND-ADDRESSING.md. Not a grammar document. Archived as pedigree after integration.

**Date:** 2026-03-12

---

## Collision 1: "Federal stack" vs "exocortex" vs "operational federation"

**Where each appears:**
- "Federal stack" — outline.md, FEDERAL_STACK (title and throughout). Used to mean: the full multi-layer architecture of the institution beyond the repo.
- "Exocortex" — STRATEGIC-VISION, HOLISTIC-STRATEGIC-ENDEAVOR, ONTOLOGY-REPORT, FEDERAL_STACK, TELEOLOGY-REGISTRY, exocortex.md, OPERATIONAL-TAXONOMY. Used to mean: the SaaS lattice, cloud providers, reasoning surfaces, and external operational surfaces.
- "Operational federation" — FEDERAL_STACK §0 ("the exocortex is the operational federation"). Used once as a synonym for exocortex.

**The collision:** "Federal stack" and "exocortex" overlap in scope but are not identical. The federal stack describes the entire multi-layer architecture (including the repo, the typed middle layer, the coding swarm, and the ontology). The exocortex describes only the external surfaces beyond the repo. Using them interchangeably conflates the institution's full architecture with one of its components.

**Proposed resolution:** Retire "federal stack" as a term. It was useful as a working label for the architectural investigation but it conflates the whole with a part. The correct terms are:
- **Institution** — the whole system (repo + exocortex + ontology + all tiers).
- **Exocortex** — the external operational surfaces (SaaS, cloud, daemons, reasoning surfaces, browser bridges). This is a subset of the institution, not a synonym for it.
- **Layer model** or **tier model** — the architectural decomposition of the institution into functional tiers.

"Operational federation" was a one-off synonym and need not survive. "Federal" as an adjective (as in "federal cognitive institution") can survive in prose where it emphasizes the multi-sovereign, differentiated-burden character of the system, but it should not appear in artifact names or structural vocabulary where precision matters.

---

## Collision 2: "Office" vs "modality class" vs "surface cluster"

**Where each appears:**
- "Office" — HOLISTIC-STRATEGIC-ENDEAVOR (office-harness binding, office federalism, office-local state, local offices). Used to mean: a differentiated functional unit within the institution, carrying its own memory, bindings, and governance.
- "Modality class" — this thread's tier model. Used to mean: a category of execution surface within Tier 4 (coding harnesses, reasoning surfaces, daemon runtimes, SaaS platforms, etc.).
- "Surface cluster" — TELEOLOGY-REGISTRY-CC90 (code+infra, model+intelligence, knowledge+work, automation+wiring, channel+incident, productivity, media+distribution, sandbox+file). Used to mean: a grouping of exocortex surfaces by functional domain.

**The collision:** All three terms describe ways of grouping surfaces, but at different structural levels. "Office" implies a governed organizational unit with local sovereignty. "Modality class" implies a structural type based on how the surface operates. "Surface cluster" implies a topical grouping based on what the surfaces are for.

**Proposed resolution:** These are not synonyms — they are three different organizational axes. Preserve all three with distinct scopes:
- **Modality class** — structural type. How a surface operates (coding harness, reasoning engine, SaaS platform, daemon, browser bridge, recon surface). Used in the tier model to organize Tier 4 execution surfaces by operational character.
- **Surface cluster** — topical grouping. What surfaces are for (code+infra, model+intelligence, knowledge+work, etc.). Used in the Teleology Registry to organize surfaces by functional domain.
- **Office** — governed organizational unit. A specific constellation role with local memory, bindings, and governance. Used for the differentiated cognitive roles (Vizier, Oracle, Vanguard) and potentially for surface groups that carry local state. This term should be used sparingly and only where actual local governance exists — not as a casual synonym for "group."

The three axes can cross-cut: a single surface can belong to one modality class, one surface cluster, and zero or one offices.

---

## Collision 3: Promotion hierarchy — "feedstock/Sigma references/Sigma/canon" vs artifact taxonomy

**Where each appears:**
- "Feedstock → Sigma references → Sigma → canon" — HOLISTIC-STRATEGIC-ENDEAVOR §4.2, §6. A five-tier promotion hierarchy for content maturity within the repo.
- The artifact taxonomy (eight classes: canon, scaffold, dossier, compression, specification, ledger, registry, method) — project doctrine + this thread's grammar layer.

**The collision:** These are two different classification systems applied to overlapping domains. The Sigma hierarchy classifies content by maturity/authority level (how proven is this?). The artifact taxonomy classifies content by structural function (what kind of thing is this?). They cross-cut: a "Sigma reference" could be a dossier or a scaffold; "canon" appears in both systems but means slightly different things (the Sigma hierarchy's canon is a maturity level; the artifact taxonomy's canon is a structural class).

**Proposed resolution:** The artifact taxonomy is the structural classification and takes precedence for artifact naming, organization, and grammar-layer governance. The Sigma hierarchy is a promotion-maturity model and takes precedence for tracking how content advances toward canonical authority.

Reconciliation: every artifact has both a class (from the taxonomy) and a maturity level (from the promotion hierarchy). A dossier at "Sigma" maturity is a well-validated dossier. A scaffold at "feedstock" maturity is a draft scaffold not yet validated. "Canon" in the artifact taxonomy means the artifact's structural class is constitutional law; "canon" in the Sigma hierarchy means the content has reached maximum earned authority. These should converge — an artifact should reach "canon" maturity level only if its structural class warrants it — but they are distinct dimensions.

Specific vocabulary refinement: consider whether "Sigma" and "Sigma reference" terminology should be preserved or retired. The terms are specific to the HOLISTIC-STRATEGIC-ENDEAVOR and carry no structural meaning outside the Syncrescendence project. The underlying concept (a promotion ladder from raw to validated to canonical) is preserved in the artifact grammar's promotion rules. Whether the specific "Sigma" vocabulary survives depends on whether it continues to be operationally useful in the repo's internal governance. **Decision deferred to ARTIFACT-GRAMMAR.md drafting,** where the promotion ladder is formally specified.

---

## Collision 4: "Pedigree" vs "tributary" vs "lineage" vs "archive"

**Where each appears:**
- "Pedigree" — HOLISTIC-STRATEGIC-ENDEAVOR §6, artifact taxonomy. Used for: ancestry, custody, caution; the provenance trail of how knowledge was obtained.
- "Tributary" — HOLISTIC-STRATEGIC-ENDEAVOR §4.5, §8. Used for: predecessor systems and archives that feed into the current shell. "Tributary archaeology," "tributary convergence."
- "Lineage" — this thread, various. Used for: the old research transcripts and prompt histories that produced current artifacts.
- "Archive" — this thread, various. Used for: documents that have been superseded but preserved.

**The collision:** These terms overlap but are not identical. Pedigree is a structural concept (how provenance works). Tributary is a specific-to-Syncrescendence metaphor (the predecessor systems). Lineage is a general term. Archive is a storage state.

**Proposed resolution:**
- **Pedigree** — the structural concept of provenance tracking. An artifact class in the taxonomy (or a property of the inquiry-lineage level in the artifact ladder). Retained.
- **Tributary** — retired as structural vocabulary. It was a useful metaphor for the migration phase (predecessor systems feeding into the successor shell) but it describes a historical process, not a permanent structural concept. Historical references to tributaries in the HOLISTIC-STRATEGIC-ENDEAVOR are preserved as is; new grammar documents should not use this term.
- **Lineage** — retained as the general term for research history. "Inquiry lineage" is Level 0 of the artifact ladder. Clear enough.
- **Archive** — retained as a storage state, not an artifact class. "Archived" means: preserved, not loaded into active sessions, not cited as authority, purge-eligible pending threshold conditions.

---

## Collision 5: "Scaffold" — ephemeral vs permanent

**Where each appears:**
- The project doctrine's artifact taxonomy lists "scaffold" as: "Generates understanding. Provisional by nature."
- This thread defines "enduring descriptive scaffold" as: permanent substrate from which canonical and prescriptive artifacts are synthesized. Not provisional. Not ephemeral.

**The collision:** The project doctrine's definition treats all scaffolds as provisional. The grammar layer requires a permanent species.

**Proposed resolution:** The term "scaffold" is polysemous within the system. Split it:
- **Scaffold** (provisional) — as the doctrine defines it. Generates understanding. Discardable once its value is extracted into downstream artifacts. This is the default meaning.
- **Enduring descriptive scaffold** (permanent) — the specific subclass defined in the grammar layer. Permanent substrate. Not discardable. Validated against the twelve-check grammar. Three species (surface, layer, cross-cutting). This is a distinct artifact type with its own specification in SCAFFOLD-GRAMMAR.md.

The artifact grammar should formalize this split. The project doctrine's definition is not wrong — it correctly describes provisional scaffolds. The grammar layer adds a permanent species that the doctrine did not anticipate. This is an extension, not a contradiction.

---

## Collision 6: "Layer" vs "tier" vs "stratum"

**Where each appears:**
- "Layer" — FEDERAL_STACK (8-layer architecture), outline (15 layers), general usage throughout.
- "Tier" — this thread's seven-tier model.
- "Stratum" — OPERATIONAL-TAXONOMY (6 strata).

**The collision:** Three words for the same structural concept (a horizontal division of the system into functional levels).

**Proposed resolution:** Standardize on **tier** for the institution's functional decomposition (the seven-tier model in LAYER-LAW.md). Reserve **stratum** for the OPERATIONAL-TAXONOMY's mereological decomposition of configuration architecture (which is being relocated to config-mereology scope within the tier model, not retired). Retire **layer** as a structural term in the grammar — it is too overloaded in computing generally and in this corpus specifically.

The document name LAYER-LAW.md is acceptable despite this because it has already been established in the build order and will carry an internal note that "layer" in the title is historical; the document's content uses "tier" consistently.

---

## Collision 7: "Surface" vs "tool" vs "platform" vs "app"

**Where each appears:**
- "Surface" — TELEOLOGY-REGISTRY, FEDERAL_STACK, STRATEGIC-VISION, throughout. The dominant term.
- "Tool" — outline, FEDERAL_STACK (tool teleology), cli-tools.md, general usage.
- "Platform" — exocortex exegeses, general usage.
- "App" — exocortex.md, casual usage.

**The collision:** Four words for the things in the exocortex.

**Proposed resolution:** Standardize on **surface** as the canonical term for any external system, service, tool, platform, or application that participates in the institution's exocortex. "Surface" is already dominant in the corpus, it avoids the connotation that these are passive instruments ("tool") or monolithic systems ("platform"), and it aligns with the Teleology Registry's naming convention (`slack_surface`, `notion_surface`).

"Tool" is acceptable in prose when referring to CLI utilities (cli-tools.md) or when the context makes the meaning unambiguous. "Platform" and "app" should be avoided in structural vocabulary; they are acceptable in prose when quoting external sources.

---

## Collision 8: "Render" vs "veneer" vs "projection"

**Where each appears:**
- "Render" — FEDERAL_STACK (surface renders, render discipline), HOLISTIC-STRATEGIC-ENDEAVOR (rendered harness veneers, render discipline). Used for: generated config files derived from canonical law.
- "Veneer" — HOLISTIC-STRATEGIC-ENDEAVOR (behavioral veneers, harness veneers). Synonym for render.
- "Projection" — ONTOLOGY-REPORT, FEDERAL_STACK, boundary law. Used for: the ontology's typed query surface over institutional state.

**The collision:** "Render" and "veneer" are synonyms. "Projection" is a different concept but overlaps in connotation (both describe derived, non-authoritative views of underlying truth).

**Proposed resolution:**
- **Render** — retained as the term for generated config files (CLAUDE.md, GEMINI.md, .aider.conf.yml, etc.). A render is a host-specific compression of canonical law into a platform's constraint surface.
- **Veneer** — retired. "Render" is sufficient and more precise.
- **Projection** — retained exclusively for the ontology's function. The ontology projects state into typed queryable form. This is not the same as rendering config files, and the terms should not be used interchangeably.

---

## Collision 9: Agent identity terms — "lens" vs "avatar" vs "agent" vs "entity"

**Where each appears:**
- "Lens" — STRATEGIC-VISION (Vizier Lens, Oracle Lens, Vanguard Lens). The named cognitive perspective a model operates under.
- "Avatar" — OPERATIONAL-TAXONOMY (avatarization as structural primitive). An instructional structure plus identity plus relationships.
- "Agent" — general usage throughout. Any AI model instance performing work.
- "Entity" — OPERATIONAL-TAXONOMY Stratum 4 (agentic entities). An identity-bearing operational unit.

**The collision:** Four terms for the identity-carrying AI workers in the constellation.

**Proposed resolution:**
- **Avatar** — the structural concept from the OPERATIONAL-TAXONOMY. An avatar is what you get when you apply avatarization (identity assignment + cognitive function + constellation position + mission alignment) to a model. This is the formal term for the result of the identity-assignment primitive.
- **Lens** — the specific avatar names (Vizier Lens, Oracle Lens, Vanguard Lens). These are instances of avatars, not a separate concept. Retained as proper names, not as a structural category.
- **Agent** — the generic term for any AI model instance performing work. Acceptable in prose. Not a formal structural category in the grammar.
- **Agentic entity** — the OPERATIONAL-TAXONOMY's formal category at Stratum 4. Retained for taxonomy purposes. An avatar is a species of agentic entity.

---

## Collision 10: "Semantic office" / "teleology layer" (outline) vs "Teleology Registry" (FEDERAL_STACK)

**Where it appears:**
- "Semantic office / teleology layer" — outline §4 (layer 4 of the fifteen-layer model). The layer that assigns proper role, anti-role, modality, authority ceiling to every surface.
- "Teleology Registry" — FEDERAL_STACK, OPERATIONAL-TAXONOMY, TELEOLOGY-REGISTRY-CC90.md. The specific artifact that records surface teleology.

**The collision:** The outline treats teleology as a layer. The FEDERAL_STACK treats it as a registry artifact. These are different structural claims.

**Proposed resolution:** Teleology is an **artifact** (the Teleology Registry), not a **tier**. The registry is a registry-class artifact that lives within the grammar layer and is populated from teleological manuals. It does not occupy its own tier in the seven-tier model. The outline's "semantic office / teleology layer" described the function correctly (assigning proper roles to surfaces) but mislocated it as a layer when it is actually a cross-cutting registry that applies across Tier 4 execution surfaces.

---

## Non-Collisions (terms that seem overlapping but are actually distinct)

**"Canon" (artifact class) vs "canon" (maturity level):** Addressed in Collision 3. Two dimensions, not one.

**"Boundary law" vs "constitutional law":** The boundary law ("repo ratifies, exocortex coordinates, ontology projects") is a specific instance of constitutional law. Not a collision — a containment relationship.

**"Compaction" (delta layer) vs "compression" (scaffold depths):** Compaction is a temporal operation (summarizing old delta entries). Compression is a spatial operation (providing multiple traversal depths within a scaffold). Different concepts, no collision.

---

## Terms to Retire

| Term | Replacement | Reason |
|---|---|---|
| Federal stack | Institution (whole), exocortex (external surfaces), tier model (architecture) | Conflates whole with part |
| Veneer | Render | Synonym; one term per role |
| Tributary | (historical only) | Metaphor for a completed migration phase |
| Operational federation | Exocortex | One-off synonym |

## Terms to Split

| Polysemous Term | Split Into | Reason |
|---|---|---|
| Scaffold | Scaffold (provisional), Enduring descriptive scaffold (permanent) | Different lifecycle, different validation, different authority |
| Canon | Canon (artifact class), canon (maturity level in promotion hierarchy) | Two orthogonal classification dimensions |
| Office | Retain only where actual local governance exists; do not use as synonym for cluster or class | Overloaded |

## Terms to Standardize

| Standardized Term | Over | Reason |
|---|---|---|
| Tier | Layer, stratum (for institutional architecture) | One term for the concept |
| Surface | Tool, platform, app (for exocortex entities) | Dominant in corpus, precise |
| Render | Veneer | One term for generated config |
| Projection | (ontology-specific only) | Distinct from render |
| Avatar | (result of avatarization) | Formal identity-assignment concept |

---

## Status

This memo is consumed by NAMING-AND-ADDRESSING.md. Proposed resolutions are working hypotheses pending ratification during grammar-document construction. Contradictions flagged here that are not resolved in this memo are forwarded to their resolution venue (noted per collision).
