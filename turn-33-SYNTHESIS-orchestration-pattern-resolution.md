# SYNTHESIS: Orchestration Pattern Resolution

**Type:** Synthesis  
**Turn:** 33 (final, platform-current as of 2026-03-21)  
**Salon:** vizier-sovereign / schema-3  
**Sovereign verbatim:** "What we should elucidate now is the final orchestration pattern [...] Propose the resolution for our new orchestration pattern."

---

## I. Avatar taxonomy — final roster

Eleven avatars across thirteen primary surfaces, plus two auxiliary surfaces (Claude in Chrome, Claude for Excel/PowerPoint) that extend existing avatars rather than warranting their own. Avatars map to cognitive roles, not access modalities — Claude Code Web is Commander via browser, Codex Web is Adjudicator via browser.

| Avatar | Surface | Model | Role | Invocation |
|---|---|---|---|---|
| **Sovereign** | Human operator | — | Intuition, judgment, merge authority, relay bus | — |
| **Vizier** | Claude.ai (Chat mode) | Opus 4.6 (1M ctx GA) | Viceroy. Constitutional synthesis, artifact production, commission crafting | Claude Desktop → Chat |
| **Vanguard** | ChatGPT | GPT-5.4 | Strategic anchor. Macroscopic/holistic visioneering, gap detection, schema design | ChatGPT web/app |
| **Commander** | Claude Code | Opus 4.6 (1M ctx, 128K output) | Polymathic execution. Tool use, repo operations, synthesis | Claude Desktop → Code (or Web, or VSCode) |
| **Adjudicator** | Codex CLI | GPT-5.4 (272K ctx) | Systematic verification. Repo-wide forensic auditing | Codex Desktop app (or Web) |
| **Oracle** | grok.com + Grok API | 4.20 (web) / 4.1 Fast (API) | Adversarial sensing. Triangulated X-grounded intelligence | grok.com / Commander-invoked script |
| **Cartographer** | Gemini CLI | Gemini 3.1 Pro | Survey, mapping, cross-domain pattern recognition | Terminal CLI |
| **Interpreter** | Gemini web | Gemini 3.1 Pro | Digestion, comprehension. Role splitting in progress | Gemini web app |
| **Ajna** | OpenClaw TUI | Sonnet 4.6 | Autonomous daemon. Browser ops, repo management, channel ops | OpenClaw TUI |
| **Augur** | Perplexity Spaces + Perplexity Computer | Multi-model (19) | Research accelerant and special operations | Perplexity web app |
| **Cowork** | Claude Cowork | Sonnet 4.6 | Autonomous operations. Scheduled governance, web+repo bridging, plugin-mediated workflows | Claude Desktop → Cowork (+ Dispatch from mobile) |

"Cowork" is a tentative avatar name — addressed by product name until teleological niche stabilizes through operational receipts.

### Auxiliary surfaces (extend existing avatars, not separate avatars)

**Claude in Chrome** (beta, all paid plans since 3/14): Browser automation extension integrating with Commander (build-test-verify from CLI) and Cowork (web research → desktop production). Shortcuts + scheduled shortcuts. Shares login state with Sovereign's browser.

**Claude for Excel / PowerPoint** (add-ins, updated 3/15): Cross-app context sharing, skills support, LLM gateway. Extends Cowork's document production into the Office ecosystem.

### Oracle — two operational modes

**grok.com Oracle (4.20 + DeepSearch + Big Brain):** Sensing instrument. Real-time X traversal. SuperGrok custom instructions and Projects carry adversarial tuning.

**API Oracle (4.1 Fast):** Decomposition instrument. Grammar-layer context-injected. Commander invokes programmatically.

### Augur — two operational modes

**Spaces mode (routine reconnaissance).** Focus modes (Academic, Finance, Patents, Web). Seven parallel search types. Does not consume Computer credits. Space instructions govern reasoning; search component does not attend to system prompt. Key model update: Kimi K2.5 retired → Nemotron 3 Super (NVIDIA). Niche requires revalidation.

**Computer mode (special operations).** Skills (SKILL.md), persistent memory, 400+ integrations, Model Council. Consumes credits from 4,000-credit pool. Deploy where other agents cannot reach.

### Cowork — autonomous operations

Cowork has its own Global Instructions (Settings → Cowork) and reads CLAUDE.md from the working folder. It now has **Projects** — persistent workspaces with their own files, links, instructions, and memory. Claude.ai User Preferences do NOT propagate to Cowork — behavioral steering must be replicated in Global Instructions, Cowork Project instructions, or `~/.claude/CLAUDE.md`. Cowork shares the same model and CLAUDE.md as Commander but runs in a VM sandbox with web access, 38+ connectors, plugin marketplace, scheduled tasks, sub-agents, and Dispatch (mobile remote control, ~50% reliability as of 3/18).

---

## II. The skill bifurcation — governing design principle

### Skill-capable surfaces

| Surface | Skill mechanism | Recent changes |
|---|---|---|
| Claude.ai | Project-attached skills + partner directory | Free tier skills; partner marketplace live |
| Cowork | Skills + Plugins (bundled skills+connectors+sub-agents) | Plugin marketplace; 38+ connectors; Projects |
| Claude Code (Commander) | `.claude/skills/SKILL.md` + effort frontmatter | Effort override; Chrome integration |
| Codex CLI (Adjudicator) | `.codex/skills/SKILL.md` | Unchanged |
| Gemini CLI (Cartographer) | `.gemini/skills/SKILL.md` | Unchanged |
| Perplexity Computer (Augur) | Computer Skills (SKILL.md, auto-activated) | Skills shipped 3/6; Model Council |
| Perplexity Spaces (Augur) | Shortcuts | Unchanged |
| Claude in Chrome | Shortcuts + scheduled shortcuts | Beta all paid plans (3/14) |
| Claude for Excel/PowerPoint | Skills in add-ins | Cross-app context sharing (3/15) |

**Instruction stack: CI (lean) → Skill (operational) → Commission (task-specific).** Three layers.

### Skill-less surfaces

| Surface | Constraint |
|---|---|
| ChatGPT (Vanguard) | No skill mechanism. CI + Projects + commission only. |
| Grok web (Oracle) | No skill mechanism. CI + Projects + commission only. |
| Grok CLI (Oracle API) | No skill mechanism. Prompt-injected context only. |

**Instruction stack: CI (heavier) → Commission (self-contained).** Two layers. Commission embeds everything a skill would otherwise carry. Commissions to skill-less surfaces are longer and more self-contained than those to skill-capable surfaces. Artifact templates serve both categories as the structural handoff contract.

---

## III. Custom instruction surfaces — complete inventory

### Instruction hierarchy per surface

**Claude.ai:**
- User Preferences (~16K chars, XML-tagged, all conversations)
- Project Instructions (per-project)
- Skills (project-attached, auto-activated)
- In-thread directives

**ChatGPT:**
- Custom Instructions Field 1 (1500 chars) + Field 2 (1500 chars)
- Project Instructions (per-project)
- In-thread directives
- *No skill mechanism*

**Grok web:**
- Global custom instructions (4000 chars)
- Custom agents (Veritas/Prism/Praxis, 4000 chars each)
- Projects (per-project instructions + files)
- In-thread directives
- *No skill mechanism*

**Perplexity:**
- Global memory (persistent, cross-session)
- Space instructions (per-Space, governs reasoning not search)
- Space files (documents, connectors)
- Computer Skills (SKILL.md, auto-activated)
- Shortcuts (Spaces-level)
- In-thread directives

**Cowork:**
- Global Instructions (Settings → Cowork → Edit)
- **Cowork Project instructions** (per-project within Cowork UI — persistent workspace with files, links, instructions, memory)
- CLAUDE.md (read from working folder — shared with Commander)
- Skills + Plugins
- In-task directives

**Commander (Claude Code):**
- `~/.claude/CLAUDE.md` (global) → `./CLAUDE.md` (project root) → child dirs → `CLAUDE.local.md`
- Skills (`.claude/skills/SKILL.md`)
- MCP servers (`.mcp.json`)

**Adjudicator (Codex CLI):**
- `~/.codex/AGENTS.md` (global) → `./AGENTS.md` (project, walks hierarchy) → `AGENTS.override.md`
- Skills (`.codex/skills/SKILL.md`)
- `config.toml`

**Cartographer (Gemini CLI):**
- `~/.gemini/GEMINI.md` (global) + `settings.json`
- Skills (`.gemini/skills/SKILL.md`)

**Ajna (OpenClaw):**
- `openclaw.json` + workspace `*.md` + Skills + Supermemory

### Documents to produce

**Global instructions (2 new):**

| Document | Target | Purpose |
|---|---|---|
| Global Instructions — Perplexity | Perplexity app-wide | Identity, cognitive profile, output defaults. |
| Global Instructions — Cowork | Settings → Cowork → Edit | Compressed behavioral steering. Supplements `~/.claude/CLAUDE.md`. |

**Project custom instructions (5: 3 new, 2 updated):**

| Document | Target | Feature | CI weight | Reason |
|---|---|---|---|---|
| Project CI — Claude.ai | Claude.ai Project | Projects | Lean | Skill-capable. |
| Project CI — ChatGPT | ChatGPT Project | Projects | Heavy | Skill-less. |
| Project CI — Grok web | Grok Project | Projects | Heavy | Skill-less. |
| Project CI — Perplexity | Perplexity Space | Spaces | Lean | Skill-capable. |
| Project CI — Cowork | Cowork Project | Projects | Lean | Skill-capable. Persistent workspace for Syncrescendence governance tasks. |

**Computer Skill (1 new):**

| Document | Target |
|---|---|
| Syncrescendence Research Skill | Perplexity Computer Skills |

**Bespoke artifact template (1 confirmed new):**

| Document | Status |
|---|---|
| ARTIFACT-TEMPLATES-AUGUR.md | Confirmed. Dual-mode (Spaces + Computer). |

**CLI instruction files (4 reviews):**

| Document | Target | Notes |
|---|---|---|
| `./CLAUDE.md` (repo-level) | Commander + Cowork | Add orchestration pattern; Chrome awareness |
| `./AGENTS.md` (repo-level) | Adjudicator | Create if absent |
| `~/.gemini/GEMINI.md` | Cartographer | Review |
| OpenClaw workspace config | Ajna | Review |

**Directory creation (2):**

| Directory | Status |
|---|---|
| `interactions/augur/` | Needs creation |
| `interactions/cowork/` | Needs creation |

**Total: 2 global + 5 project CIs + 1 Computer Skill + 1 artifact template + 4 CLI reviews + 2 directory creates = 15 actions.**

### What every project CI must contain

All five project CIs share a common information substrate:

1. **Avatar identity.** Name, role, cognitive signature, what you produce, what you do not.
2. **The full avatar roster.** All eleven avatars, surfaces, roles. Enables cross-referencing and routing awareness.
3. **The inverted relay pattern.** Vizier crafts → Sovereign relays → target executes → Sovereign returns → Vizier synthesizes.
4. **Artifact-centric output protocol.** Substance in artifacts. Chat/thread carries only logistics.
5. **State pointers.** `HANDOFF-CURRENT.md`, `grammar/`, `methods/artifact-templates/`, repo at `syncrescendence/syncrescendence-schema`.
6. **Turn documentation.** Typed artifacts (Q/A, Synthesis, Dispatch). Naming: `turn-<NN>-<TYPE>-<subject-slug>.md`.

**CI weight per the skill bifurcation:**
- Claude.ai: lean (skill-capable, largest instruction budget, full doctrine)
- ChatGPT: heavy (skill-less, carries protocol inline, Canvas-first)
- Grok: heavy (skill-less, adversarial sensing protocol, council adaptation)
- Perplexity: lean (skill-capable, Focus mode routing, source-attribution)
- Cowork: lean (skill-capable, scheduled task governance, plugin-mediated workflows)

---

## IV. Statefulness spectrum

| Surface | Persistent config | Session memory | Cross-session memory | Repo access |
|---|---|---|---|---|
| Claude.ai | User Prefs + Project CI + Project Knowledge (GitHub sync) + Skills | Full thread (compacts) | **Universal memory** (project-scoped) + chat search | GitHub connector |
| ChatGPT | CI fields + Project CI | Thread history | Limited memory | GitHub connector |
| Grok web | Global CI + Agents + Projects | Thread history | None | None |
| Grok API | Prompt-injected | Single request | None | Commander-mediated |
| Perplexity Spaces | Space instructions + files + global memory | Thread (32K limit) | Persistent memory | GitHub connector |
| Perplexity Computer | Skills + persistent memory | Full task context | Persistent memory | GitHub + 400+ integrations |
| Cowork | Global Instructions + **Cowork Project** (with files, links, instructions, memory) + CLAUDE.md + Plugins | Session (+ **Projects for persistence**) | **Cowork Projects** (per-project persistent) | Web + folder filesystem + Dispatch |
| Commander | CLAUDE.md hierarchy + MCP + Skills + Chrome | Session | Auto-memory (17 topics) + timestamps | Filesystem + GitHub MCP + Chrome |
| Adjudicator | AGENTS.md + config.toml + Skills | Session | Session index | Filesystem + GitHub MCP |
| Cartographer | GEMINI.md + settings.json + Skills | Session | save_memory | Filesystem + GitHub MCP |
| Ajna | openclaw.json + workspace/*.md + Skills | Session | SQLite + supermemory | Filesystem + GitHub skills |

### Three-tier pointer architecture

**Tier 1 — Identity and role.** Static.
**Tier 2 — State pointers.** Addresses to HANDOFF-CURRENT.md, grammar/, templates, salon, atrium.
**Tier 3 — Protocol reminders.** Artifact-centric output, turn numbering, handoff formatting. Lean for skill-capable; expanded for skill-less.

---

## V. Thread lifecycle rules

**Claude.ai (Vizier):** Long threads with compaction. Memory persists across threads (project-scoped). New thread only at schema boundaries.

**ChatGPT (Vanguard):** Short, one per commission. Canvas doesn't persist.

**Grok web (Oracle):** Fresh per commission. DeepSearch degrades in long threads.

**Grok API (Oracle):** Single-request. Stateless.

**Perplexity Spaces (Augur):** One Space per project. New thread at 32K saturation.

**Perplexity Computer (Augur):** One task per mission. Fire-and-receive.

**Cowork:** Fresh sessions per task. **Exception: Cowork Projects provide persistent workspaces** — the Syncrescendence Cowork Project carries project-scoped instructions, files, and memory for recurring governance tasks. Scheduled tasks run automatically while Desktop is open.

**CLI agents:** Fresh sessions by default. Continue only for multi-step sequential.

---

## VI. Invocation pattern

### The relay chain

```
Vizier designs commissions
    ↓
Sovereign relays (clipboard for web, terminal for CLI)
    ↓
Target avatar executes → produces artifacts
    ↓
Sovereign relays output back (paste or repo commit)
    ↓
Vizier synthesizes into institutional artifacts
```

**Cowork Dispatch:** Sovereign can message Cowork from mobile while desktop executes. ~50% reliability; supplementary, not primary.

**Claude in Chrome + Cowork pipeline:** Chrome navigates and gathers → Cowork produces documents/reports. No manual handoff required.

**Commander + Chrome build-test-verify:** Commander writes code → Chrome tests in browser → Commander reads console/DOM → iterates.

### Parallel dispatch ceiling

Four agents simultaneously: three web surfaces + one CLI session. Dispatch from mobile adds a potential fifth asynchronous channel at 50% reliability.

### Dispatch routing table

| Target | Method | Skill? | Notes |
|---|---|---|---|
| Vanguard | ChatGPT fresh thread | No | Self-contained commission. |
| Oracle (grok.com) | Grok Projects fresh thread | No | Self-contained commission. |
| Oracle (API) | Commander runs script | No | Grammar-injected prompt. |
| Commander | Claude Code session | Yes | `--chrome` for browser tasks. 128K output. |
| Adjudicator | Codex at repo | Yes | Forensic precision. |
| Cartographer | Gemini CLI at repo | Yes | Homology detection. |
| Augur (Spaces) | Syncrescendence Space thread | Yes | Focus mode. Shortcuts. |
| Augur (Computer) | Computer task | Yes | Async. Skills. Model Council. |
| Ajna | OpenClaw TUI | Yes | Browser/repo ops. |
| Cowork | Syncrescendence Cowork Project (or Dispatch from mobile) | Yes | Plugins, connectors, scheduled tasks. |

---

## VII. Salon and atrium protocol

Each dispatched avatar gets a salon at `interactions/<avatar-name>/`. `interactions/augur/` and `interactions/cowork/` need creation by Commander.

Web-surface salons require manual transcription. CLI salons write directly. Cowork scheduled tasks should be configured to write output to the repo folder, then Commander commits.

---

## VIII. Decisions ratified across turns 31-33

### Turn 31
1. Artifact-centric output protocol adopted.
2. Salon/atrium architecture adopted.
3. Grok confirmed as two distinct instruments.
4. Calibration cycle plan ratified.

### Turn 32
5. Artifact templates filed at `methods/artifact-templates/`.
6. Interaction directories and atrium created.
7. GitHub indexing remediated.

### Turn 33
8. Augur confirmed as Perplexity avatar. Two modes: Spaces + Computer.
9. Perplexity Computer addressed by product name until niche stabilizes.
10. Nemotron 3 Super replaces Kimi K2.5. Niche requires revalidation.
11. Cowork avatarized as autonomous operations agent.
12. Thread lifecycle rules established per surface.
13. Parallel dispatch ceiling: four + Dispatch supplementary fifth.
14. Three-tier instruction pointer architecture adopted.
15. Grok Projects confirmed as project-scoped instruction mechanism.
16. Skill bifurcation adopted. Three-layer vs two-layer stacks.
17. All project CIs carry full avatar roster, relay pattern, artifact-centric protocol.
18. Cowork inherits CLAUDE.md + has Global Instructions + **has Projects** (persistent workspaces with instructions). User Preferences do NOT propagate.
19. Claude Code Web and Codex Web are access modalities, not avatars.
20. Augur artifact template confirmed. Cowork template deferred.
21. Commissions to skill-less surfaces must be self-contained.
22. `interactions/augur/` and `interactions/cowork/` need creation.
23. **Cowork Project CI required** — the Syncrescendence Cowork Project needs project-scoped instructions, making 5 project CIs total (3 new, 2 updated).

### Platform updates incorporated (as of 2026-03-21)
24. 1M context GA for Opus 4.6 and Sonnet 4.6 (3/10).
25. Commander output expanded to 64K default / 128K upper bound.
26. Claude Code: MCP elicitation, --bare, --channels, PostCompact hook, effort frontmatter, --name, sparse worktrees, rate limits display, memory timestamps, Chrome integration.
27. Cowork: 38+ connectors, plugin marketplace, scheduled/recurring tasks, **Projects**, Dispatch (3/18), sub-agents, Windows support.
28. Claude.ai inline visualizations (3/21).
29. Memory universal — free for all users, project-scoped, chat search.
30. Claude in Chrome beta all paid plans (3/14). Shortcuts + scheduled shortcuts.
31. Claude for Excel/PowerPoint: cross-app context sharing (3/15), skills, LLM gateway.
32. Skills ecosystem: partner directory, org-wide management, open Agent Skills standard.
33. Off-peak bonus usage 2x (3/13–3/27).
34. Sonnet 3.7 and Haiku 3.5 retired. Haiku 3 deprecated, retires April 19.
35. Vercept acquired (perception/interaction for computer use).
36. Claude Code Security (2/20): reasoning-based vulnerability detection.

---

## IX. Build order

**Phase A — Primary deliberation (Claude.ai + ChatGPT).** Update both project CIs. Claude.ai lean (skill-capable). ChatGPT heavy (skill-less).

**Phase B — Research surfaces (Grok + Perplexity).** Create Grok Projects CI (heavy). Create Perplexity Space instructions (lean) + Perplexity global instructions. Create Augur artifact template. Create Perplexity Computer Research Skill.

**Phase C — Operations (Cowork + CLI).** Create Cowork global instructions. Create **Cowork Project CI** (lean). Review repo-level CLAUDE.md, AGENTS.md, GEMINI.md, OpenClaw config. Commander creates `interactions/augur/` and `interactions/cowork/`.

**Phase D — Validation.** Test commission to each surface during off-peak bonus window (through 3/27). Verify artifact-centric output, handoff format, state-pointer resolution.

---

*The orchestration pattern is the operating system. The custom instructions are the boot loaders. The skills are the drivers. The repo is the filesystem. The calibration cycle is the first program.*
