# SPEC: Working Repository Bootstrap and Research Apparatus (Revised)

**Class:** Specification (provisional — Vanguard-inspected, Vizier-revised)  
**Executor:** Commander (Claude Code) or Cowork  
**Date:** 2026-03-15  
**Revision note:** Incorporates all seven corrections from Vanguard inspection. Key changes: active dossiers promoted, pedigree semantics for supersession, bootstrap/production settings split, research cycle reframed as calibration-first, Bootstrap A/B phasing.

---

## I. Current filesystem state

(Unchanged from v1 — see tree.txt for full inventory. Summary below.)

**`_/`** — Nine ratified grammar-layer documents plus `federated-architecture-schema-instructions.md`.

**Root level** — 113 turn-prefixed files. Phase 2 production: scaffolds, specifications, dossiers, handoffs, prompts, responses, governance drafts, harness taxonomy. Multiple superseded versions coexist.

**`phase1/`** — Phase 1 conversation archive. Construction briefs, Q&A pairs, intermediate grammar drafts, pre-build memos, transition artifacts.

**`provenance/`** — Pre-grammar research corpus in five subdirectories. Critically: `2-exocortex/` contains the 14 SaaS platform reports that are active evidential substrate, not archival.

---

## II. Target structure

```
syncrescendence/
├── .git/
├── .gitignore
├── .mcp.json                          # MCP server config (placeholder at bootstrap)
│
├── HANDOFF-CURRENT.md                 # Singular present-state artifact
├── PROTOCOL.md                        # Inter-agent rules (Bootstrap A: minimal)
├── SYNCRESCENDENCE-STATE-OF-THE-INSTITUTION.md
├── PHASE-TRANSITION-1-TO-2.md         # Active substrate (not archivable yet)
│
├── grammar/                           # CONSTITUTIONAL — read-only post-Bootstrap A
│   ├── 1-KNOWLEDGE-ARCHITECTURE-ROOT.md
│   ├── 2-LAYER-LAW.md
│   ├── 3-ARTIFACT-GRAMMAR.md
│   ├── 4-NAMING-AND-ADDRESSING.md
│   ├── 5-SCAFFOLD-GRAMMAR.md
│   ├── 6-DELTA-METABOLISM.md
│   ├── 7-METHOD-ENGINE.md
│   ├── 8-READINESS-MATRIX.md
│   └── 9-AUTHORITY-LATTICE.md
│
├── scaffolds/
│   ├── saas/
│   │   ├── SCAFFOLD-SLACK.md
│   │   ├── SCAFFOLD-NOTION.md
│   │   ├── SCAFFOLD-JIRA.md
│   │   ├── SCAFFOLD-CONFLUENCE.md
│   │   ├── SCAFFOLD-LINEAR.md
│   │   ├── SCAFFOLD-CODA.md
│   │   ├── SCAFFOLD-CLICKUP.md
│   │   ├── SCAFFOLD-AIRTABLE.md
│   │   ├── SCAFFOLD-BASECAMP.md
│   │   ├── SCAFFOLD-DISCORD.md
│   │   ├── SCAFFOLD-TODOIST.md
│   │   ├── SCAFFOLD-TICKTICK.md
│   │   ├── SCAFFOLD-OBSIDIAN.md
│   │   ├── SCAFFOLD-TELEGRAM.md
│   │   └── SCAFFOLD-SAAS-LAYER.md
│   ├── reasoning-chat/
│   │   ├── SCAFFOLD-CLAUDE-CHAT.md
│   │   ├── SCAFFOLD-CHATGPT.md
│   │   ├── SCAFFOLD-GEMINI-CHAT.md
│   │   ├── SCAFFOLD-GROK.md
│   │   └── SCAFFOLD-REASONING-CHAT-LAYER.md
│   ├── coding-harness/
│   │   └── harness-taxonomy.md
│   └── daemon-runtime/
│       ├── SCAFFOLD-OPENCLAW.md
│       └── DAEMON-RUNTIME-CLASS-OPENING.md
│
├── specifications/
│   ├── SPEC-SAAS-TELEOLOGICAL-SELECTION.md
│   ├── SPEC-REASONING-CHAT-TELEOLOGICAL-SELECTION.md
│   └── DRAFT-METHOD-SPECIFICATION-PRODUCTION.md
│
├── dossiers/
│   ├── saas/                          # PROMOTED from provenance — active evidence
│   │   ├── report-slack.md
│   │   ├── report-notion.md
│   │   ├── report-jira.md
│   │   ├── report-confluence.md
│   │   ├── report-linear.md
│   │   ├── report-coda.md
│   │   ├── report-clickup.md
│   │   ├── report-airtable.md
│   │   ├── report-basecamp.md
│   │   ├── report-discord.md
│   │   ├── report-todoist.md
│   │   ├── report-ticktick.md
│   │   ├── report-obsidian.md
│   │   └── report-telegram.md
│   └── daemon-runtime/
│       └── DOSSIER-CLAUDE-COWORK.md
│
├── briefs/
│   ├── COMMISSION-VANGUARD-PHASE3-STRATEGY.md
│   ├── COMMISSION-VANGUARD-RESEARCH-METHODOLOGY.md
│   ├── BRIEF-GROK-ORACLE-CROSS-PLATFORM-RESEARCH.md
│   └── VANGUARD-RESEARCH-METHODOLOGY-EXEMPLAR.md
│
├── methods/
│   └── grammar-aligned-research/
│       └── SKILL.md
│
├── proposals/
│   ├── PROPOSAL-CLI-PIVOT-v1.md
│   └── PROPOSAL-CLI-PIVOT-v2.md
│
├── research/
│   └── calibration-slack/
│       └── .gitkeep
│
├── provenance/                        # Pre-grammar corpus (minus promoted dossiers)
│   ├── 0-holistic/
│   ├── 1-harness/
│   ├── 2-exocortex/                   # Emptied — contents promoted to dossiers/saas/
│   ├── 3-live_ledger/
│   ├── 4-prompting_scaffold/
│   └── 5-repo_state/
│
├── archive/
│   ├── phase1-lineage/                # Q&A pairs, intermediate drafts (not active substrate)
│   ├── phase2-conversations/          # Prompts + responses stripped from root
│   ├── pedigree/                      # Superseded artifacts with Superseded-by headers
│   └── active-supporting/             # Pre-build memos, items pending archival test
│       ├── PREBUILD-MEMO-1-TERMINOLOGY-RECONCILIATION.md
│       ├── PREBUILD-MEMO-2-ENVIRONMENTAL-PHYSICS.md
│       ├── PREBUILD-MEMO-3-REASONING-SURFACES.md
│       └── PREBUILD-MEMO-4-RUNTIME-MODALITY.md
│
├── .claude/
│   ├── settings.json                  # Bootstrap A: permissive. Bootstrap B: locked.
│   ├── skills/
│   │   └── grammar-aligned-research -> ../../methods/grammar-aligned-research/
│   └── agents/
│       └── scaffold-producer.md
│
├── CLAUDE.md
├── AGENTS.md
└── GEMINI.md
```

---

## III. Bootstrap A — Repository creation and minimum operating conventions

### Purpose
Create the repo, move files into structural positions, install minimum config, make one clean initial commit. This is the lightweight shared directory the corrected bootstrap sequence calls for.

### Settings regime: Bootstrap mode

`.claude/settings.json` during Bootstrap A:
```json
{
  "permissions": {
    "deny": [
      "Write(.git/**)",
      "Write(.env)"
    ],
    "allow": [
      "Read(**)",
      "Bash(git *)", "Bash(ls *)", "Bash(cat *)", "Bash(grep *)",
      "Bash(find *)", "Bash(wc *)", "Bash(diff *)",
      "Bash(mkdir *)", "Bash(cp *)", "Bash(mv *)", "Bash(ln *)",
      "Bash(rm *)", "Bash(rmdir *)"
    ]
  }
}
```

Grammar-directory protection is NOT active during Bootstrap A. The bootstrap itself creates `grammar/` by copying files into it. Protection activates at Bootstrap B.

### Mutation sequence

**Step 1 — Initialize.** `git init`. Create all directories per Section II.

**Step 2 — Grammar layer.** Copy nine documents from `_/` to `grammar/`. Move `federated-architecture-schema-instructions.md` to `provenance/4-prompting_scaffold/`.

**Step 3 — Scaffolds.** For each scaffold artifact at root level, identify the accepted version using this rule: highest turn number is candidate successor; acceptance confirmed by one of (a) explicit supersession in the file, (b) HANDOFF-CURRENT.md reference, or (c) downstream reliance from a layer scaffold or specification. Commander diffs ambiguous cases and annotates decisions in the commit message. Accepted versions move to `scaffolds/<class>/` with turn prefix stripped. Candidate-but-unconfirmed files move to `archive/pedigree/` with a `Superseded-by: <successor>` header prepended.

**Step 4 — Specifications.** Latest accepted versions to `specifications/`. Earlier versions to `archive/pedigree/` with supersession headers.

**Step 5 — Dossiers promoted.** The 14 SaaS reports move from `provenance/2-exocortex/` to `dossiers/saas/`. They are active evidential substrate. `DOSSIER-CLAUDE-COWORK.md` moves to `dossiers/daemon-runtime/`.

**Step 6 — Phase 1 triage.** `PHASE-TRANSITION-1-TO-2.md` promotes to repo root (active substrate). The four pre-build memos move to `archive/active-supporting/` (not yet archivable, pending five-condition test). Construction briefs, Q&A pairs, and intermediate drafts move to `archive/phase1-lineage/`.

**Step 7 — Phase 2 conversations.** All `*-prompt.md` and `*-response.md` files move to `archive/phase2-conversations/`.

**Step 8 — Unclassified root files.** Commander classifies each remaining root file:

| File | Classification | Destination |
|---|---|---|
| `init.md` | GPT-5.4 metaprompting instructions | `provenance/4-prompting_scaffold/` |
| `01-CAPABILITIES.md` | Early operational note | `archive/phase2-conversations/` |
| `01-PHASE-2-ACTIVATION.md` | Phase 2 activation record | `archive/phase2-conversations/` |
| `03-HARNESS-CONFIG.md` | Superseded by harness-taxonomy | `archive/pedigree/` |
| `03-TOOL-ECOSYSTEM.md` | Early delta-domain seed (superseded by 04-) | `archive/pedigree/` |
| `04-TOOL-ECOSYSTEM.md` | Delta-domain artifact | `archive/pedigree/` or `dossiers/` (Commander inspects) |
| `07-DRAFT-*.md` | Superseded governance drafts | `archive/pedigree/` |
| `06-DRAFT-*.md` | Superseded governance drafts | `archive/pedigree/` |

Commander inspects each and annotates the commit message with classification rationale for any ambiguous case.

**Step 9 — Place new root-level documents.** Create HANDOFF-CURRENT.md (latest), PROTOCOL.md, SYNCRESCENDENCE-STATE-OF-THE-INSTITUTION.md, CLAUDE.md, AGENTS.md, GEMINI.md, .mcp.json, .gitignore.

**Step 10 — Clean up.** Remove empty `_/` directory. Verify `provenance/2-exocortex/` is empty (contents promoted). Remove empty `phase1/` directory.

**Step 11 — Authority declaration.** For current-state authority during repo construction: SYNCRESCENDENCE-STATE-OF-THE-INSTITUTION.md plus the latest HANDOFF-CURRENT.md are authoritative. Older readiness artifacts in archive are historical maturity assessments, preserved as lineage, not confused with present state.

**Step 12 — Initial commit.**
```bash
git add -A
git commit -m "Bootstrap A: working repository from Phase 1-2 project folder

Classified 113+ root files by artifact class and acceptance status.
Promoted 14 SaaS dossiers from provenance to active evidence.
Preserved PHASE-TRANSITION-1-TO-2.md and pre-build memos as active substrate.
Superseded artifacts in archive/pedigree/ with Superseded-by headers.
Grammar layer in grammar/ (protection activates at Bootstrap B).
Config files are bootstrap-mode permissive."
```

**Step 13 — Push to GitHub.**
```bash
git remote add origin git@github.com:<user>/syncrescendence.git
git branch -M main
git push -u origin main
```

**Step 14 — Connect chat surfaces.** Add repo to Claude.ai Project Knowledge (select: `grammar/`, `scaffolds/`, `specifications/`, `dossiers/`, `HANDOFF-CURRENT.md`, `PROTOCOL.md`). Connect to ChatGPT via Settings → Apps → GitHub.

---

## IV. Config file contents

### `.gitignore`
```
.claude/settings.local.json
.obsidian/
*.DS_Store
.env
.env.*
```

### `.mcp.json` (placeholder)
```json
{
  "mcpServers": {}
}
```
MCP servers configured at Bootstrap B after the first research cycle proves the operational patterns.

### `CLAUDE.md` — Commander instructions
```markdown
# Syncrescendence — Commander Instructions

You are Commander, operating within the Syncrescendence knowledge architecture.

## Constitutional substrate
The grammar layer lives in `grammar/`. These nine documents govern all production.
Read them before producing or modifying any artifact. After Bootstrap B, `grammar/`
is write-protected. During Bootstrap A, writes are permitted only for initial population.

## Your role
Polymathic execution. Synthesis from evidence packets. Scaffold production and validation.
Governance-artifact maintenance. Twelve-check scaffold validation. Invocation receipt emission.

## Before producing any scaffold
Read `grammar/5-SCAFFOLD-GRAMMAR.md` for the twelve-check validation schema.
Read the relevant modality-class axis set from `grammar/2-LAYER-LAW.md`.
Read `grammar/4-NAMING-AND-ADDRESSING.md` for identifier and naming rules.
Read `grammar/3-ARTIFACT-GRAMMAR.md` for artifact class definitions and epistemic requirements.

## Directory semantics
- `grammar/` — Constitutional. Read-only post-bootstrap.
- `scaffolds/` — Production artifacts by modality class. Provisional by nature.
- `specifications/` — Teleological manuals. Prescriptive.
- `dossiers/` — Active evidential substrate. Remains active after scaffold production.
- `briefs/` — Research commissions and challenge briefs.
- `methods/` — Production method skills (SKILL.md format).
- `research/` — Grammar-aligned research outputs. Evidence packets, disagreement maps, receipts.
- `proposals/` — Pre-decisional. No authority until accepted.
- `provenance/` — Pre-grammar corpus. Reference, not production substrate.
- `archive/pedigree/` — Superseded artifacts. Retain identifiers, carry Superseded-by headers.
- `archive/active-supporting/` — Items pending archival test. Still referenceable.
- `archive/phase1-lineage/` — Phase 1 conversation history.
- `archive/phase2-conversations/` — Phase 2 prompts and responses.

## Output discipline
Flowing prose paragraphs. Active affirmative voice. Exact nouns. Sharp distinctions.
Epistemic labeling: separate observation, inference, and provisional claims.
Compress aggressively while preserving governing structure.

## Use `obsidian` CLI for vault queries instead of grep/find when Obsidian is running.
```

### `AGENTS.md` — Adjudicator instructions
```markdown
# Syncrescendence — Adjudicator Instructions

You are Adjudicator, operating within the Syncrescendence knowledge architecture.

## Constitutional substrate
The grammar layer lives in `grammar/`. Nine documents, read-only. They govern all
artifact production. Read them before auditing any artifact.

## Your role
Systematic verification. Forensic granularity testing. Internal consistency checks.
Missing-axis detection. Unsupported-claim identification. Deficiency reports.

## Audit discipline
For every artifact, check against:
- Twelve-check schema: `grammar/5-SCAFFOLD-GRAMMAR.md`
- Axis set: `grammar/2-LAYER-LAW.md`
- Naming conventions: `grammar/4-NAMING-AND-ADDRESSING.md`
- Epistemic requirements: `grammar/3-ARTIFACT-GRAMMAR.md`

Report deficiencies precisely. Name the failing check. Cite the grammar document
and section. State what the artifact provides and what it should provide.

## Output discipline
Forensic prose. Active voice. Source every claim. Label epistemic status.
```

### `GEMINI.md` — Cartographer instructions
```markdown
# Syncrescendence — Cartographer Instructions

You are Cartographer, operating within the Syncrescendence knowledge architecture.

## Constitutional substrate
The grammar layer lives in `grammar/`. Nine documents, read-only.

## Your role
Survey and mapping. Cross-domain pattern recognition. Structural homology detection.
When decomposing a surface, attend to structural analogies with already-known surfaces
in `scaffolds/`, and where departures may matter for class-level convergence.

## Research discipline
Produce evidence packets with axis-by-axis decomposition following the modality-class
axis set in `grammar/2-LAYER-LAW.md`. Label every claim: verified, inferred, or provisional.
Cite sources. Flag thin evidence zones. Preserve contradictions between sources.
Follow identifier conventions from `grammar/4-NAMING-AND-ADDRESSING.md`.
```

### `PROTOCOL.md` — Bootstrap A version (minimal)
```markdown
# Syncrescendence — Inter-Agent Protocol (Bootstrap A)

This protocol governs the working repository during Bootstrap A. It will be revised
at Bootstrap B after the first receipt-bearing research cycle produces operational evidence.

## Roles
- **Sovereign** — Human operator. Merge authority. Final judgment on acceptance and promotion.
- **Vizier** (Claude.ai) — Synthesis, production, commission crafting. Decision advisory.
- **Vanguard** (ChatGPT) — Strategic vision, gap detection, schema design. Decision advisory.
- **Commander** (Claude Code) — Execution, filesystem operations. Execution authority only.
- **Adjudicator** (Codex) — Verification, audit. Execution authority only.
- **Oracle** (Grok) — Adversarial research. Execution authority only.
- **Cartographer** (Gemini CLI) — Survey, mapping. Execution authority only.

Decision authority (what to build, what to accept, what to promote) rests with
Sovereign, advised by Vizier and Vanguard. Execution authority (how to build,
how to validate, how to research) is delegated to the fleet under commission.

## Write discipline (Bootstrap A)
- `grammar/` — Read-only after initial population. Amendments require Sovereign authorization.
- `HANDOFF-CURRENT.md` — Commander updates after Sovereign approval.
- All other directories accept writes from commissioned agents during governed work cycles.

## File lifecycle
draft → review (Sovereign) → accepted. Superseded artifacts move to `archive/pedigree/`
with a `Superseded-by: <successor-path>` header prepended.

## Receipt expectation
Every governed work cycle (research, production, audit) should emit an invocation receipt
recording: what ran, on whose commission, against what inputs, what it produced, what
readiness judgment resulted, and where outputs landed. Receipt format will be formalized
at Bootstrap B from observed patterns.
```

---

## V. Bootstrap B — After first receipt-bearing research cycle

Bootstrap B activates after the Slack calibration cycle completes and an invocation receipt exists. At that point:

**Settings lock.** `.claude/settings.json` switches to production mode:
```json
{
  "permissions": {
    "deny": [
      "Write(grammar/**)",
      "Write(.git/**)",
      "Write(.env)"
    ],
    "allow": [
      "Read(**)",
      "Bash(git *)", "Bash(ls *)", "Bash(cat *)", "Bash(grep *)",
      "Bash(find *)", "Bash(wc *)", "Bash(diff *)", "Bash(obsidian *)"
    ]
  }
}
```

**PROTOCOL.md revised** from Bootstrap A minimal to fuller operational protocol, incorporating receipt format, coordination patterns, review lanes, and any adjustments discovered during the first cycle.

**`.mcp.json` populated** with GitHub MCP server and any other bridges proven useful during the cycle.

**Wider agent configs** refined based on what the first cycle revealed about prompt structure, context injection needs, and output quality.

---

## VI. The first research cycle — Calibration against Slack

### Framing
This is calibration, not ordinary production. The default outcome is a calibration judgment, not a new scaffold. The cycle measures whether the existing Slack scaffold is mostly adequate, adequate but biased, or systematically blind.

### Target
Slack. Richest pre-grammar dossier (`dossiers/saas/report-slack.md`). Most populated existing scaffold (`scaffolds/saas/SCAFFOLD-SLACK.md`).

### Cycle directory
`research/calibration-slack/`

### Agents
Adjudicator, Cartographer, Oracle run decomposition in parallel. Commander reserved for synthesis.

### Context injection per agent
- `grammar/2-LAYER-LAW.md` — SaaS nine-axis set
- `grammar/5-SCAFFOLD-GRAMMAR.md` — twelve-check validation schema
- `grammar/3-ARTIFACT-GRAMMAR.md` — epistemic-labeling requirements
- `grammar/4-NAMING-AND-ADDRESSING.md` — identifier and naming rules
- Invariant prompt spine from research methodology (Section II of exemplar)
- `dossiers/saas/report-slack.md` — original pre-grammar evidence
- Signature-adapted emphasis per agent role

### Expected outputs
```
research/calibration-slack/
├── EVIDENCE-PACKET-ADJUDICATOR.md
├── EVIDENCE-PACKET-CARTOGRAPHER.md
├── EVIDENCE-PACKET-ORACLE.md
├── DISAGREEMENT-MAP.md
├── CALIBRATION-DELTA.md
└── INVOCATION-RECEIPT.md
```

CALIBRATION-DELTA.md applies the five-dimension calibration matrix (axis coverage, primitive yield, epistemic distribution, thin-zone topology, prescriptive contamination) and produces one of three judgments: mostly adequate, adequate but biased, or systematically blind.

A SCAFFOLD-DRAFT is produced only if the calibration judgment warrants revision and the evidence packet is scaffold-ready. This is a conditional output with explicit supersession intent, not the default terminal artifact.

### Success criteria
The cycle completes. The calibration delta exists and is structurally legible. The invocation receipt records what ran, against what, with what result. The methodology is proven executable. Bootstrap B can proceed.

---

## VII. What Commander needs to know before executing

The Sovereign will provide: the actual filesystem path, the GitHub repo URL, and confirmation to proceed. Commander executes Bootstrap A as a single session, annotating every ambiguous classification decision in the commit message. The Sovereign reviews the commit diff before push.

Commander should expect ~30 minutes of file inspection, movement, and classification. The grammar documents are the easiest — direct copy. The scaffolds require version resolution. The unclassified root files require individual inspection. The Phase 1 triage requires separating active substrate from pure lineage.

The result is a clean, governable working repository that the CLI fleet can operate on and both chat surfaces can read from. Everything after this — the research cycle, the contract extraction, the wider fleet calibration, the constitutional repo — earns its existence from the work this apparatus produces.

---

*Bootstrap A creates the ground. The first research cycle proves the ground bears weight. Bootstrap B hardens the ground into governed territory. Each stage earns the next.*
