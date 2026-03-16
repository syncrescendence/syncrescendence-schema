# CONSTRUCTION BRIEF: DELTA-METABOLISM.md

## Document Identity
**Name:** DELTA-METABOLISM.md
**Artifact class:** Specification (prescribes the temporal track's internal rules)
**Teleology:** Defines the canonical law governing the institution's volatile temporal track: how domain ledgers are structured, how delta entries are produced and lifecycle-managed, how freshness is computed, how compaction operates, how scaffold revision requests are generated from structural-change observations, and how sensing directives are received and processed. This is the temporal track's constitution — it specifies what the track does, how it does it, and what constraints it operates under.

## Relationship to Upstream Documents

**ARTIFACT-GRAMMAR.md § 2.7 (Ledger Class Grammar)** defines ledger-class artifacts: append-only, timestamped, source-attributed, sequentially identified. The delta metabolism must operate within this class grammar — every ledger it specifies must be a well-formed ledger-class artifact. The class grammar specifies what a ledger IS; the delta metabolism specifies how ledgers OPERATE within the temporal track.

**ARTIFACT-GRAMMAR.md § 5 (Track Interface Contract)** defines the semantic contract between the structural and temporal tracks: scaffold revision requests flow temporal→structural, sensing directives flow structural→temporal, both tracks share the indexing spine of primitive identifiers. DELTA-METABOLISM.md must not re-specify this contract. It must specify the temporal track's side of the contract: how the temporal track generates scaffold revision requests (receiving observations and evaluating them against structural-change criteria), and how it processes sensing directives (receiving staleness signals and converting them into observation priorities).

**SCAFFOLD-GRAMMAR.md § 3 (Twelve-Check Schema) and § 4.6 (Staleness Initialization)** define the scaffold's side of the track interface: scaffolds carry staleness markers, last-observed timestamps, and freshness thresholds. The delta metabolism must not re-specify scaffold-side staleness logic. It must specify the temporal-track operations that feed the scaffold's staleness computation: how delta entries are produced, how freshness is computed from entry timestamps, and how sensing directives are generated when scaffold primitives exceed their freshness thresholds.

**NAMING-AND-ADDRESSING.md §§ 2.4, 2.5, 2.6, 5.4, 5.5, 5.6** define the identifier formats for delta entries (`[DOMAIN-SLUG-NNN]`), domain identifiers (`UPPER-KEBAB-CASE`), and signal identifiers (scaffold revision requests `SRR:...` and sensing directives `SD:...`). The delta metabolism operates with these formats, not against them.

**LAYER-LAW.md §§ 2–8** define per-tier volatility regimes (ρ, λ) that determine freshness thresholds for each tier. The delta metabolism specifies how these thresholds are applied to compute staleness.

**LIVE-LEDGER-ARCHITECTURE-PRECIS** is the primary evidence source for the temporal track's operational design — domain architecture, entry format, freshness computation, sensing pipeline, compaction, failure modes. The précis is a dossier-class artifact (Level 1 curated) that documents operational experience. DELTA-METABOLISM.md promotes the précis's structural findings into specification-class prescriptions within the grammar layer's framework. It must cite the précis as source evidence, not copy it wholesale. The grammar-layer vocabulary (staleness markers, sensing directives, scaffold revision requests, structural-change criteria) supersedes the précis's more informal vocabulary where they overlap.

## The Core Design Problem

The temporal track's operational design (from the Live Ledger Précis) was developed before the grammar layer existed. It uses vocabulary and concepts that partially overlap with, partially diverge from, and partially predate the grammar layer's formal apparatus. DELTA-METABOLISM.md must perform three operations simultaneously:

1. **Canonize** the précis's structural findings that remain valid under the grammar layer (domain architecture, append-only discipline, freshness computation, compaction protocol, failure modes).

2. **Integrate** the grammar layer's new apparatus (typed signals, structural-change criteria, the indexing spine, identifier formats) into the temporal track's operations — specifying how the track generates scaffold revision requests, processes sensing directives, and anchors delta entries to primitive identifiers.

3. **Disambiguate** where the précis's informal vocabulary creates confusion under the grammar layer. The précis uses "compression" for mid-session context management (§ 8, Mode 3) — this must be distinguished from the artifact-grammar's compression class and the compaction process per NAMING-AND-ADDRESSING.md § 4.3. The précis uses "freshness" with fixed thresholds (7/30/90 days) — the grammar layer requires tier-appropriate thresholds derived from ρ-regime analysis. The précis's "sensing pipeline" maps to, but is not identical with, the grammar layer's sensing-directive mechanism.

## Required Section Structure

### § 0. Query Handle
Domain: temporal track internal rules. Class: specification. Upstream: ARTIFACT-GRAMMAR.md §§ 2.7, 5; NAMING-AND-ADDRESSING.md §§ 2.4–2.6, 5.4–5.6; SCAFFOLD-GRAMMAR.md §§ 3, 4.6; LAYER-LAW.md §§ 2–8; LIVE-LEDGER-ARCHITECTURE-PRECIS. Downstream: METHOD-ENGINE.md (sensing-directive processing as a method), READINESS-MATRIX.md (temporal-track coverage assessment), all delta producers.

### § 1. Governing Principles (≤3 paragraphs)
The temporal track absorbs the institution's volatility so the structural track does not have to. Delta ledgers carry current-state observations — capability shifts, pricing changes, API updates, benchmark drift, operational findings — as timestamped, source-attributed, append-only entries. The track's value is in freshness: knowing what was observed, when, and at what confidence, so the institution can distinguish verified current state from decaying historical state.

The temporal track is governed by the delta metabolism: the rules by which observations enter the track, age within it, signal structural changes to the scaffold track, and compact when they exceed useful retention. These rules operate within the constraints already established: ledger-class grammar (ARTIFACT-GRAMMAR.md § 2.7), the track interface contract (ARTIFACT-GRAMMAR.md § 5), identifier formats (NAMING-AND-ADDRESSING.md §§ 2.4–2.6), and per-tier volatility regimes (LAYER-LAW.md §§ 2–8).

Source: root § 6 ("the canonical-delta layer is the refresh metabolism for volatile reality"), artifact grammar § 2.7 and § 5, LIVE-LEDGER-ARCHITECTURE-PRECIS § 0 ("static reference documents decay within days").

### § 2. Domain Architecture

Specify the rules governing how domains are defined, scoped, and managed:

**Domain definition criteria** — from the précis: a domain tracks what changes independently. Formalize into three criteria: (a) the subject matter changes over time, (b) its changes matter to institutional decisions, (c) it changes independently of other tracked domains. If two subjects always co-vary, they are one domain.

**Domain lifecycle** — how domains are created, split, merged, and retired. Creation: declare a new domain with an identifier per NAMING-AND-ADDRESSING.md § 2.5, create the ledger file, record the creation decision. Splitting: governed by alias rules in NAMING-AND-ADDRESSING.md § 3.4. Retirement: when a domain ceases to change or ceases to matter, the ledger transitions to pedigree status.

**Domain-to-tier mapping** — each domain is associated with a tier (or an orthogonal concern) from LAYER-LAW.md. This mapping determines the domain's freshness thresholds (derived from the tier's ρ-regime). The mapping is many-to-one: multiple domains may map to the same tier. The mapping is declared in the domain's ledger header.

**Recommended initial domain set** — the précis's twelve domains (§ 2) as a starting reference, validated against the grammar layer's tier model and adjusted where the précis's domain boundaries do not align with the tier structure.

Source: LIVE-LEDGER-ARCHITECTURE-PRECIS §§ 2, 9 (domain architecture, domain-creep failure mode). LAYER-LAW.md §§ 2–8 (tier volatility regimes). NAMING-AND-ADDRESSING.md § 2.5 (domain identifier format).

### § 3. Entry Lifecycle

Specify the lifecycle of a delta entry from creation to compaction:

**Entry creation** — what a well-formed entry contains (per ARTIFACT-GRAMMAR.md § 2.7 and the précis's entry format). Mandatory fields: entry identifier per NAMING-AND-ADDRESSING.md § 2.4, observation date, source attribution, confidence level, at least one anchor reference (primitive identifier or domain identifier per ARTIFACT-GRAMMAR.md § 5.1). The entry format from the précis (§ 3) is the structural basis, adapted to use grammar-layer identifier formats.

**Freshness computation** — formalize the précis's freshness decay (§ 4) with tier-appropriate thresholds. Replace the précis's fixed 7/30/90-day thresholds with threshold functions derived from the tier's ρ-regime: high-ρ tiers (Tier 4 capabilities, Tier 5 coordination) have short freshness windows; low-ρ tiers (Tier 1 environmental physics, Tier 2 constitutional law) have long freshness windows. Specify the computation formula. Specify the freshness grades (the précis uses FRESH/CURRENT/AGING/STALE; the grammar layer uses `watch`/`stale`/`critical` for sensing directives — reconcile or declare both as distinct grading systems for distinct purposes).

**Structural-change evaluation** — when a delta entry is created, evaluate it against the five structural-change criteria from ARTIFACT-GRAMMAR.md § 5.2 (new primitive, removed primitive, restructured composition, new manipulation path, restructured auth model). If the observation meets any criterion, generate a scaffold revision request in `SRR:` format per NAMING-AND-ADDRESSING.md § 5.6.

**Contradiction preservation** — from the précis: contradictions between entries are preserved as signal, not smoothed. Formalize: when a new entry contradicts an existing entry, the new entry is appended with a cross-reference to the contradicted entry. The contradiction is recorded, not resolved. Resolution happens through the structural track's editorial process when the contradiction generates a scaffold revision request.

Source: LIVE-LEDGER-ARCHITECTURE-PRECIS §§ 3, 4 (entry format, freshness decay). ARTIFACT-GRAMMAR.md §§ 2.7, 5.1, 5.2 (ledger class grammar, anchoring, structural-change criteria). NAMING-AND-ADDRESSING.md §§ 2.4, 5.4, 5.6 (entry and signal identifier formats). LAYER-LAW.md §§ 2–8 (per-tier ρ-regimes for threshold calibration).

### § 4. Compaction Protocol

Specify how aging entries are compacted to manage context and storage:

**Compaction trigger** — when compaction occurs. From the précis: context bloat is the trigger. Formalize: compaction is triggered when a domain ledger's total volume exceeds a declared context budget, or on a periodic cadence (calibrated to the domain's decay rate), whichever comes first. Compaction is a governed act, not automatic — a producer (human or agent) executes it.

**Compaction operation** — what compaction does. STALE entries are summarized into a compaction snapshot that preserves: the count of compacted entries, the date range they cover, the key patterns and structural observations they contained, and cross-references to the most significant individual entries. FRESH and CURRENT entries are preserved verbatim. AGING entries are preserved verbatim unless the context budget requires their inclusion in the snapshot.

**Compaction output** — a compaction snapshot is a ledger-class artifact (append-only, timestamped) that replaces the compacted entries in the working ledger. The compacted entries are archived (moved to a separate section or file) but remain retrievable for provenance. Per NAMING-AND-ADDRESSING.md § 4.3: compaction is a temporal-track process, not a compression-class artifact.

**Compaction constraints** — compaction must not destroy provenance (the original entries remain archived), must not resolve contradictions (contradictions that span the compacted range are preserved in the snapshot), and must not change entry identifiers (compacted entries retain their original `[DOMAIN-SLUG-NNN]` identifiers in the archive).

Source: LIVE-LEDGER-ARCHITECTURE-PRECIS §§ 8, 9 (context transitions, context-bloat failure mode). NAMING-AND-ADDRESSING.md § 4.3 (compaction/compression terminological boundary). ARTIFACT-GRAMMAR.md § 2.7 (append-only discipline).

### § 5. Sensing Directive Processing

Specify how the temporal track receives and processes sensing directives from the structural track:

**Directive reception** — sensing directives arrive in `SD:` format per NAMING-AND-ADDRESSING.md § 5.6, targeting a specific primitive identifier with a staleness grade (`watch`, `stale`, `critical`).

**Priority assignment** — directives are prioritized by staleness grade (critical > stale > watch) and by structural importance (primitives with more downstream dependencies are higher priority). Priority determines the order in which the sensing pipeline processes directives.

**Sensing dispatch** — how directives are converted into observation tasks. A sensing directive becomes an observation task assigned to the appropriate sensing agent or scheduled for manual observation. The task specifies: what primitive to observe, what domain ledger to write the observation to, what evidence quality is needed (at least the confidence level the directive targets), and what sources to consult.

**Directive completion** — a sensing directive is consumed when a delta entry is created that references the targeted primitive with an observation date more recent than the staleness threshold. The entry anchors to the primitive identifier, updating the scaffold's last-observed timestamp through the indexing spine.

Source: ARTIFACT-GRAMMAR.md § 5.3 (sensing directive semantics). NAMING-AND-ADDRESSING.md § 5.6 (sensing directive format). SCAFFOLD-GRAMMAR.md § 4.6 (staleness initialization and freshness thresholds). LIVE-LEDGER-ARCHITECTURE-PRECIS § 5 (sensing pipeline architecture).

### § 6. Failure Modes

Canonize the précis's failure modes (§ 9) that remain valid under the grammar layer, adapted to grammar-layer vocabulary:

The précis identifies nine failure modes. Each should be re-evaluated under the grammar layer: some are structurally prevented by the grammar (e.g., "snapshot mentality" is prevented by the append-only class grammar), some remain active risks (e.g., "feedback stays in conversation" is the bounded-context operating law's primary enemy), and some need reframing (e.g., "lineage as memory" maps to the pedigree lifecycle concept). Present each surviving failure mode with: what happens, how it manifests, how the grammar layer mitigates it, and what residual risk remains.

Source: LIVE-LEDGER-ARCHITECTURE-PRECIS § 9 (failure modes). ARTIFACT-GRAMMAR.md § 2.7 (class grammar as structural prevention). Root § 7 (bounded-context operating law).

## Anti-Patterns
- Do NOT restate ARTIFACT-GRAMMAR.md § 5's track interface contract — implement the temporal-track side of it
- Do NOT re-specify scaffold-side staleness logic (that is SCAFFOLD-GRAMMAR.md)
- Do NOT reproduce the Live Ledger Précis wholesale — canonize its structural findings under grammar-layer vocabulary
- Do NOT define the method engine's sensing procedures (that is METHOD-ENGINE.md)
- Do NOT assign specific agents to specific domains (that is operational configuration, not grammar)
- Do NOT define scaffold validation (that is SCAFFOLD-GRAMMAR.md)
- Do NOT use the précis's informal "compression" terminology for mid-session context management — use "compaction" per NAMING-AND-ADDRESSING.md § 4.3
- Do NOT apply the précis's fixed freshness thresholds (7/30/90 days) as universal law — specify tier-appropriate thresholds derived from ρ-regimes
- Do NOT overpromote ARCHITECTURE.md
- Do NOT use retired terminology

## Source Documents to Load
1. ARTIFACT-GRAMMAR.md §§ 2.7, 5 (ratified — ledger class grammar, track interface contract)
2. NAMING-AND-ADDRESSING.md §§ 2.4–2.6, 4.3, 5.4–5.6 (ratified — entry/domain/signal identifier formats, compaction/compression terminological boundary)
3. SCAFFOLD-GRAMMAR.md §§ 3, 4.6 (ratified — staleness markers, freshness thresholds on scaffold side)
4. LAYER-LAW.md §§ 2–8 (ratified — per-tier volatility regimes)
5. KNOWLEDGE-ARCHITECTURE-ROOT.md § 6 (ratified — three tracks, volatile deltas description)
6. LIVE-LEDGER-ARCHITECTURE-PRECIS (primary evidence — full document, sections 0–11)

## Validation Checks (post-draft)
- [ ] Domain architecture specifies: definition criteria, lifecycle, tier mapping, recommended initial set
- [ ] Entry lifecycle specifies: creation requirements, freshness computation with tier-appropriate thresholds, structural-change evaluation, contradiction preservation
- [ ] Compaction protocol specifies: trigger conditions, operation, output format, provenance constraints
- [ ] Sensing directive processing specifies: reception, priority, dispatch, completion
- [ ] Failure modes canonized from précis with grammar-layer mitigation analysis
- [ ] Freshness thresholds are tier-derived, not fixed (the précis's 7/30/90-day values are referenced as examples, not as law)
- [ ] Freshness grades and sensing-directive staleness grades are either reconciled into one system or explicitly declared as two distinct grading systems serving distinct purposes
- [ ] All identifier formats comply with NAMING-AND-ADDRESSING.md §§ 5.4–5.6
- [ ] The track interface contract (ARTIFACT-GRAMMAR.md § 5) is respected, not re-specified
- [ ] Scaffold-side staleness logic (SCAFFOLD-GRAMMAR.md) is respected, not re-specified
- [ ] The compaction/compression terminological boundary (NAMING-AND-ADDRESSING.md § 4.3) is respected
- [ ] Total length: 3000–5000 words (detailed enough for delta producers and compaction operators, not exhaustively procedural)

## Downstream Artifacts This Document Unlocks
METHOD-ENGINE.md uses this document's sensing-directive processing as input for the sensing-production method. READINESS-MATRIX.md uses this document's domain architecture and freshness computation to assess temporal-track coverage and health. All delta producers (sensing agents, session observers, opportunistic recorders) use this document as their structural specification.

## Drafter
Opus only. The freshness-threshold calibration, the compaction-protocol design, and the scaffold-revision-request generation logic involve non-delegable judgment about how the temporal track's internal rules interact with the track interface contract and the per-tier volatility regimes. Sonnet may assist with the failure-mode canonization (§ 6) under a tightly scoped sub-brief, since that section involves comparative analysis of the précis against the grammar layer rather than new architectural decisions.
