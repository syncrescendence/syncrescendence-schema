# PROPOSAL: Syncrescendence CLI Pivot

**Class:** Proposal (pre-decisional — not canon, not specification, not committed)  
**Purpose:** Operational architecture for transitioning Syncrescendence's knowledge-architecture production from chat-mediated relay to filesystem-mediated CLI collaboration.  
**Date:** 2026-03-14  
**Status:** Draft for refinement  

---

## 1. The Situation

The institution has a mature grammar layer (9 ratified documents), three MATURE modality classes, Level 2 production methods, and a growing corpus. Production has been conducted through a chat-relay model: GPT-5.4 (via ChatGPT) generates calibrated prompts, the operator relays them to Claude (via claude.ai), Claude produces artifacts, the operator relays them back or archives them. This model succeeded in elucidating the grammar layer and executing Phase 2 production but has hit structural limits: context windows exhaust, conversational rapport doesn't survive thread boundaries, research quality degrades when the grammar layer can't inform the research methodology, and the operator is a manual bottleneck for every file transfer.

The CLI pivot moves production to a shared filesystem where Claude Code and Codex operate on the same directory, the operator reviews and commits, and the grammar layer's requirements are encoded as skills, subagents, and hooks rather than as conversational instructions that attenuate over long threads.

---

## 2. What We Have — Ground Truth

### Subscription-Metered Surfaces (Zero Additional API Cost)

**Claude Code** — Subscription-metered via Claude Pro/Max OAuth. CLI and Desktop app (Chat, Code, Cowork tabs). Full filesystem access, bash execution, git integration, MCP connectors, skills, subagents, hooks. Model: Opus 4.6 / Sonnet 4.6. The primary synthesis and architectural production surface.

**Codex CLI + Desktop App** — Subscription-metered via ChatGPT Plus/Pro/Edu OAuth. Shared config between CLI and app. AGENTS.md hierarchy, skills (SKILL.md), multi-agent workflows, Automations (scheduled background tasks), MCP support, web search. Model: codex-1 / GPT-5.4. The primary research, frontier-execution, and parallel-task surface. Rate limits currently doubled for all plans (promotional, time-limited).

**Claude Cowork** — Subscription-metered via Claude Pro/Max. Runs in the Desktop app's Cowork tab. Same CLAUDE.md as Claude Code. VM-sandboxed (Apple Virtualization Framework). Folder-scoped access. Sub-agent coordination, parallel task queuing, scheduled tasks, plugin ecosystem. The bridge surface for piping chat-context into file-based production.

**Gemini CLI** — Subscription-metered via Google AI Pro. Open source. Uses `GEMINI.md` for context files (same pattern as CLAUDE.md). MCP support, Google Search grounding, file operations, shell commands, web fetching. Model: Gemini 3.1 Pro with 1M token context window. Free tier alone provides 60 requests/min and 1,000 requests/day; Google AI Pro provides substantially higher limits shared across CLI and IDE agent mode. A third fully subscription-metered CLI agent with a distinct cognitive signature (cross-domain pattern recognition, structural homology detection — the same Gemini strengths documented in the reasoning/chat scaffolds).

**Claude in Chrome** — Subscription-metered via Claude Pro/Max. Browser extension that integrates with both Claude Code (via `--chrome` flag) and Cowork (via connector). Can see, click, type, navigate, and automate across any site you're logged into. Scheduled shortcuts run automatically (daily, weekly, monthly, annually). Shares browser login state — can access authenticated sites (Google Docs, Perplexity, Notion, Gmail) without separate credentials. **This is the Perplexity web↔CLI bridge:** schedule a Chrome shortcut that runs a Perplexity Deep Research session, extracts results, and saves them as files for CLI agents to consume. Also the general web↔CLI bridge for any authenticated web surface.

### Operational Surfaces (Already Available)

**OpenClaw** — Working and available. The daemon/runtime surface we scaffolded (30 primitives). Persistent autonomous agent with HEARTBEAT.md self-reporting, SOUL.md identity framework, ClawWork economic sovereignty, and market-based swarm coordination. In the CLI architecture, OpenClaw operates as the autonomous agent layer for long-running campaign-level work that exceeds the session scope of Claude Code or Codex.

### Infrastructure and Integration Surfaces

**Google Workspace CLI (gws)** — Shipped March 2026. Dynamically discovers all Google Workspace APIs through Google's Discovery Service and exposes them as a unified CLI + MCP server. One command gives Claude Code, Codex, or Gemini CLI direct access to Drive, Gmail, Calendar, Sheets. Combined with Google AI Pro subscription, this is the Google ecosystem integration layer. Install: `npm install -g @googleworkspace/cli`, then `gws mcp -s drive,gmail,calendar,sheets`.

**Obsidian CLI** — Shipped with Obsidian 1.12 (February 2026). Provides CLI access to tags, properties, backlinks, link hierarchy, and search — ~85% of what Obsidian knows, piped to stdout. Claude Code picks it up natively via bash. Multiple plugins bring Claude Code, Codex, and Gemini CLI directly into Obsidian vaults (Agent Client, Claudian, obsidian-ai-agent). The vault becomes a live workspace — agent sessions become part of the knowledge graph. Designated as the "hyper-viewfinder" into the project's knowledge structure. Not a primary production surface but a context layer that makes every other surface smarter.

**Perplexity MCP** — Official MCP server providing web search, sonar-pro, sonar-deep-research, and sonar-reasoning-pro tools. $5/month API credit from Pro subscription. Light CLI supplement; heavy research runs through the web app (bridged via Claude in Chrome scheduled shortcuts).

### API-Metered Surfaces

**Grok (via xAI API — $19.83 available + $150/month data-sharing program)** — The xAI API is a separate developer service from SuperGrok. SuperGrok does not include API access. However, the developer console carries $19.83 in available credits, and xAI offers an additional $150/month through the data-sharing program (enable in Settings > Data Sharing — xAI uses your API interactions for model improvement; acceptable for non-sensitive research).

Grok 4.20 Beta IS available via the xAI API (confirmed in xAI release notes, March 2026). Pricing: $2.00/M input, $6.00/M output. The council architecture and reasoning capabilities are accessible programmatically.

**Tokenomics with $19.83 (before data-sharing program):**

| Model | Input $/M | Output $/M | Blended $/M (3:1) | Budget buys | Strategic role |
|---|---|---|---|---|---|
| Grok 4.1 Fast | $0.20 | $0.50 | ~$0.35 | ~56M tokens | Bulk research workhorse |
| Grok 4.20 Beta | $2.00 | $6.00 | ~$3.00 | ~6.6M tokens | Council-architecture reasoning |
| Grok 4 | $3.00 | $15.00 | ~$6.00 | ~3.3M tokens | Skip (4.20 is better and cheaper) |

With the data-sharing program ($150/month): budget is effectively unlimited for research at 4.1 Fast rates. Even at 4.20 Beta rates, $150/month buys ~50M tokens — more than sufficient for sustained grammar-aligned research.

**Consequence:** Grok is now a full CLI participant via the xAI API. The community grok-cli or direct API calls from Claude Code/Codex (via Grok's OpenAI-compatible endpoint at `api.x.ai/v1`) enable grammar-aligned research with Grok models. Use 4.1 Fast for bulk axis-decomposition research; reserve 4.20 Beta for high-stakes adversarial synthesis where the council's internal debate quality matters. SuperGrok on grok.com remains the surface for Grok 4.20's full consumer features (DeepSearch, Big Brain Mode, live X sensing) that aren't available via API.

**Perplexity (via API/MCP — $5/month from Pro + separate credit purchases)** — The Perplexity API is separate from the Pro subscription. Pro subscribers receive $5/month in free API credits. Education Pro (free with .edu email) provides the same. The official Perplexity MCP server provides four tools: web search (Search API), sonar-pro chat, sonar-deep-research, and sonar-reasoning-pro. Installable in both Claude Code and Codex with one command. Deep Research via the web app remains the highest-fidelity path for complex topics — unlimited with Pro subscription but not accessible via API.

**Consequence:** Perplexity operates in two modes. The web app handles heavy deep research (unlimited with Pro/Education Pro). The MCP server handles light CLI lookups and fact-checking within the $5/month budget. For grammar-aligned research where citation-grounding matters, the web app is primary; results are saved as files for CLI agents to consume.

---

## 3. Configuration Architecture

### 3.1 Claude Code — Full Configuration Hierarchy

**Precedence (highest to lowest):**
1. Anthropic system prompt (unpublished, not overridable)
2. Managed settings (enterprise MDM — not applicable for us)
3. User settings: `~/.claude/settings.json`
4. Project settings: `.claude/settings.json` (checked into git, shared)
5. Local project settings: `.claude/settings.local.json` (gitignored, personal)
6. CLAUDE.md files (loaded hierarchically):
   - `~/.claude/CLAUDE.md` — global, applies to all projects
   - `./CLAUDE.md` — project root
   - Child directories on demand
   - `CLAUDE.local.md` — personal overrides (gitignored)

**Critical note:** Claude.ai User Preferences do NOT propagate to Claude Code or Cowork. The ~16K-character XML behavioral steering must be manually ported to `~/.claude/CLAUDE.md` (global) or `./CLAUDE.md` (project). This is a one-time operation. Once done, both Cowork and Claude Code read it identically.

**Additional steering surfaces:**
- Output styles: `/output-style` or custom modes in `~/.claude/output-modes/`
- Skills: `.claude/skills/SKILL.md` files — progressively disclosed, auto-invoked when relevant
- Subagents: `.claude/agents/` — specialized behavioral configurations with their own tools, models, and memory
- Hooks: configured in `settings.json` — deterministic, fire at specific lifecycle points (PreToolUse, PostToolUse, Stop)
- MCP servers: `.mcp.json` (project) or `~/.claude.json` (user)

#### How We Ought to Configure Claude Code

**`~/.claude/CLAUDE.md` (global — the User Preferences port):** Translate the full `custom_instructions-claude.xml` content into this file. The XML structure parses well — keep it as XML or convert to markdown, either works. This file carries the cognitive profile (AuDHD processing architecture, abstract-sequential dominance, execution scaffolding), the quality principles (substance-first, recursive deepening, prose integrity, enduring value), the interaction modes (execution/exploration/calibration), the communication protocols (register, formatting constraints, anti-patterns), the response scaling rules, the reasoning framework (epistemic labeling, productive uncertainty), and the collaborative stance. Every Claude Code and Cowork session inherits this automatically. Target: under 200 lines per CLAUDE.md file (Anthropic's recommendation for adherence). If the full User Preferences exceed this, split: put the cognitive profile and quality principles in the global file, put the project-specific doctrine in the project-level file.

**`./CLAUDE.md` (project root — Syncrescendence-specific):** Encode the project doctrine (the `<project_doctrine>` block from the current prompt), the grammar layer's vocabulary, the directory structure conventions, the artifact taxonomy (canon/scaffold/dossier/compression/specification/ledger/registry/method), the naming conventions from NAMING-AND-ADDRESSING.md, and the operational protocols (handoff continuity, review governance, commissioning vs execution authority). Use `@grammar/2-LAYER-LAW.md` import syntax to reference grammar documents without duplicating them.

**`~/.claude/settings.json` (global permissions):** Configure default permission rules: deny writes to sensitive directories, allow common bash commands (git, ls, cat, grep, find, wc), set the default model (opus for synthesis, sonnet for routine tasks). Configure the Perplexity MCP server at the user level so it's available across all projects.

**`.claude/settings.json` (project permissions + hooks):**
```json
{
  "permissions": {
    "deny": ["Write(./grammar/**)", "Write(./.env)", "Write(./.env.*)"],
    "allow": ["Read(./grammar/**)", "Read(./**)", "Bash(git *)"]
  },
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write",
        "command": "node .claude/hooks/grammar-guard.js",
        "description": "Block writes to grammar/ directory"
      }
    ]
  }
}
```

**Custom output mode (`~/.claude/output-modes/constitutional-synthesis.md`):** Create a custom output mode encoding: flowing prose paragraphs (never bullet points for analysis), active affirmative voice, exact nouns and sharp distinctions, recursive deepening, epistemic labeling, no summary restatements, no emojis, no formulaic openers. This mode activates via `/output-style` when doing knowledge-architecture work.

**Skills (`.claude/skills/`):**
- `dossier-to-scaffold/SKILL.md` — the nine-axis decomposition method, twelve-check validation, identifier format
- `cross-entity-synthesis/SKILL.md` — convergent/divergent/synthesis zone structure, convergence threshold logic
- `specification-production/SKILL.md` — five validation criteria, upstream traceability requirements
- `grammar-aligned-research/SKILL.md` — axis-specific research prompts, epistemic labeling, source-triangulation methodology

**Subagents (`.claude/agents/`):**
- `scaffold-producer.md` — model: opus, tools: Read/Write/Edit/Bash/Glob/Grep, skills: dossier-to-scaffold, memory: project
- `synthesis-agent.md` — model: opus, tools: Read/Write/Glob/Grep, skills: cross-entity-synthesis
- `research-agent.md` — model: sonnet, tools: Read/WebFetch/WebSearch/Glob/Grep, skills: grammar-aligned-research, permissionMode: plan (ask before writing)

### 3.2 Codex — Full Configuration Hierarchy

**Precedence (highest to lowest):**
1. Global: `~/.codex/AGENTS.override.md` (if exists, else `~/.codex/AGENTS.md`)
2. Project: walk from project root to current directory, checking `AGENTS.override.md` then `AGENTS.md` at each level
3. Fallback filenames configurable in `~/.codex/config.toml` via `project_doc_fallback_filenames`
4. Max combined size: 32 KiB default (configurable via `project_doc_max_bytes`)

**Additional steering surfaces:**
- Skills: `.agents/skills/SKILL.md` — same progressive disclosure as Claude Code
- Multi-agent: `[agents]` in `config.toml` — role configuration for parallel workflows
- Automations: scheduled background tasks (app only) — results land in review queue
- `/personality`: terse pragmatic vs. conversational (limited but functional)
- MCP servers: configured in `config.toml` or via `codex mcp add`
- Profiles: named config sets in `config.toml` for switching between configurations

#### How We Ought to Configure Codex

**`~/.codex/AGENTS.md` (global — the ChatGPT CI port):** Translate the `custom_instructions-chatgpt.md` two-field content into this file. Field 1 (behavioral contract: response scaling, interpretation protocol, reasoning framework, verification, collaborative stance, style, hard blocks) and Field 2 (cognitive profile, values, domain context) merge into a single document. The 32 KiB limit is generous — you can expand beyond the 3000-character ChatGPT constraint. Add the project doctrine vocabulary, the epistemic-labeling requirements, and the research-methodology directives that couldn't fit in ChatGPT's compressed fields. This is the opportunity to give GPT-5.4 the full behavioral steering that ChatGPT's character limits prevented.

**`./AGENTS.md` (project root — Syncrescendence-specific):** Encode the project doctrine (adapted for GPT-5.4's interpretation style — more explicit contracts, less implicit inference), the grammar layer's axis sets (so Codex knows how to decompose surfaces when running research), the directory conventions, and the output format expectations (so Codex produces files that Claude Code can consume without translation). Include explicit references to grammar documents: "Before producing any scaffold, read `grammar/5-SCAFFOLD-GRAMMAR.md` for the twelve-check validation schema."

**`~/.codex/config.toml` (global configuration):**
```toml
model = "codex-1"
sandbox_mode = "workspace-write"
project_doc_max_bytes = 65536  # doubled from default for our heavy instructions

[tui]
theme = "default"
notifications = true
```

**MCP configuration:** Add Perplexity MCP for research tasks:
```
codex mcp add perplexity --env PERPLEXITY_API_KEY="your_key" -- npx -y @perplexity-ai/mcp-server
```

**Skills (`.agents/skills/`):** Mirror the Claude Code skills where both agents need the same methodology. The universal SKILL.md format works across both. Key skill: `grammar-aligned-research/SKILL.md` — this is where Codex's research capability gets grammar-informed. The skill should encode: the target modality class's axis set, the epistemic-labeling requirements, the source-triangulation methodology (adapted from the CI provenance report's four-source approach), and the output format (structured dossier with per-primitive entries).

**Codex Automations (app only — for recurring research):** Set up scheduled research sweeps for tool-ecosystem monitoring. Example: weekly scan of MCP ecosystem changes, new skill releases, model updates across providers. Results land in the review queue for operator assessment. This is the sensing method instantiated as infrastructure.

**Codex `/personality`:** Set to the more conversational option for research tasks (produces more detailed, explained output) and terse for execution tasks (produces minimal, action-oriented output).

### 3.3 Cowork — Configuration

**Global Instructions (Settings → Cowork → Edit):** A condensed version of the User Preferences — cognitive profile, tone preferences, output format. Cowork's Global Instructions field is smaller than CLAUDE.md, so compress to essentials: "Cultured, direct, flowing prose. Active affirmative voice. Architecture before examples. Epistemic labeling. No emojis, no bullet-point reports, no summary restatements. AuDHD processing: abstract-sequential first, execution scaffolding second."

**CLAUDE.md (read from selected folder):** Same file as Claude Code reads. Point Cowork at the project root and it inherits the full project-level CLAUDE.md automatically.

**Plugins:** Install relevant Anthropic official plugins for the work categories you use. The Data Analysis plugin is useful for structured evidence processing. Research plugins (if available) supplement the grammar-aligned methodology.

**Scheduled tasks:** Set up a daily or weekly task to check HANDOFF-CURRENT.md and flag any staleness conditions (temporal domains aging, bridge conditions unresolved). This is governance-as-automation.

#### How We Ought to Use Cowork Specifically

Cowork's primary role in this architecture is the **bridge surface**: converting chat-context (like this conversation) into file-based configuration. The bootstrap sequence starts here — pipe the User Preferences into CLAUDE.md, create the settings.json with hooks, produce the SKILL.md files for production methods, and create the AGENTS.md for Codex. Once the bridge is complete, Cowork's ongoing role shifts to: scheduled governance tasks, document drafting that benefits from the VM sandbox, and any non-CLI knowledge work (presentations, spreadsheets, report formatting) that the code-oriented Claude Code handles less naturally.

### 3.4 Grok (via xAI API) — Configuration

**Access method:** The xAI API at `api.x.ai/v1` is OpenAI-compatible. Two integration paths:

*Path 1 — Community grok-cli:* Install via `bun add -g @vibe-kit/grok-cli`. Configure with your xAI API key. Supports MCP servers, file operations, bash integration, and interactive/non-interactive modes. Model selection per project.

*Path 2 — Claude Code/Codex as orchestrator:* Configure Grok as a model provider in either agent. Claude Code can call the xAI API directly via bash/scripts. Codex can use Grok models via its OpenAI-compatible provider configuration.

**Model strategy with $19.83 (+$150/month data-sharing):**
- **Grok 4.1 Fast** for all bulk research: axis decomposition, surface enumeration, documentation extraction, evidence gathering. At $0.20/M input tokens, this is practically free. Use the 2M context window to inject the full grammar layer + axis set + research brief in a single prompt.
- **Grok 4.20 Beta** for high-stakes adversarial synthesis: triangulated intelligence where the council architecture's internal debate produces higher-quality output than a single-pass model. Reserve for: cross-surface comparison, contradiction detection, synthesis validation.

**Context injection strategy:** Grok 4.1 Fast's 2M context window is the key to grammar-aligned research without the "lost conversational context" problem. Inject: the target modality class's axis set (from LAYER-LAW.md), the scaffold grammar's twelve-check requirements, the epistemic-labeling protocol, and the specific research question — all in a single prompt. The grammar layer IS the context injection. This is what was missing when the original dossiers were produced: the grammar didn't exist yet, so the research prompts couldn't carry grammar-aligned decomposition targets.

**Data-sharing program:** Enable at `console.x.ai` → Settings → Data Sharing → "Share API Inputs for Model Training." This provides $150/month in additional credits. For non-sensitive research queries (which is all our grammar-aligned research), this is an acceptable tradeoff. Monitor credit usage at the xAI Console Usage Explorer.

### 3.5 Perplexity — Configuration

**Web app (primary deep research):** Use Perplexity Pro (or Education Pro with .edu email) for heavy deep research sessions. Deep Research mode, Pro Search with advanced models, and Research mode with higher depth — all unlimited via subscription. Save results as markdown files in the project's `dossiers/` directory.

**MCP server (light CLI usage):**
```
claude mcp add perplexity --env PERPLEXITY_API_KEY="your_key" -- npx -y @perplexity-ai/mcp-server
codex mcp add perplexity --env PERPLEXITY_API_KEY="your_key" -- npx -y @perplexity-ai/mcp-server
```
This provides four tools in both Claude Code and Codex: `perplexity_search` (web search), `perplexity_chat` (sonar-pro), `perplexity_deep_research` (sonar-deep-research), `perplexity_reasoning` (sonar-reasoning-pro). Budget: $5/month from Pro subscription. Use for quick fact-checking, URL lookups, and lightweight verification within research sessions. Do not use for sustained deep research — that's what the web app is for.

**Perplexity agent skill (alternative to MCP):** A lighter-weight option that uses the Perplexity CLI directly via bash commands, consuming fewer context tokens than the MCP server. Install: `npx skills add xpepper/perplexity-agent-skill -a claude-code`. Provides `lookup` (quick facts) and `answer` (deeper research) tools.

### 3.6 Gemini CLI — Configuration

**Authentication:** Login with your Google AI Pro account. Gemini CLI auto-detects the subscription and grants higher limits. Uses `GEMINI.md` for context files (equivalent to CLAUDE.md).

**`~/.gemini/GEMINI.md` (global):** Port the cognitive profile and project doctrine. Gemini's steering responds differently than Claude's — the CI provenance report documents that heavy identity prompts trigger internal dialoguing. Keep the global file behavior-focused: response scaling, epistemic labeling, active voice, anti-patterns. Omit identity/persona declarations.

**`./GEMINI.md` (project root):** Project-level context. Encode the grammar layer's axis sets and research methodology. Gemini's cross-domain pattern recognition strength makes it particularly suited for research tasks that require structural homology detection across surfaces.

**MCP:** Same `.mcp.json` as Claude Code and Codex — the Perplexity and gws MCP servers are shared. Gemini CLI reads from `~/.gemini/settings.json` for MCP config.

**Role in the architecture:** Gemini CLI occupies the cross-domain research and explanation niche. Use it for tasks where structural-homology detection and licensed speculation are primary values. The 1M token context window (same as Claude Opus extended) enables full grammar-layer injection. Google Search grounding provides a distinct research capability from Perplexity's citation model.

### 3.7 Claude in Chrome — Configuration

**Setup:** Install from Chrome Web Store. Enable in Claude Code via `--chrome` flag or `/chrome` command. Enable in Cowork via Settings → Connectors → Claude in Chrome toggle.

**Permissions:** Site-level permissions managed in the extension settings. Pre-approve sites for unattended automation: perplexity.ai (for scheduled deep research), google.com (for Search), docs.google.com (for Google Docs bridge), and any other authenticated surfaces.

**Scheduled shortcuts:** The key operational feature. Create shortcuts for recurring tasks:
- Perplexity deep research runs (daily/weekly) → results saved to `dossiers/`
- Google Docs sync (if using Docs as an intermediary)
- Web-based tool monitoring (checking for platform updates, new features)

**Permission modes:** "Ask Before Acting" for initial workflow design; "Act Without Asking" for validated recurring shortcuts. Scheduled tasks benefit from autonomous mode.

### 3.8 Obsidian — Configuration

**Obsidian CLI (Obsidian 1.12+):** Add to CLAUDE.md: `Use obsidian CLI for vault queries instead of grep/find. Prefer obsidian search over filesystem scanning.` This single instruction gives Claude Code access to backlinks, tags, properties, and link hierarchy at ~1/70,000th the token cost of scanning files manually.

**Vault as project workspace:** The Syncrescendence project directory can also be an Obsidian vault. Add `.obsidian/` to the directory (gitignored). This gives you the graph view, backlink visualization, and canvas for spatial arrangement of the knowledge architecture — while Claude Code, Codex, and Gemini CLI all operate on the same underlying markdown files.

**Agent Client / Claudian plugins:** For when you want to work from within Obsidian rather than from the terminal. The Agent Client plugin (ACP-based) brings Claude Code, Codex, and Gemini CLI into an Obsidian side panel. `@`-mention any note for instant context injection.

**Longer-term role:** Obsidian is the hyper-viewfinder into the knowledge architecture. The plugin ecosystem (Dataview for queries, Templater for templates, Copilot for AI-assisted vault search, Canvas for spatial thinking) provides a human-readable interface layer over the same files that CLI agents produce and consume. Not a production surface — a comprehension surface.

### 3.9 Google Workspace CLI (gws) — Configuration

**Installation:** `npm install -g @googleworkspace/cli`

**MCP server:** `gws mcp -s drive,gmail,calendar,sheets` — add to `.mcp.json` for shared access across all CLI agents.

**Role:** The Google ecosystem integration layer. Claude Code can search Drive, read/write Docs, create Calendar events, and update Sheets — all from the terminal. Combined with Claude in Chrome for authenticated Google surfaces that the API doesn't cover.

### 3.10 OpenClaw — Configuration

**Status:** Working and available. Already scaffolded (SCAFFOLD-OPENCLAW.md, 30 primitives).

**Role in CLI architecture:** The autonomous daemon layer for campaign-level work. HEARTBEAT.md for self-reporting, SOUL.md for identity/liability, ClawWork for economic sovereignty. Operates at timescales (days to weeks) that exceed Claude Code's session model.

**Integration:** OpenClaw can dispatch to Claude Code/Codex/Gemini CLI as sub-processes via its market-based swarm coordination. The grammar-layer documents live in the shared filesystem — OpenClaw reads them for the same grammar-aligned constraints that the other agents receive.

### 3.11 Shared Configuration (All Agents Read)

**`PROTOCOL.md` (project root):** The inter-agent collaboration protocol. Specifies: directory structure conventions, file lifecycle (draft → review → accepted), naming convention (from NAMING-AND-ADDRESSING.md), handoff state format (HANDOFF-CURRENT.md), division of labor by cognitive signature, and the commission → execute → review → accept workflow. All CLI agents read this.

**`HANDOFF-CURRENT.md`:** Unchanged — the singular present-state artifact. All agents can read it for orientation. Only Claude Code writes it (synthesis is Claude's role).

**`.mcp.json` (project-level MCP):** Shared MCP server configuration. Perplexity MCP, Google Workspace CLI MCP, and any other shared tools. Claude Code, Codex, and Gemini CLI all inherit this.

**Grammar documents (`grammar/`):** Read-only for all agents (enforced by hooks in Claude Code, by instruction in AGENTS.md/GEMINI.md). These are the constitutional substrate that informs all production.

---

## 4. The Operational Model

### Division of Labor by Cognitive Signature

This directly instantiates the reasoning/chat teleological manual's prescriptions:

**Claude Code (Vizier)** — Synthesis, architectural production, specification extraction, scaffold production, governance-artifact maintenance. Reads grammar-layer documents as project knowledge. Produces publication-grade prose via custom output mode + CLAUDE.md behavioral steering. Runs deep research via subagent-based skills when needed.

**Codex (Vanguard)** — Frontier research, parallel evidence gathering, tool-heavy execution, structured data collection. Dispatches parallel agents for multi-surface research. Automations handle recurring research sweeps. Skills encode grammar-aligned research methodology (axis decomposition, epistemic labeling, convergence criteria).

**Gemini CLI (Cartographer)** — Cross-domain pattern recognition, structural homology detection, licensed speculation. Uses Google Search grounding for a research vector distinct from both Perplexity's citation model and Grok's X-integrated sensing. 1M token context window for full grammar injection. Subscription-metered via Google AI Pro — effectively unlimited. Particularly valuable for research tasks where the question is "what structural patterns recur across these seemingly unrelated domains" — Gemini's documented cognitive signature from the reasoning/chat scaffolds.

**Grok (Oracle, CLI via xAI API + chat for consumer features)** — Grammar-aligned research via 4.1 Fast (bulk axis decomposition, surface enumeration, evidence gathering — 2M context window enables full grammar injection per prompt). Adversarial synthesis via 4.20 Beta (triangulated intelligence, council-quality reasoning for high-stakes synthesis tasks). Live X sensing via grok.com/SuperGrok when the full consumer DeepSearch/Big Brain UX is needed. Produces research dossiers saved to the project's `dossiers/` directory — either directly from CLI output or saved from grok.com sessions.

**Claude in Chrome (Bridge)** — The web↔CLI bridge. Shares browser login state with Claude Code. Scheduled shortcuts automate recurring web tasks: Perplexity Deep Research sessions, Google Docs sync, web-based tool monitoring. "Act Without Asking" mode for validated recurring workflows. This replaces the manual Cowork-as-liaison approach with browser automation that runs on a schedule.

**Perplexity (Recon, web app + light MCP)** — Deep research, citation-grounded synthesis. Primary deep research runs through the web app (unlimited with Pro), now automatable via Claude in Chrome scheduled shortcuts rather than manual relay. Light CLI usage via MCP for quick fact-checking within the $5/month API budget.

**Cowork (Bootstrap Bridge → Governance Daemon)** — Initial role: convert this conversation's full context into configuration files (CLAUDE.md, AGENTS.md, settings.json, skills, hooks). Pipe the User Preferences, project doctrine, and operational instructions directly into the filesystem. Ongoing role: scheduled governance tasks (checking HANDOFF-CURRENT.md freshness, flagging staleness), non-CLI knowledge work (document formatting, presentations), and as a VM-sandboxed execution environment when isolation matters.

**OpenClaw (Autonomous Agent)** — Campaign-level work at timescales exceeding session scope. Persistent daemon with HEARTBEAT.md self-reporting, SOUL.md identity framework, market-based swarm coordination. Can dispatch to Claude Code/Codex/Gemini CLI as sub-processes. Already working and available — this is live infrastructure, not theoretical.

**Obsidian (Viewfinder)** — The comprehension layer. CLI access to backlinks, tags, properties, and link hierarchy. Agent Client/Claudian plugins bring all CLI agents into the vault side panel. The vault IS the project directory — shared markdown files, visualized through Obsidian's graph view, canvas, and plugin ecosystem. Not a production surface. A sense-making surface that makes every other agent's output more legible to the operator.

### The Interaction Flow

```
Operator commissions research brief → saves to briefs/
    ↓
Research phase (parallel, multi-agent):
    Codex runs parallel research agents → saves to dossiers/
    Gemini CLI runs cross-domain pattern detection → saves to dossiers/
    Grok 4.1 Fast runs grammar-aligned decomposition → saves to dossiers/
    Claude in Chrome runs scheduled Perplexity Deep Research → saves to dossiers/
    Grok 4.20 Beta runs adversarial triangulation on collected evidence → saves to dossiers/
    ↓
Operator reviews dossier(s) in Obsidian (graph view, backlinks, canvas)
    ↓
Operator commits accepted dossiers
    ↓
Claude Code picks up accepted dossier → converts to scaffold via skill
    ↓
Operator reviews scaffold, commits
    ↓
Claude Code picks up accepted scaffolds → runs cross-entity synthesis via skill
    ↓
Operator reviews layer scaffold, commits
    ↓
Claude Code extracts specification from accepted substrate via skill
    ↓
Operator reviews, commits → HANDOFF-CURRENT.md updated
    ↓
OpenClaw picks up long-running campaign tasks that exceed session scope
```

The operator's role shifts from relay to editor-and-committer. The merge authority stays human. Inter-agent communication is mediated by files, not by copy-paste.

### Governance Encoded in Infrastructure

**Hooks (deterministic, not advisory):**
- PreToolUse: block writes to `grammar/` directory (grammar layer is closed)
- PostToolUse on Write: validate scaffold outputs against twelve-check schema (automated QA)
- Stop hook: review Claude's final output and force continuation if incomplete

**Skills (grammar-aligned production methods):**
- `dossier-to-scaffold` skill: encodes the nine-axis decomposition, epistemic labeling requirements, identifier format, twelve-check validation
- `cross-entity-synthesis` skill: encodes convergent/divergent/synthesis zone structure, convergence threshold logic, emergence criteria
- `specification-production` skill: encodes the five validation criteria (traceability, actionability, scope, descriptive-prescriptive boundary, falsifiability)
- `grammar-aligned-research` skill: encodes axis-specific research prompts, epistemic labeling, convergence testing, source-triangulation methodology

**Subagents (specialized production roles):**
- `scaffold-producer`: configured with scaffold-grammar knowledge, twelve-check validation, write permissions to `scaffolds/`
- `research-agent`: configured with web search, Perplexity MCP, read-only permissions, output to `dossiers/`
- `synthesis-agent`: configured with read access to all scaffolds, write to `layer-scaffolds/`
- `specification-extractor`: configured with read access to layer scaffolds, write to `specifications/`

---

## 5. Directory Structure (Proposed)

```
syncrescendence/
├── PROTOCOL.md                    # Inter-agent collaboration protocol
├── HANDOFF-CURRENT.md             # Singular present-state artifact
├── CLAUDE.md                      # Project-level Claude Code + Cowork instructions
├── AGENTS.md                      # Project-level Codex instructions
├── GEMINI.md                      # Project-level Gemini CLI instructions
├── .mcp.json                      # Project MCP servers (Perplexity, gws, etc.)
├── grammar/                       # Ratified grammar layer (READ-ONLY enforced by hook)
│   ├── 1-KNOWLEDGE-ARCHITECTURE-ROOT.md
│   ├── 2-LAYER-LAW.md
│   ├── ... (all 9 documents)
│   └── federated-architecture-schema-instructions.md
├── scaffolds/
│   ├── saas/                      # 14 surface scaffolds + layer scaffold
│   ├── reasoning-chat/            # 4 surface scaffolds + layer scaffold
│   ├── daemon-runtime/            # OpenClaw scaffold + Cowork dossier
│   ├── coding-harness/            # harness-taxonomy.md (layer scaffold)
│   └── cli/                       # Future: CLI surface scaffolds (when this class matures)
├── specifications/
│   ├── SPEC-SAAS-TELEOLOGICAL-SELECTION.md
│   ├── SPEC-REASONING-CHAT-TELEOLOGICAL-SELECTION.md
│   └── DRAFT-METHOD-SPECIFICATION-PRODUCTION.md
├── dossiers/                      # Research evidence (input to scaffold production)
│   ├── DOSSIER-CLAUDE-COWORK.md
│   ├── DAEMON-RUNTIME-CLASS-OPENING.md
│   └── ... (future research outputs)
├── briefs/                        # Research commissions (operator → agent)
├── provenance/                    # Original pre-grammar research corpus
│   ├── 0-holistic/
│   ├── 1-harness/
│   ├── 2-exocortex/
│   ├── 3-live_ledger/
│   ├── 4-prompting_scaffold/
│   └── 5-repo_state/
├── phase1/                        # Phase 1 conversation archive
├── phase2/                        # Phase 2 conversation archive (prompts + responses)
├── methods/                       # Production method skills (shared across agents)
│   ├── dossier-to-scaffold/SKILL.md
│   ├── cross-entity-synthesis/SKILL.md
│   ├── specification-production/SKILL.md
│   └── grammar-aligned-research/SKILL.md
├── .claude/
│   ├── settings.json              # Claude Code permissions, hooks
│   ├── settings.local.json        # Personal overrides (gitignored)
│   ├── skills/                    # Claude Code project-level skills
│   ├── agents/                    # Claude Code project-level subagents
│   └── commands/                  # Slash commands
├── .codex/                        # Codex project config (if needed beyond AGENTS.md)
├── .obsidian/                     # Obsidian vault config (gitignored)
│   └── plugins/                   # Agent Client, Claudian, Dataview, etc.
├── init.md                        # GPT-5.4 metaprompting instructions (legacy reference)
└── openclaw/                      # OpenClaw daemon config
    ├── HEARTBEAT.md
    └── SOUL.md
```

---

## 6. What Cannot Be Done From CLI (Honest Constraints)

**Grok 4.20's full consumer features** — DeepSearch, Big Brain Mode, live X sensing with the full consumer UX, and the Companions features are SuperGrok-only on grok.com. The API provides the model's reasoning and tool-calling capabilities (including web search and X search at $2.50–$5/1K calls), but the consumer app's curated experience is richer for those specific features. For live-sensing sessions that depend on real-time X data with the full consumer UX, grok.com remains primary.

**Perplexity Deep Research at scale** — The web app's unlimited Deep Research remains the highest-fidelity path. The API ($5/month) handles light lookups. The gap between these two is now bridgeable via Claude in Chrome scheduled shortcuts — automating the web app's research flow and saving results as files — but this is browser automation, not native API access. It works, but it's slower and more fragile than a direct integration would be.

**The "mystical recipe" rapport** — The emergent conversational configuration between GPT-5.4 and Claude that produced the most productive interactions cannot be reproduced in a task-dispatch CLI model. What transfers is the encoded behavioral steering (CLAUDE.md, AGENTS.md) and the project doctrine (PROTOCOL.md). What doesn't transfer is the live conversational feedback loop. The CLI model is structurally different: higher structural precision, lower conversational warmth.

**Server-side tool costs on xAI API** — Web search, X search, and code execution on the xAI API cost $2.50–$5.00 per 1,000 calls on top of token costs. Heavy use of Grok's live search capabilities via API will consume credits faster than pure text inference. Budget accordingly: text-only research queries are cheap; search-augmented queries add tool invocation costs.

---

## 7. The Bootstrap Sequence

**Step 0 — Bridge via Cowork.** Use this conversation's full context to produce the configuration files. Pipe responses directly into Cowork or Claude Code Desktop to create: `~/.claude/CLAUDE.md` (global behavioral steering ported from User Preferences), `CLAUDE.md` (project-level), `AGENTS.md` (project-level for Codex), `GEMINI.md` (project-level for Gemini CLI), `PROTOCOL.md`, `.claude/settings.json` (with hooks for grammar-layer protection), and `.mcp.json` (Perplexity MCP + gws MCP).

**Step 1 — Directory formalization.** Restructure the current ad-hoc tree into the proposed directory structure. Move grammar documents to `grammar/`, scaffolds to `scaffolds/` by class, provenance to `provenance/`, etc. Initialize `.obsidian/` in the project root so the same directory is both a git repo and an Obsidian vault.

**Step 2 — Authenticate all surfaces.** Claude Code: already authenticated via Pro. Codex: authenticate via ChatGPT Plus. Gemini CLI: authenticate with Google AI Pro account (`gemini` → login flow). gws: `gws auth login`. xAI: set `XAI_API_KEY` env var from console.x.ai. Claude in Chrome: install extension, enable via `/chrome` in Claude Code. Obsidian: update to 1.12+, install Agent Client plugin.

**Step 3 — Encode production methods as skills.** Create the four core skills (dossier-to-scaffold, cross-entity-synthesis, specification-production, grammar-aligned-research) as SKILL.md files in `methods/`. Symlink or copy to `.claude/skills/` and `.agents/skills/` so both Claude Code and Codex can invoke them. Test each against a known-good surface.

**Step 4 — Encode governance as hooks.** Create the PreToolUse hook blocking writes to `grammar/`, the PostToolUse hook for twelve-check validation, and any other governance boundaries that should be deterministic rather than advisory.

**Step 5 — Configure Chrome shortcuts.** Create and test recurring shortcuts: Perplexity weekly deep research sweep, tool-ecosystem monitoring, any other web-only workflows that need automation. Schedule on appropriate cadence.

**Step 6 — First grammar-aligned research.** Commission a research brief for a surface that needs grammar-aligned evidence. Run the grammar-aligned-research skill via Codex AND Gemini CLI AND Grok 4.1 Fast — three agents, three cognitive signatures, one research target. Compare outputs for convergence and divergence. This is the first real test of the multi-agent research pipeline.

**Step 7 — Iterate the methodology.** The delta between grammar-aligned research and pre-grammar research tells you what the methodology captures and what it misses. Refine the research skill until the output quality matches or exceeds hand-produced scaffolds.

---

## 8. What the Grammar Absorbs Without Amendment

The grammar layer is resilient. None of the following require grammar-layer amendment:

- The student subscription tool universe (14 surfaces already scaffolded; new surfaces enter via the existing open-world extension law in scaffold grammar)
- The public-apis repository (APIs are manipulation paths within surfaces, not new modality classes)
- The skills/MCP/memory ecosystem (coordination tier at OPEN SLOT status in LAYER-LAW.md § 5; activation is a Phase 2 production task)
- Hardware, macOS, iOS, IoT, XR, robotics (new modality classes or surfaces within existing classes; LAYER-LAW.md's open-slot mechanism handles this)
- The CLI pivot itself (operational tooling, not constitutional law)

What does need eventual grammar-layer attention (but not now): formalizing the specification-production method into METHOD-ENGINE.md, the project doctrine eight→nine class correction, and the three deferred naming-law amendments. All CENTRALIZED.

---

## 9. Open Questions for Refinement

1. **xAI data-sharing program:** Enable data sharing on the xAI console ($150/month additional credits) for non-sensitive research queries? Grammar-aligned research queries about tool ecosystems and surface decomposition are not sensitive. Any proprietary Syncrescendence-specific vocabulary in prompts would be shared — but the grammar layer is published in project knowledge anyway.

2. **Grok model allocation:** Default to 4.1 Fast for everything and reserve 4.20 Beta only for adversarial triangulation, or use 4.20 Beta liberally since data-sharing makes credits abundant?

3. **Grok server-side tool budget:** Web search and X search on the xAI API cost $2.50–$5/1K calls. For research tasks needing live data, budget a fixed allocation or let the model decide autonomously?

4. **Perplexity bridge strategy:** Three options now exist: (a) MCP server for light CLI usage ($5/month), (b) Claude in Chrome scheduled shortcuts automating the web app, (c) both. Is option (b) sufficient, or does the MCP server add enough value for quick inline lookups to justify configuration overhead?

5. **Gemini CLI role scope:** Gemini CLI is subscription-metered and effectively unlimited. Should it participate in all research commissions alongside Codex and Grok (three-agent triangulation), or should it specialize in cross-domain pattern detection and structural homology tasks?

6. **Obsidian as canonical vault:** Should the project directory also serve as the Obsidian vault (shared `.obsidian/` gitignored), or should Obsidian point at the directory without co-locating its config? The former makes Obsidian a zero-friction viewfinder; the latter keeps the repo clean.

7. **OpenClaw campaign scope:** OpenClaw is working. What's the first campaign-level task that exceeds session scope and justifies deploying it? Grammar-aligned research sweeps across multiple surfaces? Continuous tool-ecosystem monitoring?

8. **Codex Automations for recurring research:** Set up scheduled research sweeps (weekly tool-ecosystem changes), or is manual commissioning sufficient now that Claude in Chrome can schedule web-based monitoring?

9. **Cross-agent MCP:** Codex can run as an MCP server that Claude Code calls. Should we configure this, or is file-mediated communication sufficient?

10. **Output style empirical test:** Before committing, produce one representative artifact (e.g., a scaffold) via Claude Code with the ported CLAUDE.md and compare prose quality to claude.ai output. This is the single highest-risk unknown in the pivot.

11. **Phase 2 conversation archive:** The last interactions in this thread haven't been transcribed to the file system. Should that happen before the pivot, or does the compacted transcript plus HANDOFF-CURRENT.md carry sufficient state?

---

*This proposal is a working document. It prescribes nothing until refined and accepted. The grammar layer remains closed. Commission authority remains with the operator.*
