# HANDOFF-CURRENT.md

## Phase
Grammar-layer first-wave construction. Documents 1–7 ratified. Document 8 drafted, pending operator review. One document remains.

## Last Completed Step
READINESS-MATRIX.md drafted. Five sections: governing principles distinguishing state assessment from authority assignment (§ 1), four maturity axes with entry schemas (§ 2), cross-axis reference rules (§ 3), initial population across all four axes (§ 4), maintenance rules with trigger-based and cadence-based update mechanisms (§ 5). Approximately 3800 words including tables.

Key design decisions in the draft:
- Four axes confirmed non-overlapping: tier/modality-class (Axis 1), scaffold coverage (Axis 2), method coverage (Axis 3), temporal-domain coverage (Axis 4). No fifth axis needed — grammar-layer completeness is an Axis 1 Tier 2 entry.
- Axis 2 separates coverage (scaffold_id field: identifier or GAP) from quality (check_pass_count and known_failures fields). A surface with a 5/12 scaffold and a surface with no scaffold produce structurally different entries.
- Surface-to-scaffold lookup is now functional: 45+ surface entities cataloged, each returning either a scaffold identifier (6 coding-harness surfaces → HARNESS-TAXONOMY.md) or an explicit GAP marker.
- Axis 4 is honestly empty: zero operational domains under the grammar layer. Twelve candidate domains from the Live Ledger Précis are listed as reference recommendations, not mandated entries.
- No authority-lattice content: the matrix assesses state, the lattice assigns authority. The boundary is clean.
- No new dependencies introduced for AUTHORITY-LATTICE.md.

## Canonical Active Artifacts
Grammar documents (ratified): KNOWLEDGE-ARCHITECTURE-ROOT.md, LAYER-LAW.md, ARTIFACT-GRAMMAR.md, NAMING-AND-ADDRESSING.md, SCAFFOLD-GRAMMAR.md, DELTA-METABOLISM.md, METHOD-ENGINE.md
Grammar documents (drafted, pending ratification): READINESS-MATRIX.md
Construction briefs (all consumed)
Pre-build memos (active inputs): PREBUILD-MEMO-2 through PREBUILD-MEMO-4
Handoff: this file — sole present-state artifact

## Next Action
Operator reviews READINESS-MATRIX.md. Key review targets: (a) whether the four-axis model is sufficient and non-overlapping, (b) whether the entry schemas are concrete enough to be maintained as a living registry, (c) whether the initial population honestly reflects current institutional maturity, (d) whether the surface-to-scaffold lookup is complete, (e) whether Axis 4's honest emptiness is acceptable as a starting state rather than a failure. On ratification: proceed to AUTHORITY-LATTICE.md (Document 9 — the final grammar-layer document).

## Authoritative Inputs for Next Action (AUTHORITY-LATTICE.md)
- ARTIFACT-GRAMMAR.md §§ 3, 4 (ratified — four authority levels, promotion ladder, ratification authority)
- LAYER-LAW.md §§ 2–8 (ratified — per-tier volatility regimes and revision cadences for decision-cadence calibration)
- READINESS-MATRIX.md (if ratified — maturity assessments informing delegation breadth)
- NAMING-AND-ADDRESSING.md § 2.7 (ratified — authority/lifecycle markers)
- KNOWLEDGE-ARCHITECTURE-ROOT.md § 1 (ratified — boundary law: "the repo ratifies")
- METHOD-ENGINE.md § 5 (ratified — method/teleological-manual boundary as a decision-rights model)

## Decisions in Force
All prior decisions remain in force. New decisions from READINESS-MATRIX.md draft:
- Four non-overlapping maturity axes with typed entry schemas (readiness matrix §§ 2–3)
- Surface-to-scaffold lookup via Axis 2 (readiness matrix § 4.2) — closes NAMING-AND-ADDRESSING.md review gap
- LAYER-LAW.md current-status assessments absorbed and superseded (readiness matrix § 4.1)
- ROOT § 10 readiness map absorbed and superseded (readiness matrix § 4.1)
- ROOT § 11 open slots absorbed as Axis 2 scaffold-coverage gaps (readiness matrix § 4.2)
- Scaffold coverage summary: 1 layer scaffold / 0 surface scaffolds / 0 cross-cutting scaffolds / 14 dossier-backed surfaces / ~21 surfaces with no evidence
- Method coverage summary: 5 methods (1 Level 2, 3 Level 1, 1 Level 0) + 2 open slots
- Temporal-domain coverage: zero operational domains
- Assessment authority: human operator applying upstream structural criteria

Full decision inventory: seven-tier model; nine-class taxonomy; four authority levels (Level 3 canon-only); Sigma as orthogonal authority dimension; pedigree as lifecycle state; three promotion modes; track interface via typed signals; seven identifier types; dual-form surface identifiers; authority as metadata; signal syntax provisional-but-operational; compaction ≠ compression; two freshness-grading systems; tier-derived thresholds; twelve-check scaffold schema; seven-step scaffold production procedure; three scaffold species; method/invocation distinction; five methods + two open slots; four readiness axes; draft canon = specification until ratified; config mereology within Tier 2; "office" = avatarization.

## Remaining Build Sequence
- Document 8: READINESS-MATRIX.md — drafted, pending ratification
- Document 9: AUTHORITY-LATTICE.md — the final grammar-layer document; assigns decision rights per authority level and tier; specifies delegation breadth, ratification gates, and how authority scales with maturity
- Transition criterion to second wave: all nine grammar documents ratified, readiness matrix populated (done on ratification), method engine operational for scaffold production

## Naming-Law Deferred Amendments
Three identifier variants awaiting batch registration:
- Compaction-entry identifiers: `[DOMAIN-SLUG-C{NNN}]` (delta metabolism § 4.2)
- Modality-class slugs (scaffold grammar § 4.4)
- Concern slugs (scaffold grammar § 4.4)

## Unresolved Contradictions
- Directory-layout conflict — deferred to specification phase
- Project doctrine eight → nine class editorial debt
- Signal identifier syntax provisional-but-operational
- Three naming-law deferred amendments
- harness-taxonomy.md remediation (7 failing scaffold-grammar checks) — post-grammar editorial task
- Specification-production and compression-production methods — open slots
- Surface-to-scaffold lookup is now provided by READINESS-MATRIX.md Axis 2 — gap CLOSED

## Active Constraints
- Documents are substrate; memory is cache
- Every step resumable from artifacts alone
- Do not revise project doctrine yet
- Do not purge lineage documents
- Do not overpromote ARCHITECTURE.md
- AUTHORITY-LATTICE.md must assign decision rights, not re-assess maturity (that is the readiness matrix)
- AUTHORITY-LATTICE.md must specify delegation breadth calibrated to maturity without collapsing into operational scheduling
- AUTHORITY-LATTICE.md is the final grammar-layer document — it must leave the institution ready to transition to Phase 2

## Do Not
- Let AUTHORITY-LATTICE.md become a project plan for Phase 2
- Let it re-assess maturity (the readiness matrix does that)
- Let it assign specific agents to specific tiers (that is teleological-manual territory)
- Let old handoff shards regain authority — this file is the singular present-state artifact
