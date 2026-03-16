# SPEC: Working Repository Bootstrap and Research Apparatus

**Class:** Specification (provisional — pending Vanguard inspection)  
**Executor:** Commander (Claude Code) or Cowork  
**Purpose:** Transform the existing project folder into a working git repository with config files that define roles, operations, and governance, then execute the first grammar-aligned research calibration cycle.  
**Date:** 2026-03-15  

---

## I. Current state of the filesystem

The project lives in a single folder with three zones:

**`_/`** — The nine ratified grammar-layer documents plus `federated-architecture-schema-instructions.md`. This is the constitutional substrate. These files are the highest-authority artifacts in the system.

**Root level** — 113 files, flat, prefixed with turn numbers (01- through 21-). These are Phase 2 production artifacts: scaffolds, specifications, dossiers, handoffs, prompts, responses, governance drafts, and the harness taxonomy. Multiple superseded versions of the same artifact coexist (e.g., five versions of HANDOFF-CURRENT.md, three versions of SCAFFOLD-SAAS-LAYER.md, two versions of SPEC-REASONING-CHAT-TELEOLOGICAL-SELECTION.md). The turn-number prefix makes chronological ordering visible but structural role invisible.

**`phase1/`** — Phase 1 conversation archive. Construction briefs, question-answer pairs, intermediate grammar drafts, pre-build memos, handoff states. Lineage material.

**`provenance/`** — Pre-grammar research corpus organized into five subdirectories: `0-holistic/` (strategic vision documents, architecture docs, federal stack), `1-harness/` (Grok directives and reports for coding harness surfaces), `2-exocortex/` (14 SaaS platform reports — the pre-grammar dossiers), `3-live_ledger/` (avatarization, taxonomy prompts/responses), `4-prompting_scaffold/` (custom instructions, prompting guides, per-model config artifacts), `5-repo_state/` (Oracle sensing prompts and responses).

---

## II. Target structure

The mutation moves files from flat-root chaos into a structure where directory position encodes artifact class, modality class, and authority level. The grammar layer's artifact taxonomy (canon, scaffold, dossier, specification, method, ledger, registry, compression) governs the directory semantics.

```
syncrescendence/
├── .git/
├── .gitignore
│
├── HANDOFF-CURRENT.md                 # Singular present-state artifact (latest version only)
├── PROTOCOL.md                        # Inter-agent collaboration rules
├── SYNCRESCENDENCE-STATE-OF-THE-INSTITUTION.md  # Cold-start orientation
│
├── grammar/                           # CONSTITUTIONAL — read-only post-bootstrap
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
│   │   ├── SCAFFOLD-SLACK.md          # Latest accepted version (strip turn prefix)
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
│   │   └── SCAFFOLD-SAAS-LAYER.md     # Latest accepted layer scaffold
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
│   ├── SPEC-SAAS-TELEOLOGICAL-SELECTION.md        # Latest accepted
│   ├── SPEC-REASONING-CHAT-TELEOLOGICAL-SELECTION.md
│   └── DRAFT-METHOD-SPECIFICATION-PRODUCTION.md
│
├── dossiers/
│   └── DOSSIER-CLAUDE-COWORK.md
│
├── briefs/                            # Research commissions, challenge briefs
│   ├── COMMISSION-VANGUARD-PHASE3-STRATEGY.md
│   ├── COMMISSION-VANGUARD-RESEARCH-METHODOLOGY.md
│   ├── BRIEF-GROK-ORACLE-CROSS-PLATFORM-RESEARCH.md
│   └── VANGUARD-RESEARCH-METHODOLOGY-EXEMPLAR.md
│
├── methods/                           # Production method skills
│   └── grammar-aligned-research/
│       └── SKILL.md                   # Encoded from Vanguard methodology
│
├── proposals/                         # Pre-decisional working documents
│   ├── PROPOSAL-CLI-PIVOT-v1.md
│   └── PROPOSAL-CLI-PIVOT-v2.md
│
├── research/                          # Grammar-aligned research outputs (new)
│   └── calibration/
│       └── .gitkeep                   # First cycle outputs land here
│
├── provenance/                        # PRESERVED AS-IS — pre-grammar research corpus
│   ├── 0-holistic/
│   ├── 1-harness/
│   ├── 2-exocortex/
│   ├── 3-live_ledger/
│   ├── 4-prompting_scaffold/
│   └── 5-repo_state/
│
├── archive/
│   ├── phase1/                        # Phase 1 conversation lineage (moved from ./phase1/)
│   ├── phase2-conversations/          # Phase 2 prompts + responses (stripped from root)
│   └── superseded/                    # Superseded artifact versions (old handoffs, old scaffolds)
│
├── .claude/
│   ├── settings.json                  # Permissions, hooks, model defaults
│   ├── skills/
│   │   └── grammar-aligned-research -> ../../methods/grammar-aligned-research/
│   └── agents/
│       └── scaffold-producer.md
│
├── CLAUDE.md                          # Project-level Claude Code instructions
├── AGENTS.md                          # Project-level Codex instructions
└── GEMINI.md                          # Project-level Gemini CLI instructions
```

---

## III. The mutation plan

### Step 1 — Initialize git

```bash
cd /path/to/syncrescendence
git init
```

### Step 2 — Create directory structure

```bash
mkdir -p grammar scaffolds/{saas,reasoning-chat,coding-harness,daemon-runtime}
mkdir -p specifications dossiers briefs methods/grammar-aligned-research
mkdir -p proposals research/calibration
mkdir -p archive/{phase1,phase2-conversations,superseded}
mkdir -p .claude/{skills,agents}
```

### Step 3 — Move grammar layer

```bash
cp _/1-KNOWLEDGE-ARCHITECTURE-ROOT.md grammar/
cp _/2-LAYER-LAW.md grammar/
cp _/3-ARTIFACT-GRAMMAR.md grammar/
cp _/4-NAMING-AND-ADDRESSING.md grammar/
cp _/5-SCAFFOLD-GRAMMAR.md grammar/
cp _/6-DELTA-METABOLISM.md grammar/
cp _/7-METHOD-ENGINE.md grammar/
cp _/8-READINESS-MATRIX.md grammar/
cp _/9-AUTHORITY-LATTICE.md grammar/
```

Note: `federated-architecture-schema-instructions.md` goes to `provenance/4-prompting_scaffold/` — it is the ChatGPT project instruction set, not a grammar document.

### Step 4 — Move scaffolds (latest accepted versions only)

The root contains multiple versions. The rule: the highest turn-number version of each artifact is the accepted version. Earlier versions move to `archive/superseded/`.

**SaaS scaffolds** — single version each (turn 10 or 13):
```bash
cp 01-SCAFFOLD-SLACK.md scaffolds/saas/SCAFFOLD-SLACK.md      # Use 02 if it supersedes 01
cp 03-SCAFFOLD-NOTION.md scaffolds/saas/SCAFFOLD-NOTION.md
cp 03-SCAFFOLD-JIRA.md scaffolds/saas/SCAFFOLD-JIRA.md
# ... (Commander resolves by inspecting content — the turn-prefix indicates sequence)
```

**Layer scaffolds** — `15-SCAFFOLD-SAAS-LAYER.md` is the latest (supersedes 12- and 14- versions):
```bash
cp 15-SCAFFOLD-SAAS-LAYER.md scaffolds/saas/SCAFFOLD-SAAS-LAYER.md
mv 12-SCAFFOLD-SAAS-LAYER.md archive/superseded/
mv 14-SCAFFOLD-SAAS-LAYER.md archive/superseded/
```

Commander must inspect each case. The heuristic: highest turn number wins. When uncertain, diff the files.

### Step 5 — Move specifications (latest accepted)

```bash
cp 19-SPEC-REASONING-CHAT-TELEOLOGICAL-SELECTION.md specifications/SPEC-REASONING-CHAT-TELEOLOGICAL-SELECTION.md
cp 15-SPEC-SAAS-TELEOLOGICAL-SELECTION.md specifications/SPEC-SAAS-TELEOLOGICAL-SELECTION.md
cp 15-DRAFT-METHOD-SPECIFICATION-PRODUCTION.md specifications/
mv 18-SPEC-REASONING-CHAT-TELEOLOGICAL-SELECTION.md archive/superseded/
```

### Step 6 — Move dossiers and daemon-runtime artifacts

```bash
cp 21-DOSSIER-CLAUDE-COWORK.md dossiers/
cp 21-SCAFFOLD-OPENCLAW.md scaffolds/daemon-runtime/
cp 20-DAEMON-RUNTIME-CLASS-OPENING.md scaffolds/daemon-runtime/
cp 11-harness-taxonomy.md scaffolds/coding-harness/
```

### Step 7 — Archive Phase 2 conversations

```bash
mv *-prompt.md archive/phase2-conversations/
mv *-response.md archive/phase2-conversations/
```

### Step 8 — Archive superseded handoffs and governance drafts

```bash
mv 01-HANDOFF-CURRENT.md archive/superseded/
mv 02-HANDOFF-CURRENT.md archive/superseded/
# ... all numbered HANDOFF-CURRENT versions
mv 07-DRAFT-*.md archive/superseded/
mv 06-DRAFT-*.md archive/superseded/
mv 01-PHASE-2-ACTIVATION.md archive/phase2-conversations/
mv 01-CAPABILITIES.md archive/phase2-conversations/
mv 03-HARNESS-CONFIG.md archive/superseded/
mv 03-TOOL-ECOSYSTEM.md archive/superseded/
mv 04-TOOL-ECOSYSTEM.md archive/superseded/
```

### Step 9 — Move Phase 1 archive

```bash
mv phase1/* archive/phase1/
rmdir phase1
```

### Step 10 — Preserve provenance as-is

`provenance/` stays in place, unchanged. Its internal structure already makes sense.

### Step 11 — Place new root-level documents

The following are produced fresh by this spec (content defined in Section IV):

```bash
# These are created by Commander, not moved:
# HANDOFF-CURRENT.md        (latest version, updated)
# PROTOCOL.md               (new — inter-agent rules)
# SYNCRESCENDENCE-STATE-OF-THE-INSTITUTION.md (from this session's output)
# CLAUDE.md                 (new — project-level Claude Code instructions)
# AGENTS.md                 (new — project-level Codex instructions)
# GEMINI.md                 (new — project-level Gemini CLI instructions)
# .claude/settings.json     (new — permissions and hooks)
# .gitignore                (new)
```

### Step 12 — Clean the `_/` directory

Once grammar files are copied to `grammar/`, the `_/` directory is redundant.

```bash
mv _/federated-architecture-schema-instructions.md provenance/4-prompting_scaffold/
rmdir _
```

### Step 13 — Initial commit

```bash
git add -A
git commit -m "Bootstrap working repository from Phase 1-2 project folder"
```

### Step 14 — Push to GitHub

```bash
# Create repo on GitHub first (private, no README)
git remote add origin git@github.com:<user>/syncrescendence.git
git branch -M main
git push -u origin main
```

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

### `CLAUDE.md` (project-level — Claude Code / Commander)

```markdown
# Syncrescendence — Commander Instructions

You are Commander, operating within the Syncrescendence knowledge architecture.

## Constitutional substrate
The grammar layer lives in `grammar/`. These nine documents are READ-ONLY. You must never
write to, modify, or delete any file in `grammar/`. They define the law that governs
all production: artifact classes, layer model, naming conventions, scaffold validation,
temporal metabolism, methods, readiness assessment, and authority delegation.

## Your role
Polymathic execution. Synthesis from evidence packets. Scaffold production and validation.
Governance-artifact maintenance. Twelve-check scaffold validation. Invocation receipt emission.

## Output discipline
Flowing prose paragraphs. Active affirmative voice. Exact nouns. Sharp distinctions.
Epistemic labeling: separate observation, inference, and provisional claims. Mark each.
Reserve lists for cases where discrete structure genuinely increases precision.
Compress aggressively while preserving governing structure. Every sentence clarifies the
system, sharpens a boundary, resolves ambiguity, or advances the architecture.

## Directory semantics
- `grammar/` — Constitutional. Read-only.
- `scaffolds/` — Production artifacts by modality class. Provisional by nature.
- `specifications/` — Teleological manuals. Prescriptive. High authority when accepted.
- `dossiers/` — Aggregated evidence. Input to scaffold production.
- `briefs/` — Research commissions and challenge briefs. Operator or Vizier authored.
- `methods/` — Production method skills (SKILL.md format).
- `research/` — Grammar-aligned research outputs. Evidence packets, disagreement maps, receipts.
- `proposals/` — Pre-decisional working documents. No authority until accepted.
- `provenance/` — Pre-grammar research corpus. Reference material, not production substrate.
- `archive/` — Superseded versions, conversation lineage. Preserved, not active.

## Before producing any scaffold
Read `grammar/5-SCAFFOLD-GRAMMAR.md` for the twelve-check validation schema.
Read the relevant modality-class axis set from `grammar/2-LAYER-LAW.md`.
Read `grammar/3-ARTIFACT-GRAMMAR.md` for artifact class definitions.

## Use `obsidian` CLI for vault queries instead of grep/find when Obsidian is running.
```

### `AGENTS.md` (project-level — Codex / Adjudicator)

```markdown
# Syncrescendence — Adjudicator Instructions

You are Adjudicator, operating within the Syncrescendence knowledge architecture.

## Constitutional substrate
The grammar layer lives in `grammar/`. Nine documents, read-only. They govern all
artifact production. Read them before auditing any artifact.

## Your role
Systematic verification. Repo-wide auditing. Forensic granularity testing. Internal
consistency checks. Missing-axis detection. Unsupported-claim identification. Deficiency
reports. You do not produce scaffolds. You audit them.

## Audit discipline
For every artifact you review, check against:
- The twelve-check schema in `grammar/5-SCAFFOLD-GRAMMAR.md`
- The axis set for the relevant modality class in `grammar/2-LAYER-LAW.md`
- The naming conventions in `grammar/4-NAMING-AND-ADDRESSING.md`
- The epistemic-labeling requirements in `grammar/3-ARTIFACT-GRAMMAR.md`

Report deficiencies precisely. Name the check that fails. Cite the grammar document
and section that specifies the requirement. State what the artifact provides and what
it should provide. Preserve the distinction between "missing" and "inadequate."

## Output discipline
Forensic prose. Active voice. Source every claim. Label epistemic status. Treat rigor
as your primary value. Richness is Commander's concern.
```

### `GEMINI.md` (project-level — Gemini CLI / Cartographer)

```markdown
# Syncrescendence — Cartographer Instructions

You are Cartographer, operating within the Syncrescendence knowledge architecture.

## Constitutional substrate
The grammar layer lives in `grammar/`. Nine documents, read-only.

## Your role
Survey and mapping. Cross-domain pattern recognition. Structural homology detection.
When decomposing a surface, pay special attention to whether primitives are structurally
analogous to already-known surfaces in `scaffolds/`, and where departures may matter
for class-level convergence.

## Research discipline
Produce evidence packets with axis-by-axis decomposition following the modality-class
axis set in `grammar/2-LAYER-LAW.md`. Label every claim: verified, inferred, or provisional.
Cite sources. Flag thin evidence zones explicitly. Preserve contradictions between sources.

## Output discipline
Active voice. Structural observations over narrative. Dense prose. Mark homologies
and departures with explicit structural justification.
```

### `.claude/settings.json`

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
      "Bash(git *)",
      "Bash(ls *)",
      "Bash(cat *)",
      "Bash(grep *)",
      "Bash(find *)",
      "Bash(wc *)",
      "Bash(diff *)",
      "Bash(obsidian *)"
    ]
  }
}
```

### `PROTOCOL.md`

```markdown
# Syncrescendence — Inter-Agent Protocol

## Roles
- **Sovereign** — Human operator. Merge authority. Final judgment.
- **Vizier** (Claude.ai) — Synthesis, production, commission crafting.
- **Vanguard** (ChatGPT) — Strategic vision, gap detection, schema design.
- **Commander** (Claude Code) — Execution, tool use, filesystem operations.
- **Adjudicator** (Codex) — Systematic verification, repo-wide audit.
- **Oracle** (Grok) — Adversarial sensing, triangulated intelligence.
- **Cartographer** (Gemini CLI) — Survey, mapping, pattern detection.

## Write discipline
- `grammar/` is read-only for all agents. Amendments require Sovereign authorization.
- `HANDOFF-CURRENT.md` is single-writer: Commander updates, Sovereign approves.
- `scaffolds/` and `specifications/` accept writes only from Commander after review.
- `briefs/` accepts writes from Vizier (commissions) and Sovereign (challenges).
- `research/` accepts writes from any research agent (Commander, Adjudicator,
  Cartographer, Oracle) during governed research cycles.
- `archive/` is append-only.

## File lifecycle
draft → review → accepted. Drafts land in the appropriate directory.
Accepted artifacts stay in place. Superseded versions move to `archive/superseded/`.

## Research cycle protocol
1. Commission lands in `briefs/`
2. Research agents produce evidence packets in `research/<cycle-name>/`
3. Disagreement map produced in `research/<cycle-name>/`
4. Commander synthesizes in `research/<cycle-name>/`
5. Invocation receipt emitted in `research/<cycle-name>/`
6. If scaffold-ready, output moves to `scaffolds/` after Sovereign review
7. HANDOFF-CURRENT.md updated

## Naming convention
Strip turn-number prefixes. Name by function: SCAFFOLD-<surface>.md,
SPEC-<class>-TELEOLOGICAL-SELECTION.md, DOSSIER-<surface>.md.
See `grammar/4-NAMING-AND-ADDRESSING.md` for full rules.
```

---

## V. The first research cycle

Once the repo exists and the config files are in place, the immediate next operation is the first grammar-aligned calibration cycle per the Vanguard methodology.

**Target:** Slack (richest pre-grammar dossier, most populated existing scaffold)

**Cycle directory:** `research/calibration-slack/`

**Agents:** Adjudicator, Cartographer, Oracle (Commander reserved for synthesis)

**Context injection per agent:** `grammar/2-LAYER-LAW.md` (SaaS axis set), `grammar/5-SCAFFOLD-GRAMMAR.md` (twelve-check schema), `grammar/3-ARTIFACT-GRAMMAR.md` (epistemic requirements), the invariant prompt spine from the research methodology, plus `provenance/2-exocortex/report-slack.md` as the original pre-grammar evidence.

**Outputs expected:**
```
research/calibration-slack/
├── EVIDENCE-PACKET-ADJUDICATOR.md
├── EVIDENCE-PACKET-CARTOGRAPHER.md
├── EVIDENCE-PACKET-ORACLE.md
├── DISAGREEMENT-MAP.md
├── CALIBRATION-DELTA.md           # Comparison to scaffolds/saas/SCAFFOLD-SLACK.md
├── SCAFFOLD-DRAFT-SLACK-v2.md     # If warranted
└── INVOCATION-RECEIPT.md
```

**Calibration matrix applied:** Axis coverage, primitive yield by axis, epistemic distribution, thin-zone topology, prescriptive contamination — per Section III of the Vanguard methodology.

**Success criteria:** The cycle completes. The calibration delta reveals whether the existing Slack scaffold is mostly adequate, adequate but biased, or systematically blind. The invocation receipt exists and records what ran, against what evidence, with what result. The methodology is proven executable.

---

## VI. What this spec asks Vanguard to inspect

1. **Is the directory structure correct?** Does it encode the artifact taxonomy faithfully? Are any categories misplaced? Is the archive strategy sound?
2. **Are the config files adequate?** Do CLAUDE.md, AGENTS.md, and GEMINI.md carry enough constitutional context for cold-start operation? Are the settings.json deny rules sufficient for grammar protection?
3. **Is the mutation plan complete?** Are any files from the current tree unaccounted for? Is the version-resolution heuristic (highest turn number wins) safe, or are there known cases where an earlier version is the accepted one?
4. **Is the first research cycle correctly scoped?** Is Slack the right calibration target? Is the context injection set correct? Are the expected outputs properly typed?
5. **Is anything premature?** Does this spec attempt to build infrastructure that should wait for operational evidence? Does it prescribe governance that should emerge from traffic patterns?

---

*This spec produces the working apparatus. The apparatus produces the research. The research produces the evidence. The evidence produces the contracts. The contracts produce the constitutional repo. Each stage earns the next.*
