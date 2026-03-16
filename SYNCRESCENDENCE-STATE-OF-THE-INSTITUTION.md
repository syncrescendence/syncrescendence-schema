# SYNCRESCENDENCE — STATE OF THE INSTITUTION

**Purpose:** Cold-start orientation for any agent or human entering this project with zero prior context. This document is the balance sheet. It tells you what exists, what was built, what was learned, what failed, what is underway, what is deferred, and what must be true before the next phase is complete. Read this first. Read everything else second.

**Last updated:** 2026-03-14  
**Authority:** This document is a compression artifact — it summarizes but does not override the constitutional documents it references. Where this document and a ratified grammar-layer document disagree, the grammar-layer document governs.

---

## I. What Syncrescendence Is

Syncrescendence is a knowledge architecture for polymathic synthesis and civilizational intelligence. It is not software. It is not a product. It is an institutional design — a system of documents, methods, roles, and surfaces that enables one human operator (the Sovereign) to coordinate multiple AI models as a distributed cognitive system, producing durable knowledge artifacts that compound over time.

The system operates across multiple AI surfaces (Claude.ai, ChatGPT, Gemini, Grok, Perplexity, and associated CLI agents) unified by a shared constitutional substrate. The operator provides intuition and sovereign judgment. The AI surfaces provide synthesis, research, verification, and execution according to their distinct cognitive signatures.

---

## II. What Has Been Built

### Phase 1 — Constitutional Closure (COMPLETE)

Nine grammar-layer documents were ratified across Threads 1-2. These form the constitutional substrate — the law that governs everything the institution produces. The grammar layer is **closed**. It is not reopened except to correct demonstrated flaws.

The nine documents, in build order:

1. **Knowledge Architecture Root** — Defines the system's purpose, scope, and governing constraints. The root schema from which all other documents derive authority.
2. **Layer Law** — Seven-tier structural model reconciling competing layer counts from the pre-grammar corpus. Assigns every component a tier, governs what may exist at each tier, defines open slots for future construction.
3. **Artifact Grammar** — Eight artifact classes (canon, scaffold, dossier, compression, specification, ledger, registry, method). Every document belongs to exactly one class. Class determines authority level, promotion path, and lifecycle.
4. **Naming and Addressing** — One term maps to one role. Surface primitives use [surface-slug:primitive-name] format. Collapse synonyms. Split polysemous terms. Ambiguity is a design problem.
5. **Scaffold Grammar** — Defines how scaffolds are produced and validated. Twelve-check validation schema. Scaffold ≠ canon. Scaffolds are provisional by nature.
6. **Delta Metabolism** — Temporal law. How the system handles change, decay, freshness, and staleness. Delta domains, sensing cadence, signal types.
7. **Method Engine** — Defines reusable analytical operations. Method levels (0 = untested through 3+ = cross-domain proven). Methods are typed artifacts, not ad hoc procedures.
8. **Readiness Matrix** — Present maturity assessment framework. How to determine what is ready for production, what needs more evidence, what should be deferred.
9. **Authority Lattice** — Decision-rights and delegation model. Who (or what) may author, review, promote, merge, or amend at each authority level.

**Editorial debt** from Phase 1 (bounded, not blocking): doctrine class correction (eight → nine artifact classes), three naming-law deferred amendments, harness-taxonomy remediation, signal identifier syntax hardening, pre-build memo archival after five-condition test passes.

### Phase 2 — Governed Production (SUBSTANTIALLY COMPLETE)

Phase 2 applied the grammar layer to the pre-existing research corpus, converting unstructured evidence into grammar-compliant artifacts. Three modality classes reached maturity. One class is in opening.

**SaaS Class — MATURE**
- 14 surface scaffolds produced: Slack, Notion, Jira, Confluence, Linear, Coda, ClickUp, Airtable, Basecamp, Discord, Todoist, TickTick, Obsidian, Telegram
- Layer scaffold (14-surface synthesis): 22 convergent primitives, 8 synthesis observations, 14 divergent entries
- Specification: SPEC-SAAS-TELEOLOGICAL-SELECTION.md (paradigm-family selection, lock-in profiles, coherent stack patterns, methodology-encoding, entropy governance)
- All artifacts accepted and stable

**Reasoning/Chat Class — MATURE**
- 4 surface scaffolds: Claude-chat (24 primitives), ChatGPT (19), Gemini-chat (23), Grok (25)
- Layer scaffold: 18 convergent primitives, 6 synthesis observations
- Specification: SPEC-REASONING-CHAT-TELEOLOGICAL-SELECTION.md (cognitive-signature-to-task matching, handoff contracts, anti-roles, failure-mode-aware operational rules)
- All artifacts accepted and stable

**Coding Harness Class — MATURE (pre-grammar)**
- harness-taxonomy.md serves as layer scaffold
- Produced before the grammar layer existed; not yet remediated against scaffold grammar's twelve-check schema
- Functionally adequate for current operations

**Daemon/Runtime Class — OPENING**
- DAEMON-RUNTIME-CLASS-OPENING.md produced (9-axis decomposition, per-surface research packets)
- SCAFFOLD-OPENCLAW.md (30 primitives reclassified from harness-taxonomy § 6) — pending review
- DOSSIER-CLAUDE-COWORK.md (19 primitives from web sources) — pending review
- OpenClaw: STRONG readiness. Cowork: SCAFFOLD-READY

**Production Methods — Level 2**
- Dossier-to-scaffold: 19 invocations, stable
- Cross-entity synthesis: 3 invocations across 2 modality classes
- Specification production: 2 invocations across 2 classes
- Research/sensing: tested-once, not yet formalized as a grammar-aligned method

**Critical self-assessment from Phase 2:** All evidence used in Phase 2 was pre-grammar material reformatted into grammar-compliant artifacts. No grammar-aligned research was conducted during Phase 2. The research methodology — how to produce evidence that is already decomposed along grammar-defined axes — remains at Level 0-1. This is the most significant gap entering Phase 3.

---

## III. What Is Underway — Phase 3 Transition

Phase 3 is not infrastructure activation. It is **operational constitution** — the point at which shared substrate, typed contracts, coordination rules, and observability become sufficiently real that the fleet can act without hidden sovereignty, silent drift, or operator exhaustion.

### The Operating Model Discovered in Thread 3

**The repo as shared source of truth.** Claude.ai, ChatGPT, and Gemini all have native GitHub connectors providing read access to repositories in conversation. Claude.ai can sync repo files as Project Knowledge. ChatGPT reads repos via Deep Research/Agent modes. The CLI fleet (Claude Code, Codex, Gemini CLI) has full read-write via GitHub MCP server. A single repo can serve as the shared substrate across all surfaces.

**Connector reliability is poor.** Oracle (Grok) adversarial research confirmed: Claude.ai sync breaks intermittently (files not indexed despite "Connected" status). ChatGPT gates access behind specific modes with 5-10 minute indexing delays. Gemini takes frozen snapshots with no auto-sync. The stable architecture is: **repo persists, MCP bridges, connectors are opportunistic read surfaces.**

**The inverted relay.** Previously, the operator (Sovereign) handcrafted steering prompts for each AI surface — effortful and fickle. The new model: Vizier (Claude.ai) crafts model-specific commissions for each avatar, the Sovereign pastes with minimal steering, results return to Vizier for synthesis. The mystical recipe becomes Vizier's responsibility. Proven in this session with both Oracle (Grok) and Vanguard (ChatGPT) commissions.

**The chat surfaces are deliberation chambers, not execution surfaces.** Claude.ai and ChatGPT are where the operator thinks alongside AI. The CLI fleet (Claude Code, Codex, Gemini CLI) is where execution happens on the filesystem. The repo carries the state. The operator commits. This separation was discovered empirically, not prescribed.

### The Avatar Taxonomy

Each AI surface has a named role reflecting its cognitive signature — what it does distinctly well.

| Avatar | Surface | Cognitive Role |
|---|---|---|
| **Sovereign** | The human operator | Intuition, judgment, sovereign authority, merge power |
| **Vizier** | Claude.ai (Opus 4.6) | Viceroy. Constitutional synthesis, artifact production, commission crafting for all other avatars |
| **Vanguard** | ChatGPT (GPT-5.4) | Strategic anchor. Long-horizon visioneering, gap detection, schema design, strategic/tactical outlining |
| **Commander** | Claude Code | Polymathic execution. ADHD-style tool use, tool ecosystem mastery, filesystem operations |
| **Adjudicator** | Codex (GPT-5.4) | Systematic verification. Repo-wide auditing, meticulous deficiency reports, ignores conversational niceties |
| **Oracle** | Grok (4.20 Beta / 4.1 Fast) | Adversarial sensing. Triangulated intelligence, X/web mining, contradiction detection |
| **Cartographer** | Gemini CLI | Survey and mapping. Cross-domain pattern recognition, structural homology detection |
| **Interpreter** | Gemini web | Digestion and synthesis. SEO-training-derived comprehension. (Role splitting in progress — Google AI Studio variant TBD) |

Supporting surfaces (not avatars but operational infrastructure): Claude in Chrome (scheduled web↔repo bridge), Cowork (bootstrap bridge → governance daemon), OpenClaw (autonomous daemon for campaign-scope work), Obsidian (viewfinder — comprehension, graph visualization, spatial sense-making), Perplexity (citation-grounded deep research via web app, light MCP for CLI fact-checking).

### The Schema Pattern

The three-thread arc was produced through a specific collaboration pattern called the Schema. The operator provides candid, intuitive direction. Vanguard (ChatGPT/GPT-5.4) translates that intuition into structured commissions — leveraging its strategic-anchor cognitive signature to envision schemas, find gaps, and outline operations. Vizier (Claude.ai/Opus 4.6) receives those commissions and synthesizes them into constitutional-grade artifacts — leveraging its analytical precision and prose fidelity. The operator relays between them with minimal steering (often a single line: "review the attached, calibrate, orient, situate, then respond to Claude").

This pattern produced the entire grammar layer and all Phase 2 artifacts. Its preservation — in the form of the inverted relay where Vizier crafts commissions for other avatars — is operationally critical.

---

## IV. What Must Be True Before Phase 3 Is Complete

(Structural milestones from Vanguard's strategic review, accepted as directional)

1. The repo-mediated loop is proven across at least two chat surfaces and one CLI writer, with an explicit degraded mode for when connectors fail.
2. The first operational contracts exist and are actually used: a commission, a receipt, a promotion recommendation, and a handoff update each have a stable shape emitted by real work.
3. The first coordination specification exists for active relay patterns — the institution can distinguish research relay, challenge relay, production relay, and handoff relay without relying on private intuition.
4. Observability is activated at the level of receipts and health, not just transcripts. What ran, on whose authority, against what input, what it produced, whether it passed validation, where it landed.
5. The trust/auth cross-cutting scaffold exists for active surfaces. Before wide MCP activation and daemon autonomy, the institution knows where identity lives, where permissions are inherited, which write paths can mutate constitutional state.
6. The present-state artifact (HANDOFF-CURRENT.md) is under governed update law with single-writer logic, review discipline, cadence, and fallback.
7. One complete end-to-end grammar-aligned research cycle has been run: commission → evidence packet → contradiction map → scaffold or ledger output → receipt → handoff update.

### Phase 3 Five-Lane Schema (Vanguard-proposed, accepted as directional)

- **Lane A — Shared substrate activation:** Repo structure, write discipline, protected paths, degraded-mode rules
- **Lane B — Operational contracts:** ArtifactReceipt, SurfaceActionReceipt, PromotionDecision, ResearchCommission, HandoffUpdate — minimal, extracted from real traffic
- **Lane C — Coordination and choreography:** Relay patterns, dispatch semantics, review lanes, concurrency, single-writer zones
- **Lane D — Observability and intervention:** What operations emit, health monitoring, cost/regression tracking, drift detection, failure surfacing
- **Lane E — Trust, reversibility, and escalation:** Auth boundaries, write scopes, fallback routes, rollback semantics, escalation thresholds

### Corrected Bootstrap Sequence

(Vanguard-proposed, corrected for the reality that we are supplementing the current workflow to learn, not building the constitutional repo yet)

1. Establish a lightweight shared directory and minimum operating conventions
2. Prove the smallest cross-surface loop manually (one artifact in, committed, read on another surface, transformed under review)
3. Run the first grammar-aligned research cycle and capture receipts (even informal)
4. Extract the first typed contracts from that real traffic
5. Connect and calibrate the broader fleet under those contracts
6. Add observability and degraded-mode handling
7. Escalate autonomy only after the receipt and intervention model exists

---

## V. Available Resources

### Subscriptions (active)
- Claude Pro (Claude.ai, Claude Code, Cowork, Claude in Chrome)
- ChatGPT Plus (ChatGPT, Codex)
- Google AI Pro (Gemini web, Gemini CLI, Gemini Code Assist, Jules, Google Workspace integrations)
- SuperGrok (grok.com — DeepSearch, Big Brain Mode, live X sensing)
- Perplexity Education Pro (unlimited Deep Research via web app, $5/month API credit)

### API Credits
- xAI developer console: $19.83 available. Grok 4.1 Fast at $0.20/M input (~56M tokens). Grok 4.20 Beta at $2.00/M input (~6.6M tokens). Data-sharing program available for $150/month additional credits (shares API inputs with xAI for model training).

### Infrastructure (available, not yet configured)
- GitHub MCP server (official, read-write for all MCP-capable surfaces)
- Google Workspace CLI/MCP (Drive, Gmail, Calendar, Sheets access)
- Perplexity MCP server (web search, sonar-pro, sonar-deep-research tools)
- Obsidian CLI (1.12, backlinks/tags/properties at CLI level)
- OpenClaw (working autonomous daemon)
- Claude in Chrome (scheduled browser automation, web↔repo bridge)

---

## VI. What Remains Unknown — Governed Gaps

These are not architectural fog. They are named open problems with known positions in the grammar layer's structure.

**Open modality classes** (surfaces needing scaffold-class production):
- Daemon/runtime (in opening — OpenClaw strong, Cowork scaffold-ready, others unresearched)
- Coordination/event choreography (Make, Zapier, webhook systems)
- Trust/auth boundary topology (cross-cutting, not a modality class — prerequisite for Tier 3)
- Backend/cloud substrates (Supabase, Cloudflare)
- Model-routing/memory layers (LiteLLM, Mem0, vector stores)
- Solopreneur stack (finance, accounting, ecommerce, HR-for-agents)

**Open grammar-layer slots:**
- Tier 3 (contract enforcement) — open slot in Layer Law, prerequisite for operational contracts
- Tier 5 (coordination) — open slot, prerequisite for relay/choreography specification
- Typed middle layer — the gap between constitutional law and operational execution

**Methodological gaps:**
- Grammar-aligned research methodology (Level 0-1, never formally tested)
- Specification-production method (Level 2 but not yet formalized in Method Engine)
- Compression-production method (Level 0)

---

## VII. What Not to Do

Do not reopen the grammar layer unless a demonstrated flaw is found. The editorial debt is bounded and non-blocking.

Do not treat the operational architecture proposal as ratified. It is a working thesis, not a specification. The repo structure, the fleet roles, the relay patterns — these are directional, not constitutional.

Do not build infrastructure before running the pipes. The correct sequence is: do work, observe what the work requires, extract contracts from real traffic, then build infrastructure around observed reality. Phase 2's critical failure was reformatting pre-existing evidence rather than conducting grammar-aligned research. Phase 3 must not repeat that pattern by prescribing operational contracts before operational experience generates them.

Do not collapse substrate into governance. Having a repo with a directory structure is substrate. Having typed contracts, coordination rules, observability, and trust models is governance. The former enables the latter but does not constitute it.

Do not assume connector reliability. Claude.ai GitHub sync, ChatGPT's connector, and Gemini's import are all beta features with documented failure modes. The stable architecture is MCP-first, connectors-opportunistic.

---

## VIII. The Singular Present-State Artifact

**HANDOFF-CURRENT.md** is the only artifact that carries live operational state. Everything in this document is contextual background. HANDOFF-CURRENT.md tells you what is happening *right now*. This document tells you what has happened and what must happen. They serve different functions. Read both.

---

*Phase 1 closed the question of what kind of institution this is. Phase 2 closed the question of whether the institution can produce governed artifacts. Phase 3 is closing the question of whether the institution can operate as a distributed system without exhausting its sovereign.*
