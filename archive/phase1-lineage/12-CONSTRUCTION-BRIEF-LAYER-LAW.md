# CONSTRUCTION BRIEF: LAYER-LAW.md

## Document Identity
**Name:** LAYER-LAW.md
**Artifact class:** Canon
**Teleology:** Defines the seven functional tiers and three orthogonal concerns of the institution at one resolution level below the root schema. For each tier: purpose, scope boundary, interfaces, artifact populations, maturity semantics, and open-slot logic. Provides the structural frame within which all per-tier scaffolds, specifications, and registries locate themselves.

## Relationship to Root Schema
The root schema (§3) gives the headline tier model — one paragraph per tier, a maturity table for Tier 4, one paragraph per orthogonal concern. LAYER-LAW.md deepens each tier to a full structural specification. It must not repeat the root; it must extend it. A reader who has read the root's §3 should encounter only new resolution in this document.

## Section Structure

### § 0. Query Handle
Domain: institutional tier model. Class: canon. Upstream: KNOWLEDGE-ARCHITECTURE-ROOT.md §3. Downstream: all per-tier scaffolds, all tier-scoped specifications, READINESS-MATRIX.md.

### § 1. Governing Principles (brief, ≤3 paragraphs)
The tier model decomposes the institution by function, not by tool, surface, or team. Each tier has a single governing purpose. Tiers interact through declared interfaces — what one tier provides, the adjacent tier consumes. The environmental physics (ρ-regime split, mixed λ) structurally shapes the tier law: high-ρ tiers operate under fast-cycle empirical control; low-ρ tiers operate under governance-grade deliberation. The two-track architecture (structural/temporal) applies per-tier, not only at the system level. Each tier has its own characteristic λ and its own appropriate revision cadence.

Source: root schema §2, §3. PREBUILD-MEMO-2 (ρ, λ per tier).

### § 2–8. Per-Tier Specifications (one section per tier)

For each tier, specify:

**Purpose** — one paragraph. What this tier does. More specific than the root's one-sentence summary.

**Scope boundary** — what is inside this tier, what is not, what belongs in adjacent tiers. Explicit exclusions where confusion is likely. For Tier 4: scope boundary is the modality-class taxonomy, not a surface enumeration.

**Interfaces** — what this tier receives from the tier above (or from the environment, for Tier 1). What this tier provides to the tier below (or to the institution's operational surface, for Tier 7). What interfaces this tier exposes to non-adjacent tiers. Interface descriptions are structural (what kind of thing crosses the boundary), not operational (what specific data flows).

**Artifact populations** — what artifact classes populate this tier. What scaffold species it requires (surface scaffold, layer scaffold, or cross-cutting scaffold). What specifications, registries, ledgers, or methods it produces.

**Volatility regime and revision cadence** — this tier's ρ and λ from PREBUILD-MEMO-2. Whether the tier operates under empirical or governance-grade control. How often its artifacts should be re-verified.

**Maturity semantics** — what MATURE, PARTIAL, OPEN SLOT, and IN PROGRESS mean specifically for this tier. What structural completeness looks like. What the minimum viable scaffold coverage is.

**Open-slot logic** — what research is needed to advance the tier from its current maturity to the next level. What specific gaps exist. What is blocked on what.

Per-tier source mapping:
- Tier 1: PREBUILD-MEMO-2 (environmental physics framework and instantiation)
- Tier 2: root schema §4, §5, §8, §9. SYNCRESCENDENCE-HOLISTIC-STRATEGIC-ENDEAVOR-v1.md (strategic pillars). SYNCRESCENDENCE-OPERATIONAL-TAXONOMY.md (six strata as config-mereology scope within this tier).
- Tier 3: root schema §3 (typed middle layer). SYNCRESCENDENCE_FEDERAL_STACK_AND_TELEOLOGY_v1.md §6 (config cascade ordering — law → typed contracts → surface renders → runtime receipts → ontology projection).
- Tier 4: PREBUILD-MEMO-4 (eight modality classes). PREBUILD-MEMO-3 (reasoning-surface characterization). harness-taxonomy.md and ARCHITECTURE.md (coding-harness maturity specimen — reference only, do not over-index). Root schema Tier 4 table.
- Tier 5: root schema §3 Tier 5. outline.md §10 (automation and event choreography requirements).
- Tier 6: root schema §3 Tier 6. ARCHITECTURE.md §7 (observability for coding harnesses — reference as partial specimen only).
- Tier 7: SYNCRESCENDENCE-ONTOLOGY-HOLISTIC-REPORT.md (current ontology scope, boundary law, cascade ordering). Root schema §3 Tier 7.

### § 9. The Three Orthogonal Concerns

For each concern (trust/auth boundaries, reversibility/migration, epistemic status):

**What it governs** — the structural question it answers across all tiers.

**Per-tier intersection** — how this concern manifests at each of the seven tiers. Not a generic paragraph, but a structured per-tier note. For trust/auth: what auth boundaries exist at Tier 4 execution surfaces, what auth requirements exist at Tier 5 coordination, what trust model the ontology at Tier 7 inherits. For reversibility: what rollback looks like at each tier. For epistemic status: what verification cadences are appropriate at each tier.

**Current state and gap** — what coverage exists, what does not.

**Why this is orthogonal, not a tier** — brief justification. These concerns are properties of every tier, not standalone functional units.

### § 10. The Config-Mereology Scope (brief section)

Explicit relocation of the operational taxonomy's six strata (atoms → modules → instructional structures → agentic entities → platform/workflow architectures → ecosystem) into configuration-mereology scope within Tier 2. State: these strata describe how behavioral instructions compose from primitives to institutional character. They are a mereological grammar for one sub-domain (configuration architecture), not a rival tier model for the institution. The OPERATIONAL-TAXONOMY.md is the primary evidence source for this sub-domain; its structural findings are valid within this scope.

Source: SYNCRESCENDENCE-OPERATIONAL-TAXONOMY.md. Root schema §3 Tier 2 scoping note.

### § 11. The "Office" Concept (brief resolution or explicit deferral)

Resolve the "office" collision from Memo 1. The Holistic Strategic Endeavor uses "office" to mean a governed organizational unit with local memory, bindings, and governance. This maps to the avatarization concept at Stratum 4 of the config mereology (agentic entities with identity, cognitive function, constellation position). Offices are not tiers; they are an organizational pattern within Tier 4 modality classes where avatar-level identity and local governance exist. State this clearly. If the resolution is not yet fully earned, declare it as an open question with the structural hypothesis stated.

Source: PREBUILD-MEMO-1 (collision 2). SYNCRESCENDENCE-HOLISTIC-STRATEGIC-ENDEAVOR-v1.md (office usage). SYNCRESCENDENCE-OPERATIONAL-TAXONOMY.md (avatarization at Stratum 4).

## Anti-Patterns
- Do NOT repeat the root schema's tier descriptions — deepen them
- Do NOT assign specific surfaces to teleological roles (no "Slack is the operator bus")
- Do NOT resolve the directory-layout conflict (deferred to specification phase)
- Do NOT prescribe Tier 3 typed-middle-layer contracts (blocked on operational proof)
- Do NOT prescribe Tier 5 coordination patterns (insufficient substrate)
- Do NOT overpromote ARCHITECTURE.md — it is the mature specimen for one modality class in Tier 4
- Do NOT use retired terminology (federal stack, veneer, tributary, layer-as-tier-synonym)
- Do NOT let the six strata become a competing architecture — they are scoped within Tier 2

## Source Documents to Load
1. KNOWLEDGE-ARCHITECTURE-ROOT.md (ratified)
2. PREBUILD-MEMO-1-TERMINOLOGY-RECONCILIATION.md
3. PREBUILD-MEMO-2-ENVIRONMENTAL-PHYSICS.md
4. PREBUILD-MEMO-3-REASONING-SURFACES.md
5. PREBUILD-MEMO-4-RUNTIME-MODALITY.md
6. SYNCRESCENDENCE-HOLISTIC-STRATEGIC-ENDEAVOR-v1.md (for Tier 2 strategic pillars, office usage)
7. SYNCRESCENDENCE-ONTOLOGY-HOLISTIC-REPORT.md (for Tier 7)
8. SYNCRESCENDENCE-OPERATIONAL-TAXONOMY.md (for config-mereology scope)
9. SYNCRESCENDENCE_FEDERAL_STACK_AND_TELEOLOGY_v1.md (for Tier 3 config cascade, input only)
10. outline.md (for interface and fidelity requirements, input only)
11. ARCHITECTURE.md (for Tier 4 coding-harness specimen and Tier 6 observability specimen — scope-bounded reference only)

## Validation Checks (post-draft)
- [ ] Every tier has: purpose, scope boundary, interfaces, artifact populations, volatility regime, maturity semantics, open-slot logic
- [ ] Every orthogonal concern has: governance scope, per-tier intersection, current state, orthogonality justification
- [ ] Config mereology explicitly scoped within Tier 2, not presented as rival architecture
- [ ] "Office" concept resolved or explicitly deferred with structural hypothesis
- [ ] No per-surface teleological assignments
- [ ] No retired terminology
- [ ] No repetition of root schema content — every section adds resolution
- [ ] Environmental physics (λ, ρ-regime) visibly affects tier law
- [ ] ARCHITECTURE.md referenced only as Tier 4 coding-harness specimen, not as institutional architecture
- [ ] Total length: 3000–5000 words (deeper than root but not exhaustive)

## Downstream Artifacts This Document Unlocks
All per-tier scaffolds know their scope from this document. The readiness matrix uses this document's maturity semantics. Specifications for individual tiers (typed middle layer, coordination contracts, observability specs) reference this document for interface requirements. The authority lattice uses this document's volatility-regime assignments to calibrate decision-rights per tier.

## Drafter
Opus only. Tier-boundary decisions and scope-exclusion judgments are non-delegable.
