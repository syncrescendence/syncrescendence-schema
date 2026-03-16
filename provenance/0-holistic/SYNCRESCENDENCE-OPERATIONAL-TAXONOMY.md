# Syncrescendence Operational Taxonomy

## Mereological Architecture

Six strata compose the system from atoms to organism. Each stratum carries: its definition, representative instantiations, a composition rule (how lower-stratum parts aggregate upward), a governance rule (how higher-stratum structures constrain downward), canonical artifacts with their data formats and storage locations, and the rationale that substantiates every architectural decision. The taxonomy supports bidirectional navigation — top-down from ecosystem telos to atomic execution, bottom-up from primitives to self-improving superorganism.


## Stratum 1: Atomic Primitives

**Definition.** Indivisible units of intent, steering, and epistemic marking. The smallest operable elements across all configuration surfaces.

**Instantiations.** A single directive ("always tag confidence"). A configuration key-value pair (`temperature: 1.0`). A prompt fragment ("architecture before examples"). An epistemic label (`<confidence>HIGH</confidence>`). A forbidden behavior ("no antithetical framing"). A YAML frontmatter field (`name: explain-code`). An MCP tool parameter schema entry. A freshness-decay threshold (`if days_since >= 90: STALE`).

**Composition rule.** Atoms aggregate via syntactic concatenation and semantic binding — Markdown prose, YAML key-value pairs, XML tags, JSON properties — into coherent triggerable modules at Stratum 2.

**Governance rule.** The anti-pattern catalog and universal prompt requirements (Stratum 3) enforce consistency and forbid ambiguity at the atomic level.

**Data structure.** Atoms embed within their host formats — they exist as constituent parts of configural modules, never as standalone artifacts. A directive lives within a custom instruction block (Markdown). A config value lives within a settings file (JSON/YAML). An epistemic label lives within a handoff envelope (XML/JSON). Atoms are the vocabulary; Stratum 2 provides the grammar.

**Rationale.** Identifying the atomic level prevents two failure modes: under-specification (instructions too vague to produce consistent behavior) and over-bundling (treating a complex instruction block as a monolithic unit when individual directives could be independently modified, reused, or debugged). The atom is the minimum unit of behavioral steering — splitting further loses operational meaning.


## Stratum 2: Configural Modules

**Definition.** Functional assemblies of atomic primitives carrying invocation logic, structural metadata, or parseable schemas. The snap-together building blocks of complete instruction sets.

**Instantiations.** A skill YAML frontmatter block (name, description, allowed-tools, invocation mode). A hook definition (lifecycle trigger, matcher, script path, exit-code semantics). A slash-command macro (prompt template with `$ARGUMENTS`). An optimized prompt block (reusable prompt pattern with variable slots). An MCP tool schema (name, description, parameter JSON schema, expected response format). A ledger entry template (Observed, Source, Confidence, Freshness, Tags, Observation, Implications, Cross-refs). A Notion database property schema (field names, types, formulas, relations). An epistemic-envelope contract definition.

**Composition rule.** Atoms combine through their host syntax (YAML/Markdown/XML/JSON) to produce auto-invokable or parseable units with progressive disclosure and conditional activation. A skill frontmatter block plus its Markdown body compose into a complete skill. A set of hook definitions compose into a lifecycle governance layer. A collection of database property definitions compose into a queryable intelligence substrate.

**Governance rule.** Instructional structures (Stratum 3) impose behavioral coherence and teleological alignment — every module serves a purpose defined at a higher stratum.

**Canonical artifacts, formats, and rationale.**

| Artifact | Format | Rationale |
|----------|--------|-----------|
| Skill definitions | Markdown + YAML frontmatter at `.claude/skills/[name]/SKILL.md` | Models consume natural-language instructions as prose; YAML carries structured metadata for invocation routing |
| Hook definitions | JSON in `.claude/settings.json` | Deterministic lifecycle execution requires exact event names, matchers, and exit codes — JSON's precision matches the behavior's precision |
| MCP server configs | JSON in platform settings | Protocol contracts require typed schemas; MCP's JSON-RPC 2.0 transport mandates JSON |
| Ledger entry templates | Markdown (human authoring) or JSON (agent/automation ingestion) | Dual-format serves dual consumers; the template lives in the Methodology Playbook (repo, Markdown) and instantiates as Notion database entries (structured properties + page body) |
| Database schemas | JSON in `schemas/` directory | Schema-as-contract: any agent can reference the JSON to generate correctly-structured entries; the schema is the interface agreement |

**Rationale.** Format decisions become consequential at this stratum. The format must match the consumer: models consume Markdown; automation consumes JSON; protocols consume structured schemas; humans consume either depending on context. Markdown where JSON is needed produces ambiguity in deterministic contexts. JSON where Markdown is needed produces hostility toward the human reader and the model's language understanding. The format is a fitness criterion — the right format for the right consumer at the right stratum.


## Stratum 3: Instructional Structures

**Definition.** Complete behavioral blueprints defining how an agent operates within any single context window or configuration surface. The constitutional documents of the system — the behavioral genomes that transform generic models into mission-aligned specialists.

**Instantiations.** A full custom instruction block (Claude's User Preferences XML, ChatGPT's two-field CI, Grok's global + agent blocks, Gemini's web app snippets or AI Studio system instruction). A complete SKILL.md body with supporting files. A per-model prompting formula (Grok's ten elements, Claude's constitutional framing, GPT's contract-driven protocol, Gemini's context-first sparsity). The Structural Primitives Codex. The Methodology Playbook. A CLAUDE.md project constitution. An onboarding packet (mission-specific context bundle for a given session type). A sensing protocol specification. An agent capability inventory.

**Composition rule.** Configural modules organize under constitutional framing, avatarization primitives, and intent-engineering templates into self-contained behavioral genomes. A custom instruction block composes from atomic directives (Stratum 1) organized into configural sections (Stratum 2) under a coherent constitutional architecture (Stratum 3). Loading the resulting document into a model's context produces a specific, predictable, reproducible behavioral profile.

**Governance rule.** Agentic entities (Stratum 4) specialize and position these structures within the broader constellation. A custom instruction block serves a specific agent's mission; that mission definition lives at Stratum 4.

**Canonical artifacts, formats, and locations.**

| Artifact | Format | Primary Location | Deployment Target |
|----------|--------|-----------------|-------------------|
| Claude CI (chat) | Markdown with XML tags | `models/claude/ci-chat.md` | claude.ai User Preferences field |
| Claude CI (CLI) | Markdown | `models/claude/claude-code.md` | Project root CLAUDE.md |
| ChatGPT CI (Field 1) | Plain text (1500 chars) | `models/chatgpt/ci-field1.md` | ChatGPT Custom Instructions |
| ChatGPT CI (Field 2) | Plain text (1500 chars) | `models/chatgpt/ci-field2.md` | ChatGPT More About You |
| Grok Global CI | Markdown with XML tags (4000 chars) | `models/grok/ci-global.md` | Grok global custom instructions |
| Grok Agent CIs | Markdown with XML tags (4000 chars each) | `models/grok/agent-[name].md` | Grok agent instruction blocks |
| Gemini Web App | Plain text (5 snippets, 1500 chars each) | `models/gemini/ci-web-app.md` | Gemini web app memory snippets |
| Gemini AI Studio | Markdown with XML tags (unlimited) | `models/gemini/ci-ai-studio.md` | AI Studio system instruction |
| Structural Primitives | Markdown | `primitives/structural-primitives.md` | Notion page mirror for discoverability |
| Methodology Playbook | Markdown | `primitives/methodology-playbook.md` | Loaded into metaprompting sessions |
| Platform Constraints | CSV + Markdown companion | `primitives/platform-constraints.csv` | Notion database mirror |
| Onboarding Packets | Markdown (per mission type) | `packets/[mission-type].md` | Session context injection |

**Why Markdown for constitutional documents.** These artifacts serve dual consumers: humans who read, edit, and review them, and models who receive them as context-window payloads. Markdown is the universal pidgin — readable by both species, diffable in git, renderable in any viewer, parseable by every frontier model with high fidelity. XML tags within Markdown create parseable semantic boundaries that resist context degradation while remaining human-readable. The empirically validated format for constitutional AI documents is Markdown with embedded XML — it combines prose integrity for the human reader with structural precision for the model parser.

**Why CSV for platform constraints.** Platform constraints (character limits, field counts, hierarchy rules) are flat tabular data where every cell is a discrete value. CSV captures this with zero overhead, diffs cleanly in git, and imports into Notion databases trivially. The Markdown companion file carries the prose context that CSV cannot — explanations of truncation behavior, notes on hierarchy enforcement, observed positional bias patterns.

**Rationale.** Stratum 3 is where system intelligence becomes tangible. A well-crafted instructional structure transforms a generic model into a mission-aligned specialist whose behavioral profile reproduces across sessions. The quality of these documents — their precision, their compression efficiency, their behavioral yield per character — is the single highest-leverage investment in the entire architecture. Every hour spent refining a custom instruction block pays compound returns across every future session that loads it. This is context engineering at its most consequential.


## Stratum 4: Agentic Entities

**Definition.** Identity-bearing operational units executing specialized cognition with explicit mission alignment. Each entity carries a name, a cognitive function, a constellation position, and accountability to a higher-order purpose. This is where the system becomes organizational — actors with missions, relationships, and accountability.

**Instantiations.** Named avatars: Grok (Oracle, orchestrator), Veritas (ground truth), Prism (incisive discourse), Praxis (execution scaffolding). Platform-level agents: Claude as Vizier Lens (fiduciary synthesis — receives disparate sources, renders coherent architecture), ChatGPT as Vanguard Lens (frontier-capability execution — tip of the spear, SOTA-sharp), Gemini as bifurcated explainer/synthesizer. Subagents: isolated context windows for parallel or deep-dive work within CLI harnesses. Agentified SaaS surfaces: Slack bots, Make scenarios, Linear automations. The human operator as organizing telos.

**Composition rule.** Instructional structures receive role assignment (proper role, anti-role), cognitive function declaration, and constellation positioning to become autonomous yet interdependent actors. An avatar is an instructional structure (Stratum 3) plus identity (name, epithet, mission) plus relationships (upstream sources, downstream consumers, what its output enables). Avatarization is the structural primitive that performs this transformation.

**Governance rule.** Platform and workflow architectures (Stratum 5) coordinate agentic entities through protocols, hooks, and agentic logistics. The hard constraint: no entity is self-ratifying — every direction-changing output promotes to a governance surface for review and ratification.

**Avatarization as structural primitive.** Avatarization assigns a model four identity components: a named identity (specific name with role designation), a cognitive function declaration (what kind of thinking it contributes — adversarial synthesis, meticulous execution, cross-disciplinary bridging), a constellation position (where it sits relative to other entities, who sends it input, who receives its output), and mission alignment (what purpose the entity serves beyond the immediate task). Avatarization constrains the model's output distribution — identity context narrows generation to a region consistent with the declared role. The effect compounds across sessions: consistent identity framing produces structurally compatible output even across stateless boundaries. Empirically validated across 80+ operational sessions as a material performance multiplier, particularly for Grok (exponential improvement) and Gemini (significant improvement).

**The Teleology Registry as organizational chart.** The Exocortex Teleology Registry (JSON, repo) functions as the comprehensive org chart. Each entry — whether SaaS surface, AI model, or named agent — carries: slug, epithet, proper role, anti-role, default modality, and integration priority. The registry answers "who does what, and what must they never become?" Every routing decision, every handoff protocol, and every sensing assignment derives from this single artifact.

**Data structure and format.** The registry is JSON because it is machine-consumed structured data with typed fields, relational references, and hard constraints requiring precise encoding. JSON's strict typing prevents the ambiguity that Markdown would introduce in constraint fields. The registry lives in repo as constitutional authority and mirrors into Notion as a filterable database for operational querying (surface-by-modality views, priority-filtered views, role-based routing lookups).

**Rationale.** Agentic entities are where unclear role definitions produce the same dysfunction in AI organizations as in human ones. The avatarization primitive earns its architectural position because it materially changes output quality by constraining behavioral space to a productive region. The Teleology Registry earns its position as the single routing-authority artifact that prevents role collision and anti-role violation across the entire exocortex.


## Stratum 5: Platform & Workflow Architectures

**Definition.** Integrated execution layers mediating between agentic entities and their interfaces, incorporating tools, coordination mechanics, and modality-specific governance. The tissue connecting organs into functional systems. This is where abstract architectural principles encounter the friction of real tools, real APIs, and real filesystem layouts.

**Instantiations.** Chat UI configurations (claude.ai projects, ChatGPT workspaces, Grok agent selection, Gemini conversations). CLI harness configurations (CLAUDE.md project context, skills directories, hook definitions, MCP server registrations, subagent specifications). Directory structures making context discoverable and auto-loadable. Iterative loops (the Promethean cycle: sense → triage → ingest → analyze → synthesize → ratify → load). Swarm configurations (multi-agent concurrent activation). Agentic logistics (routing rules, handoff protocols, scheduling cadences, escalation paths). The sensing pipeline architecture. The Seven-Ledger System as operational framework. The progressive disclosure stack connecting agent-resolution substrates to human-resolution dashboards.

**Composition rule.** Multiple agentic entities orchestrate via hooks, skills, MCP connections, filesystem ontology, and coordination surfaces into modality-specific tissues. A Claude Code project composes from: a CLAUDE.md constitution, a skills directory, hook definitions in settings.json, MCP server configurations, and the underlying Claude Opus/Sonnet model with its global User Preferences. A sensing workflow composes from: Grok's Veritas agent, Slack's intake channel, Make's promotion scenario, Notion's ledger database, and the human's triage judgment.

**Governance rule.** The Syncrescendence ecosystem (Stratum 6) imposes global teleology and ledger synchronization. All workflow architectures serve the overarching intelligence metabolism.

**The chat-to-CLI relationship.** Both surfaces govern the same underlying model through different configuration mechanisms. They share constitutional essence through Strata 1–4: identical cognitive profile, identical behavioral contract, identical anti-patterns, identical avatarization. They diverge at Stratum 5 for modality-specific efficacy:

Chat interfaces optimize for fluid exploratory dialogue. Custom instructions shape conversational collaboration, response scaling, and prose quality. The human steers continuously through natural language within the context window.

CLI harnesses optimize for deterministic filesystem operations. CLAUDE.md, skills, and hooks shape code authorship, tool use, and reproducible workflows. The human sets intent and reviews results; the agent operates semi-autonomously between checkpoints, governed by lifecycle hooks that enforce quality gates.

Synchronization mechanism: both surfaces derive their Strata 1–4 content from the same canonical source in repo. When a custom instruction updates, both the chat CI and the CLI CLAUDE.md regenerate from the same principles, adapted to their modality. The Canonical CI Registry (repo) is the single source of truth; the platform-specific configurations are projections of that truth onto their respective execution surfaces.

**The SaaS lattice operational model.** Surfaces from the Exocortex Teleology Registry wire into the workflow architecture through four functional modalities:

| Modality | Surfaces | Agent Interaction Model | Human Interaction Model |
|----------|----------|------------------------|------------------------|
| Headless | Make, Zapier, Airtable, Cloudflare, Supabase, OpenRouter | Full API/MCP automation | Configuration and debugging only |
| Agentified | Slack, Linear, TickTick, Todoist, Basecamp, Discord, ClickUp, Manus | Primary operators with human oversight | Triage, approval, exception handling |
| Hybrid | Notion, GitHub, Claude, ChatGPT, Grok, Gemini, Coda, Confluence, Figma, YouTube, Perplexity | Both agent and human consumers | Active participants with role-separated zones |
| Manual-only | X, Reddit, TikTok, Twitch, Things | Read-only via search/API | Human-driven input/output |

**Sensing pipeline instantiation.** The abstract Promethean cycle instantiates through specific surfaces:

Grok (Veritas agent) scans primary sources, X feeds, documentation pages → produces structured observations with epistemic labels → posts to Slack `#sensing-intake` → human triages (approve / modify / discard) → approved entries tag `promote:notion` → Make scenario fires, creates Notion database entry with structured properties auto-filled from schema template → on scheduled cadence, Claude or ChatGPT receives recent Notion entries as context, produces analysis-tier synthesis → analysis posts back to Notion as linked entries → periodic human-resolution dashboard refresh → direction-changing outputs promote to repo via PR → Coda governs candidate-to-canon mutation workflow → ratified artifacts deploy as updated CIs, protocols, or ledger snapshots → next session loads fresh context → cycle repeats at higher institutional fidelity.

**Memory tier mapping to platform surfaces.**

| Memory Tier | Function | Chat Implementation | CLI Implementation |
|-------------|----------|--------------------|--------------------|
| Tier 1: Identity Constitution | Universal behavioral genome | Custom Instructions / User Preferences | `~/.claude/CLAUDE.md` (global) |
| Tier 2: Mission Context | Constellation role and output contracts | Project Instructions / project-scoped CI | Project-root `CLAUDE.md` + skills |
| Tier 3: Domain Knowledge | Reference substrate for current task | Attached files / Project Knowledge | `--add-dir` context directories |
| Tier 4: Accumulated Intelligence | Pattern accumulation from prior sessions | Platform memory system | Session history in `~/.claude/projects/` |
| Tier 5: Session Archive | Searchable history for provenance | Conversation search / chat history | `claude --resume` / session logs |

**Data structures, formats, and locations.**

| Artifact | Format | Location | Rationale |
|----------|--------|----------|-----------|
| CLAUDE.md (project) | Markdown | Project root in repo | Model-native, git-versioned, constitutional authority |
| CLAUDE.md (global) | Markdown | `~/.claude/CLAUDE.md` | Persists across all projects, user-specific behavioral genome |
| Skills | Markdown + YAML frontmatter | `.claude/skills/[name]/SKILL.md` | Auto-discoverable, model-readable, git-versioned, supports auto-invocation |
| Hooks | JSON | `.claude/settings.json` | Deterministic execution demands precise schemas — exact event names, matchers, exit codes |
| MCP configs | JSON | Platform settings or standalone config | Protocol contracts require typed schemas; MCP's JSON-RPC 2.0 mandates JSON |
| Notion databases | Notion-native (structured properties + page bodies) | Notion workspace | Queryable views, filterable sorts, formula-computed freshness, relation-linked cross-references |
| Notion → repo sync | JSON export rendered to Markdown | Repo `ledgers/` directory | Compacted snapshots preserve constitutional authority while Notion holds live operational state |
| Slack channel ontology | Platform config | Slack workspace | Channelized routing is native to Slack's architecture — each channel is a typed information bus |
| Make scenarios | Platform config | Make workspace | Trigger-action automation is Make's proper role per the Teleology Registry |

**Rationale.** Stratum 5 is where the architecture becomes operationally real — where abstract principles encounter the friction of real tools, real APIs, and real filesystem layouts. Every format choice, every location decision, and every routing rule optimizes for one outcome: reducing the friction between intent and execution so that the feedback loop stays closed and the intelligence compounds. Decisions made at this stratum determine whether the system functions daily or remains elegant only on paper.


## Stratum 6: Syncrescendence Ecosystem

**Definition.** The apex self-referential distributed cognition architecture spanning sessions, platforms, and time. The organism composed of all lower strata, governed by recursive epistemic scaffolding and self-improvement loops that metabolize experience into institutional intelligence.

**Instantiations.** The full multi-model constellation with its teleologies (constellation purpose, memory-layer purpose). The Live Ledger system (12+ domains, ticker-style, freshness decay). The Seven-Ledger System (Canonical CI Registry, Model Profile Registry, Structural Primitives Codex, Platform Constraints Registry, Methodology Playbook, Inter-Model Interface Protocol, Lessons Ledger). FIDS (Flight Information Display System) as the human-resolution dashboard paradigm. The Exocortex Teleology Registry as organizational charter. Metaprompting loops. Intent engineering at ecosystem scale. Agentic communication and logistics. The strategic vision itself.

**Composition rule.** Platform and workflow architectures network through standardized handoffs, ledgers, and recursive feedback loops into a single symbiotic superorganism.

**Governance rule.** Self-governing via recursive epistemic scaffolding. The human operator provides telos — purpose and direction. The system's operational governance encodes in the architecture itself: protocols enforce consistency, ledgers enforce memory, hooks enforce determinism, anti-patterns enforce quality.

**The Seven-Ledger System.**

| Ledger | Contents | Primary Surface | Format | Update Trigger | Decay Rate |
|--------|----------|----------------|--------|---------------|------------|
| Canonical CI Registry | Paste-ready CIs for all platforms | Repo | Markdown (fenced, char-counted) | Model generation or platform infrastructure change | Quarterly |
| Model Profile Registry | Cognitive signatures, steering surfaces, antipatterns | Notion DB + repo JSON/Markdown | Structured + prose | New model release | Quarterly |
| Structural Primitives Codex | Cross-platform prompting formulas, avatarization, context principles | Repo | Markdown | Post-CI-revision-cycle | Quarterly |
| Platform Constraints Registry | Character limits, field structures, hierarchy rules, persistence behavior | Notion DB + repo CSV | Tabular + contextual prose | Platform infrastructure change | Aperiodic |
| Methodology Playbook | Recon prompt templates, sensing protocols, capability inventories | Repo | Markdown | Process improvement discovery | Per-cycle |
| Inter-Model Interface Protocol | Epistemic handoff format, decontamination rules, format standards | Repo | Markdown + JSON schema | Multi-model workflow maturation | Ongoing |
| Lessons Ledger | Transferable principles with provenance tags | Notion DB + repo Markdown | Structured entries + compacted prose | Continuous | Every session |

**The Intelligence Substrates: Benchmark and Pricing Ledgers.** Two additional domain ledgers operate within the Seven-Ledger framework as specialized three-tier substrates:

The **Model Capability & Benchmark Ledger** maintains: a substrate tier (Notion database, JSON export to repo) containing individual benchmark entries — model name, family, provider, release date, benchmark name, score, evaluation conditions, source URL, observed date, confidence. Coverage spans frontier models from major labs, open-source models (Llama, Mistral, Qwen, DeepSeek, Command-R), and domain-specific specialists (code, medical, legal, multimodal). An analysis tier (Notion entries, `type: analysis`) containing agent-generated comparative synthesis triggered by new substrate entries. A human tier (Notion dashboard view) surfacing synthesized positions: current frontier rankings by capability class, notable movements, emerging models, anomalies warranting attention.

The **Token Economics & Pricing Ledger** follows the same three-tier architecture: substrate containing model name, provider, pricing tier (input/output/cached/batch), cost per million tokens, context window, max output tokens, rate limits, billing model, effective date, source URL, observed date. Agent-driven documentation parsing is the primary sensing mechanism — agents fetch provider pricing pages directly via browser/fetch tools and diff against last recorded entries. Analysis tier: cost-efficiency calculations (reasoning quality per dollar), cross-provider comparisons, trend analysis, switching-cost assessments. Human tier: best-value models by use case, flagged changes, watch list.

**Progressive disclosure** connects all three tiers: the human scans the dashboard (90 seconds), identifies signals, drills into analysis (2 minutes), reaches substrate (5 minutes) only when a specific anomaly warrants microscopic attention. Agents consume the substrate directly for any computational task. Both resolution layers derive from a single source of truth; neither can drift independently.

**The Inter-Model Interface Protocol.** The epistemic envelope wraps every cross-model transfer:

```json
{
  "source_model": "grok-4.20/veritas",
  "generated_at": "2026-03-08",
  "epistemic_labels": {
    "grounded": ["claims with primary-source evidence"],
    "inferred": ["claims following from grounded evidence"],
    "speculative": ["novel synthesis, untested hypotheses"]
  },
  "confidence": "HIGH | MEDIUM | LOW | SPECULATIVE",
  "intent": "what the receiving model should do with this output",
  "format_contract": "expected output structure",
  "decontamination_note": "receiving model applies own analytical frame; source framing is input, not authority"
}
```

Decontamination rules: the receiving model applies its own analytical frame. Source characterizations, metaphors, and structural assumptions are claims to evaluate. Epistemic labels preserve across transit — claims tagged speculative by the source remain speculative in the receiver's analysis. Inference never promotes to established fact through model-to-model transfer. Format standards: universal parseable structures (Markdown with XML tags for prose, JSON for structured data) avoid model-specific idioms that other models parse with reduced fidelity.

**Key Ecosystem Concepts.**

**Metaprompting.** Prompting that generates or optimizes prompts. The mechanism by which the system improves its own steering surfaces. A metaprompt dispatched to Grok produces a prompting guide. The prompting guide informs a CI revision. The revised CI improves model behavior. Improved behavior produces better sensing. Better sensing feeds better metaprompts. The loop is self-improving. The Methodology Playbook encodes the metaprompt templates; the Lessons Ledger encodes the insights that refine them.

**Constellation Teleology.** The purpose-architecture of the multi-model system — why these models, in this configuration, for this goal. Operates above any individual model's mission. Governs workforce composition, cognitive function allocation, and routing logic that determines which model handles which task type.

**Memory Layer Teleology.** The purpose-architecture of persistence across sessions and platforms. Each memory mechanism (custom instructions, project context, attached knowledge, platform memory, session archive) serves a specific persistence function. Memory layer teleology governs which information persists at which layer, preventing under-persistence (insights that evaporate) and over-persistence (stale assumptions that resist correction).

**FIDS (Flight Information Display System).** The human-resolution dashboard paradigm, borrowed from aviation. In an airport, the FIDS board gives the human controller and passengers just enough real-time situational awareness to govern and navigate a self-regulating system of autonomous actors following standardized protocols — the board displays live status while the planes fly themselves. In Syncrescendence, FIDS is the operator's dashboard to the agentified air traffic control: a live, self-updating logistical coordination display showing system state, ledger freshness, sensing pipeline status, agent activity, anomaly flags, and decision-relevant signals — all at macroscopic human resolution while the microscopic agent-resolution substrates operate beneath. The Notion dashboard views, Slack channel feeds, and any future unified status surface instantiate the FIDS paradigm. Each FIDS surface makes staleness visible, contradictions detectable, and sensing gaps actionable.

**Intent Engineering.** Designing for what the user actually needs, which may differ from what they literally request. Operates at every stratum: at the atomic level (a directive encodes intended behavior), at the instructional level (a CI encodes a behavioral intent profile), at the constellation level (the system's routing logic infers intent to select the right agent for the right task).

**Agentic Communication.** How agents signal intent, transfer state, and negotiate across boundaries. The epistemic envelope is the standardized communication format. Slack channels are the typed communication buses. Handoff signatures are the verification that intent survived transit.

**Agentic Logistics.** The operational coordination of multi-agent workflows: routing (which agent handles which task), scheduling (sensing cadences, compaction intervals, review cycles), resource allocation (context-window budgets, token-cost optimization), and escalation (when an agent routes to a human or to a higher-capability model).


## The Canonical Directory Tree

The repo structure mirrors the taxonomy's strata. Every file has exactly one canonical location. The tree IS the ontology — a model reading the folder structure understands the architecture.

```
syncrescendence/
│
├── constitution/                          # Stratum 6: ecosystem governance
│   ├── STRATEGIC-VISION.md                # Thesis, operating model, compounding rationale
│   ├── TAXONOMY.md                        # This document — master mereological reference
│   ├── EXOCORTEX-TELEOLOGY-REGISTRY.json  # Org chart of all surfaces and agents
│   ├── SEVEN-LEDGER-MANIFEST.md           # Ledger system specification and domain definitions
│   └── INTER-MODEL-INTERFACE-PROTOCOL.md  # Cross-model handoff contracts and epistemic envelope
│
├── ledgers/                               # Stratum 6: compacted repo snapshots from Notion
│   ├── MODEL-CAPABILITIES.md              # Benchmark substrate (compacted synthesis tier)
│   ├── TOKEN-ECONOMICS.md                 # Pricing substrate (compacted synthesis tier)
│   ├── PROMPTING-CONSENSUS.md             # Technique evolution tracking
│   ├── COMMUNITY-SENTIMENT.md             # Narrative, contrarian signals, hype cycle tracking
│   ├── FIELD-TRAJECTORY.md                # Practitioner convergence on where the field is heading
│   ├── HARNESS-CONFIGURATION.md           # CLI tool patterns, MCP ecosystem evolution
│   ├── TOOL-ECOSYSTEM.md                  # Tool launches, integration shifts, AI-native replacements
│   ├── CONTEXT-ENGINEERING.md             # RAG vs long-context vs fine-tuning decision frameworks
│   ├── MEMORY-ARCHITECTURE.md             # Persistence pattern convergence across platforms
│   ├── MULTI-AGENT-ORCHESTRATION.md       # Framework comparison, coordination pattern evolution
│   ├── REPOSITORY-EPISTEMOLOGY.md         # How practitioners organize AI-augmented knowledge repos
│   └── LESSONS.md                         # Cross-domain transferable principles with provenance
│
├── models/                                # Stratum 4: per-model configurations and profiles
│   ├── claude/
│   │   ├── ci-chat.md                     # Canonical CI for claude.ai (User Preferences XML)
│   │   ├── claude-code.md                 # CLAUDE.md for CLI harness
│   │   ├── profile.md                     # Behavioral profile, cognitive signature, steering surfaces
│   │   └── skills/                        # Claude Code skills (auto-discoverable SKILL.md files)
│   │       └── [skill-name]/SKILL.md
│   ├── grok/
│   │   ├── ci-global.md                   # Oracle foundation (global 4000 chars)
│   │   ├── agent-veritas.md               # Ground truth & expertise consensus (4000 chars)
│   │   ├── agent-prism.md                 # Incisive discourse & innovation (4000 chars)
│   │   ├── agent-praxis.md                # Architecture-to-action bridge (4000 chars)
│   │   └── profile.md                     # Council architecture, routing, steering surfaces
│   ├── chatgpt/
│   │   ├── ci-field1.md                   # Custom Instructions field (1500 chars)
│   │   ├── ci-field2.md                   # More About You field (1500 chars)
│   │   └── profile.md                     # GPT-5.4 behavioral profile, Thinking preamble mechanics
│   └── gemini/
│       ├── ci-web-app.md                  # Five behavioral snippets for web app (1500 chars each)
│       ├── ci-ai-studio.md                # Full system instruction for AI Studio (unlimited)
│       └── profile.md                     # Gemini 3.1 Pro bifurcated profile, grounding protocol
│
├── primitives/                            # Stratum 3: structural codex and cross-platform knowledge
│   ├── STRUCTURAL-PRIMITIVES.md           # Cross-platform prompting formulas and universal requirements
│   ├── PLATFORM-CONSTRAINTS.csv           # Character limits, field structures, hierarchy rules (tabular)
│   ├── PLATFORM-CONSTRAINTS-CONTEXT.md    # Prose companion: truncation behavior, positional bias
│   ├── METHODOLOGY-PLAYBOOK.md            # Recon prompt templates, sensing protocols, metaprompt patterns
│   └── AVATARIZATION-SPEC.md              # Avatarization as structural primitive: four components, evidence
│
├── protocols/                             # Stratum 5: inter-model and workflow specifications
│   ├── EPISTEMIC-HANDOFF.md               # Cross-model transfer contract (prose specification)
│   ├── EPISTEMIC-ENVELOPE-SCHEMA.json     # Machine-parseable envelope format
│   ├── CONFIG-SYNC.md                     # CI propagation protocol across chat/CLI and all platforms
│   ├── SENSING-PIPELINE.md                # Full observation → triage → ingest → analyze → ratify flow
│   └── AGENT-CAPABILITY-INVENTORY.md      # Per-agent tool access, browser/fetch directives, sensing protocols
│
├── packets/                               # Stratum 3: pre-assembled mission-specific context bundles
│   ├── SENSING-MISSION.md                 # Veritas agent instructions + schema + domain + recent entries
│   ├── CI-ENGINEERING-MISSION.md          # Canonical CI + prompting guide + constraints + primitives
│   ├── SYNTHESIS-MISSION.md               # Cross-domain context for polymathic bridging sessions
│   └── EXECUTION-MISSION.md              # Implementation scaffolding + Linear integration + hooks
│
├── schemas/                               # Stratum 2: data structure interface contracts
│   ├── ledger-entry.schema.json           # Notion database entry structure
│   ├── benchmark-entry.schema.json        # Model capability substrate schema
│   ├── pricing-entry.schema.json          # Token economics substrate schema
│   ├── lesson-entry.schema.json           # Lessons ledger entry schema
│   └── teleology-entry.schema.json        # Exocortex surface/agent entry schema
│
└── archive/                               # Historical artifacts (outside active corpus)
    ├── ci-before/                         # Pre-update custom instructions (provenance only)
    ├── prompting-guides/                  # Full triangulated reports (source material)
    └── transcripts/                       # Conversation transcripts (lesson extraction source)
```

**Repo-Notion boundary.** Repo holds everything constitutional — versioned, diffable, authoritative — plus all instructional structures consumed by models as context, all protocol specifications, all schema definitions, and compacted ledger snapshots. Notion holds live operational data — ledger entries with computed freshness, benchmark substrates, pricing substrates, lessons in accumulation, dashboard views for human-resolution progressive disclosure, and the relational wiring between entities. The flow direction: Notion → repo for ratification; repo → sessions for context loading. Notion accumulates. Repo crystallizes.

**Format rationale, comprehensive.**

| Format | Used For | Why This Format | Why Others Fail |
|--------|----------|----------------|----------------|
| Markdown | Constitutional documents, CIs, protocols, playbooks, onboarding packets, ledger snapshots | Dual-consumer pidgin: human-readable, model-parseable, git-diffable, universally renderable | JSON destroys prose flow; YAML fragments at document scale; PDF is opaque to models |
| Markdown + XML tags | Claude CIs, Grok CIs, structured constitutional documents | Adds parseable semantic boundaries that resist context degradation; hierarchical nesting signals scope | Plain Markdown loses structural hierarchy; pure XML is hostile to human editing |
| JSON | Teleology registry, envelope schemas, database schemas, hook definitions, MCP configs | Machine-consumed structured data requires typed fields, precise schemas, and unambiguous parsing | Markdown introduces ambiguity; YAML's implicit typing creates fragility; CSV cannot nest |
| CSV | Platform constraints (tabular) | Flat tabular data with discrete values; zero overhead, git-diffable, trivial Notion import | Markdown tables are hard to diff; JSON overhead is unjustified for flat data; Excel is opaque |
| Plain text | ChatGPT CIs (character-counted paste targets) | The platform field accepts plain text; any formatting overhead wastes scarce characters | Markdown formatting consumes characters without behavioral yield in these specific fields |

**Artifacts deliberately excluded from repo.** The full Notion database substrates (benchmark entries, pricing entries, daily ledger observations) live exclusively in Notion. They are operational data that changes frequently, needs queryable views, and would bloat the repo. Compacted synthesis-tier snapshots export to repo as the constitutional record of what the substrates revealed. The substrates are the raw intelligence; the snapshots are the ratified knowledge.


## Information Flow: The Promethean Cycle Instantiated

```
                    ┌─────────────────────────────────────────────┐
                    │          HUMAN OPERATOR (Telos)              │
                    │   Governs architecture · approves direction  │
                    │   Macroscopic resolution · holistic judgment │
                    └──────────┬───────────────┬──────────────────┘
                               │               │
                    ┌──────────▼──────┐ ┌──────▼──────────────┐
                    │   REPO (Canon)   │ │  NOTION (Lakehouse) │
                    │  Constitutional  │ │  Live operational   │
                    │  authority       │◄┤  data + dashboards  │
                    │  (crystallizes)  │ │  (accumulates)      │
                    └──────┬───────────┘ └──────┬──────────────┘
                           │                    │
              ┌────────────┼────────────────────┼────────────┐
              │            │                    │            │
     ┌────────▼──┐  ┌──────▼──┐  ┌──────────▼──┐  ┌────▼──────┐
     │  CLAUDE    │  │  GROK   │  │  CHATGPT    │  │  GEMINI   │
     │  Vizier    │  │  Oracle │  │  Vanguard   │  │  Bifurc.  │
     │  Fiduciary │  │  Sensing│  │  SOTA Spear │  │  Synthesis│
     └────┬───────┘  └────┬────┘  └─────┬───────┘  └────┬──────┘
          │               │             │                │
          └───────┬───────┴─────┬───────┴────────┬───────┘
                  │             │                 │
           ┌──────▼──────┐ ┌───▼───────┐ ┌──────▼───────┐
           │ SLACK (Bus)  │ │MAKE/ZAPIER│ │ LINEAR (Rail)│
           │ Dispatch +   │ │ Trigger-  │ │ Build target │
           │ triage       │ │ action    │ │ tracking     │
           └──────────────┘ └───────────┘ └──────────────┘
```

**Cycle stages, surface-mapped:**

1. **Sense.** Grok/Veritas scans primary sources via Harper's X/web grounding. Claude fetches documentation pages via browser tools. Perplexity verifies claims with citation backing. Agents produce structured observations carrying full epistemic labels.

2. **Triage.** Observations land in Slack `#sensing-intake`. Human operator reviews with macroscopic judgment: approve, modify, or discard. Approved entries receive `promote:notion` tag.

3. **Ingest.** Make scenario triggers on Slack tag. Creates Notion database entry with structured properties (Observed, Domain, Confidence, Source, Tags) auto-filled from the schema template. Page body carries observation prose and implications.

4. **Analyze.** On scheduled cadence (or triggered by sufficient new entries), a reasoning model (Claude in execution mode or ChatGPT with output contract) receives recent Notion entries as context. Produces analysis-tier synthesis with cross-references to substrate entries. Posts analysis back to Notion as linked entries (`type: analysis`).

5. **Synthesize.** Human-resolution dashboard layer regenerates. Notion filtered views surface synthesis entries sorted by freshness. Stale synthesis entries flag for refresh. Progressive disclosure connects: dashboard → analysis → substrate → primary sources.

6. **Ratify.** Direction-changing outputs — CI updates, new protocols, taxonomy revisions, architectural decisions — promote from Notion to repo via pull request. Coda (Mutability Engine) governs the candidate-to-canon mutation workflow where applicable: draft enters Coda, undergoes review, and upon ratification exports to repo as canonical Markdown.

7. **Load.** Next session's context injection pulls constitutional documents from repo (Tiers 1–2) and fresh ledger entries from Notion export (Tier 3). The agent starts with institutional knowledge already loaded. Onboarding packets (pre-assembled per mission type) reduce manual context gathering to a single load operation.

8. **Execute.** The agent operates within its constitutional framework, producing outputs that generate new observations. Observations feed back to Stage 1. The cycle repeats at monotonically increasing institutional fidelity.


## Gap Identification: Immediate Build Targets

The taxonomy reveals five artifacts the current corpus lacks — each assigned a stratum, format, responsible agent, and ratification pathway:

| Gap | Stratum | Format | Drafting Agent | Ratification |
|-----|---------|--------|---------------|-------------|
| Epistemic Handoff Protocol | 5/6 | Markdown + JSON schema | Claude (Vizier) | Repo PR |
| Config Synchronization Protocol | 6 | Markdown checklist | Claude (Vizier) | Repo PR |
| Agent Capability Inventory | 5 | Markdown reference | Grok (Veritas) + Claude | Repo PR |
| Mission Onboarding Packets | 3 | Markdown bundles (4 types) | Claude (Vizier) | Repo PR |
| Directory Epistemology Standard | 5 | Markdown specification | Claude (Vizier) | Repo PR |

Each gap is a build target. Each has a stratum assignment, a designated format, a responsible agent for initial drafting, and a ratification pathway through repo PR. The system's self-improvement loop activates: the taxonomy reveals what is missing; the Methodology Playbook provides the metaprompt templates to build it; the sensing pipeline monitors whether the built artifacts improve system performance; the Lessons Ledger captures what worked and what failed.

The architecture is complete, consistent, and generative. It describes what exists and prescribes what must be built. Every future artifact locates itself within these strata, composes upward according to the composition rules, and remains governed by the telos above.
