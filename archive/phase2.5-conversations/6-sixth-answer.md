Good questions. Let me hunt down precise answers.Now I have the full picture. Let me address each question precisely, then synthesize.

---

## Cowork's Config Inheritance

Cowork has its own "Global instructions" accessible via Settings → Cowork within Claude Desktop — you type your preferred tone, output format, or background on your role. It also reads CLAUDE.md files from whatever folder you point it at. Cowork and Claude Code share "the same brain" — the same model, the same CLAUDE.md, and the same web connectors. If you write a CLAUDE.md in your working folder, both Cowork and Claude Code read it identically.

However — and this is the critical distinction — Claude.ai has three layers: User Preferences (Settings → Profile, applies to every conversation), Project Instructions (per-project), and Styles (communication format). The User Preferences from claude.ai are injected at the system level into claude.ai chat conversations. **They do not automatically propagate to Claude Code or Cowork.** When using Claude Code, "they stack — your User Preferences load first (your working style), then CLAUDE.md adds project-specific context on top." But that stacking only applies within the claude.ai ecosystem (Chat tab). Cowork and Code read CLAUDE.md; they don't read the User Preferences field from your claude.ai profile settings.

So the answer to "can Cowork be the middleman that emulates claude.ai best?" is: **almost, but you have to manually replicate your User Preferences into either Cowork's Global Instructions or a CLAUDE.md file.** The behavioral steering that lives in your ~16K-character XML User Preferences needs to be ported. The good news is that this is a one-time operation — put the content in `~/.claude/CLAUDE.md` (global) and it applies to both Cowork and Claude Code sessions. The writing style, cognitive profile, anti-patterns, response scaling, epistemic labeling — all of it can live there.

Can you override Cowork to behave more like claude.ai? Functionally yes: Cowork's Global Instructions + CLAUDE.md + the folder context files give you the same behavioral steering surface. The difference is execution environment (VM sandbox vs. browser), not model behavior. The model reads the same instructions either way.

---

## Codex Desktop App Usage Boost

You're right to flag this. For a limited time, OpenAI is including Codex with ChatGPT Free and Go, and doubling the rate limits on Plus, Pro, Business, Enterprise, and Edu plans — those higher limits apply everywhere: app, CLI, IDE, and cloud. The doubling is across all surfaces, not app-specific. I didn't find a specific April cutoff date in the search results, but the "limited time" framing suggests it's promotional. Worth taking advantage of now for research-intensive work.

The Codex-as-MCP-server capability you flagged is genuinely powerful — Codex can run as an MCP server and be orchestrated by other MCP clients, including agents built with the OpenAI Agents SDK — but it uses API access, not subscription credits. The desktop app's doubled rate limits are the better lever for heavy research usage right now.

---

## Deep Research from the CLI

This is solved. Multiple paths exist.

There's an enterprise-grade deep research skill for Claude Code with an 8-phase pipeline (Scope → Plan → Retrieve → Triangulate → Outline → Synthesize → Critique → Refine → Package), multiple research modes (Quick, Standard, Deep, UltraDeep), and an auto-continuation system achieving unlimited length through recursive agent spawning. This is precisely the kind of deep research capability you've been doing in chat, but now it runs in Claude Code with file output and parallel sub-agent execution. It lives at `~/.claude/skills/deep-research/`.

Beyond that dedicated skill, Claude Code has built-in subagent capabilities — you can create custom subagents with research-specific configurations, spawning multiple parallel research agents that each work with their own context window. The subagent pattern's key benefit is that intermediate reasoning, dead ends, and search queries are discarded once the subagent finishes — none of it compounds into the main agent's context. This is structurally superior to chat-based deep research where everything accumulates in a single context window.

There's even a community skill that "decomposes research goals into parallel sub-objectives, spawns `claude -p` sub-processes, aggregates results, and delivers polished reports" with structured logging and chapter-by-chapter refinement.

---

## Grok CLI Status

xAI has confirmed that an official Grok CLI is coming but hasn't shared a launch date. What exists now is a community-built third-party tool. The open-source grok-cli (`@vibe-kit/grok-cli`) provides a conversational AI CLI powered by Grok with file operations, bash integration, and MCP support, using the xAI API. It requires an xAI API key (which you'd get through SuperGrok or a separate API subscription).

Grok Build, xAI's official local-first coding agent, was announced January 2026 and remains on a waitlist as of March 2026. It supports up to eight parallel agents, Arena Mode (automated evaluation of competing agent outputs), and GitHub integration — but it's not publicly available yet.

The practical path right now: use the community grok-cli with your xAI API key (which your SuperGrok subscription provides via api.x.ai), or — more powerfully — use Grok's models as a provider within Claude Code or Codex via their OpenAI-compatible API endpoint. Grok CLI uses OpenAI-compatible APIs, meaning "you can use any provider that implements the OpenAI chat completions standard." The reverse is also true: Claude Code and Codex can call Grok's models via MCP or direct API calls.

---

## Perplexity from the CLI

This is comprehensively solved through MCP. Perplexity has an official MCP server providing four tools: direct web search (Search API), general-purpose chat with web search (sonar-pro), deep comprehensive research (sonar-deep-research), and advanced reasoning (sonar-reasoning-pro). Installation is one command:

`claude mcp add perplexity --env PERPLEXITY_API_KEY="your_key" -- npx -y @perplexity-ai/mcp-server`

For Codex: `codex mcp add perplexity --env PERPLEXITY_API_KEY="your_key" -- npx -y @perplexity-ai/mcp-server`

There's also a dedicated Perplexity agent skill that uses the Perplexity CLI directly via bash, with lower token usage and faster execution than the MCP approach. Perplexity Pro subscribers get $5 in free API credits each month, which extends your subscription into the CLI world.

One significant development to note: Perplexity's CTO announced at Ask 2026 (March 11) that the company is moving away from MCP toward APIs and CLIs, citing high context window consumption and clunky authentication. They launched an Agent API — a single endpoint routing to models from OpenAI, Anthropic, Google, xAI, and NVIDIA with built-in web search. This means the integration path may shift from MCP to direct API calls, but both work now.

---

## What Else You Should Be Searching For

Several domains surfaced in the research that you haven't mentioned but that bear directly on your operational architecture:

**Skills marketplaces and cross-agent compatibility.** The universal SKILL.md format now works across Claude Code, Cursor, Gemini CLI, Codex CLI, and Antigravity IDE. There are curated repositories of 1,234+ agent skills organized by category, including deep research, scientific literature review, company research, and customer journey mapping skills. This is the tool-ecosystem layer your grammar predicted but didn't activate — and it's growing faster than any single institution can scaffold.

**Google Workspace CLI (gws).** Google shipped `gws` in March 2026 — a CLI that dynamically discovers all Google Workspace APIs through Google's Discovery Service and exposes them as a unified interface, with a built-in MCP server. One command and your AI agent has full Workspace access: Drive, Gmail, Calendar, Sheets. This is directly relevant to your research methodology — grammar-aligned research briefs could be dispatched through Claude Code, results stored in Drive, and cross-referenced via Sheets.

**Hooks as governance infrastructure.** Unlike CLAUDE.md instructions which are advisory, hooks are deterministic — they fire every time at specific points in Claude's workflow. A PreToolUse hook that blocks writes to grammar-layer files is an enforceable governance boundary. A PostToolUse hook that validates scaffold output against the twelve-check schema is automated quality control. This is the operational instantiation of the authority lattice — delegation with technical enforcement rather than just instructional compliance.

**Pipedream MCP as universal connector.** Pipedream MCP is a free platform that connects to 1,000+ APIs and apps with a single MCP server — add it once and Claude Code/Codex can reach essentially any service with an API. This collapses the "how do we connect to all these tools" question into a single integration point.

**Auto Memory in Claude Code.** Claude Code now has Auto Memory — it automatically saves patterns, preferences, and decisions to a MEMORY.md file per workspace, persisting across sessions with no setup needed. This is the cross-session persistence that Cowork lacks and that the handoff protocol was designed to compensate for. It doesn't replace HANDOFF-CURRENT.md (which carries institutional state), but it captures the behavioral and stylistic patterns that previously required conversational accumulation.

**Codex multi-agent workflows.** Codex supports multi-agent workflows to parallelize larger tasks, with role configuration via `[agents]` in config.toml. Combined with Codex Automations (scheduled background tasks with review queues), this gives the GPT-5.4 side of the operation a structured mechanism for recurring research sweeps — the sensing method instantiated as an Automation.

The solution space you're looking for is not a single tool configuration. It's a **protocol layer** — PROTOCOL.md at the project root — that governs how Claude Code (synthesis/architecture), Codex (research/frontier-execution), Perplexity (web-grounded research via MCP), and Grok (live-sensing via API) collaborate through a shared filesystem with grammar-aligned production methods encoded as skills and governance boundaries encoded as hooks. The grammar layer already describes this architecture in abstract terms. The CLI pivot is where it becomes concrete.