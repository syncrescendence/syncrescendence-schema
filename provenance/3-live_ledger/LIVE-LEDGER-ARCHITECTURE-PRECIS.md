# Live Ledger Architecture — Précis

A stateless reference for implementing continuously-updating intelligence surfaces in AI-augmented systems. Distilled from 80+ operational sessions. Every design decision here was shaped by failure.

---

## 0. The Problem

Static reference documents decay within days. Model capabilities shift weekly. Pricing changes monthly. Community consensus on prompting techniques inverts quarterly. Any document that captures "the state of things" is wrong by the time it's read — and invisibly so.

The conventional fix — periodic manual updates — fails because:
- No one knows when a document became stale
- Contradictions between old content and new reality are invisible
- The update cadence never matches the decay rate
- Knowledge lives in conversations that evaporate

**The live ledger replaces the static document with a ticker.**

---

## 1. Ticker vs. Snapshot

This is the foundational design decision. Everything else follows from it.

| Property | Snapshot (conventional) | Ticker (live ledger) |
|---|---|---|
| Update mechanism | Replace content | Append new entry |
| History | Destroyed on update | All entries preserved in sequence |
| Staleness | Invisible — reader cannot tell when content was last verified | Visible — every entry has a timestamp and freshness rating |
| Contradictions | Overwritten — old position disappears | Both positions preserved — contradiction IS the signal that a domain is shifting |
| Authorship | Usually anonymous | Every entry attributed to a sensing source |
| Cadence | Event-driven (someone remembers to update) | Scheduled + event-driven (cron + opportunistic) |

**The ledger is a ticker, not a report.** Entries accumulate. Staleness is visible. Drift between entries is detectable. Nothing is deleted.

---

## 2. Domain Architecture

A live ledger system tracks state across discrete domains. Each domain gets its own file. Domains are defined by **what changes independently** — if two things can shift without affecting each other, they belong in separate ledgers.

### Recommended Domain Set (AI Engineering)

| # | Domain | What It Tracks | Decay Rate |
|---|---|---|---|
| 1 | Model Capabilities | Frontier rankings, benchmark deltas, new releases | Weekly |
| 2 | Token Economics | Pricing per million tokens, rate limits, context windows, cost trends | Monthly |
| 3 | Community Sentiment | Dominant narratives, contrarian signals, hype cycles, sentiment shifts | Daily |
| 4 | Field Trajectory | Where practitioners believe the field is heading — AGI timelines, capability plateaus, paradigm shifts | Monthly |
| 5 | Model Configuration | Optimal temperature/top-p settings, system prompt patterns, tool use best practices per model | Monthly |
| 6 | Harness Configuration | IDE/CLI tool patterns (Cursor, Claude Code, Codex CLI), config file conventions, MCP ecosystem | Biweekly |
| 7 | Tool Ecosystem | New tool launches/shutdowns, integration shifts, AI-native replacements for legacy tools | Weekly |
| 8 | Prompting Consensus | Which prompting techniques work NOW — not six months ago | Biweekly |
| 9 | Context Engineering | RAG vs. long-context vs. fine-tuning decision frameworks, chunking strategies | Monthly |
| 10 | Memory Architecture | File-based vs. vector DB vs. graph memory — what practitioners are converging on | Monthly |
| 11 | Multi-Agent Orchestration | Framework comparison (CrewAI, AutoGen, LangGraph, native), coordination patterns | Biweekly |
| 12 | Repository Epistemology | How practitioners organize AI-augmented knowledge repos, monorepo vs. polyrepo, doc-as-code | Quarterly |

**Design principle:** Domains are defined by topic (what they're ABOUT), never by format, source, or artifact type. A tweet about model pricing and a whitepaper about model pricing both belong in Token Economics.

### Defining Your Own Domains

Any domain is valid if it satisfies three criteria:
1. **It changes.** Static knowledge doesn't need a ledger — it needs a reference document.
2. **Its changes matter to your decisions.** Tracking change for its own sake is surveillance, not intelligence.
3. **It changes independently** of other tracked domains. If two things always move together, they're one domain.

---

## 3. Entry Format

Every entry follows a standardized format. Standardization enables automated staleness detection, cross-referencing, and filtering.

```markdown
### [DOMAIN-NNN] Title

**Observed**: YYYY-MM-DD
**Source**: [specific — X thread / paper / blog / release notes / direct observation]
**Confidence**: HIGH / MEDIUM / LOW / SPECULATIVE
**Freshness**: FRESH (<7d) / CURRENT (<30d) / AGING (<90d) / STALE (>90d)
**Tags**: #domain #model #technique

[Observation content — 2-5 sentences. What changed, what was observed,
what is new. Factual, not interpretive.]

**Implications**: [1-2 sentences. What this means for your system's
decisions, architecture, or operations.]

**Cross-refs**: [Related entry IDs, canonical docs, or external links.
Shows how this observation connects to prior knowledge.]
```

### Entry Rules

1. **Append-only.** New entries go at the bottom of the entries section. Never delete or overwrite existing entries.
2. **Timestamped.** Every entry gets an observation date. Multiple entries on the same date are fine.
3. **Sequential IDs per domain.** `[CAPABILITIES-001]`, `[CAPABILITIES-002]`, etc. Never reuse an ID.
4. **Freshness decays automatically.** Freshness is computed from observation date, not manually assigned. Any reader or tool can calculate it.
5. **Contradictions are preserved.** If a new entry contradicts an old one, both remain. The contradiction is signal — it shows the domain is in flux. Add a cross-ref linking the contradicting entries.
6. **Source specificity is mandatory.** "I read somewhere" is not a source. Link the thread, paper, changelog, or commit.
7. **Confidence is honest.** SPECULATIVE is a valid confidence level. Overconfident entries are worse than speculative ones because they suppress further sensing.

---

## 4. Freshness Decay

Freshness is not a feeling — it is a computation.

```
days_since = today - entry.observed_date

if days_since < 7:    FRESH
if days_since < 30:   CURRENT
if days_since < 90:   AGING
if days_since >= 90:  STALE
```

### What Freshness Enables

- **At-a-glance triage.** A ledger full of STALE entries tells you sensing has stopped — the system is flying blind.
- **Confidence weighting.** A FRESH HIGH-confidence entry outweighs a STALE HIGH-confidence entry. Freshness modulates confidence.
- **Sensing prioritization.** Domains with mostly AGING/STALE entries need sensing passes. Domains with mostly FRESH entries can wait.
- **Automated alerting.** A cron job can scan all ledgers and flag domains where the freshest entry is older than the domain's decay rate.

### Freshness ≠ Validity

A STALE entry is not necessarily wrong — it may still be accurate. Staleness means **unverified**, not **incorrect**. The entry hasn't been checked against current reality. That distinction matters: stale entries should trigger re-sensing, not deletion.

---

## 5. Sensing Pipeline

Entries don't write themselves. A sensing pipeline feeds the ledger system through scheduled and opportunistic observation.

### Pipeline Architecture

```
┌─────────────────┐
│    SCHEDULER     │  cron / launchd / task runner
│  (time-based)    │  triggers at defined intervals per domain
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   DISPATCHER     │  routes sensing tasks to appropriate agents
│                  │  based on domain → agent mapping
└────────┬────────┘
         │
    ┌────┴────┬──────────┬──────────┐
    ▼         ▼          ▼          ▼
┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐
│AGENT A │ │AGENT B │ │AGENT C │ │AGENT D │
│Firehose│ │Surveys │ │Verifies│ │Observes│
│parsing │ │frontier│ │claims  │ │during  │
│+ social│ │+ repos │ │+ tests │ │session │
└───┬────┘ └───┬────┘ └───┬────┘ └───┬────┘
    │          │          │          │
    └────┬─────┴──────────┴─────┬────┘
         ▼                      ▼
┌─────────────────┐   ┌─────────────────┐
│  RESULT FILES   │   │  LEDGER FILES   │
│  (raw intake)   │──▶│  (append-only)  │
└─────────────────┘   └─────────────────┘
         │
         ▼
┌─────────────────┐
│  NEXT SESSION   │  loads updated ledgers as context
│  CONTEXT LOAD   │  → informs decisions → cycle repeats
└─────────────────┘
```

### Agent-Domain Mapping (Example)

| Agent Type | Sensing Function | Domains | Cadence |
|---|---|---|---|
| Social/firehose parser | Scans social feeds, forums, release channels | Sentiment, Trajectory, Prompting | Daily |
| Frontier surveyor | Monitors model releases, benchmarks, pricing pages | Capabilities, Economics, Tools | Weekly |
| Verification agent | Tests claims, runs benchmarks, validates configurations | Config, Context Engineering | Per-task |
| Session observer | Captures insights during normal work | Any domain | Per-session (opportunistic) |

### Sensing Without Agents

If you don't have a multi-agent system, the sensing pipeline simplifies to:

1. **Scheduled self-prompts.** Weekly calendar reminder: "Update ledgers for domains with AGING entries."
2. **Opportunistic capture.** When you encounter relevant information during normal work, append an entry immediately. The 60-second entry is worth more than the hour-long review you'll never do.
3. **Batch sensing sessions.** Monthly dedicated pass through all domains. Review freshness, add entries for anything that changed, mark confirmed-still-accurate entries with a new observation date.

---

## 6. The Feedback Loop — Why Live Ledgers Exist

The live ledger is not a documentation practice. It is the mechanism that closes the feedback loop into persistent storage.

### The Problem It Solves

A correction, insight, or observation that stays in a conversation produces **zero compounding value**. The system makes the same mistake next session because the correction was never stored anywhere that the next session loads.

### The Loop

```
1. OBSERVE  →  something changed / something was wrong / something was learned
2. RECORD   →  append entry to the relevant ledger (persistent storage)
3. LOAD     →  next session loads updated ledgers as context
4. ADJUST   →  next session's decisions reflect accumulated observations
5. OBSERVE  →  cycle repeats with higher-fidelity mental model
```

**If any link breaks, the loop is open and the system does not improve.**

The most common break: step 2. The observation happens, but no one writes it down. The insight dies with the conversation.

### Compounding Returns

The loop produces a characteristic three-phase arc:

| Phase | Duration | Character |
|---|---|---|
| Phase 1 — Empty Ledgers | Days 1-7 | High effort, low value. Entries are sparse. Ledgers feel like busywork. Most people quit here. |
| Phase 2 — Pattern Emergence | Days 8-21 | Entries start cross-referencing. Contradictions reveal real shifts. Sensing becomes targeted instead of exploratory. |
| Phase 3 — Compounding Intelligence | Day 22+ | Ledgers contain enough history to detect trends, predict shifts, and surface non-obvious implications. The system knows things no single session could discover. |

**Phase 1 is investment, not cost.** The return arrives in Phase 3. Operators who quit during Phase 1 never collect.

---

## 7. Context Loading Strategy

Live ledgers are only valuable if they're loaded into the working context of whatever system makes decisions — human or AI.

### For AI Agents

- **Load at session start.** Inject relevant ledger entries (FRESH and CURRENT) into the system prompt or context window.
- **Filter by domain relevance.** Not every session needs every ledger. Match loaded domains to session objectives.
- **Respect the attention curve.** Models have a U-shaped attention distribution — primacy (beginning) and recency (end) get disproportionate attention. Place the most decision-relevant ledger entries at the top and bottom of injected context, not buried in the middle.
- **Budget context.** Ledger entries consume context tokens. At scale (hundreds of entries), load summaries of AGING/STALE entries and full text of FRESH/CURRENT entries.

### For Humans

- **Scan before deciding.** Before making an architectural or tooling decision, check the relevant domain ledger. A two-minute scan prevents decisions based on month-old assumptions.
- **Trust freshness, not memory.** Your memory of "how things work" decays at the same rate as a static document. The ledger's freshness ratings are more honest than your confidence.

---

## 8. Context Transitions — Session Boundaries

When a session ends or context approaches capacity, the ledger system needs a transition protocol.

### Three Modes

1. **Culmination.** The session produced insights worth preserving. Action: append observations as ledger entries before closing. Focus: what was learned?

2. **Continuation.** Work will resume in a new session. Action: write a continuation entry that captures current state, entry point for resumption, and which ledger domains are active. Focus: what state must be restored?

3. **Compression.** Context approaching capacity mid-session. Action: summarize AGING/STALE entries into compressed form, preserve FRESH entries verbatim. Focus: what must survive vs. what can be regenerated?

### The Handoff Entry

When transitioning between sessions, write a special entry:

```markdown
### [SESSION-NNN] Handoff — YYYY-MM-DD

**State**: [what was being worked on]
**Entry point**: [where to resume]
**Active domains**: [which ledgers are relevant]
**Unrecorded observations**: [anything noticed but not yet entered as a ledger entry]
**Decisions made**: [choices that constrain future work]
```

This is not a ledger entry — it's a state transfer artifact. It lives in a separate handoff location, not in the domain ledgers.

---

## 9. Failure Modes

Each was encountered in production.

| Failure Mode | What Happens | Fix |
|---|---|---|
| **Feedback stays in conversation** | Most damaging. Corrections never reach persistent storage. Same mistakes repeat indefinitely. | Enforce closure: every correction produces a ledger entry or a persistent file update. No exceptions. |
| **Snapshot mentality** | Entries replaced instead of appended. History lost. Contradictions invisible. | Append-only rule. No overwrites. Automated enforcement if possible. |
| **Context bloat** | 30+ days of accumulation exceeds usable context window. 150,000+ tokens. | Periodic compaction every 2 weeks. Compress STALE entries to summaries. Preserve FRESH verbatim. |
| **Silent cron failure** | Scheduled sensing stops running. No one notices. Ledgers go stale silently. | Heartbeat monitoring. Alert when any domain's freshest entry exceeds 2× its expected decay rate. |
| **Overconfident entries** | HIGH confidence assigned to speculative observations. Suppresses further sensing. | Honest confidence assignment. SPECULATIVE is a valid and valuable level. |
| **Source amnesia** | Entries without specific sources. Unverifiable. Become folklore. | Source specificity mandatory. Reject entries without linkable sources. |
| **Domain creep** | Domains multiply beyond what sensing capacity can feed. Empty ledgers everywhere. | Start with 3-5 domains. Add only when you have sensing capacity AND decision relevance. An unfed ledger is worse than no ledger. |
| **Lineage as memory** | Preserving narrative history (session-by-session logs) instead of condensing into patterns. History causes regression into old habits. | Condense into wisdom. "X fails when Y" is better than "in session 31 we tried X and it failed because Y." Delete the narrative, keep the pattern. |
| **Means-ends inversion** | The ledger system becomes the product instead of serving the goal. Building and maintaining ledgers displaces the work they're supposed to improve. | Ledgers serve decisions. If no decision consults a ledger domain, that domain shouldn't exist. |

---

## 10. Implementation — Minimum Viable Ledger System

### Start Here (Day 1)

1. **Pick 3 domains** that matter to your current work and change frequently enough to justify tracking.
2. **Create one file per domain.** Name it descriptively: `LEDGER-MODEL-CAPABILITIES.md`, `LEDGER-PROMPTING-CONSENSUS.md`, etc.
3. **Add the entry template** (§3) to each file.
4. **Write your first entry** in each. Right now. From what you already know. Confidence: whatever is honest.
5. **Set a weekly reminder** to scan and update.

### Scale Later (Week 3+)

- Add domains only when you have both sensing capacity and decision relevance.
- Automate freshness alerting with a simple script that parses observation dates.
- If using AI agents, add ledger loading to session initialization prompts.
- If running multi-agent systems, assign sensing responsibilities to agents by domain.
- Implement periodic compaction (every 2 weeks) to manage context bloat.

### What NOT to Build

- **A custom app.** Markdown files in a git repo are sufficient. The format is the feature — human-readable, version-controlled, diffable, grep-able.
- **A database.** Structured data is a premature optimization. The ledger's value is in human-readable narrative entries, not queryable fields.
- **An archive system.** Old entries stay in the file. They age visibly via freshness. No separate archive, no cold storage, no "completed" bucket. Integrate or forget — never hedge with an archive.

---

## 11. The Operational Philosophy (One Paragraph)

Every system that learns operates the same loop: observe, record, load, adjust, observe. The live ledger is the record-and-load mechanism. It ensures that what was learned in one session is available in the next. Without it, every session starts from zero — the same mistakes, the same stale assumptions, the same blind spots. With it, each session starts from the accumulated intelligence of all prior sessions. The ledger doesn't make you smarter. It makes you unable to forget what you've already learned. That's the entire value proposition: **systematic unforgetting**.
