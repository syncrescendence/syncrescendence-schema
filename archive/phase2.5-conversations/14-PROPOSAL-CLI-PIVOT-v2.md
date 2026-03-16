# PROPOSAL: Syncrescendence Operational Architecture

**Class:** Proposal (pre-decisional)  
**Purpose:** How the operator, two conversational surfaces, and a CLI fleet share a single source of truth.  
**Date:** 2026-03-14  
**Status:** Draft v2 — sharpened from v1's 494-line infrastructure sprawl  

---

## 1. The Core Insight

The problem was never "chat vs. CLI." It was "no shared source of truth." Claude.ai and ChatGPT couldn't see the same files. Every crossing between surfaces cost operator attention — copying, pasting, re-explaining context, losing fidelity. The grammar layer was built in one Claude.ai conversation and had to be manually uploaded to the next one.

A GitHub repo solves this. Both Claude.ai and ChatGPT have native GitHub connectors that provide read access to repo files in conversation. Claude.ai can add repo files to Project Knowledge, searchable and syncable with one click. ChatGPT can attach repos in Deep Research and Agent Mode. Neither surface writes to the repo from chat. The CLI fleet (Claude Code, Codex, Gemini CLI, Grok API) writes to it. The operator writes to it via git.

The repo is the constitution. The chat surfaces are the deliberation chambers. The CLI fleet is the civil service.

---

## 2. The Operating Model

### The Operator's Experience

The operator sits in two conversational surfaces with distinct roles:

**Claude.ai** — Primary. Synthesis, architectural reasoning, production-grade artifact creation, governance. The Project (Schema-3 or its successor) has the repo connected as Project Knowledge. The grammar layer, current scaffolds, HANDOFF-CURRENT.md, active briefs — all live-synced from GitHub, searchable via project_knowledge_search. Claude Opus 4.6 Extended provides the deepest analytical processing. Output mode: flowing prose, epistemic labeling, recursive deepening. When Claude produces an artifact, it goes to the repo (via download → git commit, or via Claude Code filesystem access in sessions with computer tools).

**ChatGPT** — Secondary. Exploratory ideation, adversarial reading, metaprompting, rapid structural speculation. The GitHub connector provides read access to the same repo. GPT-5.4's conversational fluency enables a different mode of thinking — faster, more associative, occasionally orthogonal. Canvas is the materialization boundary. When a Canvas artifact is worth keeping, the operator downloads it to the repo's `briefs/` or `challenges/` directory. Git commit. Both surfaces see it on next sync.

**The operator's overhead:** Talk to Claude.ai for production. Occasionally open ChatGPT for exploration. Download worthwhile outputs to the repo directory. Git commit. Sync. That's the entire interaction surface.

### The Fleet Underneath

The CLI agents operate on the repo filesystem. The operator rarely interacts with them directly — Claude Code runs in sessions with computer tools (like this one), or is dispatched by Cowork, or operates via Claude in Chrome for browser automation. The fleet:

**Claude Code (Vizier)** — Synthesis, scaffold production, specification extraction, governance-artifact maintenance. Reads CLAUDE.md for behavioral steering. Hooks enforce grammar-layer read-only protection. Skills encode production methods. Subagents handle specialized roles. Writes to the repo.

**Codex (Vanguard)** — Frontier research, parallel evidence gathering. AGENTS.md provides behavioral steering beyond ChatGPT's 3000-character limit. Automations handle recurring research sweeps. Writes to the repo.

**Gemini CLI (Cartographer)** — Cross-domain pattern recognition, structural homology detection. Subscription-metered via Google AI Pro. GEMINI.md for context. 1M token context window. Writes to the repo.

**Grok (Oracle)** — Adversarial synthesis via API. 4.1 Fast ($0.20/M input) for bulk research with 2M context window. 4.20 Beta ($2.00/M input) for council-quality reasoning. $19.83 available + $150/month via data-sharing program. Writes to the repo via scripts or orchestrating agents.

**Claude in Chrome (Bridge)** — Scheduled browser automation. Runs Perplexity Deep Research sessions, extracts results, saves to repo. Weekly/daily cadence for recurring research. The web↔repo bridge.

**Cowork (Bootstrap → Governance)** — Initial role: convert this conversation's context into config files. Ongoing: scheduled governance checks, document formatting, VM-sandboxed execution.

**OpenClaw (Autonomous)** — Campaign-level work exceeding session scope. Persistent daemon. HEARTBEAT.md self-reporting. Already working and available.

**Obsidian (Viewfinder)** — The repo IS an Obsidian vault. Graph view, backlinks, canvas for spatial comprehension. CLI access via Obsidian 1.12. Agent Client plugin brings all CLI agents into the vault. Not a production surface — a sense-making surface.

### Governance

**The repo structure is the governance.** The `grammar/` directory is read-only (enforced by Claude Code hooks, by instruction in AGENTS.md/GEMINI.md). The file lifecycle (draft → review → accepted) is enforced by directory conventions and operator commits. HANDOFF-CURRENT.md is the singular present-state artifact — only Claude Code writes it. PROTOCOL.md specifies the inter-agent collaboration rules. The grammar layer IS the constitution, and it lives in the repo where every surface can read it.

---

## 3. The Transcription Tax — Dissolved

**Before (three-thread history):** Operator copies metaprompt from ChatGPT → pastes into Claude.ai → Claude produces artifact → operator downloads → uploads to next Claude.ai session or manually pastes into ChatGPT for review. Context lost at every boundary. Fidelity degrades. Operator exhaustion compounds.

**After (repo-mediated):** ChatGPT reads the repo, produces insight in Canvas → operator downloads to `briefs/challenge-xyz.md` → git commit → Claude.ai syncs project knowledge, sees the new brief → Claude Code processes it through the governed production pipeline → artifact lands in `scaffolds/` → git commit → ChatGPT sees the new scaffold on next repo read. Context preserved. Fidelity maintained. Operator touches each artifact exactly twice: once to commit, once to review.

**The Canvas/Artifacts symmetry:** Both surfaces have sidecar document mechanisms that exist outside ephemeral chat context. Canvas (ChatGPT) and Artifacts/file creation (Claude.ai) are the materialization boundaries where conversational exploration becomes durable. The operator's discipline: if it's worth keeping, it goes in the repo. If it's not in the repo, it didn't happen.

---

## 4. Configuration — Compressed

### What Goes in the Repo (Shared State)

```
syncrescendence/
├── PROTOCOL.md              # Inter-agent rules
├── HANDOFF-CURRENT.md       # Present state
├── CLAUDE.md                # Claude Code project instructions + doctrine
├── AGENTS.md                # Codex project instructions
├── GEMINI.md                # Gemini CLI project instructions
├── .mcp.json                # Shared MCP servers (Perplexity, gws)
├── grammar/                 # Constitutional layer (READ-ONLY)
├── scaffolds/               # Production artifacts by class
├── specifications/          # Teleological manuals
├── dossiers/                # Research evidence
├── briefs/                  # Research commissions + adversarial challenges
├── methods/                 # Production method skills (SKILL.md)
├── provenance/              # Original pre-grammar corpus
├── .claude/                 # Claude Code settings, hooks, skills, agents
├── .obsidian/               # Obsidian vault config (gitignored)
└── openclaw/                # Daemon config
```

### What Goes in Global User Config (Per-Agent, Per-Machine)

- `~/.claude/CLAUDE.md` — Behavioral steering ported from Claude.ai User Preferences (cognitive profile, quality principles, anti-patterns, response scaling)
- `~/.codex/AGENTS.md` — Behavioral steering ported from ChatGPT CIs (expanded beyond 3000-char limit)
- `~/.gemini/GEMINI.md` — Behavioral steering (behavior-only, no identity declarations)
- `~/.claude/settings.json` — Global permissions, default model, user-level MCP
- `~/.codex/config.toml` — Global Codex settings, model, sandbox mode

### What Goes in Claude.ai Project Settings

Connect the GitHub repo. Select: `grammar/`, `scaffolds/`, `specifications/`, `HANDOFF-CURRENT.md`, `PROTOCOL.md`, `briefs/`. Sync before each session. This replaces the current manually-uploaded project files with live repo state. The project_knowledge_search tool becomes the operator's primary way of accessing architectural context in conversation.

### What Goes in ChatGPT

Connect the same GitHub repo via Settings → Apps → GitHub. In Deep Research or Agent Mode, attach the repo. ChatGPT reads the same files Claude.ai reads. Project memory: keep project-only, don't fight global memory's opacity.

---

## 5. The ChatGPT Question — Resolved

**Is there secret sauce in ChatGPT vs. Codex?** The model (GPT-5.4) is identical. The surface differs in system prompt engineering, personality tuning, routing logic, and conversational cadence. AGENTS.md can approximate the behavioral directives but cannot replicate the personality layer or the routing.

**Should we emulate ChatGPT in the harness?** No. The value of ChatGPT is precisely what makes it unreliable — the associative, sometimes brilliant, sometimes derailing conversational style. You can't encode that in instructions without either suppressing it (making it useless) or amplifying it (making it dangerous). Use the native surface for what it does natively. Don't coerce.

**Is ChatGPT moot given its writing quality issues?** GPT-5.4 is a genuine correction. Sam Altman acknowledged the personality regression and calls 5.4 "my favorite model to talk to." Community response confirms improved conversational quality, though "disturbingly insightful" coexists with "too verbose and goes into loops." The schizophrenic quality is the feature/cost pair — you pay for the occasional brilliance with frequent misfires. The repo-mediated model bounds the blast radius: a bad ChatGPT session wastes one conversation. A good one produces a brief that enters the governed pipeline.

**The resolution:** Claude.ai for all production. ChatGPT for bounded exploration with the repo as shared context. Canvas artifacts that survive operator review enter the repo. Everything else evaporates harmlessly. The operator never depends on ChatGPT's consistency. They depend on the repo's consistency, which Claude Code maintains.

---

## 6. What This Actually Costs the Operator

**Daily overhead:** Talk to Claude.ai (you're already doing this). Occasionally open ChatGPT with repo context. Download files to repo directory. `git add . && git commit -m "description" && git push`. Click "Sync" in Claude.ai project settings before the next session.

**One-time setup:** Create the GitHub repo. Connect it to both Claude.ai and ChatGPT. Port User Preferences to `~/.claude/CLAUDE.md`. Port ChatGPT CIs to `~/.codex/AGENTS.md`. Create PROTOCOL.md, GEMINI.md. Set up Claude Code hooks. Configure MCP servers. Install Obsidian plugins. Authenticate Gemini CLI with Google AI Pro.

**What the operator does NOT need to do:** Use a terminal directly. Configure Codex Automations manually. Manage Grok API calls. Monitor token budgets (unless they want to). The fleet is infrastructure, not an interaction surface. Claude Code can be instructed from within Claude.ai sessions like this one.

---

## 7. Honest Constraints

**Grok 4.20's full consumer UX** (DeepSearch, Big Brain Mode, live X sensing with the Companions interface) remains SuperGrok-only on grok.com. The API provides the model's reasoning and tool-calling capabilities. For full consumer features, the operator visits grok.com manually.

**Perplexity Deep Research** at scale runs through the web app (unlimited with Pro). Claude in Chrome can automate this via scheduled shortcuts, but browser automation is slower and more fragile than a native API integration.

**The mystical recipe** — the emergent conversational configuration between GPT-5.4 and Claude — is partially but not fully preserved. What transfers: the behavioral steering (CLAUDE.md, AGENTS.md), the project doctrine (PROTOCOL.md), the shared context (the repo). What doesn't transfer: the live conversational feedback loop between the two models, which required the operator as real-time relay. The repo model trades real-time interplay for asynchronous composability.

**ChatGPT's inconsistency** is real and unresolved. Project memory is opaque. The model's quality varies session to session. The repo-mediated architecture bounds the damage but doesn't fix the underlying problem. Accept this as a cost of access to GPT-5.4's occasional orthogonal insights.

**Claude.ai GitHub sync** is read-only and requires manual "Sync now" clicks. There have been reported issues with sync reliability. If sync breaks, the fallback is manual file upload to project knowledge (the current operating mode). This is a beta feature.

---

## 8. The Bootstrap

1. **Create the GitHub repo.** Push the current project files (grammar layer, scaffolds, specifications, dossiers, provenance) into the directory structure from Section 4.
2. **Connect to Claude.ai.** Add the repo to this Project's knowledge. Select key directories. Sync. Verify project_knowledge_search returns grammar-layer content.
3. **Connect to ChatGPT.** Settings → Apps → GitHub. Authorize. Select the repo. Test in a conversation: "Read grammar/2-LAYER-LAW.md and summarize the seven-tier model."
4. **Port behavioral steering.** Create `~/.claude/CLAUDE.md` from User Preferences XML. Create `~/.codex/AGENTS.md` from ChatGPT CIs (expanded). Create project-level CLAUDE.md, AGENTS.md, GEMINI.md, PROTOCOL.md.
5. **Configure Claude Code.** Settings.json with hooks (grammar-layer protection). MCP servers (Perplexity, gws, GitHub). Skills from production methods. Test one scaffold production via skill.
6. **Configure the fleet.** Authenticate Gemini CLI with Google AI Pro. Set XAI_API_KEY for Grok. Install Claude in Chrome. Initialize Obsidian vault at repo root.
7. **First grammar-aligned research.** Commission a research brief. Run it through Codex + Gemini CLI + Grok 4.1 Fast — three agents, three cognitive signatures. Compare outputs. Refine the methodology.

---

## 9. Open Questions

1. **xAI data-sharing program** ($150/month credits for sharing API inputs) — enable for non-sensitive research?
2. **Claude.ai GitHub sync reliability** — test before depending on it. Fallback: manual upload.
3. **Repo size vs. context window** — will the full grammar layer + scaffolds + specifications fit in Claude.ai's project knowledge? May need selective sync.
4. **ChatGPT project memory** — keep project-only? Switch to global + delete after? Or ignore memory entirely and depend on repo reads?
5. **Adversarial review process** — should ChatGPT challenges land in `briefs/` or a separate `challenges/` directory? Different governance expectations?
6. **Output style empirical test** — produce one scaffold via Claude Code with ported CLAUDE.md, compare prose quality to claude.ai output.

---

*The repo is the constitution. The chat surfaces are the deliberation chambers. The CLI fleet is the civil service. The operator is the sovereign.*
