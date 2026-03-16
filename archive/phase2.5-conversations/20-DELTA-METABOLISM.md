# DELTA-METABOLISM.md

**Class:** Specification  
**Domain:** Temporal track internal rules  
**Upstream:** ARTIFACT-GRAMMAR.md §§ 2.7, 5; NAMING-AND-ADDRESSING.md §§ 2.4–2.6, 4.3, 5.4–5.6; SCAFFOLD-GRAMMAR.md §§ 3, 4.6; LAYER-LAW.md §§ 2–8  
**Downstream:** METHOD-ENGINE.md, READINESS-MATRIX.md, all delta producers  
**Last updated:** 2026-03-13  

---

## § 1. Governing Principles

The temporal track absorbs institutional volatility so the structural track does not have to. Model capabilities shift weekly, pricing changes monthly, harness configurations evolve biweekly, and community consensus on prompting inverts quarterly. If this volatility were absorbed directly into scaffolds, the structural track would be under permanent revision and its stability — the property that makes it useful as a synthesis substrate — would collapse. The temporal track exists to carry current-state observations in a governed, timestamped, append-only format that keeps the institution's awareness fresh without destabilizing its durable knowledge.

The delta metabolism specifies the rules governing this track: how domains are defined (§ 2), how delta entries are created and lifecycle-managed (§ 3), how compaction prevents unbounded growth without destroying provenance (§ 4), how sensing directives from the structural track are received and processed (§ 5), and how the track's known failure modes are mitigated (§ 6). These rules operate within constraints already established by the grammar layer: ledger-class artifacts are append-only and sequentially identified (ARTIFACT-GRAMMAR.md § 2.7), the track interface contract defines the typed signals crossing the track boundary (ARTIFACT-GRAMMAR.md § 5), identifier formats are fixed (NAMING-AND-ADDRESSING.md §§ 2.4–2.6), and per-tier volatility regimes determine freshness calibration (LAYER-LAW.md §§ 2–8).

One foundational constraint governs everything that follows: the temporal track observes and records. It does not judge, harmonize, or resolve. Contradictions between observations are preserved as signal. Resolution is a structural-track operation — it happens through scaffold revision, not through delta editing. The temporal track's integrity depends on this separation.

---

## § 2. Domain Architecture

### 2.1 Domain Definition Criteria

A domain organizes delta observations around a subject that changes over time. A valid domain satisfies three criteria, all of which must hold:

The subject **changes.** Static knowledge does not need a ledger — it needs a reference document or a scaffold. If the subject has not changed in the period covered by the tier's freshness window, the domain is either unnecessary or miscalibrated.

The changes **matter to institutional decisions.** Tracking change for its own sake is surveillance, not intelligence. Every domain must be traceable to at least one downstream decision, artifact, or operational concern that consults the domain's observations.

The subject **changes independently** of other tracked domains. If two subjects always co-vary — their observations are produced by the same events and consumed by the same decisions — they are one domain, not two. Independent variation is the structural justification for domain separation.

### 2.2 Domain Lifecycle

**Creation.** A new domain is created by declaring a domain identifier per NAMING-AND-ADDRESSING.md § 2.5 (`UPPER-KEBAB-CASE`, institution-wide unique), creating a ledger file, and recording the creation in the domain's header metadata: domain identifier, tier mapping (§ 2.3), freshness window (§ 3.2), scope declaration (what the domain tracks), and creation date. The first entry in the ledger is the domain's inaugural observation.

**Splitting.** When a domain contains two subjects that have begun changing independently, the domain is split. The original domain identifier becomes an alias resolving to both successor domains per NAMING-AND-ADDRESSING.md § 3.4. The original ledger transitions to pedigree status. Entries from the original ledger are not copied to the successors — the successors start fresh, and the original remains as the historical record. Cross-references from successor ledgers to the predecessor are mandatory.

**Retirement.** When a domain ceases to change or ceases to matter, the ledger transitions to pedigree lifecycle status. The domain identifier is preserved (identifiers are permanent). The ledger remains retrievable for provenance but no longer receives new entries or generates sensing directives.

### 2.3 Tier Mapping and Freshness Inheritance

Every domain is mapped to a tier from LAYER-LAW.md. The mapping is declared in the domain's header metadata and determines the domain's freshness calibration. A domain may map to a tier directly (e.g., a domain tracking model capabilities maps to Tier 4) or to an orthogonal concern (e.g., a domain tracking auth-boundary changes maps to the trust/auth concern). The mapping is many-to-one: multiple domains may map to the same tier.

The tier's ρ-regime determines the freshness-window class:

**High-ρ tiers** (Tier 4 execution surfaces for volatile modality classes, Tier 5 coordination) — short freshness windows. Default calibration: FRESH < 7 days, CURRENT < 21 days, AGING < 60 days, STALE ≥ 60 days. Appropriate for domains where assumptions invalidate monthly or faster.

**Moderate-ρ tiers** (Tier 3 typed middle layer, Tier 4 for stable modality classes, Tier 7 projection) — medium freshness windows. Default calibration: FRESH < 14 days, CURRENT < 45 days, AGING < 120 days, STALE ≥ 120 days.

**Low-ρ tiers** (Tier 1 environmental physics, Tier 2 constitutional law) — long freshness windows. Default calibration: FRESH < 30 days, CURRENT < 90 days, AGING < 270 days, STALE ≥ 270 days. Appropriate for domains where the underlying subject changes slowly if at all.

These default calibrations are initial values derived from operational experience documented in the Live Ledger Architecture Précis. They are subject to operational adjustment: if a domain's observations consistently stale faster or slower than the default calibration predicts, the freshness window is recalibrated in the domain's header. Recalibration is an editorial act recorded in the ledger.

---

## § 3. Entry Lifecycle

### 3.1 Entry Creation

A well-formed delta entry contains, at minimum:

**Entry identifier** in `[DOMAIN-SLUG-NNN]` format per NAMING-AND-ADDRESSING.md § 2.4. Sequential within the domain, zero-padded, append-only — once assigned, never reused.

**Observation date** in `YYYY-MM-DD` format. The date the observation was made, not the date the entry was written (these differ when observations are recorded retroactively from session notes or research).

**Source attribution.** A specific, verifiable source — a URL, a document identifier, a changelog reference, a direct observation note with context. "I read somewhere" is not a source.

**Confidence level.** One of four grades: HIGH (independently verifiable, multiple confirming sources), MEDIUM (single credible source, not yet independently verified), LOW (indirect evidence, reasonable but unconfirmed), SPECULATIVE (hypothesis or extrapolation from limited evidence). Honest confidence is a structural requirement. Overconfident entries suppress further sensing by making stale knowledge appear settled.

**Anchor reference.** At least one primitive identifier (`[surface-slug:primitive-name]`) or domain identifier that connects the observation to the structural track's scope map, per ARTIFACT-GRAMMAR.md § 5.1. An entry may carry multiple anchor references if it observes multiple primitives. An entry without any anchor reference is valid as Level 0 intake but cannot trigger scaffold revision requests until anchored.

**Observation content.** The observation itself — what changed, what was observed, what is new. Factual and specific. Two to five sentences is typical; longer entries are acceptable for complex observations.

Optional fields that strengthen an entry: implications (what the observation means for institutional decisions), cross-references (related entry identifiers or artifact references), and tags (domain-specific classification markers).

### 3.2 Freshness Computation

Freshness is computed, not assigned. Two distinct grading systems serve distinct purposes:

**Entry-level freshness** answers: how old is this observation? Computed from the gap between the entry's observation date and the current date, evaluated against the domain's freshness window (§ 2.3). Four grades: FRESH (within the first freshness-window segment), CURRENT (within the second), AGING (within the third), STALE (beyond the third). Any reader or tool can compute an entry's freshness from the observation date and the domain's declared window. Freshness grades are not stored in the entry — they are derived at read time from the observation date and the current date, ensuring they never become stale themselves.

**Sensing-directive staleness** answers: how urgently does a scaffold primitive need re-observation? Computed from the gap between a primitive's last-observed timestamp (the most recent delta entry anchored to that primitive) and the current date, evaluated against the tier's freshness threshold. Three grades: `watch` (approaching threshold — the primitive's freshest entry is AGING), `stale` (threshold exceeded — the freshest entry is STALE), `critical` (threshold exceeded by more than 2× the freshness window — the primitive has been unobserved for an extended period). These grades are computed by the structural track and appear in sensing directives per NAMING-AND-ADDRESSING.md § 5.6.

The two systems meet at the threshold: when a primitive's freshest anchored entry crosses from CURRENT to AGING (entry-level), the structural track evaluates whether to generate a sensing directive at `watch` grade (directive-level). The entry-level system feeds the directive-level system, but they serve different consumers and carry different vocabularies.

### 3.3 Structural-Change Evaluation

When a delta entry is created, its observation is evaluated against the five structural-change criteria from ARTIFACT-GRAMMAR.md § 5.2:

Does the observation report a **new primitive** — a previously undocumented capability, config surface, or object type? Does it report a **removed primitive** — something previously documented that is no longer present? Does it report **restructured composition** — changed relationships between existing primitives? Does it report a **new manipulation path** — a new way of interacting with an existing primitive? Does it report a **restructured auth model** — changed trust, permission, or identity structures?

If the observation meets any criterion, the entry producer generates a scaffold revision request in `SRR:{delta-entry-id}→{artifact-id}:{change-category}` format per NAMING-AND-ADDRESSING.md § 5.6. The revision request enters the structural track's editorial queue. The temporal track's responsibility ends at generation — it does not determine whether or when the scaffold is actually revised. That is the structural track's editorial judgment.

Not every delta entry triggers a structural-change evaluation. Entries that report current-state observations about known primitives (pricing updates for a documented pricing model, benchmark shifts for a documented capability) update the temporal record without signaling structural change. The evaluation triggers only when the observation suggests the scaffold's primitive inventory or composition is outdated.

### 3.4 Contradiction Preservation

A delta entry that contradicts a prior entry is appended as a new entry with a mandatory cross-reference to the contradicted entry. The temporal track never resolves contradictions — it preserves them as signal. The cross-reference uses the delta entry identifier format: the new entry's metadata includes a `Contradicts: [DOMAIN-SLUG-NNN]` field pointing to the contradicted entry.

Contradictions are structurally significant. A domain with accumulating contradictions is a domain in flux — the underlying reality is shifting, and the scaffold may be stale. When contradicting observations meet the structural-change criteria (§ 3.3), they generate scaffold revision requests. When they do not meet structural-change criteria (e.g., two sources disagree about the current default configuration value), they remain in the ledger as competing observations, with the structural track free to consult both when it next revises the scaffold.

The prohibition on resolution is absolute within the temporal track. No entry is edited to harmonize with a later observation. No entry is deleted because a subsequent entry supersedes it. No entry's confidence level is retroactively downgraded because a contradicting entry arrived. The temporal track is an append-only record of what was observed; the structural track is where observations become knowledge.

---

## § 4. Compaction Protocol

### 4.1 Compaction Trigger

Compaction is triggered by either of two conditions:

**Volume trigger.** The domain ledger's total entry count or character volume exceeds a declared context budget. The budget is domain-specific, calibrated to the context-loading constraints of the consumers that ingest the ledger (agent context windows, human scanning capacity). A reasonable initial default: 80–120 entries per domain ledger before compaction. Domains with higher consumption frequency may need lower thresholds.

**Cadence trigger.** A periodic compaction cadence, calibrated to the domain's decay rate. High-ρ domains: compact every 2–4 weeks. Moderate-ρ domains: compact every 6–10 weeks. Low-ρ domains: compact every 3–6 months. The cadence is declared in the domain's header.

Whichever trigger fires first initiates compaction. Compaction is a governed act executed by a producer (human or agent), not an automatic background process. The decision to compact is recorded in the ledger.

### 4.2 Compaction Operation

Compaction separates the domain ledger's entries into three retention tiers:

**Preserved verbatim.** FRESH and CURRENT entries remain in the working ledger without modification. These are the active observations that consumers need in full detail.

**Preserved verbatim with review.** AGING entries are retained in the working ledger unless the volume trigger requires their inclusion in the compaction snapshot. If retained, they remain unmodified. If compacted, they follow the STALE-entry treatment below.

**Summarized into compaction snapshot.** STALE entries are summarized into a compaction snapshot — a single entry that replaces the compacted entries in the working ledger. The snapshot is a ledger-class entry (timestamped, identified, append-only) with entry identifier `[DOMAIN-SLUG-C{NNN}]` where `C` prefix denotes a compaction entry. The snapshot contains: the date range of compacted entries, the count of compacted entries, the key observations and structural patterns that emerged from the compacted period, cross-references to the most significant individual entries (by entry identifier), and any unresolved contradictions that spanned the compacted range.

### 4.3 Provenance Preservation

Compaction is lossy for detail but lossless for provenance. The original entries that were compacted are archived — moved to a separate `## Archive` section at the bottom of the ledger file, or to a companion archive file named `{DOMAIN-SLUG}-ARCHIVE.md`. Archived entries retain their original identifiers, timestamps, and content. They are no longer loaded as active context but remain retrievable for provenance queries, auditing, or re-analysis.

The compaction snapshot carries enough information to trace any claim back to the underlying evidence: the cross-references to significant entries point into the archive. A reader who needs the full detail of a compacted period can follow the cross-references. Compaction never destroys the evidential trail — it compresses the active view while preserving the complete record.

### 4.4 Compaction Constraints

Compaction must not resolve contradictions. If two entries within the compacted range contradicted each other, both observations are noted in the compaction snapshot with their original cross-reference. The snapshot does not determine which entry was correct.

Compaction must not change entry identifiers. Compacted entries retain their original `[DOMAIN-SLUG-NNN]` identifiers in the archive. The compaction snapshot receives a new identifier (`[DOMAIN-SLUG-C{NNN}]`) that does not collide with the original sequence.

Compaction must not alter the append-only discipline. The compaction snapshot is appended to the working ledger at the position where the compacted entries were. The archive section grows monotonically. Neither the working ledger nor the archive is ever retroactively edited during compaction.

---

## § 5. Sensing-Directive Processing

### 5.1 Directive Reception

Sensing directives arrive from the structural track in `SD:{surface-slug}:{primitive-name}:{staleness-grade}` format per NAMING-AND-ADDRESSING.md § 5.6. Each directive targets a specific scaffold primitive and carries a staleness grade (`watch`, `stale`, or `critical`).

The temporal track receives directives into an observation queue. The queue is not a ledger — it is a transient processing buffer. Directives are consumed when fulfilled and do not persist as institutional records.

### 5.2 Priority Assignment

Directives are prioritized along two axes:

**Staleness severity.** `critical` > `stale` > `watch`. A primitive unobserved for more than 2× its freshness window takes priority over one approaching the threshold.

**Structural importance.** Primitives with more downstream dependencies (feeding more specifications, compressions, or registry rows) take priority over structurally isolated primitives. Structural importance is assessed from the scaffold's downstream-consumer declarations (SCAFFOLD-GRAMMAR.md Check 11), not from ad hoc judgment.

The combined priority determines processing order. Within the same priority tier, directives are processed in the order received.

### 5.3 Sensing Dispatch

A sensing directive becomes an observation task. The task specifies: what primitive to observe (from the directive's primitive identifier), which domain ledger to record the observation in (from the domain-to-tier mapping that covers the primitive's surface), what evidence quality is needed (minimum confidence level proportional to the staleness grade: `watch` → at least LOW, `stale` → at least MEDIUM, `critical` → at least HIGH), and what sources to consult (primary documentation, operational observation, or vendor channels appropriate to the primitive's domain).

Task execution is operational — the delta metabolism specifies what the task must produce, not who performs it or how. The method engine (METHOD-ENGINE.md) will specify the reusable sensing procedures. Teleological manuals will assign sensing responsibilities to specific agents or operators.

### 5.4 Directive Completion

A sensing directive is completed — and removed from the observation queue — when a delta entry is created that satisfies three conditions: (a) the entry's anchor reference includes the targeted primitive identifier, (b) the entry's observation date is more recent than the primitive's prior last-observed timestamp, and (c) the entry's confidence level meets or exceeds the minimum for the directive's staleness grade. On completion, the scaffold's last-observed timestamp for that primitive updates through the indexing spine, and the staleness computation resets.

If a sensing task is dispatched but produces no observation (the primitive could not be re-observed — the surface is unavailable, the documentation is inaccessible, the capability cannot be verified), the task records this as a null observation entry in the domain ledger: `[DOMAIN-SLUG-NNN]` with observation content noting the inability to observe and confidence level SPECULATIVE. The null observation does not reset the staleness computation — the primitive remains stale until a substantive observation is recorded. The directive remains in the queue at the same or elevated priority.

---

## § 6. Failure Modes

The Live Ledger Architecture Précis (§ 9) documents nine failure modes encountered in operational use. Under the grammar layer, some are structurally mitigated, some remain active risks, and some are reframed. Each surviving failure mode is presented with its mechanism, grammar-layer mitigation, and residual risk.

**Feedback stays in conversation.** The most damaging failure: observations made during a session are never recorded as delta entries. The bounded-context operating law (root § 7) is the structural mitigation — "any conclusion that matters must exit thread context into an authored document." The residual risk is behavioral, not structural: the grammar provides the slot for the observation, but the producer must fill it. No grammar can force recording.

**Overconfident entries.** HIGH confidence assigned to speculative observations suppresses further sensing by making stale knowledge appear settled. Grammar-layer mitigation: the four-tier confidence system (HIGH/MEDIUM/LOW/SPECULATIVE) makes honest labeling structurally available. The staleness computation ignores confidence — a HIGH-confidence entry ages at the same rate as a SPECULATIVE one, so overconfidence cannot prevent sensing-directive generation. Residual risk: confidence labels are producer-assigned and cannot be validated without domain expertise.

**Source amnesia.** Entries without specific sources become unverifiable folklore. Grammar-layer mitigation: source attribution is a mandatory field in entry creation (§ 3.1). The scaffold grammar's Check 7 (source attribution) will propagate through to any scaffold built from ledger evidence. Residual risk: enforcement depends on producers respecting the mandatory field.

**Domain creep.** Domains multiply beyond what sensing capacity can feed, producing empty ledgers everywhere. Grammar-layer mitigation: the three definition criteria (§ 2.1) require that every domain be justified by change, decision-relevance, and independence. Residual risk: it remains easier to create a domain than to maintain one. The readiness matrix (READINESS-MATRIX.md) will track domain health as part of its temporal-track coverage assessment.

**Context bloat.** Accumulation exceeds usable context. Grammar-layer mitigation: the compaction protocol (§ 4) with volume and cadence triggers. Residual risk: compaction must be actually executed. Untriggered compaction is a variant of the "feedback stays in conversation" failure — the mechanism exists but the behavior doesn't happen.

**Contradiction smoothing.** A producer edits or removes a prior entry because a newer observation contradicts it, destroying the signal. Grammar-layer mitigation: the append-only class grammar (ARTIFACT-GRAMMAR.md § 2.7) and the explicit contradiction-preservation rule (§ 3.4) make smoothing a structural violation, not merely a bad practice. Residual risk: structural violations are possible in any system that allows text editing. Git history provides a recovery path.

**Means-ends inversion.** The ledger system becomes the product instead of serving institutional decisions. Grammar-layer mitigation: the domain definition criteria require decision-relevance (§ 2.1). If no decision consults a domain, the domain fails its own definition criteria and should be retired. Residual risk: this failure mode is cultural, not structural. The grammar can specify the criteria; it cannot enforce the orientation.

**Stale sensing infrastructure.** Sensing stops running and no one notices. Ledgers go stale silently. Grammar-layer mitigation: the sensing-directive mechanism (§ 5) makes staleness visible — scaffold primitives whose freshness thresholds are exceeded generate directives that accumulate in the observation queue. An observation queue with growing `critical`-grade directives is the structural alarm. Residual risk: the alarm must be monitored. If no one checks the observation queue, the directives accumulate without effect.

---

*Assessment as of 2026-03-13: all sections drafted. Pending operator review and ratification. The freshness-grade resolution (§ 3.2 — two distinct systems explicitly declared) and the compaction protocol (§ 4) are the highest-stakes sections for operational use. The tier-derived freshness calibration (§ 2.3) replaces the précis's fixed thresholds with a ρ-regime-based derivation that preserves the précis's values as defaults for high-ρ domains while extending to the full tier range. Signal identifier syntax remains provisional-but-operational — no revision was required during drafting.*
