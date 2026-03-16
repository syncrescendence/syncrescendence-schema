# Definitive monorepo spec for six agentic coding harnesses

**The OpenHands director assumption is wrong.** The most significant finding of this audit is architectural: neither OpenHands nor any single AI agent should serve as director. Cross-harness delegation requires a **thin orchestration layer** — a process manager, not an AI agent — because DelegationTool is internal-only and Claude Code Agent Teams are Claude-only. The correct pattern, validated by Superset (3,285 stars, shipped March 1 2026), Composio's Agent Orchestrator, and AgentPool, is subprocess spawning per git worktree with filesystem-mediated coordination. ACP stdio transport is production-grade (5/6 harnesses supported, pre-1.0 but SDK-backed across 4 languages), upgrading from medium to **medium-high epistemic status**. The "Krieger" persistent coworker already shipped as Claude Cowork in January 2026 — the Q3 2027 timeline was based on stale signals.

---

## PART 1: GAP PATCHES

### GAP 1 — ACP is stable enough for local stdio, not for remote transport

**Current state (March 11, 2026):** ACP (Agent Client Protocol, Zed Industries/JetBrains — not IBM's identically-abbreviated Agent Communication Protocol, which merged into Google A2A under the Linux Foundation in January 2026) has no formal version number but maintains a documented JSON-RPC 2.0 schema at agentclientprotocol.com, 4 language SDKs (Python, TypeScript, Rust, Java/Kotlin), 11 GitHub repositories, and **15+ agents in its registry**. The Rust reference implementation (`symposium-acp`) was updated March 5, 2026. [HIGH — primary sources: agentclientprotocol.com, github.com/agentclientprotocol]

**Per-harness adoption matrix:**

| Harness | ACP Status | Mechanism |
|---------|-----------|-----------|
| Aider | 🟡 Underway | "An Aider implementation of ACP is underway" — Zed progress report |
| Claude Code | 🟢 Adapter | `@zed-industries/claude-code-acp` npm v0.16.2. Feature request #6686 for native support open |
| Gemini CLI | 🟢 Native | First ACP integration (Aug 2025). `gemini --experimental-acp` flag |
| OpenAI Codex | 🟢 Adapter | `codex-acp` adapter open-sourced by Zed |
| OpenClaw | 🟢 Native | `runtime: "acp"` in agent config; `acp-router` skill; `acpx` backend |
| OpenHands | 🟢 Native | `openhands acp` CLI command; listed in Zed ACP registry |

**Resolution:** ACP stdio transport is production-ready for local co-location. Remote transports (HTTP, WebSocket) remain work-in-progress. The thin-adapter strategy holds for 5/6 harnesses. Aider is the single gap — **fallback for Aider is the community `aider-mcp` stdio server** (sengokudaikon/aider-mcp) which wraps Aider as an MCP tool, invokable by any ACP agent via the MCP passthrough mechanism built into ACP's capability negotiation.

**ACP message schema (verified):** Connection via `initialize` → `InitializeResponse` with capability negotiation. Sessions via `session/new` → `session/prompt` → streaming `session/update` notifications (types: `thought`, `message_chunk`, `tool_call`, `tool_result`). Filesystem mediation via `fs/read_text_file`, `fs/write_text_file`. Terminal operations via `terminal/create`, `terminal/output`, `terminal/waitForExit`. Content blocks support text, images, audio, diffs/patches. ACP explicitly reuses MCP JSON schemas and passes MCP server configs to agents during session setup — the two protocols are complementary, not competing.

**Impact on prior architecture:** The ACP-as-arbitration assumption holds for local deployment. The fallback architecture (subprocess + git worktree + filesystem coordination) is ALSO viable and is what production orchestrators actually use. ACP provides structured session semantics on top of this. **Epistemic status: MEDIUM-HIGH** — pre-1.0 but SDK-backed, production-deployed in JetBrains and Zed, with 5/6 harness coverage. [Sources: agentclientprotocol.com, zed.dev/blog/acp-progress-report, hexdocs.pm/acpex/protocol_overview.html]

### GAP 2 — Krieger shipped in January 2026; director architecture requires fundamental revision

**Current state:** "Krieger" was never an official Anthropic codename — it was an inference from Mike Krieger's CPO role. The product it referred to **already shipped** as **Claude Cowork** beginning January 12, 2026 (research preview for Max subscribers, macOS). Timeline:

- **Jan 12**: Cowork research preview (Max subscribers)
- **Jan 16**: Available to Pro subscribers
- **Jan 23**: Team and Enterprise plans
- **Jan 30**: Plugin support (11 open-source plugins) + livestream
- **Feb 5**: Claude Opus 4.6 with 1M token context + Agent Teams (experimental)
- **Feb 24**: Full enterprise launch with Google Drive, Gmail, DocuSign, FactSet connectors
- **Mar 9**: Microsoft Copilot Cowork launched (using Claude engine)

Mike Krieger **stepped down as CPO in January 2026** to co-lead Labs, Anthropic's internal incubator for experimental products. Ami Vora took over as head of product. Krieger's Labs is explicitly building next-generation products but nothing has been announced. [HIGH — Anthropic blog, Axios, TechCrunch, The Information]

**The Q3 2027 projection was wrong by 18+ months.** Claude Cowork is a general-purpose persistent agent (VM-based, Apple Virtualization Framework on macOS, with file-level sandboxing). Claude Code separately gained persistent orchestration capabilities via the **Tasks system** (DAG-based, filesystem-persisted, cross-session) and **Agent Teams** (experimental, full independent instances with shared task lists and direct messaging).

**Director architecture revision — the critical finding:**

OpenHands' DelegationTool delegates **only to internal OpenHands sub-agents**, not to external harnesses. Claude Code's Agent Teams spawn **only additional Claude Code instances**. Neither can natively orchestrate the other five harnesses. The correct director is **not an AI agent at all** — it is a thin process-management layer. This pattern is validated by multiple production tools:

- **Superset** (superset.sh, March 1 2026, 3,285 GitHub stars): Electron app, spawns any CLI agent in isolated git worktree + tmux session
- **Agent Orchestrator** (Composio): Each agent in own worktree + branch + PR, YAML config, plugin-based agent support
- **AgentPool** (phil65): Most protocol-complete — supports ACP, MCP bridge, AG-UI, OpenCode Server; coordinator delegates to any ACP-compatible agent via unified YAML config with teams and chains

**Impact:** The architecture flips from "OpenHands as AI director" to "thin orchestrator as process director with OpenHands as one of six worker agents." The event-sourced ConversationState and deterministic replay remain valuable for the OpenHands worker — they just don't serve the director function.

**Revision triggers to monitor:**
1. Claude Code Agent Teams exits experimental (removes flag `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS`) — tighten watch
2. OpenHands ships external harness delegation via ACP — would restore director candidacy
3. AgentPool reaches stable release — becomes recommended orchestrator

**Epistemic status: HIGH** for Cowork timeline and director revision. MEDIUM for AgentPool/Superset longevity.

### GAP 3 — Frequency-weighted retention replaces age-based pruning

**Current state:** The "prune completed branches >30 days" policy destroys compounding value. A task pattern recurring weekly (e.g., "add API endpoint with auth middleware") becomes MORE valuable over time — its genealogy IS institutional memory.

**Resolution — three-tier similarity detection:**

1. **Structural signature** (fast): `SHA256(sorted_file_paths_touched || operation_types)`. Exact match = same task class
2. **Embedding similarity** (semantic): Cosine similarity of 768d task description embeddings. ≥0.85 = same class, ≥0.70 = related
3. **Tag intersection** (explicit): Jaccard similarity of task class tags. ≥0.6 = same class

Combined score: `sim(a,b) = 0.4 × structural + 0.4 × embedding + 0.2 × tag_jaccard`

**Retention scoring formula:**

```
retention_priority = 0.25 × frequency_score + 0.35 × reuse_score
                   + 0.10 × depth_penalty + 0.15 × outcome_weight
                   + 0.15 × recency_boost

where:
  frequency_score = log₂(1 + access_count) / log₂(1 + max_access_global)
  reuse_score = log₂(1 + reuse_count) × 2.0
  depth_penalty = 1.0 / (1.0 + depth × 0.1)
  outcome_weight = {success: 1.0, partial: 0.7, failure: 0.3, abandoned: 0.1}
  recency_boost = exp(-days_since_last_access / half_life)
  half_life = 90 × (1 + reuse_count × 0.5)   # base 90 days, NOT 30
```

The key mechanism: `reuse_count` both boosts retention AND extends half-life — a spaced-repetition principle where proven-valuable items get longer intervals. A 2-year-old task with `reuse_count=50` MUST be retained.

**Compaction triggers:**
- Memory pressure: Qdrant >2 GB or node count >50,000 → compact bottom 10% by priority
- Branch count: >100 completed branches at any tree level → compact lowest-priority at that level
- Scheduled: Weekly score recomputation; monthly full-pass compact nodes below 0.1 priority
- **Never**: Age-only pruning

Compaction preserves the skeleton (id, merkle_hash, structural_signature, tags, outcome, retention_metrics, embedding) while dropping full descriptions and artifact refs. The Merkle hash chain is recomputed upward after each compaction.

**Impact:** Replaces the 30-day age-based policy entirely. Base half-life triples from 30 to 90 days; high-reuse branches effectively never expire. [Epistemic status: MEDIUM — formula grounded in spaced-repetition research (MaRS/FiFA, arxiv:2512.12856) and Merkle tree properties, but untested in this specific configuration. Thresholds require empirical calibration.]

### OVERCLAIM CORRECTION — Reversibility is layer-dependent, not binary

**What IS reversible:**

| Layer | Component | Mechanism |
|-------|-----------|-----------|
| Cross-harness memory (Mem0) | Vector embeddings, graph entities, SQLite history | Delete gitignored Qdrant volume + graph DB |
| Per-harness state | Config files, chat histories, tag caches | Delete gitignored dot-dirs |
| Intra-session (ACP) | Handoff state | Ephemeral — dies with session |
| Task hierarchy | Tree nodes, Merkle chain | Delete task tree files |
| Event logs | OpenHands EventLog, conversation records | Delete `~/.openhands/` |
| Git worktrees | Branch-isolated working copies | `git worktree remove` |

**What is NOT reversible:**

| Layer | Component | Why |
|-------|-----------|-----|
| **Behavioral compounding in instruction files** | CLAUDE.md, AGENTS.md, .aider.conf.yml refined over 50+ sessions | Accumulated judgment in iteratively refined instructions loses evolution path unless intermediate states were versioned. **This is the true irreversibility.** |
| **Pruned context under old policy** | Cross-session branches deleted by 30-day rule | Permanently gone — no recovery after compaction drops full content |
| **Downstream code artifacts** | Git commits influenced by routing decisions and learned preferences | Code is in git history; the causal chain (why this agent chose this approach) is lost |
| **Routing preference drift** | Orchestrator learned which harness handles which task type | Implicit in accumulated routing logs; not captured in any single exportable artifact |

**Export schema for director migration:** The correct export covers four spectra — cross-harness Mem0 memories (vector + graph), per-harness native files (Markdown/YAML/JSON snapshots with content hashes), task hierarchy nodes (full schema including retention metrics), and export metadata (Merkle root for integrity verification, timestamp, selective filter). Format is JSON with embedded arrays for each spectrum. Selective export supports filtering by spectrum, harness, and time range. [Epistemic status: MEDIUM — novel design, no existing standard covers all four spectra.]

---

## PART 2: LIVE DELTAS (March 2026+)

### New primitives that alter the architecture

**Claude Code (rolling releases, Feb–Mar 2026):**
- `WorktreeCreate`/`WorktreeRemove` hooks + `isolation: worktree` in agent definitions — **native worktree isolation** [HIGH]
- Agent Teams via `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` — full independent instances with shared task lists and direct messaging [HIGH]
- Tasks system (v2.1, Jan 22 2026) — DAG-based dependencies, cross-session persistence via `~/.claude/tasks/` [HIGH]
- Plan subagent, `/plan` command, `disallowedTools` for agents [HIGH]
- HTTP hooks (`"type": "http"`) — new hook surface beyond filesystem [MEDIUM]
- `CLAUDE_CODE_SIMPLE=1` now disables CLAUDE.md, hooks, MCP, and attachments — **breaks shared config if set in CI** [HIGH]
- `.claude/rules/` directory for auto-loaded rule files [HIGH]
- `ExitWorktree` tool for programmatic worktree cleanup [MEDIUM]

**Gemini CLI v0.32.1 (Mar 4 2026) / v0.33.0-preview:**
- Plan Mode (`/plan`, `enter_plan_mode` tool) — **new PLAN collision vector with OpenHands** [HIGH]
- Policy engine (`--policy` flag) replaces deprecated `--allowed-tools` [HIGH]
- Custom skills system [MEDIUM]
- GEMINI.md deduplication by device/inode on case-insensitive filesystems — **directly affects symlink strategy** (symlinked files with same inode loaded only once) [HIGH]
- Research subagents in plan mode (preview) [MEDIUM]

**OpenAI Codex CLI (rolling):**
- GPT-5.4 with native computer-use and 1M context [HIGH]
- SKILL.md support for agent skills [MEDIUM]
- `codex mcp-server` mode — Codex as MCP server [HIGH]
- `codex exec` non-interactive mode for CI/automation [MEDIUM]
- ExecPolicy engine (preview) for fine-grained tool permissions [MEDIUM]
- `AGENTS.override.md` takes precedence over `AGENTS.md` at any directory level [HIGH]
- Thread forking into sub-agents [MEDIUM]

**OpenClaw v2026.3.7 (Mar 7 2026):**
- ContextEngine plugin with full lifecycle hooks: bootstrap, ingest, assemble, compact, afterTurn, prepareSubagentSpawn, onSubagentEnded [HIGH]
- ACP persistent channel bindings [MEDIUM]
- Adaptive thinking defaults for Claude 4.6 [LOW]

**OpenHands v1.4.0 (Feb 17 2026) / CLI v1.13.0:**
- **Planning Mode BETA** (March 4 2026, not March 6 as previously stated) — Planning Agent writes `PLAN.md` to workspace root [HIGH]
- MCP server integration (`openhands mcp`) [HIGH]
- `--always-approve` / `--yolo` flags for automated execution [MEDIUM]
- GUI Slash Menu for Agent Skills [LOW]

**Aider v0.86.2 (Feb 12 2026):**
- No releases since Feb 12. Latest notable: `--cache-keepalive-pings`, `--shell-completions`, Grok-4/Gemini 2.5 model support [HIGH]
- Still no native MCP or ACP support — **remains the sole holdout** [HIGH]

### New collision vectors

| Vector | Harnesses | Severity | Discovery |
|--------|----------|----------|-----------|
| Gemini CLI Plan Mode + OpenHands PLAN.md | Gemini CLI, OpenHands | SOFT | Both generate planning artifacts at workspace root |
| MCP server port collision | Claude Code, Gemini CLI, Codex, OpenHands | SOFT | Multiple harnesses configuring same MCP server may contend on same port/socket |
| Worktree session resume cross-talk | Claude Code | SOFT | `/resume` shows sessions from all worktrees of same repo |
| SKILL.md shared spec divergence | Claude Code, Codex, Gemini CLI, OpenClaw | SOFT | Four harnesses use SKILL.md with potentially different frontmatter schemas |
| `CLAUDE_CODE_SIMPLE` environment leak | Claude Code | HARD (if triggered) | CI pipelines setting this var disable CLAUDE.md, hooks, MCP for all sessions |
| Claude Code worktree behavioral degradation | Claude Code | SOFT | Known bug #31872 — system prompt "This is a git worktree" causes model behavior shift |
| OpenClaw self-mutation | OpenClaw | SOFT | Self-improving agent writes new SKILL.md files, could modify shared repo files |

### Deprecated assumptions

- **"OpenHands is event-only"**: PLAN.md introduces a mutable workspace file outside the EventLog. Content is injected into AgentFinishAction but the file itself can be modified externally
- **"HARNESS.md routing table is a production pattern"**: No evidence found of any tool reading a HARNESS.md file. The concept is theoretical only
- **"OpenClaw is a coding harness"**: OpenClaw is a **personal AI agent messaging gateway** (WhatsApp, Discord, Telegram, web). Its coding capability comes from spawning Codex or Claude Code as sub-processes via ACP. It's categorically different from the other five
- **"AGENTS.md v1.0 is the final spec"**: v1.1 proposal (GitHub issue #135) adds optional YAML frontmatter with `description` and `tags` fields, stewarded by Agentic AI Foundation under Linux Foundation
- **"Claude Code doesn't read AGENTS.md"**: Prediction market at **62%** for native adoption in 2026 (manifold.markets). Current workaround: `CLAUDE.md` containing `@AGENTS.md` import reference

---

## PART 3: COMPOUNDED ARCHITECTURE

### A. Repository layout

```
monorepo/                              # Primary worktree (human / orchestrator)
├── .git/                              # Shared object store
│
│── ──── TIER 1: UNIVERSAL SPINE (committed) ────
├── AGENTS.md                          # Source of truth for all harnesses
├── CONVENTIONS.md                     # Code style, git workflow, security
├── ARCHITECTURE.md                    # This file — self-describing spec
├── README.md                          # Human-facing documentation
│
│── ──── TIER 2: HARNESS COMPATIBILITY LAYER (committed) ────
├── CLAUDE.md                          # Contains: @AGENTS.md import + Claude-specific overrides
├── GEMINI.md → AGENTS.md             # Symlink (Gemini inode dedup means loaded once)
├── .aider.conf.yml                    # read: [AGENTS.md, CONVENTIONS.md]
├── .aiderignore                       # File exclusion patterns
├── .claude/
│   ├── settings.json                  # Permissions, hooks, MCP config
│   ├── rules/                         # Auto-loaded rule files (*.md)
│   ├── skills/                        # Shared Claude Code skills
│   ├── agents/                        # Custom subagent definitions
│   └── commands/                      # Slash commands (*.md)
├── .gemini/
│   └── settings.json                  # contextFileName, hooks, policy
├── .codex/
│   └── config.toml                    # project_doc_fallback_filenames, sandbox_mode
├── .agent/
│   └── PLANS.md                       # Codex ExecPlan template (namespaced to avoid root collision)
│
│── ──── TIER 3: ORCHESTRATOR-OWNED (committed) ────
├── orchestrator.yml                   # AgentPool / Superset / custom config
├── docker-compose.yml                 # Memory stack (Qdrant + OpenMemory)
├── .env.example                       # Template for API keys
│
│── ──── TIER 4: GITIGNORED STATE ────
├── .env                               # Actual API keys (gitignored)
├── .aider.chat.history.md             # Aider session history
├── .aider.input.history               # Aider input history
├── .aider.tags.cache.v3/              # Aider repo map cache
├── .claude/worktrees/                 # Claude Code internal worktrees
├── .gemini/context/                   # Gemini CLI session state
├── .openhands/
│   ├── PLAN.md                        # Planning Mode output (MOVED from root)
│   └── workspace/                     # Docker sandbox workspace
├── .openclaw/
│   ├── skills/                        # Local skills cache
│   └── memory/                        # Persistent memory store
│
│── ──── TIER 5: EXTERNAL WORKTREES (sibling directory, gitignored) ────
├── ../wt-aider/                       # branch: agent/aider
├── ../wt-claude/                      # branch: agent/claude
├── ../wt-gemini/                      # branch: agent/gemini
├── ../wt-codex/                       # branch: agent/codex
├── ../wt-openclaw/                    # branch: agent/openclaw
└── ../wt-openhands/                   # branch: agent/openhands
```

**Update semantics:** Tier 1–3 files are committed and updated via human review or orchestrator-mediated PR. Tier 4 files are machine-managed and disposable. Tier 5 worktrees are created/destroyed per task. CLAUDE.md uses `@AGENTS.md` import (not symlink) because Claude Code's auto-memory writes to CLAUDE.md and symlinks would corrupt the shared file. GEMINI.md uses symlink because Gemini CLI's inode deduplication handles it correctly and Gemini CLI does not write back to GEMINI.md.

**.gitignore:**
```
.env
.aider.chat.history.md
.aider.input.history
.aider.tags.cache.v3/
.claude/worktrees/
.gemini/context/
.openhands/
.openclaw/
```

### B. Config architecture

**Minimal shared root satisfying all six native loaders simultaneously:**

| Harness | Primary instruction file | How it reads AGENTS.md | Config file | Config precedence |
|---------|------------------------|----------------------|-------------|-------------------|
| Aider | (none auto-loaded) | `read: [AGENTS.md]` in `.aider.conf.yml` | `.aider.conf.yml` | `~/.aider.conf.yml` → git root → CWD (later wins) |
| Claude Code | `CLAUDE.md` | `@AGENTS.md` import in CLAUDE.md | `.claude/settings.json` | Enterprise → User (`~/.claude/`) → Project → Directory (all additive) |
| Gemini CLI | `GEMINI.md` | Symlink `GEMINI.md → AGENTS.md` | `.gemini/settings.json` | `~/.gemini/` → ancestor dirs → CWD (concatenated) |
| OpenAI Codex | `AGENTS.md` ✅ native | Direct — walks root → CWD | `~/.codex/config.toml` | `~/.codex/AGENTS.md` → root → CWD; `AGENTS.override.md` takes precedence |
| OpenClaw | `IDENTITY.md` / `SOUL.md` | Not applicable (different config surface) | `~/.openclaw/openclaw.json` (JSON5) | Global only; workspace-scoped identity files |
| OpenHands | (prompt/headless) | Via `--headless -f AGENTS.md` or agent prompt | `~/.openhands/agent_settings.json` | CLI args → env vars → config.toml → defaults |

**Key insight: No filename collisions at repo root for primary config files.** Each harness uses distinct dot-directories at both `~/` and repo level. The AGENTS.md → CLAUDE.md → GEMINI.md fan-out via import/symlink is the unification point. Codex is the only harness with native AGENTS.md discovery; the others require one line of config each.

**Environment variables (non-overlapping):**
```
ANTHROPIC_API_KEY    → Aider, Claude Code, OpenClaw, OpenHands
OPENAI_API_KEY       → Aider, Codex, OpenClaw, OpenHands, Mem0
GOOGLE_API_KEY       → Gemini CLI
```

### C. Memory architecture — four-spectrum lattice

**Recommended local stack: Mem0 OSS** (Apache 2.0, v1.0.0). Mem0 is the only backend providing both graph and vector memory natively with multi-tenant namespacing (`user_id`/`agent_id`/`run_id`), making it the correct choice over Chroma (pure vector, no graph) and Letta (full agent framework, not a memory layer). [HIGH — confirmed via docs.mem0.ai, GitHub mem0ai/mem0]

**Local deployment:**
- Vector store: Qdrant (Docker, port 6333, gitignored volume)
- Graph store: Kuzu (embedded, no server required — lightest option) or Memgraph (Docker, port 7687)
- Embeddings: Ollama with `nomic-embed-text` or OpenAI API
- History: SQLite at `~/.mem0/history.db`
- MCP interface: OpenMemory MCP server (port 8765) — standardized access for all harnesses

```
┌──────────────────────────────────────────────────────────────────┐
│                    FOUR-SPECTRUM MEMORY LATTICE                   │
├──────────────────────────────────────────────────────────────────┤
│                                                                  │
│  SPECTRUM 1: Cross-Harness / Cross-Session (Mem0)               │
│  ┌──────────────────┐  ┌──────────────────┐                     │
│  │  Qdrant (vector)  │  │  Kuzu (graph)    │                     │
│  │  :6333            │  │  embedded         │                     │
│  │  per-agent ns     │  │  entity-relation  │                     │
│  └────────┬─────────┘  └────────┬─────────┘                     │
│           └──────────┬──────────┘                                │
│                      ▼                                           │
│           ┌──────────────────┐                                   │
│           │ OpenMemory MCP   │ ← All harnesses connect here     │
│           │ :8765            │                                   │
│           │ /mcp/{agent}/sse │                                   │
│           └──────────────────┘                                   │
│                                                                  │
│  SPECTRUM 2: Per-Harness Native Persistence                     │
│  ┌────────┐┌────────┐┌────────┐┌────────┐┌────────┐┌────────┐  │
│  │.aider* ││.claude/││.gemini/││.codex/ ││.open-  ││.open-  │  │
│  │history ││memory/ ││context/││state/  ││claw/   ││hands/  │  │
│  │tags    ││tasks/  ││hooks/  ││logs/   ││memory/ ││events/ │  │
│  └────────┘└────────┘└────────┘└────────┘└────────┘└────────┘  │
│  Write: each harness owns its files exclusively                 │
│                                                                  │
│  SPECTRUM 3: Intra-Session (ACP Handoff)                        │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ session/prompt → session/update stream → session/cancel   │   │
│  │ Ephemeral JSON-RPC payloads — no persistence              │   │
│  │ Single-writer per handoff (pipeline, not concurrent)      │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                  │
│  SPECTRUM 4: Fractal Merkle Task Hierarchy                      │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ root ──┬── goal_A ──┬── subtask_A1 (reuse_count: 12)     │   │
│  │        │            └── subtask_A2 [compacted]            │   │
│  │        └── goal_B ──── subtask_B1                         │   │
│  │ merkle_hash = SHA256(content_hash || sorted(children))    │   │
│  │ Append-only root hash log (MMR) for temporal audit        │   │
│  │ Frequency-weighted retention (see GAP 3 patch)            │   │
│  └──────────────────────────────────────────────────────────┘   │
└──────────────────────────────────────────────────────────────────┘
```

**Write semantics per spectrum:**

| Spectrum | Trigger | Content | Consistency | Conflict resolution |
|----------|---------|---------|-------------|-------------------|
| 1. Cross-harness | `memory.add()`, post-task, `/remember` | LLM-extracted atomic facts | Eventually consistent | Mem0's LLM-mediated ADD/UPDATE/DELETE/NONE. Recency wins on contradiction |
| 2. Per-harness | Harness-specific auto-update | Native format (MD/YAML/JSON/SQLite) | Strong (atomic file write) | No cross-harness conflict (separate files) |
| 3. Intra-session | ACP handoff event | Structured JSON-RPC payload | Synchronous | Single writer per handoff |
| 4. Task hierarchy | Task create/complete/status | Task node per retention schema | Append-mostly + Merkle rehash | Parent aggregates children; hash detects tampering |

**Conflict resolution priority:** Git (code) > per-harness native > Mem0 cross-harness > task hierarchy > ACP session state.

**Task node schema** (key fields for reuse detection):
```json
{
  "id": "uuid-v4",
  "merkle_hash": "sha256(content_hash || sorted(children_hashes))",
  "content": {
    "description": "string",
    "task_class_embedding": "[float × 768]",
    "task_class_tags": ["string"],
    "harness_origin": "enum",
    "structural_signature": "sha256(sorted_file_paths || op_types)",
    "outcome": "enum: success|failure|partial|abandoned"
  },
  "retention_metrics": {
    "access_count": "int",
    "reuse_count": "int",
    "recurrence_score": "float [0,1]",
    "retention_priority": "float",
    "half_life": "float (days, base 90)"
  }
}
```

### D. Communication stack

**Primary layer: ACP stdio** for 5/6 harnesses (all except Aider). The orchestrator spawns each harness as a subprocess, communicates via JSON-RPC 2.0 over stdio. ACP provides session management (`session/new`, `session/prompt`, streaming `session/update`), filesystem mediation, and terminal operations.

**Aider bridge:** Community `aider-mcp` server wraps Aider as an MCP tool over stdio. The orchestrator invokes Aider through this bridge. Alternatively, raw subprocess with `aider --yes-always --no-auto-commits --message-file /tmp/prompt.md`.

**MCP layer: Tool federation** across all harnesses. Shared MCP servers (OpenMemory for memory, filesystem for file access) are passed to each agent via ACP session configuration during `initialize`. Claude Code, Codex, Gemini CLI, and OpenHands all have first-class MCP client support. Claude Code and Codex can also run AS MCP servers.

**Fallback architecture (ACP-independent):** If ACP adoption lags, the proven fallback is the subprocess + worktree + filesystem pattern used by every production orchestrator:

```
Orchestrator process
  ├── git worktree create per task
  ├── spawn CLI agent as subprocess in tmux pane
  ├── pipe prompt via stdin or temp file
  ├── monitor stdout + exit codes
  ├── coordinate via filesystem (shared task files)
  └── merge results via git (PR per worktree branch)
```

This is not a degraded mode — it is the primary mechanism used by Superset, Agent Orchestrator, Gas Town, and AgentPool. ACP adds structured session semantics on top but is not strictly required.

**Graceful degradation matrix:**

| Layer | Available | Degraded | Failed |
|-------|-----------|----------|--------|
| ACP | Full session management, streaming, filesystem mediation | Subprocess + stdout parsing (no structured session) | Manual CLI invocation |
| MCP | Structured tool sharing across harnesses | File-based tool coordination | Per-harness isolated tools |
| Mem0 | Cross-harness semantic memory | Per-harness isolated memory files | No cross-harness learning |

### E. Collision resolution matrix

**All 15 pairs with severity classification:**

| # | Pair | Vector | Severity | Mitigation |
|---|------|--------|----------|------------|
| 1 | Aider / Claude Code | Git auto-commit race on `.git/index.lock` | SOFT | Separate worktrees (eliminates contention) |
| 2 | Aider / Gemini CLI | Both read conventions files | COSMETIC | Symlink CONVENTIONS.md → AGENTS.md |
| 3 | Aider / Codex | No shared state files | COSMETIC | None needed |
| 4 | Aider / OpenClaw | No direct interaction | COSMETIC | Separate worktrees |
| 5 | Aider / OpenHands | Both support AGENTS.md | COSMETIC | None needed |
| 6 | Claude Code / Gemini CLI | CLAUDE.md vs GEMINI.md context fragmentation | SOFT | AGENTS.md as shared source via import/symlink |
| 7 | Claude Code / Codex | CLAUDE.md vs AGENTS.md + `.claude/` vs `.codex/` | SOFT | Separate worktrees + AGENTS.md as shared source |
| 8 | Claude Code / OpenClaw | Shell execution overlap (OpenClaw spawns Claude Code as sub-process) | SOFT | Never nest OpenClaw → Claude Code in same worktree |
| 9 | Claude Code / OpenHands | Docker sandbox overlap | SOFT | OpenHands in Docker; Claude Code local. Separate execution environments |
| 10 | Gemini CLI / Codex | `.gemini/` vs `.codex/` | COSMETIC | None needed |
| 11 | Gemini CLI / OpenHands | Gemini Plan Mode + OpenHands PLAN.md | **SOFT** (NEW) | Move OpenHands PLAN.md to `.openhands/PLAN.md` |
| 12 | Gemini CLI / OpenClaw | Hook syscall contention (synchronous hooks + concurrent shells) | **SOFT-HARD** | Separate worktrees + port isolation + hook rate-limiting |
| 13 | Codex / OpenClaw | `.agent/PLANS.md` readable by OpenClaw sub-agents | COSMETIC | Namespace under `.agent/` |
| 14 | Codex / OpenHands | PLANS.md vs PLAN.md semantic overlap | SOFT | Namespace Codex to `.agent/PLANS.md`; OpenHands to `.openhands/PLAN.md` |
| 15 | OpenClaw / OpenHands | Execution model clash (Node.js vs Docker) | SOFT | Separate runtimes |

**Critical mitigations:**
- **PLAN.md collision (rows 11, 14):** OpenHands Planning Mode output MUST be redirected to `.openhands/PLAN.md` (gitignored). Codex ExecPlan templates MUST be namespaced to `.agent/PLANS.md` (committed). This eliminates root-level planning file collisions
- **Worktree degradation (Claude Code):** Known bug #31872 — model treats worktree sessions as "lighter," ignoring workflows and rules. Monitor for fix
- **SKILL.md divergence:** Four harnesses use SKILL.md with potentially different frontmatter schemas. Standardize on Codex's SKILL.md format (most documented)

### F. Director architecture — thin orchestrator, not AI agent

**Validated selection: Thin process orchestrator** (AgentPool recommended for ACP-native setups; Superset for GUI-first workflows).

**Capability matrix:**

| Capability | AgentPool | Superset | Agent Orchestrator | OpenHands (as worker) | Claude Code (as worker) |
|-----------|-----------|----------|-------------------|---------------------|----------------------|
| Cross-harness delegation | ✅ ACP + MCP | ✅ Subprocess | ✅ Plugin | ❌ Internal only | ❌ Claude only |
| Git worktree isolation | ✅ | ✅ | ✅ | ❌ (Docker sandbox) | ✅ Native |
| Task DAG coordination | ✅ Teams + chains | ❌ Parallel only | ✅ CI loop | Blocking delegation | ✅ Tasks system |
| Model agnostic | ✅ | ✅ | ✅ | ✅ | ❌ (Claude locked) |
| Deterministic replay | ❌ | ❌ | ❌ | ✅ (event-sourced) | ❌ |
| Protocol support | ACP, MCP, AG-UI | None (subprocess) | Plugins | MCP client | MCP client + server |
| Maturity | Active, early | 3,285 stars | 3,288 tests | v1.4.0 stable | Production GA |

**Initialization sequence:**
1. Orchestrator reads `orchestrator.yml` for harness definitions, routing preferences, worktree config
2. Creates git worktrees per task assignment (6 branches: `agent/{harness}`)
3. Spawns each harness as ACP subprocess (or raw subprocess for Aider)
4. Passes shared MCP servers (OpenMemory, filesystem) via ACP session config
5. Monitors task progress via stdout/ACP `session/update` streams
6. On task completion: collects results, updates Mem0 memory, creates PR per branch
7. Merges approved PRs to main; prunes completed worktrees

**Failure recovery:** Each worktree is independently recoverable. Orchestrator maintains a task journal (NDJSON, gitignored) mapping task IDs to worktree branches and process PIDs. On crash: read journal, check worktree state, resume or re-spawn.

**Migration path if Claude Code absorbs orchestration natively:** If Claude Code Agent Teams exits experimental AND gains model-agnostic routing, the migration is: export Mem0 memory via JSON schema → import into Claude Code's persistent task system → reconfigure Agent Teams to spawn external harnesses via MCP tools. The Mem0 cross-harness memory and task hierarchy are portable; the per-harness native memory stays.

### G. Self-improvement loop

**Cross-harness postmortem → instruction mutation governance:**

1. After each task completion, the orchestrator runs a postmortem: diff the task result against AGENTS.md instructions, identify gaps (e.g., a convention was violated because it wasn't in AGENTS.md)
2. Propose instruction mutations as a PR against AGENTS.md/CONVENTIONS.md
3. Human reviews mutation PR. Approval threshold: mutation must cite specific task failure and proposed fix
4. On merge: all harnesses pick up the updated instructions on next session start (via their respective file-loading mechanisms)

**Compound learning rate:** Track the ratio of novel instruction mutations to total tasks per week. Target: **2–5% mutation rate**. Below 2% indicates stagnation (instructions aren't learning). Above 5% indicates instability (instructions thrashing).

**Homogenization prevention:** Each harness has its own per-harness instruction overrides (CLAUDE.md overrides, `.aider.conf.yml` tweaks, `.gemini/settings.json` policy). The shared AGENTS.md captures universal truths; per-harness files capture harness-specific behaviors. Monitor for convergence: if all per-harness files become identical, the routing table is wrong (harnesses aren't being used for their strengths).

**Drift detection:** Weekly Merkle root comparison of the task hierarchy. If the root hash hasn't changed for >7 days, no learning occurred. If it changed >100 times, investigate thrashing. Monthly review of retention priority distribution — if >50% of nodes have `retention_priority < 0.2`, compaction is overdue.

### H. Bootstrap sequence

```bash
#!/usr/bin/env bash
set -euo pipefail

# === PHASE 0: Prerequisites ===
# Node.js ≥ 22, Python 3.12+, Docker, Git, uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# === PHASE 1: Monorepo skeleton ===
mkdir -p ~/monorepo && cd ~/monorepo && git init
cat > AGENTS.md << 'EOF'
# Project Agent Instructions
## Conventions: Conventional commits. Run tests before committing.
## Architecture: Multi-harness monorepo. See ARCHITECTURE.md.
## Memory: Shared Mem0 at localhost:8765 via OpenMemory MCP.
EOF

# Harness compatibility layer
cat > CLAUDE.md << 'EOF'
@AGENTS.md
# Claude Code specific: Use Agent Teams for parallel work.
# Use /plan for architecture decisions. Background with Ctrl+B.
EOF

ln -sf AGENTS.md GEMINI.md
cat > .aider.conf.yml << 'YAML'
read: [AGENTS.md, CONVENTIONS.md]
auto-commits: false
model: sonnet
YAML

mkdir -p .codex .claude/rules .gemini .agent
cat > .codex/config.toml << 'TOML'
model = "gpt-5-codex"
approval_policy = "on-request"
project_doc_max_bytes = 65536
TOML

# API keys
cp .env.example .env  # Fill in ANTHROPIC_API_KEY, OPENAI_API_KEY, GOOGLE_API_KEY
echo '.env' >> .gitignore

git add -A && git commit -m "chore: monorepo skeleton with AGENTS.md spine"

# === PHASE 2: Git worktrees ===
for harness in aider claude gemini codex openclaw openhands; do
  git worktree add ../wt-${harness} -b agent/${harness}
done

# === PHASE 3: Install harnesses ===
python -m pip install aider-install && aider-install
npm install -g @anthropic-ai/claude-code
npm install -g @google/gemini-cli
npm i -g @openai/codex
npm install -g openclaw@latest
uv tool install openhands --python 3.12

# === PHASE 4: Memory stack ===
cat > docker-compose.yml << 'YAML'
services:
  qdrant:
    image: qdrant/qdrant:latest
    ports: ["6333:6333", "6334:6334"]
    volumes: [qdrant_storage:/qdrant/storage]
  openmemory:
    image: skpassegna/openmemory-mcp:latest
    ports: ["8765:8765"]
    environment:
      OPENAI_API_KEY: ${OPENAI_API_KEY}
      QDRANT_HOST: qdrant
      QDRANT_PORT: "6333"
    depends_on: [qdrant]
volumes:
  qdrant_storage:
YAML
docker compose up -d

# === PHASE 5: Connect harnesses to memory ===
claude mcp add openmemory \
  npx -y supergateway --sse "http://localhost:8765/mcp/claude/sse/${USER}"
codex mcp add openmemory --url "http://localhost:8765/mcp/codex/sse/${USER}"
# Gemini: /extensions add openmemory http://localhost:8765/mcp/gemini/sse/${USER}
openhands mcp add openmemory --transport sse \
  "http://localhost:8765/mcp/openhands/sse/${USER}"

# === PHASE 6: Verify ===
for cmd in aider claude gemini codex openclaw openhands; do
  $cmd --version 2>/dev/null && echo "$cmd: OK" || echo "$cmd: check manually"
done
git worktree list
docker compose ps
curl -s http://localhost:6333 | head -1
```

### I. Reversibility map

| Layer | Reversible | Export mechanism | Time to reverse | Notes |
|-------|-----------|-----------------|-----------------|-------|
| Git worktrees | ✅ Full | `git worktree remove` + `git branch -D` | Seconds | Clean removal, no residue |
| Mem0 vector store | ✅ Full | Delete Docker volume or `memory.delete_all()` | Seconds | Complete wipe to blank |
| Mem0 graph store | ✅ Full | Drop database | Seconds | Gitignored, disposable |
| Per-harness dot-dirs | ✅ Full | `rm -rf .aider* .claude/ .gemini/ .openhands/ .openclaw/` | Seconds | Clean re-init on next session |
| ACP session state | ✅ Auto | Ephemeral — dies with process | Instant | No persistence to reverse |
| Task hierarchy | ✅ Full | Delete task tree files | Seconds | Gitignored |
| OpenHands EventLog | ✅ Full | Delete `~/.openhands/` | Seconds | Conversations lost but reproducible |
| **Instruction file compounds** | **❌ Partial** | Manual — requires reviewing git history of AGENTS.md/CLAUDE.md | **Days to weeks** | **THE TRUE IRREVERSIBILITY.** 50+ sessions of accumulated judgment in instruction files. Intermediate states exist in git log but require manual archaeology to revert meaningfully |
| **Pruned memory branches** | **❌ Permanent** | None — compacted content dropped | N/A | Why frequency-weighted retention is critical: prevents premature destruction |
| **Downstream code artifacts** | **❌ Permanent** | In git history but causal chain lost | N/A | Code commits influenced by now-gone routing decisions |
| **Routing preference drift** | **⚠️ Difficult** | Export orchestrator task journal | Hours | Implicit learned preferences in accumulated routing logs |

**Correct export schema for full director migration:**

```json
{
  "export_metadata": {
    "export_ts": "ISO8601",
    "merkle_root": "sha256",
    "source_orchestrator": "string",
    "spectra_included": ["cross_harness", "per_harness", "task_hierarchy"]
  },
  "cross_harness": {
    "memories": [{"id": "...", "content": "...", "embedding": [...], "metadata": {...}}],
    "graph_entities": [{"id": "...", "name": "...", "type": "...", "properties": {...}}],
    "graph_relationships": [{"source": "...", "target": "...", "relation": "..."}]
  },
  "per_harness": {
    "aider": {"files": [{"path": "...", "content": "...", "hash": "..."}]},
    "claude_code": {"files": [...]},
    "...": "..."
  },
  "task_hierarchy": {
    "root_hash": "sha256",
    "nodes": [{"id": "...", "merkle_hash": "...", "retention_metrics": {...}, "...": "..."}]
  }
}
```

### J. Evolutionary maintenance

**Changelog monitoring:** Subscribe to release feeds for all six harnesses:
- Aider: GitHub Aider-AI/aider releases + aider.chat/HISTORY.html
- Claude Code: github.com/anthropics/claude-code/CHANGELOG.md + claudelog.com
- Gemini CLI: geminicli.com/docs/changelogs + github.com/google-gemini/gemini-cli
- Codex: developers.openai.com/codex + github.com/openai/codex
- OpenClaw: github.com/openclaw/openclaw/releases
- OpenHands: github.com/OpenHands/OpenHands/releases + openhands.dev/blog

**Update sequence (on any harness update):**
1. Read changelog for new primitives, config changes, deprecations
2. Check collision matrix — does the update introduce new vectors?
3. Test in isolated worktree — `git worktree add ../wt-test -b test/update`
4. Update ARCHITECTURE.md if architecture-impacting
5. Update AGENTS.md if instruction-impacting
6. Commit changes via PR with harness-update tag

**Regression test suite:**
- Smoke: Each harness starts, reads AGENTS.md (or equivalent), completes a trivial task
- Integration: Two harnesses modify different files in separate worktrees, merge without conflict
- Memory: Task completion writes to Mem0; another harness reads the memory
- Collision: Verify no file contention when all six harnesses run simultaneously
- Retention: Create 100 task nodes, run compaction, verify high-reuse nodes survive

**Quarterly re-baseline:**
- Review all epistemic status labels — upgrade/downgrade based on evidence
- Re-evaluate orchestrator choice against new entrants
- Audit instruction file compound growth (diff AGENTS.md across quarters)
- Full export + integrity check of Mem0 memory
- Review Merkle task hierarchy health metrics

---

## PART 4: ARCHITECTURE.md ARTIFACT

```markdown
# ARCHITECTURE.md — Multi-Harness Monorepo Specification v1.0

This monorepo co-locates six agentic coding harnesses (Aider, Claude Code,
Gemini CLI, OpenAI Codex, OpenClaw, OpenHands) on a single local machine
with shared memory, isolated git worktrees, and a thin process orchestrator.
All harnesses read AGENTS.md as the universal instruction source.
Collision isolation is achieved via per-harness git worktrees and namespaced
config files with zero root-level filename conflicts.

## Repository layout

```
.                               # Primary worktree (orchestrator/human)
├── AGENTS.md                   # Universal instructions (all harnesses)
├── CLAUDE.md                   # @AGENTS.md import + Claude overrides
├── GEMINI.md → AGENTS.md      # Symlink for Gemini CLI
├── CONVENTIONS.md              # Code style, git workflow, security
├── ARCHITECTURE.md             # This file
├── .aider.conf.yml             # read: [AGENTS.md] + model config
├── .aiderignore                # Aider file exclusions
├── .claude/
│   ├── settings.json           # Permissions, hooks, MCP
│   ├── rules/*.md              # Auto-loaded rules
│   ├── skills/                 # Shared skills
│   └── agents/                 # Custom subagent defs
├── .gemini/settings.json       # Context, hooks, policy
├── .codex/config.toml          # Model, sandbox, permissions
├── .agent/PLANS.md             # Codex ExecPlan template
├── orchestrator.yml            # Orchestrator config
├── docker-compose.yml          # Memory stack
├── .env                        # API keys (GITIGNORED)
├── .openhands/                 # OpenHands state (GITIGNORED)
├── .openclaw/                  # OpenClaw state (GITIGNORED)
└── ../wt-{harness}/            # Per-harness worktrees (GITIGNORED)
```

## Config quickref

| Harness     | Instruction file | Config file              | AGENTS.md access              |
|-------------|-----------------|--------------------------|-------------------------------|
| Aider       | .aider.conf.yml | .aider.conf.yml          | `read: [AGENTS.md]`          |
| Claude Code | CLAUDE.md       | .claude/settings.json    | `@AGENTS.md` in CLAUDE.md    |
| Gemini CLI  | GEMINI.md       | .gemini/settings.json    | Symlink GEMINI.md → AGENTS.md|
| Codex       | AGENTS.md       | .codex/config.toml       | Native discovery              |
| OpenClaw    | ~/.openclaw/    | ~/.openclaw/openclaw.json| Via ACP session config       |
| OpenHands   | (prompt)        | ~/.openhands/settings    | --headless -f AGENTS.md      |

## Memory federation

```
SPECTRUM 1 (cross-harness):  Mem0 Qdrant+Kuzu → OpenMemory MCP :8765
SPECTRUM 2 (per-harness):    Each harness's gitignored dot-dir
SPECTRUM 3 (intra-session):  ACP JSON-RPC stdio (ephemeral)
SPECTRUM 4 (task tree):      Merkle hierarchy, frequency-weighted retention
```

Write priority: Git > per-harness > Mem0 > task tree > ACP session.
Retention: Frequency-weighted, base half-life 90 days.
Never prune by age alone. Reuse extends half-life.

## Routing decision table

| Task type                  | Recommended harness | Rationale                         |
|---------------------------|--------------------|------------------------------------|
| Interactive pair coding    | Aider              | Real-time terminal, wide model support |
| Multi-file refactoring     | Claude Code        | Native worktrees, sub-agents, 1M ctx  |
| Monorepo cross-project     | Codex              | Native AGENTS.md hierarchy, GPT-5.4   |
| Planning / architecture    | Claude Code (Plan) | Plan subagent, Agent Teams            |
| CI/CD automation           | Codex (`exec`)     | Non-interactive, structured output    |
| Quick code generation      | Gemini CLI         | Free tier, Gemini 3, fast iteration   |
| Issue triage / PR review   | OpenHands          | GitHub/GitLab integration, headless   |
| Personal agent / messaging | OpenClaw           | Gateway: WhatsApp/Discord/Telegram    |

## Bootstrap commands

```bash
# Install
pip install aider-install && aider-install
npm i -g @anthropic-ai/claude-code @google/gemini-cli @openai/codex openclaw
uv tool install openhands --python 3.12

# Initialize
git init && git add -A && git commit -m "init"
for h in aider claude gemini codex openclaw openhands; do
  git worktree add ../wt-$h -b agent/$h
done

# Memory stack
docker compose up -d  # Qdrant :6333 + OpenMemory :8765

# Connect MCP
claude mcp add openmemory npx -y supergateway --sse "http://localhost:8765/mcp/claude/sse/$USER"
codex mcp add openmemory --url "http://localhost:8765/mcp/codex/sse/$USER"
openhands mcp add openmemory --transport sse "http://localhost:8765/mcp/openhands/sse/$USER"
```

## Maintenance protocol

Weekly: Review harness changelogs. Recompute task retention scores.
Monthly: Full compaction pass. Audit instruction drift.
Quarterly: Re-baseline architecture. Full memory export + integrity check.
On harness update: Test in isolated worktree → update collision matrix → PR.

## Collision matrix (severity: HARD > SOFT > COSMETIC)

| Pair                     | Severity  | Vector                              | Fix                            |
|--------------------------|-----------|-------------------------------------|--------------------------------|
| Aider / Claude Code      | SOFT      | Git auto-commit race                | Separate worktrees             |
| Gemini / OpenHands       | SOFT      | Plan Mode vs PLAN.md overlap        | Namespace to .openhands/       |
| Gemini / OpenClaw        | SOFT-HARD | Hook syscall contention             | Port isolation + worktrees     |
| Codex / OpenHands        | SOFT      | PLANS.md vs PLAN.md semantic        | Namespace to .agent/ and .openhands/ |
| Claude / OpenClaw        | SOFT      | Nested sub-process risk             | Never nest in same worktree    |
| All other pairs          | COSMETIC  | No direct file/resource contention  | None required                  |

## Reversibility map

✅ REVERSIBLE: Mem0 store, event logs, worktrees, per-harness state, ACP sessions
❌ NOT REVERSIBLE: Instruction file behavioral compounds, pruned memory branches
⚠️  DIFFICULT: Routing preference drift, downstream code causal chains

## Epistemic status labels

| Claim                                        | Status      |
|----------------------------------------------|-------------|
| ACP stdio production-ready for local use     | HIGH        |
| ACP remote transport (HTTP/WS) ready         | LOW         |
| 5/6 harnesses support ACP                    | HIGH        |
| Mem0 correct for local cross-harness memory  | HIGH        |
| Frequency-weighted retention formula         | MEDIUM      |
| Thin orchestrator > AI agent as director     | HIGH        |
| AGENTS.md becoming cross-harness standard    | HIGH        |
| Claude Code will adopt AGENTS.md natively    | MEDIUM (62%)|
| OpenClaw is a coding harness                 | LOW (it's a personal agent gateway) |
| HARNESS.md routing table is a real pattern   | LOW (theoretical only)              |
| Krieger ships Q3 2027                        | REFUTED (Cowork shipped Jan 2026)   |
| OpenHands PLAN.md date March 6 2026          | CORRECTED → March 4 2026            |
| Bootstrap is irreversible                    | CORRECTED → layer-dependent          |
```

---

*This specification was compiled March 11, 2026, drawing on primary sources including agentclientprotocol.com, official documentation for all six harnesses, GitHub release histories, the OpenHands arXiv paper (2511.03690), Anthropic product announcements, and production orchestrator repositories (Superset, AgentPool, Composio Agent Orchestrator). All epistemic labels reflect source quality and verification depth at time of compilation. Re-baseline quarterly.*