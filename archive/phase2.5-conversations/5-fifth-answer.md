Let me conduct the research systematically. Multiple searches needed.Good. I now have comprehensive ground truth across all the surfaces. Let me synthesize this into the response you need. This is going to be dense.

---

## Configuration Hierarchies — Precise Ground Truth

**Claude Code's instruction hierarchy** (from highest to lowest precedence):

The behavioral steering stack is: Anthropic's system prompt (unpublished, not overridable) → Managed settings (enterprise MDM/server-managed, cannot be overridden) → User settings (`~/.claude/settings.json`) → Project settings (`.claude/settings.json`, checked into git) → Local project settings (`.claude/settings.local.json`, gitignored) → CLAUDE.md files (loaded hierarchically: `~/.claude/CLAUDE.md` global → `./CLAUDE.md` project root → child directories on demand → `CLAUDE.local.md` for personal overrides). For permissions specifically, deny rules are checked first, then ask, then allow, with first match winning. Array settings merge across scopes (they concatenate, not replace).

The critical insight: settings.json controls *behavior and permissions*. CLAUDE.md controls *knowledge, conventions, and context*. They serve different functions. Your User Preferences from claude.ai have no direct equivalent in Claude Code — the closest mapping is the global `~/.claude/CLAUDE.md` (for behavioral steering and cognitive profile) plus `~/.claude/settings.json` (for tool permissions and operational defaults). The writing style, anti-patterns, response scaling, and collaborative stance all belong in CLAUDE.md. The agentic defaults (what to confirm, what to proceed on) belong in settings.json permissions.

Additionally, Claude Code has **output styles** — accessible via `/output-style` or `/config`. There's even an undocumented feature: `@agent-output-mode-setup` which generates four custom output modes (Concise, Educational, Code Reviewer, Rapid Prototyping) in `~/.claude/output-modes/`. You can create custom output modes. This is a direct lever for prose quality — you can define a "constitutional synthesis" output mode that encodes the register, cadence, and anti-pattern discipline from the Claude.ai User Preferences.

Furthermore, Claude Code supports **skills** (`.claude/skills/SKILL.md` files) and **subagents** (`.claude/agents/` directories). Skills are progressively disclosed — Claude starts with just the metadata and loads full instructions only when relevant. This maps well to the grammar layer's method engine: each production method (dossier-to-scaffold, cross-entity synthesis, specification production) could be encoded as a skill with its own SKILL.md.

**Codex's instruction hierarchy:**

Codex reads AGENTS.md files before doing any work, building an instruction chain: Global scope (`~/.codex/AGENTS.md` or `AGENTS.override.md`) → Project scope (walking from project root to current working directory, checking `AGENTS.override.md` then `AGENTS.md` at each level). Override files take precedence at each level. The maximum combined size defaults to 32 KiB, configurable via `project_doc_max_bytes`. Codex also supports `config.toml` at `~/.codex/config.toml` for operational settings (model selection, sandbox policy, provider configuration, feature flags).

Codex supports skills as directories with SKILL.md files, scanned from repository and user locations, with progressive disclosure — metadata loaded first, full instructions only when triggered. Codex supports a `/personality` command: choosing between a terse pragmatic style and a more conversational one, without changing capability. This is more limited than Claude Code's output styles but serves a similar function.

The Codex desktop app (macOS, launched Feb 2026; Windows March 2026) shares configuration with the CLI. Custom instructions in the app map to personal `AGENTS.md` under the hood. The app, CLI, and IDE extension share MCP settings — configure in one, adopted by all.

**Should Claude Code and Codex share instructions?** They should share *project-level* instructions (the grammar layer, the project doctrine, the naming conventions, the directory structure) but maintain *separate global instructions* (the behavioral steering, the output style, the cognitive-profile accommodation). The reason: the same project doctrine applies regardless of which agent is executing, but the behavioral steering needs to be model-specific. Claude's prose craft responds to different levers than GPT-5.4's contract-driven execution. The shared layer is PROTOCOL.md (or an equivalent project-root document both agents read). The divergent layer is `~/.claude/CLAUDE.md` vs `~/.codex/AGENTS.md`.

---

## CLI vs Desktop App — Distinctions That Matter

**Claude Code CLI vs Claude Desktop app:** The Claude Desktop app has three tabs: Chat, Cowork, and Code. The Code tab *is* Claude Code running inside the desktop app rather than a separate terminal. Your CLAUDE.md, web connectors, and settings carry over between Cowork and Code — they're tied to your account. The CLI and the Desktop Code tab share session history and configuration. The functional difference: the Desktop app provides visual diffs, a sidebar explorer, and the Cowork tab. The CLI provides scripting, piping, `--print` mode for non-interactive execution, and autonomous loops (`while true; do claude "..."; done`).

**Claude Cowork specifically:** Cowork runs in a virtual machine (Apple Virtualization Framework on macOS), isolating it from the broader filesystem. It operates on user-designated folders. The same CLAUDE.md that Cowork reads works in Code — Claude reads it at the start of every session. This is the key operational insight for your workflow: you can pipe this conversation's output into Cowork to build the configuration files, and those files will immediately work in Claude Code because they share the same instruction-reading mechanism.

**Codex CLI vs Codex Desktop app:** Both connect to the same underlying model and share configuration. The CLI is faster for quick tasks and has full feature parity. The app provides visual project management, thread naming, parallel agent orchestration, and a review queue. The app adds multi-agent orchestration, Git worktrees, Skills management UI, and Automations — scheduled background tasks. The practical difference for your workflow: the Codex app is the better surface for *research tasks* (long-running, multi-step, review-oriented) while the CLI is better for *quick execution* (single-command tasks, scripting).

---

## The Prose Quality Question

This is the load-bearing uncertainty. Can Claude Code produce the same prose quality as claude.ai?

The evidence is mixed but encouraging. One writer who switched from claude.ai to Claude Code for prose work reports that the key insight was separating *generating* (where Claude excels) from *editing* (where traditional tools win), and that Claude Code's file-based workflow enables seamless switching between the two modes. The model is the same (Opus 4.6 or Sonnet 4.6). The behavioral steering is different — CLAUDE.md vs User Preferences. The output styles feature provides a direct lever. Anthropic's own prompting best practices now include an explicit `<avoid_excessive_markdown_and_bullet_points>` directive that instructs Claude to write in "clear, flowing prose using complete paragraphs and sentences" — meaning the model *can* be steered to prose quality through instruction.

The solution space: encode the full User Preferences XML content into CLAUDE.md (the model already knows how to interpret it). Create a custom output mode via `/output-style` or the output-modes directory that enforces the register, cadence, and anti-patterns. Use skills for structured production tasks (scaffold production, cross-entity synthesis, specification extraction) where the output format matters. Test empirically against a representative task.

For Codex, the `/personality` command is more limited. Skills are the stronger lever — you can create a "constitutional prose" skill that Codex loads when producing documents. The AGENTS.md can encode writing quality directives. But GPT-5.4's prose tendencies are structurally different from Claude's — the CI provenance report already documents this. The expectation should be: Codex produces *research* and *structured evidence*; Claude Code produces *synthesis* and *final artifacts*. Division of labor by cognitive signature, exactly as the reasoning/chat teleological manual prescribes.

---

## The Grammar's Resilience

You're right that the grammar was prescient. The nine ratified documents don't need amendment for any of this. LAYER-LAW.md already has named slots for cloud/backend substrates, model-routing/memory layers, and a solopreneur open slot. The coordination tier (§ 5) is at OPEN SLOT status and is where MCP-as-coordination-protocol, skills marketplaces, and cross-surface integration standards would live. The harness taxonomy's convergent primitives already document MCP and skills as structural features of coding harnesses. The scaffold grammar's twelve-check validation works regardless of what the surface is — hardware, macOS apps, iOS apps, IoT, XR, robotics. The axes change per modality class, but the scaffold structure, the epistemic-labeling requirements, and the promotion pipeline are modality-agnostic.

The grammar was designed to absorb more dimensions without structural amendment. What it needs is *activation of the slots it already declared* — opening new modality classes as the tool universe expands — not revision of its constitutional structure.

---

## What You Didn't Mention That the Research Surfaced

**Codex as MCP server.** Codex can run as an MCP server and be orchestrated by other MCP clients, including agents built with the OpenAI Agents SDK. This means Claude Code could theoretically invoke Codex as a tool via MCP, and vice versa. The direct line of communication between the two agents doesn't have to be just the filesystem — it could be structured tool calls. This changes the interaction model from "asynchronous file exchange" to "structured inter-agent protocol." The grammar's coordination tier would govern this.

**Codex Automations.** The Codex app supports Automations — scheduled tasks that run in the background on a defined schedule, with results landing in a review queue. This is a direct fit for the sensing/research methodology: schedule a daily or weekly research sweep, results land for operator review. The sensing method could be partially automated.

**Claude Code hooks.** Hooks run scripts automatically at specific points in Claude's workflow — deterministic guarantees rather than advisory instructions. A PostToolUse hook could auto-validate scaffold outputs against the twelve-check schema. A PreToolUse hook could enforce scope boundaries (prevent writing to grammar-layer files). This is governance encoded in the harness, not just in the instructions.

**Claude Code subagents.** Subagents live as markdown files in `.claude/agents/` — each a specialized behavioral configuration. The grammar layer's method engine could be encoded as subagents: a "scaffold-producer" agent, a "synthesis-agent," a "specification-extractor." Each carries its own CLAUDE.md-equivalent instructions scoped to its production method.

**The public-apis repository.** This isn't just a list of free APIs — it's a structural map of the data layer that daemon/runtime and coding-harness surfaces can consume. The grammar doesn't need to scaffold each API. What it needs is a *data-source taxonomy* that classifies APIs by domain (weather, finance, government, etc.) and by access pattern (REST, GraphQL, streaming). This could be a new modality class or a cross-cutting concern within existing classes.

**Student subscription tools as modality-class candidates.** The subscription list maps across existing grammar slots: productivity tools (SaaS class, already scaffolded), dev tools (coding-harness class, already mature), cloud hosting (cloud/backend class, NONE status), AI tools (reasoning/chat class, already mature), design tools (potential new class or SaaS subclass), learning platforms (potential solopreneur-stack surface). The grammar's open-world extension law in the scaffold grammar handles the new-class question: enumerate first, then determine whether structural primitives warrant a new class or fit an existing one.

---

## The Backpropagation Question

You asked how to render this approach into higher fidelity. The metaphor is apt. The grammar layer is the loss function — it defines what "correct" means. The production methods are the forward pass — they generate artifacts. The missing piece is the backward pass — using the output quality to update the input methodology. Here's what that looks like concretely:

The first thing to build in the CLI environment is not more scaffolds. It's the **research methodology** — the SKILL.md files that encode grammar-aligned research prompts, the AGENTS.md that teaches Codex how to decompose a surface along axis sets, the CLAUDE.md that teaches Claude Code how to synthesize dossier evidence into scaffold-grade primitives. Test these against a known-good surface (Slack, which has the strongest dossier). Compare the output to the existing SCAFFOLD-SLACK.md. The delta between them tells you what the methodology captures and what it misses. Iterate the methodology until the output on the known-good surface matches or exceeds the hand-produced scaffold. Then deploy the methodology against fresh surfaces.

Second, the **directory structure** in your tree.txt needs formalization. The `_/` subdirectory for grammar documents is fine. The `phase1/` archive is fine. The `provenance/` subdirectory with its numbered categories is close but needs alignment with the grammar's modality classes. The production outputs (scaffolds, layer scaffolds, specifications, dossiers) need a governed directory convention that both agents read. I'd propose: `grammar/` (the nine ratified documents), `scaffolds/` (organized by modality class), `specifications/`, `dossiers/`, `methods/` (SKILL.md files encoding production methods), `briefs/` (research commissions), `handoff/` (HANDOFF-CURRENT.md and transition artifacts). The PROTOCOL.md at the root governs the directory convention and the inter-agent communication pattern.

Third, **the interaction model itself needs to be explicit**. Not "how do I configure the tools" but "what is the constitutional protocol for how two agents collaborate through a shared filesystem on a knowledge-architecture project." That protocol is a specification-class artifact — it prescribes how commissions flow (operator → brief file → agent), how outputs flow (agent → output file → operator review → acceptance), how handoff state is maintained (HANDOFF-CURRENT.md as the singular present-state artifact, same as before but now filesystem-native), and how inter-agent communication works (structured file exchange, or MCP tool calls, or both).

The tools are ready. The grammar is resilient. The configuration surfaces exist and are well-documented. What's missing is the methodology layer that connects "we have a grammar and we have tools" to "the tools produce grammar-aligned research and the research produces grammar-aligned scaffolds." That methodology is the next thing to build — and it should be built *in the CLI environment itself*, as SKILL.md and AGENTS.md files, tested against known-good surfaces, before being deployed against fresh territory.