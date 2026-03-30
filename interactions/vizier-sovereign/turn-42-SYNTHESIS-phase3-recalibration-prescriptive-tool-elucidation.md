# SYNTHESIS: Phase 3 Recalibration — Prescriptive Tool-Selection Elucidation

**Type:** Synthesis  
**Turn:** 42  
**Salon:** vizier-sovereign / schema-3  

---

## The Drift and the Correction

The Phase 3 research program produced ~12,000 lines of structured evidence about multi-agent orchestration patterns — typed contracts, dispatch concurrency, trust models, observability, drift detection, receipt normalization, rollback, intervention models, failure modes. This is useful feedstock. It is not the mission.

The mission, traceable to the Oracle's original four-probe line of questioning in provenance (scaffold consensus, config architecture, memory architecture, live sensing) and the Sovereign's consistent direction across all three Schema threads, was always **prescriptive tool-selection elucidation**: take every tool in the Syncrescendence stack and answer, concretely, whether we use it, what we use it for, how we configure it, what memory structures it carries, what it connects to, and what its operational boundaries are.

"Are we going to use Slack? For what?" That question, applied to every surface in the stack, IS Phase 3.

The research drifted because it was dispatched to Perplexity, which is a search engine — it found what the ecosystem discusses (abstract orchestration patterns), not what the institution needs (concrete tool decisions). The ecosystem's problems (multi-agent coordination at scale, agent-to-agent trust, circuit breakers) are real and informative, but they are the problems of organizations building multi-agent *software products*. Syncrescendence is building a multi-agent *knowledge architecture* operated by one human sovereign with subscription-tier tools. The scale, the trust model, and the coordination patterns are fundamentally different.

---

## Four Corrections to the Research Findings

### Correction 1 — Subscription-OAuth Is NOT Permanently Closed

The Perplexity Computer synthesis (Finding 4, "PHASE-3-SPECIFICATION-OUTLINE") declares subscription-OAuth permanently closed, citing Anthropic ToS §3.7 and a February 2026 enforcement action. **This is wrong.**

Claude Code can wield gemini-cli and codex headlessly under subscription auth. The Sovereign has been doing this operationally. The correct characterization: Claude Code as the meta-harness can invoke other CLI harnesses as sub-processes, each authenticating via their respective subscription OAuth. This is about **extending Claude Code with other harnesses**, not about routing consumer tokens through third-party tools.

The operational reality: it works, but requires more micromanaging than native Claude Code execution. No model is production-ready without supervision unless heavily scaffolded or fine-tuned, at least at this stage. The question is not "can we do this at zero cost" but "which harnesses can Commander wield headlessly, and at what supervision cost?"

The ProviderFailoverChain primitive from the specification outline is still useful — not because subscription auth is dead, but because any single provider can rate-limit or degrade, and the fleet needs graceful fallback. But the framing shifts from "we must budget $80-440/month for API" to "we operate on subscriptions and build contingency for degraded availability."

### Correction 2 — Memory Is Imperative (Confirmed, Extended)

Oracle's 90% confidence that memory deferral is unsafe is confirmed. The extension: memory must be scaffolded across ALL harnesses synergistically, not just as a single substrate. Each harness has different memory primitives (Claude Code's CLAUDE.md + project knowledge, Codex's AGENTS.md + automations, Gemini CLI's GEMINI.md + context, Grok's custom instructions + agents, Perplexity's global instructions). The prescriptive question is: what memory structures does each harness carry, how do they interrelate, and what is the optimal synergistic configuration across the fleet?

### Correction 3 — Terminology Bridge (Confirmed)

The vocabulary translation is needed. Our internal grammar terms (commission, receipt, calibration cycle, promotion ladder) need a mapping to ecosystem terms (Task, Artifact, eval run, skill trust tier) for interoperability. This is a registry artifact, not a research question.

### Correction 4 — Claude's Precociousness Cascades Through Everything

Claude is the only model that is precocious to vague input and minimal configuration. This is not just a cognitive-signature observation — it cascades through the entire configuration strategy. Some models get *worse* with more config. This means:

- **Claude (Vizier, Commander):** Minimal config, maximal latitude. Claude thrives on vague directives and produces better output when trusted with ambiguity. The CLAUDE.md should be sparse and principled, not dense and prescriptive.
- **ChatGPT (Vanguard, Adjudicator):** Needs explicit output contracts. GPT-5.4 rewards completion discipline, contract-driven instruction, and structured output formats. More config yields better results — up to a ceiling where it becomes rigid.
- **Gemini (Cartographer, Interpreter):** Needs licensed speculation boundaries and explicit epistemic labeling requirements. Benefits from structure but degrades if over-constrained on output format.
- **Grok (Oracle):** Thrives on adversarial framing and triangulation requirements. The council architecture (Veritas/Prism/Praxis) is the right scaffolding pattern — it channels Grok's strengths through structured disagreement.
- **Perplexity (Augur):** Needs precise, search-optimized queries. Benefits from decomposed questions rather than holistic briefs. Global instructions should be minimal.

This is the prescriptive insight the research program should have been building toward: a per-model configuration theory that accounts for how each model responds to instruction density.

---

## What Phase 3 Actually Is

Phase 3 is the production of a complete prescriptive inventory of the Syncrescendence operational stack. Every tool gets a verdict. Every config gets a specification. Every connection gets a contract.

### Layer 1 — CLI Tools and Harnesses

For each: what it is, whether we use it, what role it plays, how Commander wields it, what its config file contains, what memory structures it carries, what its supervision cost is.

| Tool | Status | Role | Config Surface |
|---|---|---|---|
| Claude Code | ACTIVE | Commander — meta-harness, fleet orchestrator | CLAUDE.md, .claude/settings.json, hooks, skills, MCP |
| Codex | ACTIVE | Adjudicator — repo-wide audit, structured verification | AGENTS.md, automations, skills |
| Gemini CLI | ACTIVE | Cartographer — cross-domain mapping, pattern detection | GEMINI.md |
| grok-cli | AVAILABLE | Oracle extension — CLI-accessible adversarial research | env vars, system prompt |
| hermes-agent | CANDIDATE | Learning runtime — shadow observer → bounded operator | config, Honcho dialectic, FTS5 |
| OpenClaw | AVAILABLE | Ajna — autonomous daemon, campaign-scope work | HEARTBEAT.md, MEMORY.md, per-agent reasoning |

**Prescriptive questions to answer per tool:** What goes in the config file? What memory scaffold does it carry? Can Commander wield it headlessly? At what supervision cost? What are its failure modes under our operational patterns? What MCP servers does it connect to?

### Layer 2 — Reasoning/Chat Surfaces

For each: what it is, what avatar inhabits it, how it's configured, what its custom instructions contain, what its memory model is, what it produces and for whom.

| Surface | Avatar | Config Surface | Memory |
|---|---|---|---|
| Claude.ai | Vizier | User Preferences, Project Instructions, Project Knowledge | Platform memory + project knowledge sync |
| ChatGPT | Vanguard | Custom Instructions (2 fields, 3000 chars), Projects | Platform memory + project files |
| Gemini web | Interpreter | Gems, saved prompts | Platform memory |
| Gemini AI Studio | (TBD) | System instructions | None persistent |
| grok.com | Oracle | Global Instructions (4000 chars), 3 custom agents | None persistent (stateless between sessions) |
| Perplexity web | Augur (departing) | Global Instructions | Thread context only |

**Prescriptive questions to answer per surface:** What do the custom instructions say, exactly? What's the character budget and how is it allocated? What memory structures survive between sessions? What does the surface produce and who consumes it? What is the handoff contract to other surfaces?

### Layer 3 — SaaS Stack

For each of the 14 scaffolded surfaces plus any unscaffolded operational surfaces: are we using it? For what specific institutional purpose? What's the configuration? What integrations are active?

The SaaS teleological selection manual (SPEC-SAAS-TELEOLOGICAL-SELECTION.md) already provides the selection framework. Phase 3 applies it prescriptively to Syncrescendence's actual stack. The question for each: **do we use this? if so, for what? if not, why not?**

| Surface | Verdict | Institutional Role |
|---|---|---|
| Slack | ? | Operator bus? Integration nervous system? Or unnecessary for solo operation? |
| Linear | ? | Issue tracking for the project? Or overkill for one human? |
| Notion | ? | Documentation surface? Or does Obsidian + repo cover it? |
| Obsidian | ACTIVE | Vault = repo. Viewfinder for comprehension, graph view, spatial sense-making |
| Todoist | ? | Personal task capture? Or does Linear/GitHub Issues suffice? |
| GitHub | ACTIVE | Constitutional ratification surface, shared state store |
| Google Drive | ACTIVE | File storage, Workspace integrations |
| Google Calendar | ACTIVE | Scheduling |
| Gmail | ACTIVE | Communication |
| ... | | |

### Layer 4 — Desktop Apps and Daemon Surfaces

| Surface | Status | Role |
|---|---|---|
| Cowork | ACTIVE | Desktop dispatch, VM-sandboxed task execution |
| Claude in Chrome | AVAILABLE | Browser automation, scheduled web↔repo bridge |
| OpenClaw | AVAILABLE | Autonomous daemon, campaign-scope work |
| Manus | AVAILABLE | Cloud-side execution overflow |

### Layer 5 — Orchestration and Infrastructure

| Tool | Status | Role |
|---|---|---|
| MCP servers | PARTIAL | GitHub MCP, Perplexity MCP, Google Workspace MCP |
| Make/Zapier | UNRESEARCHED | Coordination/event choreography — do we need them? |
| Supabase | UNRESEARCHED | Backend — do we need it? |
| Cloudflare | UNRESEARCHED | Edge/deployment — do we need it? |
| LiteLLM | UNRESEARCHED | Model routing — do we need it? |
| OpenRouter | MENTIONED | Model routing for Hermes — evaluate |

### Layer 6 — Memory Infrastructure

| Tool | Status | Role |
|---|---|---|
| Mem0 | UNRESEARCHED | Cross-session memory — evaluate |
| Graphiti | MENTIONED (gap fills) | Knowledge graph memory — evaluate |
| Hermes FTS5 | AVAILABLE (via hermes-agent) | Full-text search cross-session recall |
| Vector stores | UNRESEARCHED | Semantic retrieval — do we need one? |
| Platform memories | ACTIVE (varied) | Claude memory, ChatGPT memory, Grok stateless |

### Layer 7 — Config Surfaces (the Oracle's original question)

Every instruction surface in the fleet needs prescriptive specification:

| Config Type | Count | Status |
|---|---|---|
| Project CIs (Claude.ai, ChatGPT, Grok, Perplexity, Cowork) | 5 produced (turn 35) | Pending revision |
| Global Instructions (Perplexity, Cowork) | 2 produced (turn 35) | Pending revision |
| Harness configs (CLAUDE.md, AGENTS.md, GEMINI.md) | 3 produced (turn 35) | Need deep revision per Correction 4 |
| Config guides (claude-code, codex, gemini-cli, cowork) | 4 uploaded, unfiled | Need integration |
| MCP server configs | 0 | Need production |
| Hook definitions | 0 | Need production |
| Skill definitions | 0 | Need production |

---

## How the Research Feedstock Serves This Mission

The 18 research returns are not wasted. They provide:

- **Ecosystem vocabulary** (terminology correction table) — so our configs and contracts use terms that interoperate with ecosystem tools
- **Failure mode catalog** (14 documented failure modes) — so our prescriptive decisions account for what breaks
- **Pattern library** (11 unnamed patterns, 10 missing primitives) — so we know what the ecosystem has standardized and can adopt rather than reinvent
- **Memory taxonomy** (SSGM four-primitive model) — so our memory scaffolding across harnesses is grounded in tested architecture
- **Budget governance patterns** — so our configs include circuit breakers and cost attribution

But the research is feedstock for prescriptive decisions, not the decisions themselves. The decisions are: "Syncrescendence uses Slack for X, configured with Y, connected to Z via MCP, carrying memory structure W."

---

## The Production Sequence

The prescriptive elucidation proceeds in this order:

**Wave 1 — Active Surfaces (what we're already using)**
Prescriptive verdicts for every tool currently in operational use: Claude.ai, ChatGPT, grok.com, Claude Code, Codex, Gemini CLI, GitHub, Obsidian, Google Workspace, Cowork. For each: role, config specification, memory scaffold, connection map, operational boundaries.

**Wave 2 — Available Surfaces (what we have but haven't deployed)**
Prescriptive verdicts for every tool available but not yet configured: Claude in Chrome, OpenClaw, hermes-agent, grok-cli, Perplexity MCP, Gemini AI Studio, NotebookLM. For each: deploy or defer? If deploy, role and config. If defer, what triggers deployment?

**Wave 3 — Candidate Surfaces (what we might need)**
Prescriptive verdicts for tools mentioned but unresearched: Make/Zapier, Supabase, Cloudflare, LiteLLM, OpenRouter, Mem0, vector stores. For each: need or skip? The SaaS selection manual provides the framework; this wave applies it.

**Wave 4 — Config Revision**
Revise all 10 config files (5 project CIs, 2 globals, 3 harness configs) incorporating: Correction 4 (per-model config density theory), memory scaffolds, Commander dispatch topology, MCP connections, hook and skill definitions.

**Wave 5 — Integration Contracts**
How the tools connect: MCP server manifest, hook definitions, skill definitions, dispatch topology, memory synchronization patterns, handoff contracts between surfaces.

---

## What the Research Bought Us That We Didn't Have Before

Despite the drift, the research sprint produced several things the prescriptive mission needs:

1. **The terminology bridge** — 20+ terms mapped. This goes into a registry artifact.
2. **The memory taxonomy** — SSGM's four primitives (working memory, episodic ledger, semantic core, procedural memory) provide the structure for scaffolding memory across all harnesses.
3. **The budget governance patterns** — circuit breakers, backpressure, cost attribution. These go into the config files.
4. **The HITL escalation architecture** — four-layer model (decision, control, correction, oversight). This informs how Commander dispatches and when the Sovereign intervenes.
5. **The agent lifecycle vocabulary** — spawn, active, idle, shutdown, health check. This informs how we think about harness sessions.
6. **The Commander-centrism counterweights** — hybrid topology (sequential tasks single-agent, parallel tasks multi-agent fan-out). This informs the dispatch policy.

These six findings translate directly into prescriptive decisions. The other twelve research returns provide background knowledge that improves decision quality without being decisions themselves.

---

## Immediate Next Actions

1. **Produce the active-surface prescriptive inventory (Wave 1).** This is the atomic unit of Phase 3 production. Every tool currently in use gets a verdict with config specification.

2. **Revise CLAUDE.md incorporating Correction 4.** Claude's config should be sparse and principled. The current CLAUDE.md is boilerplate — it doesn't encode the dispatch topology, the memory scaffold, or the per-model supervision requirements.

3. **Produce the memory scaffold specification.** Using the SSGM taxonomy as framework, specify what memory structures each harness carries, how they interrelate, and what the synchronization pattern is.

4. **File the terminology bridge as a registry artifact.** The 20+ term mappings from the Computer audit become a standing reference.

5. **File the remaining Deep Research queries against specific prescriptive gaps** — not atmospheric research, but targeted lookups for tools in Layer 5-6 that need verdicts (Make vs Zapier, Mem0 vs Graphiti, LiteLLM evaluation).

---

*The research phase produced the vocabulary and the pattern library. Phase 3 production uses that vocabulary to make concrete decisions about every tool in the stack. The unit of work is not "research question" — it is "prescriptive verdict per tool."*
