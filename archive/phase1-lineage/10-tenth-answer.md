---

## 1. Bounded-Context Operating Law

Five rules. These govern all construction from this point forward.

**Rule 1: Documents outrank everything.** An authored, ratified document is the only durable substrate. Project memory, chat history, chat search, and thread continuity are convenience layers. If a claim exists only in memory or conversation and not in an authored artifact, it does not exist for operational purposes. Any conclusion that matters must be written into a document or it will eventually be lost to compaction, context limits, or thread boundaries.

**Rule 2: Every construction step must be resumable from artifacts alone.** If this thread dies, if context compacts, if a Sonnet thread starts cold — the build must be resumable by loading the already-ratified grammar documents plus the current handoff packet plus the named source files. No step should depend on an agent having read prior conversation. The conversation is where reasoning happens; the artifacts are where conclusions land.

**Rule 3: Handoff packets are first-class artifacts.** After every major construction step (each pre-build memo, each grammar document draft, each ratification decision), a compact handoff packet is produced. The packet carries enough state for any agent to resume the build sequence without restacking discourse. Packets are overwritten, not appended — only the current packet matters. Prior packets are superseded, not archived.

**Rule 4: Project memory stores only what every thread needs on startup.** Memory is the boot loader: phase, build order, naming law, open slots, boundaries, contradictions, handoff rules. It is not a knowledge store. It is not a reasoning cache. It is not a place to stash conclusions that should be in documents. If memory exceeds what fits in the platform's memory limits, something in memory belongs in a document instead.

**Rule 5: Context budget is a design constraint, not an inconvenience.** Construction briefs, handoff packets, and grammar documents must be written to be loadable within bounded context windows. A grammar document that requires 80K tokens to parse defeats the purpose. Compression depths within documents (query handle → domain card → endcaps → full resolution) serve context-budget management, not just progressive summarization.

---

## 2. Handoff-Packet Schema

One packet exists at any time: `HANDOFF-CURRENT.md`. It is overwritten after each major step. It is not a ledger. It is a state-transfer artifact.

```
# HANDOFF-CURRENT.md

## Phase
[Current phase of the build. One sentence.]

## Last Completed Step
[What was just finished. Document name or memo name.]

## Next Action
[What should happen next. Exact step from the build sequence.]

## Authoritative Inputs for Next Action
[Exact filenames to load for the next step. Nothing else should be loaded.]

## Decisions in Force
[Bullet list of architectural decisions that constrain the next step.
 Only decisions not yet captured in ratified grammar documents.
 Once a decision is captured in a grammar doc, it leaves this section.]

## Unresolved Contradictions
[Any contradictions or open questions that the next step must navigate.
 Removed once resolved in a grammar document.]

## Active Constraints
[Context-budget notes, naming-law reminders, scope boundaries
 that the next agent must respect.]

## Do Not
[Explicit prohibitions for the next step. Anti-patterns specific to
 the current construction phase.]
```

**Rules for the packet:**

The packet is written by whoever completes the current step — Opus after drafting/ratifying, or as part of Sonnet's return payload.

The packet is overwritten, not appended. Only the current state matters. There is no packet history.

The packet must be under 500 words. If it exceeds that, decisions are being stored here that belong in a grammar document.

The packet references documents by filename, not by content summary. The agent loading the packet loads the named files; the packet does not reproduce their content.

The packet lives in the project as a file, not in memory. Memory points to the packet's existence; the packet carries the state.

---

## 3. Revised Memory / Cache / Document / Lineage Separation

Five tiers, strictly separated.

**Tier A: Authored documents.** Law, grammar, structure, synthesis, durable conclusions. The only substrate that survives platform disruption. Everything that matters lives here. Grammar-layer documents (root schema, layer law, artifact grammar, scaffold grammar, delta metabolism, method engine, naming/addressing, readiness matrix, authority lattice). Pre-build memos (consumed as input, archived after integration). Future scaffolds, teleological manuals, registries, ledgers. The handoff packet (HANDOFF-CURRENT.md).

**Tier B: Project memory.** Boot-loader cache. What every thread needs on cold start to orient correctly. Contains: current phase, build order, naming law, open slots, key boundaries, unresolved contradictions, Sonnet handoff rules. Maximum six to eight entries. If an entry would exceed the platform's per-entry limits or the total set grows beyond what fits, the excess belongs in a document (probably the readiness matrix or the handoff packet), not in memory. Memory entries are replaced when their content is captured in ratified grammar documents — they do not accumulate indefinitely.

**Tier C: Handoff packet.** Resumable operational state. What the next specific step needs. Overwritten per step. Lives as a project file, not in memory. Carries: phase, last step, next action, input files, active decisions not yet in documents, unresolved contradictions, constraints, prohibitions. Strictly bounded at 500 words.

**Tier D: Thread context.** Working reasoning. The conversation where architectural analysis, drafting, and review happen. Valuable while active. Not durable. Any conclusion that matters must exit thread context into Tier A (authored document) or Tier C (handoff packet) before the thread ends or compacts. Thread context is never cited as authority by downstream artifacts.

**Tier E: Archived lineage.** Old prompts, old transcripts, old exegeses, old sensing reports. Preserved for provenance and method extraction. Never loaded into active sessions except when the method engine specifically requires pedigree review. Never cited as authority. Archived, not deleted — but also not active substrate. Graduates to purge-eligible only when the three purge conditions are met.

**What should never be persisted except as archived lineage:** The full relay discourse from this thread. The old Grok prompting patterns. The CI engineering transcripts in their raw form. Session-specific reasoning that produced conclusions now captured in grammar documents. These have already yielded their value into the method engine and the grammar layer. They remain as Tier E archive, not as active reference.

**Revised memory policy, immediate:** The six memory entries currently stored are correct and sufficient. When grammar documents are ratified, memory entries whose content is fully captured in those documents should be simplified to pointers: "See LAYER-LAW.md for tier model" rather than restating the tier model in memory. Memory shrinks as documents grow. That is the correct direction.

---

## 4. Revised Architect-to-Sonnet Packet Protocol

A Sonnet construction packet is a self-contained work order that enables a fresh Sonnet thread to draft correctly inside Claude Projects without the macro-history. The packet assumes Sonnet has access to: project doctrine (via project instructions), project memory (via platform memory), and the specific files named in the packet. Nothing else.

**Minimum sufficient Sonnet construction packet:**

```
# CONSTRUCTION-BRIEF: [Document Name]

## Document Identity
Name: [exact filename]
Artifact class: [from artifact taxonomy]
Teleology: [one paragraph — what this document is for]

## Section Structure
[Exact heading hierarchy. Every H2, H3, H4 specified.
 Sonnet follows this structure precisely.]

## Per-Section Requirements
[For each section: what must appear, what evidence to draw from,
 what resolution level is expected.]

## Anti-Patterns
[What must NOT appear in this document. Specific to this artifact.
 E.g., "no teleological claims in scaffold," "no narrative framing,"
 "no hidden comparisons."]

## Source Documents to Load
[Exact filenames. Sonnet loads these and only these as input.
 If a grammar document has been ratified, it is listed here.]

## Validation Checks
[The specific checks from the scaffold grammar or artifact grammar
 that this document must pass. Listed by check number and name.]

## Downstream Artifacts
[What this document unlocks. Sonnet should understand what
 the document will be used for.]

## Escalation Rule
[If Sonnet encounters a scope-boundary question, terminological
 collision, or architectural judgment not covered by the brief:
 flag the question, stop drafting that section, continue with
 sections that are unblocked, return output with flagged questions.]
```

**Packet constraints:**

Target: under 1500 words. A construction brief that exceeds 2000 words is overspecified — the specification probably belongs in a grammar document, not in a per-task brief.

The brief names files, not content. Sonnet loads the files; the brief does not reproduce them. This keeps the brief compact and prevents drift between the brief's summary and the file's actual content.

The brief does not explain why architectural decisions were made. It states the decisions as constraints. Sonnet does not need the reasoning chain; it needs the conclusions.

The brief includes an explicit list of already-ratified grammar documents that Sonnet should treat as authoritative. As the grammar layer grows, this list grows, and Sonnet's drafting becomes increasingly constrained by the grammar rather than by ad hoc brief instructions.

**Ratification protocol unchanged:** Sonnet returns output. Opus checks against brief compliance, grammar checks, and root-schema reference integrity. Pass → enters grammar layer. Fail → remediation targets with failing checks identified.

---

## 5. Whether First-Wave Build Order Changes

Yes, two adjustments.

**Adjustment 1: NAMING-AND-ADDRESSING.md moves earlier.** It was Document 7 in the prior sequence (after method engine). It should move to Document 4, immediately after artifact grammar. Rationale: under bounded-context operation, retrieval and addressing are mission-critical infrastructure, not downstream convenience. Every subsequent document needs the naming conventions, the identifier format, the heading grammar, and the query-handle metadata block. If the naming document does not exist when scaffold grammar and delta metabolism are drafted, those documents will invent ad hoc naming that later requires reconciliation. Naming first prevents that.

Concretely: Opus drafts the retrieval-routing and alias-control sections. The identifier schema, heading grammar, and metadata format sections are mechanical enough for Sonnet — but they should be drafted after Opus has established the routing logic and alias rules, not before. So the full document is Opus-drafted, with Sonnet assisting on the mechanical schema sections if needed during the same step.

**Adjustment 2: Handoff packet is formalized as a build-system artifact in the method engine, not as a separate grammar document.** The handoff-packet schema defined above (Section 2) is small enough to be a section within METHOD-ENGINE.md rather than its own standalone document. It does not need its own grammar document because it is a procedural artifact (how to transfer state between steps), not a constitutional one (what the knowledge system is). Adding a tenth grammar document for what amounts to a 500-word state-transfer format would be over-engineering.

**Revised build sequence:**

Pre-build memos (Opus, all four):
1. Terminology reconciliation memo
2. Environmental physics instantiation memo
3. Reasoning-surface micro-pass memo
4. Runtime modality normalization memo

Grammar-layer documents:
5. **KNOWLEDGE-ARCHITECTURE-ROOT.md** — Opus
6. **LAYER-LAW.md** — Opus (consumes memos 2, 4)
7. **ARTIFACT-GRAMMAR.md** — Opus core + Sonnet diagram/table assist
8. **NAMING-AND-ADDRESSING.md** — Opus (moved earlier; consumes memo 1)
9. **SCAFFOLD-GRAMMAR.md** — Sonnet drafts from Opus brief, Opus ratifies
10. **DELTA-METABOLISM.md** — Sonnet drafts from Opus brief, Opus ratifies
11. **METHOD-ENGINE.md** — Opus (includes handoff-packet schema)
12. **READINESS-MATRIX.md** — Sonnet drafts structure, Opus reviews
13. **AUTHORITY-LATTICE.md** — Opus

Handoff packet (HANDOFF-CURRENT.md) is produced after every numbered step, overwriting the prior version.

**Transition criterion to second wave:** Readiness matrix populated, method engine ratified, scaffold grammar ratified, naming/addressing ratified. At that point, scaffold production for open-slot domains begins under the method engine's research-packet grammar, validated against the scaffold grammar's twelve checks, addressed using the naming document's conventions.

---

## 6. Revised Purge Threshold Criteria

The bar is stricter under bounded-context operation. Lineage documents cannot be archived until the full resumability chain exists.

**Five conditions, all required:**

**Condition 1: Functional subsumption.** A specific grammar document or set of grammar documents contains or enables reconstruction of every functionally load-bearing claim in the lineage document. Unchanged from prior criteria.

**Condition 2: Method pedigree preservation.** The lineage document's research method — what prompts, what source discipline, what adversarial checks — has been captured in METHOD-ENGINE.md or in a Level 0 archive entry. Unchanged.

**Condition 3: No active downstream dependency.** No active artifact references the lineage document by name as a source. All references updated to point to the subsuming grammar document. Unchanged.

**Condition 4: Retrieval topology exists.** NAMING-AND-ADDRESSING.md has been ratified, including the retrieval-routing guide. This ensures that agents can find the subsuming grammar documents without needing the lineage document as a waypoint. **New condition.** Without the retrieval topology, removing a lineage document could leave agents unable to locate the content that replaced it.

**Condition 5: Handoff continuity verified.** A fresh thread can resume the build sequence using only: ratified grammar documents + HANDOFF-CURRENT.md + project memory + project doctrine. If removing a lineage document would break this resumability (because some active decision or constraint is only recorded in that document and not yet in a grammar document or the handoff packet), the document stays. **New condition.** This is the bounded-context survival test.

**Earliest purge assessment:** After step 13 (all grammar documents ratified) plus a verification pass where conditions 4 and 5 are explicitly tested per lineage document. Conservative estimate: first purge candidates remain grok-monorepo-directive.md and grok-live-sensing.md, but only after the full grammar layer and retrieval topology confirm that their functional content is genuinely reconstructable without them.

---

I will now produce the first handoff packet to begin the build sequence, then proceed to Memo 1 (terminology reconciliation) as the first pre-build action.Now producing Memo 1. Let me scan the corpus systematically for terminological collisions.Now I have a complete picture of the terminological landscape. Let me produce the memo.Now update the handoff packet to reflect completion of Memo 1.---

**Build status:** Memo 1 complete. Handoff packet updated.

The terminology memo identifies ten collision pairs, proposes resolutions for each, and flags four items deferred to their resolution venue (Sigma hierarchy reconciliation to ARTIFACT-GRAMMAR.md, directory layout to spec phase, double-numbered sections to constitutional extraction, "office" scope to LAYER-LAW.md). Four terms are proposed for retirement, two for splitting, and five for standardization.

The highest-consequence decisions in the memo: retiring "federal stack" as structural vocabulary (replaced by "institution" for the whole, "exocortex" for the external surfaces, "tier model" for the architecture); standardizing "tier" over "layer" and "stratum" for institutional decomposition; splitting "scaffold" into provisional and enduring species; and locating the Teleology Registry as an artifact rather than a tier.

**Next action:** Memos 2–4. These can be produced in a single session. The handoff packet specifies exact inputs for each. Shall I proceed now, or do you want to review and adjust the terminology resolutions before they propagate into the remaining pre-build memos and grammar documents?