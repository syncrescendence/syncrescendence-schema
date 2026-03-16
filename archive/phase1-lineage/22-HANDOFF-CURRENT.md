# HANDOFF-CURRENT.md

## Phase
Grammar-layer first-wave construction. Documents 1–6 ratified. Document 7 drafted, pending operator review. Two documents remain after Document 7.

## Last Completed Step
METHOD-ENGINE.md drafted. Five sections: governing principles establishing the method track's position between procedure specification and operational assignment (§ 1), method architecture defining the six structural components every method carries including the method/invocation distinction (§ 2), initial method set of five methods plus two declared open slots (§ 3), method lifecycle with creation/validation/revision/retirement governance (§ 4), boundary with operational configuration enforced by a structural constraint against surface/agent/tool/schedule content in methods (§ 5). Approximately 3400 words.

Key design decisions in the draft:
- Method/invocation distinction introduced in § 2.6: a method is an abstract reusable operation (one per catalog entry, governed by lifecycle); an invocation is a specific operational occurrence (tracked by operational mechanisms, not by the method engine). Bounded to definition only — no invocation-tracking apparatus specified.
- Five initial methods: scaffold production (Level 2), dossier-to-scaffold conversion (Level 1), sensing (Level 1), compaction (Level 1), cross-entity synthesis (Level 0). Authority levels assigned honestly based on operational evidence.
- Two open slots declared: specification production method and compression production method — awaiting upstream procedure specification.
- Self-referential validation: the document is itself a method-class artifact and satisfies the architecture it defines.
- No new dependencies introduced. The remaining two documents (READINESS-MATRIX.md, AUTHORITY-LATTICE.md) still close Phase 1 cleanly.

## Canonical Active Artifacts
Grammar documents (ratified): KNOWLEDGE-ARCHITECTURE-ROOT.md, LAYER-LAW.md, ARTIFACT-GRAMMAR.md, NAMING-AND-ADDRESSING.md, SCAFFOLD-GRAMMAR.md, DELTA-METABOLISM.md
Grammar documents (drafted, pending ratification): METHOD-ENGINE.md
Construction briefs (all consumed)
Pre-build memos (active inputs): PREBUILD-MEMO-2 through PREBUILD-MEMO-4
Handoff: this file — sole present-state artifact

## Next Action
Operator reviews METHOD-ENGINE.md. Key review targets: (a) whether the abstraction level is correctly set — methods reference upstream procedures without restating them, (b) whether the initial method set is sufficient without being inflated, (c) whether the method/invocation distinction is bounded correctly, (d) whether the boundary with teleological manuals is explicit enough to survive operational buildout, (e) whether the authority levels assigned to each method are honest. On ratification: proceed to READINESS-MATRIX.md (Document 8).

## Authoritative Inputs for Next Action (READINESS-MATRIX.md)
- LAYER-LAW.md §§ 2–8 (ratified — per-tier maturity semantics)
- SCAFFOLD-GRAMMAR.md § 3 (ratified — twelve-check schema as scaffold maturity criteria)
- DELTA-METABOLISM.md §§ 2, 3.2 (ratified — domain architecture and freshness computation for temporal-track health)
- METHOD-ENGINE.md § 3 (if ratified — method catalog for method-coverage assessment)
- ARTIFACT-GRAMMAR.md §§ 2, 3 (ratified — class grammar and authority levels for artifact-level maturity)
- NAMING-AND-ADDRESSING.md § 2 (ratified — identifier types for entity cataloging)
- KNOWLEDGE-ARCHITECTURE-ROOT.md § 10 (ratified — readiness map as headline assessment)
- LAYER-LAW.md per-tier "Current status" assessments (dated 2026-03-12 with migration note to readiness matrix)

## Decisions in Force
All prior decisions remain in force. New decisions from METHOD-ENGINE.md draft:
- Method/invocation distinction: method = abstract reusable operation; invocation = operational occurrence (method engine § 2.6)
- Five initial methods at declared authority levels; two open slots (method engine § 3)
- Method lifecycle: creation → validation (Level 0→1 on first successful invocation) → operational validation (Level 1→2 on diverse successful invocations) → revision (triggered by upstream changes, not calendar) → retirement (five-condition archival test) (method engine § 4)
- Boundary enforced structurally: no surface/agent/tool/schedule content in methods (method engine § 5)
- Methods reference upstream procedures; they do not restate them (method engine § 1)

Full decision inventory: seven-tier model; nine-class taxonomy; four authority levels (Level 3 canon-only); Sigma as orthogonal authority dimension; pedigree as lifecycle state; three promotion modes; track interface via typed signals; seven identifier types; dual-form surface identifiers; authority as metadata; signal syntax provisional-but-operational; compaction ≠ compression; two freshness-grading systems; tier-derived thresholds; twelve-check scaffold schema; seven-step scaffold production procedure; three scaffold species; method/invocation distinction; five initial methods + two open slots; draft canon = specification until ratified; config mereology within Tier 2; "office" = avatarization.

## Remaining Build Sequence
- Document 7: METHOD-ENGINE.md — drafted, pending ratification
- Document 8: READINESS-MATRIX.md — registry-class artifact cataloging per-tier, per-modality-class, per-method maturity; absorbs the current-status assessments from LAYER-LAW.md; provides the surface-to-scaffold lookup that NAMING-AND-ADDRESSING.md review identified as a gap
- Document 9: AUTHORITY-LATTICE.md — canon-class artifact assigning decision rights per authority level and tier; depends on artifact grammar promotion ladder, layer law per-tier decision cadences, naming authority indicators
- Transition criterion to second wave: all nine grammar documents ratified, readiness matrix populated, method engine operational for scaffold production

## Naming-Law Deferred Amendments
Three identifier variants awaiting batch registration:
- Compaction-entry identifiers: `[DOMAIN-SLUG-C{NNN}]` (delta metabolism § 4.2)
- Modality-class slugs for layer-scaffold convergent primitives (scaffold grammar § 4.4)
- Concern slugs for cross-cutting scaffold primitives (scaffold grammar § 4.4)

## Unresolved Contradictions
- Directory-layout conflict — deferred to specification phase
- Project doctrine eight → nine class editorial debt
- Signal identifier syntax provisional-but-operational
- Surface-to-scaffold lookup mechanism — scheduled for READINESS-MATRIX.md
- Three naming-law deferred amendments
- harness-taxonomy.md remediation (7 failing scaffold-grammar checks) — post-grammar editorial task
- Specification-production and compression-production methods — open slots awaiting upstream procedure specs

## Active Constraints
- Documents are substrate; memory is cache
- Every step resumable from artifacts alone
- Do not revise project doctrine yet
- Do not purge lineage documents
- Do not overpromote ARCHITECTURE.md
- READINESS-MATRIX.md is a registry-class artifact, not a canon or specification
- READINESS-MATRIX.md must absorb the current-status assessments from LAYER-LAW.md (which deferred authoritative maturity tracking to this document)
- READINESS-MATRIX.md must provide the surface-to-scaffold lookup missing from the naming conventions

## Do Not
- Let READINESS-MATRIX.md become a narrative assessment essay — it is a typed registry with schema-governed entries
- Let it duplicate the tier model or the maturity semantics — it applies them, not restates them
- Let it become a project plan or roadmap — it assesses current state, not future intent
- Let old handoff shards regain authority — this file is the singular present-state artifact
