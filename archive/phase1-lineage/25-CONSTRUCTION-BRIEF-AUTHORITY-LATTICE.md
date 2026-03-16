# CONSTRUCTION BRIEF: AUTHORITY-LATTICE.md

## Document Identity
**Name:** AUTHORITY-LATTICE.md
**Artifact class:** Canon (defines stable institutional law for decision authority)
**Teleology:** Defines who can decide what within the institution: what decision rights exist, how they are distributed across authority levels and tiers, how delegation breadth scales with maturity, and what governance constraints apply to promotion, ratification, assessment, and operational action. This is the final grammar-layer document. It closes the constitutional loop by specifying the decision-rights structure that makes the promotion ladder (ARTIFACT-GRAMMAR.md § 4), the tier model (LAYER-LAW.md), and the maturity assessments (READINESS-MATRIX.md) governable.

## Relationship to Upstream Documents

**ARTIFACT-GRAMMAR.md § 4 (Promotion Ladder)** specifies promotion gates, modes, demotion, and ratification authority at the artifact level. § 4.4 states: "the repo ratifies. Concretely: the human operator commits to the repo with an explicit scope boundary and class assignment. No artifact self-promotes. No AI agent ratifies." The authority lattice deepens this by specifying the full decision-rights structure: not just who ratifies promotion to Level 3, but who can promote to Level 1, who can promote to Level 2, who can invoke methods, who can create domains, who can execute compaction, and how these rights scale with institutional maturity.

**LAYER-LAW.md §§ 2–8** specify per-tier volatility regimes and revision cadences. These determine the governance cadence at each tier: high-ρ tiers need fast decision cycles (more delegation to agents), low-ρ tiers need deliberate governance (more centralized authority). The authority lattice translates ρ-regime differences into decision-cadence assignments per tier.

**READINESS-MATRIX.md** provides the maturity state that the authority lattice consumes for calibrating delegation breadth. At low maturity (OPEN SLOT, NONE), decision authority is centralized because the structural substrate is too thin for safe delegation. At high maturity (MATURE, ESTABLISHED), delegation is safe because the structural substrate provides guardrails. The authority lattice specifies the mapping from maturity level to delegation breadth without re-assessing maturity.

**METHOD-ENGINE.md § 5 (Boundary with Operational Configuration)** establishes the method/teleological-manual boundary: methods specify what, manuals specify who. The authority lattice operates at a level above both: it specifies what *kinds* of decisions exist and what *structural position* (authority level, tier, maturity grade) a decision-maker must hold to make each kind. It does not assign specific agents to specific decisions — that remains teleological-manual territory.

**KNOWLEDGE-ARCHITECTURE-ROOT.md § 1 (Boundary Law)** states: "the repo ratifies, the exocortex coordinates, the ontology projects." The authority lattice operationalizes this boundary law into a complete decision-rights structure.

## The Core Design Problem

The institution has one human operator and many AI agents. Decision authority cannot be uniformly centralized (the operator becomes a bottleneck, and high-ρ operational tiers stall) or uniformly delegated (agents make constitutional decisions without governance, and the institution loses sovereignty). The authority lattice must specify a graduated structure where:

1. Constitutional decisions (Level 3 ratification, tier-model revision, grammar-layer amendment) are centralized to the operator.
2. Operational decisions (method invocation, delta entry creation, sensing-directive processing) are delegable to agents under method constraints.
3. Intermediate decisions (scaffold production, promotion from Level 0 to Level 1, domain creation) are delegable with operator review.
4. The boundary between these categories is defined by the decision's reversibility, propagation scope, and the maturity of the structural substrate it operates on.

The lattice must also distinguish four kinds of decision authority that the grammar layer has implicitly created:
- **Promotion authority** — who can advance an artifact along the authority ladder
- **Ratification authority** — who can commit constitutional changes (a subset of promotion authority, reserved for Level 2→3 transitions)
- **Assessment authority** — who can assign maturity levels in the readiness matrix
- **Operational authority** — who can invoke methods, create entries, execute compaction, and perform routine knowledge work

These may collapse into fewer categories if the structural analysis shows they follow the same governance logic. They should remain distinct if they require different governance constraints.

## Required Section Structure

### § 0. Query Handle
Domain: institutional decision-rights structure. Class: canon. Upstream: ARTIFACT-GRAMMAR.md §§ 3, 4; LAYER-LAW.md §§ 2–8; READINESS-MATRIX.md; METHOD-ENGINE.md § 5; KNOWLEDGE-ARCHITECTURE-ROOT.md § 1. Downstream: All governance acts, teleological manuals (which inherit operational delegation rights from this document), the operator.

### § 1. Governing Principles (≤3 paragraphs)
Decision authority in the institution is graduated by structural position: the decision's impact scope, its reversibility, and the maturity of the substrate it operates on. Constitutional decisions (those that propagate widely and are effectively irreversible at short timescales) require centralized human ratification. Operational decisions (those that are bounded, reversible, and operate within mature structural constraints) are delegable to agents. The authority lattice specifies this graduation as a governed structure, not as ad hoc judgment.

The boundary law from ROOT § 1 governs: the repo ratifies, the exocortex coordinates, the ontology projects. No AI agent holds constitutional authority. No exocortical surface acquires hidden sovereignty. The authority lattice operationalizes these constraints into a decision-rights taxonomy and a delegation framework calibrated to maturity.

Source: root § 1 (boundary law), artifact grammar § 4.4 (ratification authority), layer law §§ 2–8 (per-tier volatility and revision cadences).

### § 2. Decision-Rights Taxonomy

Define the distinct kinds of decisions the institution makes and what governance each requires:

**Promotion decisions** — advancing an artifact from one authority level to the next. Governed by the promotion gates in ARTIFACT-GRAMMAR.md § 4.1. The authority lattice specifies who can execute each gate: Level 0→1 (editorial completion), Level 1→2 (operational validation), Level 2→3 (constitutional ratification).

**Ratification decisions** — committing constitutional changes (Level 2→3 promotion, grammar-layer amendment, tier-model revision). The highest-authority decision class. Always requires human operator action via repo commit.

**Assessment decisions** — assigning maturity levels in the readiness matrix, evaluating scaffold quality against the twelve-check schema, evaluating method authority advancement. These are judgment calls that consume structural criteria from upstream documents.

**Operational decisions** — invoking methods, creating delta entries, executing compaction, processing sensing directives, producing scaffolds, and performing routine knowledge work within the constraints of ratified grammar-layer specifications.

**Architectural decisions** — creating new tiers, modality classes, artifact classes, or methods. These are structural extensions that change the grammar layer itself. Distinguished from ratification (which promotes within existing structure) by their creative scope.

For each decision type: what authority level or structural position is required, what evidence or process must accompany the decision, and what governance constraints apply. Reference upstream specifications for the process details; specify the authority assignment here.

Source: artifact grammar § 4 (promotion ladder, including gates and ratification). Method engine § 4 (method lifecycle as a decision sequence). Delta metabolism § 2.2 (domain creation). Readiness matrix § 5.3 (assessment authority).

### § 3. Delegation Framework

Specify how decision authority is delegated from the operator to AI agents, calibrated by maturity:

**Maturity-calibrated delegation.** At each maturity level (from the readiness matrix), what delegation breadth is permissible? At OPEN SLOT or NONE maturity, operational decisions in that tier are centralized — the structural substrate is too thin for safe delegation. At PARTIAL, bounded delegation is permissible for operations covered by ratified methods. At MATURE or ESTABLISHED, broad delegation is permissible within method constraints.

**Delegation constraints.** What constraints accompany delegation regardless of maturity? Method compliance (delegated operations must follow ratified methods), receipt emission (delegated operations must produce verifiable outputs), reversibility (delegated operations must be reversible or, if not, require pre-approval), and scope binding (an agent's delegated authority is bounded to its assigned scope in its teleological manual).

**Delegation revocation.** Under what conditions is delegation reduced? Maturity downgrade (the readiness matrix detects regression), method failure (a delegated operation produces output that fails validation), or structural violation (an agent operates outside its delegated scope).

Source: readiness matrix (maturity levels as delegation calibration input). Method engine § 5 (method/teleological-manual boundary). Artifact grammar § 4.4 (no artifact self-promotes). Root § 1 (no AI agent holds constitutional authority).

### § 4. Per-Tier Authority Profiles

For each tier, specify the authority profile that applies given its current maturity and volatility regime:

What decisions are centralized, what are delegable, and what governance cadence applies. High-ρ tiers (Tier 4 volatile modality classes, Tier 5) need faster decision cycles — operational delegation is broader to prevent bottlenecks. Low-ρ tiers (Tier 1, Tier 2) need deliberate governance — most decisions are centralized because they carry constitutional weight.

This section applies the delegation framework (§ 3) to each tier using the readiness matrix's current maturity assessments (READINESS-MATRIX.md § 4.1). The profiles are living — they change when the readiness matrix is updated.

Source: layer law §§ 2–8 (per-tier ρ-regime and revision cadence). Readiness matrix § 4.1 (current per-tier maturity). Root § 1 (boundary law per tier).

### § 5. Governance Constraints

Specify the absolute constraints that apply regardless of maturity or delegation:

**Constitutional constraint.** No AI agent ratifies Level 3 promotion. No AI agent amends the grammar layer. No AI agent creates new tiers or artifact classes. These are human-operator-only decisions.

**Sovereignty constraint.** No exocortical surface acquires decision authority by accumulating operational state. Decision authority flows from the repo's constitutional structure, not from operational volume or surface capability. Per ROOT § 1: the repo ratifies, the exocortex coordinates, the ontology projects.

**Reversibility constraint.** Irreversible decisions (those that cannot be undone without cascading revision) require human pre-approval regardless of maturity or delegation status. Reversible decisions (those undoable via git revert, entry append, or scaffold revision) can be delegated per the delegation framework.

**Receipt constraint.** Every delegated decision must emit a verifiable receipt. For scaffold production: the scaffold itself, validated against the twelve-check schema. For delta entry creation: the entry, validated against DELTA-METABOLISM.md § 3.1. For method invocation: the output, validated against the method's output contract. A decision that produces no verifiable output was not governed.

Source: root § 1 (boundary law), artifact grammar § 4.4 (ratification authority), artifact grammar § 4.3 (demotion and retirement as reversibility mechanism).

## Anti-Patterns
- Do NOT re-assess maturity — consume the readiness matrix, do not duplicate it
- Do NOT assign specific agents to specific tiers or decisions — that is teleological-manual territory
- Do NOT produce a Phase 2 project plan — specify decision rights, not future actions
- Do NOT specify what decisions to make — specify who can make what kinds of decisions under what constraints
- Do NOT conflate authority level (artifact property) with decision authority (governance property) — authority levels inform decision rights but are not the same thing
- Do NOT make delegation absolute — all delegation is maturity-calibrated and revocable
- Do NOT overpromote ARCHITECTURE.md
- Do NOT use retired terminology
- Do NOT produce governance theater — every constraint must have a structural justification tied to an upstream grammar-layer specification

## Source Documents to Load
1. ARTIFACT-GRAMMAR.md §§ 3, 4 (ratified — authority levels, promotion ladder, ratification authority)
2. LAYER-LAW.md §§ 2–8 (ratified — per-tier volatility regimes and revision cadences)
3. READINESS-MATRIX.md (ratified — per-tier and per-axis maturity assessments)
4. METHOD-ENGINE.md §§ 4, 5 (ratified — method lifecycle, method/teleological-manual boundary)
5. DELTA-METABOLISM.md §§ 2.2, 3.1, 4 (ratified — domain creation, entry creation, compaction as delegable operations)
6. SCAFFOLD-GRAMMAR.md § 3 (ratified — twelve-check schema as receipt for scaffold-production delegation)
7. KNOWLEDGE-ARCHITECTURE-ROOT.md § 1 (ratified — boundary law)
8. NAMING-AND-ADDRESSING.md § 2.7 (ratified — authority/lifecycle markers that the lattice assigns)

## Validation Checks (post-draft)
- [ ] Decision-rights taxonomy covers: promotion, ratification, assessment, operational, and architectural decisions (or a justified consolidation of these)
- [ ] Delegation framework specifies maturity-calibrated delegation breadth for each maturity level
- [ ] Delegation constraints are specified: method compliance, receipt emission, reversibility, scope binding
- [ ] Delegation revocation conditions are specified
- [ ] Per-tier authority profiles exist for all seven tiers (and optionally for orthogonal concerns)
- [ ] Constitutional constraint is absolute: no AI ratification, no AI grammar-layer amendment, no AI structural extension
- [ ] Sovereignty constraint prevents exocortical surfaces from acquiring hidden authority
- [ ] Reversibility constraint distinguishes reversible from irreversible decisions with different governance requirements
- [ ] Receipt constraint ensures every delegated decision produces verifiable output
- [ ] The document consumes readiness-matrix maturity levels without re-assessing them
- [ ] No specific agent assignments — decision rights are specified by structural position, not by agent identity
- [ ] No Phase 2 project planning content
- [ ] Total length: 2500–4000 words (governance specification, not governance manual)

## Downstream Artifacts This Document Unlocks
The authority lattice is the final grammar-layer document. On ratification, the grammar layer is complete. Downstream: teleological manuals consume delegation rights from this document (an agent's teleological manual specifies what decisions it can make, which are inherited from the lattice's delegation framework). The operator consumes this document for governance — it specifies the decision-rights structure for Phase 2 scaffold production, method invocation, domain creation, and operational delegation. All future governance acts reference this document for their authority basis.

The transition criterion to the second wave — all nine grammar documents ratified, readiness matrix populated, method engine operational — is met on ratification of this document (the readiness matrix was populated at draft; the method engine is ratified and operational at Level 2 for scaffold production).

## Drafter
Opus only. Decision-rights design, delegation-breadth calibration, and governance constraints are non-delegable architectural judgments — they determine who can do what in the institution and errors here undermine the entire constitutional structure. No Sonnet assistance on any section.
