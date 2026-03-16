# HANDOFF-CURRENT.md

## Phase
Grammar-layer first-wave construction. Documents 1–5 ratified. Document 6 drafted, pending operator review.

## Last Completed Step
DELTA-METABOLISM.md drafted. Six sections: governing principles with absolute prohibition on temporal-track resolution of contradictions (§ 1), domain architecture with definition criteria, lifecycle, and tier-mapped freshness inheritance using three ρ-regime classes (§ 2), entry lifecycle with creation requirements, dual freshness-grading resolution, structural-change evaluation, and contradiction preservation (§ 3), compaction protocol with volume/cadence triggers, three-tier retention, provenance-preserving archival, and compaction constraints (§ 4), sensing-directive processing with priority assignment, dispatch, completion, and null-observation handling (§ 5), failure modes canonized from the Live Ledger Précis with grammar-layer mitigation analysis for eight surviving modes (§ 6). Approximately 4200 words.

Key design decisions in the draft:
- Freshness-grade resolution: two explicitly distinct systems. Entry-level freshness (FRESH/CURRENT/AGING/STALE) computed from observation date for all ledger consumers. Sensing-directive staleness (watch/stale/critical) computed from primitive coverage gaps for the sensing pipeline. The two meet at the threshold: AGING entry triggers `watch`-grade directive evaluation.
- Tier-derived freshness thresholds replace the précis's fixed 7/30/90-day scheme. Three ρ-regime classes (high/moderate/low) produce different default calibrations. Précis values survive as defaults for high-ρ domains, not as universal law.
- Compaction snapshot identifiers use `[DOMAIN-SLUG-C{NNN}]` format to distinguish compaction entries from observation entries within the same domain sequence.
- Signal identifier syntax remains provisional-but-operational — no revision was required during drafting.

## Canonical Active Artifacts
Grammar documents (ratified): KNOWLEDGE-ARCHITECTURE-ROOT.md, LAYER-LAW.md, ARTIFACT-GRAMMAR.md, NAMING-AND-ADDRESSING.md, SCAFFOLD-GRAMMAR.md
Grammar documents (drafted, pending ratification): DELTA-METABOLISM.md
Construction briefs (all consumed): ROOT-SCHEMA, LAYER-LAW, ARTIFACT-GRAMMAR, NAMING-AND-ADDRESSING, SCAFFOLD-GRAMMAR, DELTA-METABOLISM
Pre-build memos (active inputs): PREBUILD-MEMO-2 through PREBUILD-MEMO-4
Handoff: this file — sole present-state artifact

## Next Action
Operator reviews DELTA-METABOLISM.md. Key review targets: (a) whether the two-system freshness-grade resolution (§ 3.2) is clean or creates unnecessary complexity, (b) whether the tier-derived threshold calibrations (§ 2.3) are concrete enough to replace the précis's fixed thresholds, (c) whether the compaction protocol (§ 4) preserves provenance without permitting unbounded growth, (d) whether the contradiction-preservation rule (§ 3.4) is absolute enough to prevent smoothing, (e) whether the compaction-entry identifier format (`C`-prefixed) should be registered in NAMING-AND-ADDRESSING.md. On ratification: proceed to METHOD-ENGINE.md (Document 7).

## Authoritative Inputs for Next Action (METHOD-ENGINE.md)
- SCAFFOLD-GRAMMAR.md § 4 (ratified — scaffold production procedure as the primary method to be abstracted)
- DELTA-METABOLISM.md § 5 (if ratified — sensing-directive processing as input for sensing method)
- ARTIFACT-GRAMMAR.md § 2.9 (ratified — method class grammar)
- NAMING-AND-ADDRESSING.md (ratified — identifier formats that methods must produce compliant output against)
- KNOWLEDGE-ARCHITECTURE-ROOT.md § 6 (ratified — generative method track description)
- The research lineage that produced the strongest corpus artifacts (harness-taxonomy.md production, surface exegesis production) as evidential basis for method abstraction

## Decisions in Force
All prior decisions remain in force. New decisions from DELTA-METABOLISM.md draft:
- Entry-level freshness and sensing-directive staleness are two distinct grading systems (delta metabolism § 3.2)
- Freshness thresholds are tier-derived via ρ-regime classes: high-ρ (short windows), moderate-ρ (medium), low-ρ (long) (delta metabolism § 2.3)
- Default calibrations are operational starting points, not constitutional law (delta metabolism § 2.3)
- Contradiction preservation is absolute within the temporal track (delta metabolism § 3.4)
- Compaction preserves provenance through archival; lossy for detail, lossless for traceability (delta metabolism § 4.3)
- Compaction snapshot identifiers: `[DOMAIN-SLUG-C{NNN}]` (delta metabolism § 4.2)
- Null observations recorded for unresolvable sensing directives; do not reset staleness (delta metabolism § 5.4)

Full decision inventory: seven-tier model; nine-class taxonomy; four authority levels (Level 3 canon-only); Sigma as orthogonal authority dimension; pedigree as lifecycle state; three promotion modes; track interface via typed signals; seven identifier types; dual-form surface identifiers; authority as metadata; signal syntax provisional-but-operational; compaction ≠ compression; two freshness-grading systems; tier-derived thresholds; draft canon = specification until ratified; twelve-check scaffold schema; seven-step scaffold production procedure; three scaffold species; config mereology within Tier 2; "office" = avatarization.

## Unresolved Contradictions
- Directory-layout conflict — deferred to specification phase
- Project doctrine eight → nine class editorial debt
- Signal identifier syntax provisional-but-operational (no revision needed so far)
- Surface-to-scaffold lookup mechanism — deferred to READINESS-MATRIX.md
- Modality-class and concern slugs lack declared registry home — deferred
- harness-taxonomy.md remediation (7 failing checks) — post-grammar editorial task
- Compaction-entry identifier format (`C`-prefixed) introduced in DELTA-METABOLISM.md § 4.2 — may need registration in NAMING-AND-ADDRESSING.md as a variant of the delta entry identifier format

## Active Constraints
- Documents are substrate; memory is cache
- Every step resumable from artifacts alone
- Do not revise project doctrine yet
- Do not purge lineage documents
- Do not overpromote ARCHITECTURE.md
- METHOD-ENGINE.md must abstract the production procedures already specified (scaffold production, sensing) into reusable methods
- METHOD-ENGINE.md must not re-specify the procedures themselves — it specifies the abstraction layer
- METHOD-ENGINE.md scope: the generative track's reusable operations, not the full operational playbook

## Do Not
- Let METHOD-ENGINE.md become a restatement of SCAFFOLD-GRAMMAR.md § 4 — it abstracts, not restates
- Let it become a general-purpose research methodology document divorced from the grammar layer
- Let it specify what agents or operators execute methods — that is teleological-manual territory
- Let old handoff shards regain authority — this file is the singular present-state artifact
