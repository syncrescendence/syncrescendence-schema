# ARCHITECTURE.md — Definitive Multi-Harness Monorepo Specification v2.0

**Scope:** Six agentic coding harnesses (Aider, Claude Code, Gemini CLI, OpenAI
Codex, OpenClaw, OpenHands) co-located on a single local machine with shared
memory, isolated git worktrees, a thin process orchestrator, and a
cross-harness self-improvement loop. AGENTS.md is the universal instruction
source; collision isolation is achieved by namespacing every harness to its own
git worktree and dot-directory with zero root-level filename conflicts. This
document is self-describing: it is readable by all six native
instruction-loading mechanisms and serves as the orchestrator's session-start
reference.

**Compiled:** March 11 2026. Epistemic labels are inline throughout. Re-baseline
quarterly; update immediately on any harness major release.

---

## Table of Contents

1. [Repository Layout](#1-repository-layout)
2. [Config Architecture](#2-config-architecture)
3. [Memory Architecture](#3-memory-architecture)
4. [Communication Stack](#4-communication-stack)
5. [Collision Resolution Matrix](#5-collision-resolution-matrix)
6. [Director Architecture](#6-director-architecture)
7. [Observability & Telemetry](#7-observability--telemetry)
8. [Self-Improvement Loop](#8-self-improvement-loop)
9. [Protocol Convergence Trajectory](#9-protocol-convergence-trajectory)
10. [Bootstrap Sequence](#10-bootstrap-sequence)
11. [Reversibility Map](#11-reversibility-map)
12. [Velocity Benchmarks](#12-velocity-benchmarks)
13. [Evolutionary Maintenance](#13-evolutionary-maintenance)
14. [Epistemic Status Table](#14-epistemic-status-table)

---

## 1. Repository Layout

Four ownership tiers determine commit status, update semantics, and garbage-
collection policy. The tier boundary between committed and gitignored is the
single most load-bearing structural decision in the entire architecture — it
determines what survives a full state wipe and what is recoverable vs.
permanently lost.

```
monorepo/                              ← Primary worktree (human / orchestrator)
│
│  ━━━ TIER 1: UNIVERSAL SPINE (committed, human-reviewed) ━━━━━━━━━━━━━━━━
│
├── AGENTS.md                          ← Universal instructions — ALL harnesses
├── CONVENTIONS.md                     ← Code style, git workflow, security rules
├── ARCHITECTURE.md                    ← This file (self-describing spec)
├── README.md                          ← Human-facing entry point
│
│  ━━━ TIER 2: HARNESS COMPATIBILITY LAYER (committed, generated+reviewed) ━━
│
├── CLAUDE.md                          ← @AGENTS.md import + Claude overrides
│                                        (DO NOT symlink — Claude auto-writes here)
├── GEMINI.md → AGENTS.md             ← Symlink (inode dedup: loaded once)
├── .aider.conf.yml                    ← read: [AGENTS.md, CONVENTIONS.md]
├── .aiderignore                       ← Aider file exclusion patterns
│
├── .claude/
│   ├── settings.json                  ← Permissions, HTTP hooks, MCP config
│   ├── rules/                         ← Auto-loaded rule files (*.md)
│   ├── skills/                        ← Shared Claude Code skills
│   ├── agents/                        ← Custom subagent definitions
│   └── commands/                      ← Slash commands (*.md)
│
├── .gemini/
│   └── settings.json                  ← contextFileName, hooks, policy engine
│
├── .codex/
│   └── config.toml                    ← model, approval_policy, sandbox_mode
│
├── .agent/
│   └── PLANS.md                       ← Codex ExecPlan template
│                                        (namespaced to avoid root collision with
│                                        OpenHands PLAN.md — see §5, row 14)
│
│  ━━━ TIER 3: ORCHESTRATOR-OWNED (committed, machine-maintained) ━━━━━━━━━━
│
├── orchestrator.yml                   ← Process orchestrator config
│                                        (absorbs HARNESS.md routing concept —
│                                        see §6 director provenance note)
├── docker-compose.yml                 ← Memory stack (Qdrant + OpenMemory)
├── prometheus/
│   ├── prometheus.yml                 ← Scrape config for all harness exporters
│   └── alert_rules.yml               ← Cost ceiling, velocity floor alerts
├── .env.example                       ← API key template (committed)
│
│  ━━━ TIER 4: GITIGNORED STATE ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
│
├── .env                               ← Actual API keys
├── .aider.chat.history.md
├── .aider.input.history
├── .aider.tags.cache.v3/
│
├── .claude/
│   ├── worktrees/                     ← Claude Code internal worktree state
│   ├── tasks/                         ← Persistent Tasks DAG (cross-session)
│   └── memory/                        ← MEMORY.md auto-writes
│
├── .gemini/context/                   ← Gemini CLI session state
│
├── .openhands/
│   ├── PLAN.md                        ← Planning Mode output (MOVED from root)
│   │                                    CRITICAL: must be here, not repo root
│   └── workspace/                     ← Docker sandbox workspace
│
├── .openclaw/
│   ├── skills/                        ← Local skills cache
│   └── memory/                        ← OpenClaw persistent memory
│
│  ━━━ TIER 5: GIT WORKTREES (sibling dirs, gitignored from primary) ━━━━━━━
│
├── ../wt-aider/                       ← branch: agent/aider
├── ../wt-claude/                      ← branch: agent/claude
├── ../wt-gemini/                      ← branch: agent/gemini
├── ../wt-codex/                       ← branch: agent/codex
├── ../wt-openclaw/                    ← branch: agent/openclaw
└── ../wt-openhands/                   ← branch: agent/openhands
```

**Root .gitignore (minimum required):**

```gitignore
.env
.aider.chat.history.md
.aider.input.history
.aider.tags.cache.v3/
.claude/worktrees/
.claude/tasks/
.claude/memory/
.gemini/context/
.openhands/
.openclaw/
```

**Update semantics by tier:**

| Tier | Who writes | How | Review required |
|------|-----------|-----|----------------|
| 1 — Universal spine | Human + orchestrator postmortem PRs | Manual commit | Yes — human approval |
| 2 — Compatibility layer | Human + harness auto-update (CLAUDE.md only) | Commit or auto-write | Yes for AGENTS.md changes; no for CLAUDE.md memory appends |
| 3 — Orchestrator | Orchestrator process + CI | Commit via PR | Yes |
| 4 — Gitignored state | Each harness owns its files exclusively | Machine-managed | No |
| 5 — Worktrees | Per-task, created and destroyed by orchestrator | `git worktree add/remove` | No |

**Why CLAUDE.md is NOT a symlink:** Claude Code's auto-memory system appends to
CLAUDE.md during sessions. A symlink would corrupt AGENTS.md. Use the `@AGENTS.md`
import directive on line 1 of CLAUDE.md instead — Claude Code resolves it to the
canonical instruction set and appends to CLAUDE.md only. [HIGH]

**Why GEMINI.md IS a symlink:** Gemini CLI v0.32+ performs inode deduplication on
case-insensitive filesystems — a symlinked file with the same inode as its target
is loaded exactly once, preventing double-injection. Gemini CLI does not write
back to GEMINI.md. [HIGH]

---

## 2. Config Architecture

**Design constraint:** The minimal shared root must satisfy all six native loaders
simultaneously without any root-level filename collision and without any harness
reading another harness's config file.

### Per-harness config surface

**Aider**

```yaml
# .aider.conf.yml
read: [AGENTS.md, CONVENTIONS.md]
model: claude-sonnet-4-6          # or sonnet via env AIDER_MODEL
auto-commits: false               # orchestrator owns commit lifecycle
dirty-commits: false
cache-keepalive-pings: 5
map-tokens: 4096
show-model-warnings: false
```

Precedence: `~/.aider.conf.yml` → git root → CWD (later wins, additive).
AGENTS.md is injected as a read file, not a system-prompt override — it loads
alongside the repo map. No MCP, no ACP native support. Bridge via `aider-mcp`
stdio wrapper (see §4). [HIGH]

**Claude Code**

```json
// .claude/settings.json
{
  "permissions": {
    "allow": ["Bash", "Read", "Write", "Edit", "Task", "WorktreeCreate"],
    "deny": ["WebSearch"]
  },
  "hooks": {
    "PostToolUse": [{
      "matcher": "Write|Edit",
      "hooks": [{"type": "command", "command": "bash .claude/hooks/post-write.sh"}]
    }]
  },
  "mcpServers": {
    "openmemory": {
      "command": "npx",
      "args": ["-y", "supergateway", "--sse",
               "http://localhost:8765/mcp/claude/sse/${USER}"]
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "."]
    }
  }
}
```

```markdown
<!-- CLAUDE.md (first two lines are mandatory) -->
@AGENTS.md
@CONVENTIONS.md

## Claude Code Overrides
Use Agent Teams (`CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`) for parallelizable
work. Background tasks with Ctrl+B. Use /plan before any multi-file
architecture change. WorktreeCreate for isolated experiments.

## Harness Awareness
This is a multi-harness repo. Do not modify files in ../wt-{other-harness}/
worktrees. Do not assume you are the only active agent.
```

Precedence: Enterprise managed tier → `~/.claude/` (user) → `.claude/` (project)
→ subdirectory CLAUDE.md files (all additive, not overriding). [HIGH]

**Known degradation:** Claude Code worktree sessions exhibit behavioral drift
(issue #31872) — the system prompt injection "This is a git worktree" causes
models to deprioritize rules, workflows, and skills. Monitor for fix. Until
resolved, copy a full CLAUDE.md into each worktree root at creation time rather
than relying on the primary worktree's file. [MEDIUM — open GitHub issue,
workaround confirmed]

`CLAUDE_CODE_SIMPLE=1` disables CLAUDE.md, hooks, MCP, and attachments entirely.
Never set this in `.env` or shell profiles — it will silently break the entire
shared config. Reserve for bare CI runs only. [HIGH]

**Gemini CLI**

```json
// .gemini/settings.json
{
  "contextFileName": "GEMINI.md",
  "theme": "default",
  "sandbox": "docker",
  "policy": ".gemini/policy.json",
  "hooks": {
    "pre-tool": ".gemini/hooks/pre-tool.sh",
    "post-tool": ".gemini/hooks/post-tool.sh",
    "after-agent": ".gemini/hooks/after-agent.sh",
    "action-validation": ".gemini/hooks/validate.sh"
  }
}
```

Precedence: `~/.gemini/` → ancestor directories → CWD (concatenated, all loaded).
GEMINI.md symlink resolves to AGENTS.md via inode. Plan Mode (`/plan`,
`--experimental-plan`) generates planning artifacts — redirect to
`.gemini/plans/` via hook or post-tool script to avoid workspace root
contamination. [HIGH]

**OpenAI Codex**

```toml
# .codex/config.toml  (repo-level; global at ~/.codex/config.toml)
model = "gpt-5-codex"
approval_policy = "on-request"   # auto|on-request|manual
sandbox_mode = "workspace"       # workspace|docker|none
project_doc_max_bytes = 65536
project_doc_fallback_filenames = ["AGENTS.md", "CONVENTIONS.md"]
```

```markdown
<!-- .agent/PLANS.md  (ExecPlan template) -->
# Task Planning Template
## Goal
## Subtasks
## Verification criteria
## Harness notes: Running as Codex in agent/codex worktree
```

Precedence: `~/.codex/AGENTS.md` → repo root AGENTS.md → subdirectory
AGENTS.md (hierarchical cascade, all concatenated). `AGENTS.override.md` at any
level takes strict precedence over AGENTS.md at the same level. [HIGH]

Codex can run AS an MCP server (`codex mcp-server`) — expose it selectively to
the orchestrator for code-generation tool calls. [MEDIUM]

**OpenClaw**

```json
// ~/.openclaw/openclaw.json  (JSON5, global only — no repo-level config)
{
  "model": "claude-sonnet-4-6",
  "runtime": "acp",
  "acp_router": true,
  "memory": {
    "backend": "local",
    "path": "~/.openclaw/memory/"
  },
  "skills_path": "~/.openclaw/skills/",
  "context_engine": {
    "hooks": ["bootstrap", "ingest", "assemble", "compact",
              "afterTurn", "prepareSubagentSpawn", "onSubagentEnded"]
  },
  "identity": "~/.openclaw/SOUL.md",
  "heartbeat": "~/.openclaw/HEARTBEAT.md"
}
```

**Categorization correction [HIGH]:** OpenClaw is a personal AI agent messaging
gateway (WhatsApp, Discord, Telegram, web) that spawns Codex or Claude Code as
sub-processes via ACP for coding tasks. It is NOT a coding harness in the same
sense as the other five. Its correct role in this monorepo is as the
orchestrator-accessible personal agent interface — it delegates coding tasks
inward rather than executing them directly. Never nest OpenClaw → Claude Code
in the same git worktree (shell execution overlap risk).

**OpenHands**

```toml
# ~/.openhands/config.toml  (no repo-level config file)
[core]
workspace_base = ".openhands/workspace"
persist_sandbox = false

[llm]
model = "claude-sonnet-4-6"
max_input_tokens = 200000

[agent]
enable_prompt_extensions = true
```

Invocation with AGENTS.md injection:

```bash
openhands --headless \
  -f AGENTS.md \               # Inject as system context
  --always-approve \           # Non-interactive
  -t "task description"
# OR
openhands mcp                  # Expose as MCP server for orchestrator
```

OpenHands Planning Mode (shipped March 4, 2026 — note: prior session stated
March 6 incorrectly) writes PLAN.md to workspace root by default. This MUST be
redirected to `.openhands/PLAN.md` (gitignored) to avoid collision with Codex's
`.agent/PLANS.md` and Gemini CLI's Plan Mode outputs. Redirect is achieved by
setting `workspace_base = ".openhands/workspace"` — PLAN.md then writes to
`.openhands/workspace/PLAN.md`, which is gitignored. [HIGH]

### Precedence resolution for shared AGENTS.md

```
AGENTS.md (source of truth)
    │
    ├─→ Codex: Direct native discovery (most faithful)
    ├─→ Claude Code: @AGENTS.md import in CLAUDE.md (appended, overrideable)
    ├─→ Gemini CLI: GEMINI.md symlink (exact, no override layer)
    ├─→ Aider: `read:` directive (appended to repo map context)
    ├─→ OpenHands: `-f AGENTS.md` flag (injected as system context)
    └─→ OpenClaw: ACP session config payload (orchestrator injects at spawn)
```

When AGENTS.md changes, all harnesses pick up the update on their next session
start. There is no runtime hot-reload. Plan instruction mutations as PRs; merge
during off-hours to avoid mid-session drift.

---

## 3. Memory Architecture

### Backend selection — Mem0 OSS

**Recommended local stack: Mem0 OSS** (Apache 2.0, v1.0.0+).
Rationale over alternatives:

| Backend | Vector | Graph | Multi-tenant | MCP interface | Local-only viable |
|---------|--------|-------|-------------|---------------|------------------|
| **Mem0 OSS** | ✅ Qdrant | ✅ Kuzu/Memgraph | ✅ Native (`user_id`/`agent_id`/`run_id`) | ✅ OpenMemory | ✅ |
| Chroma | ✅ | ❌ | Partial (namespacing) | ❌ | ✅ |
| Letta / MemGPT | ✅ | ✅ | ✅ | Partial | ✅ but heavy |

Mem0 provides the only backend with both graph and vector memory natively, with
multi-tenant namespacing that maps directly to the per-harness isolation
requirement, and an MCP server (OpenMemory) that all six harnesses can connect
to via their native MCP clients. [HIGH]

**Local deployment stack:**

```
Qdrant         :6333/:6334   — vector store (Docker, volume gitignored)
Kuzu           embedded       — graph store (no server; lightest option)
Ollama         :11434         — local embeddings (nomic-embed-text)
SQLite         ~/.mem0/       — history (Mem0 managed)
OpenMemory MCP :8765          — unified access point for all harnesses
```

OpenAI API embeddings are the fallback if Ollama is unavailable. Switching is
a single Mem0 config change — no schema migration.

### Four-spectrum memory lattice

```
 ┌─────────────────────────────────────────────────────────────────────────┐
 │                     FOUR-SPECTRUM MEMORY LATTICE                         │
 ├─────────────────────────────────────────────────────────────────────────┤
 │                                                                          │
 │  SPECTRUM 1 ── Cross-Harness / Cross-Session  [SHARED STATE]            │
 │                                                                          │
 │   ┌─────────────────┐    ┌──────────────────┐                           │
 │   │  Qdrant :6333   │    │  Kuzu (embedded) │                           │
 │   │  vector embeddings   │  entity-relation  │                           │
 │   │  per-harness ns │    │  graph memory     │                           │
 │   └────────┬────────┘    └────────┬──────────┘                          │
 │            └───────────┬──────────┘                                      │
 │                        ▼                                                 │
 │             ┌─────────────────────┐                                      │
 │             │  OpenMemory MCP     │  ← Universal access point            │
 │             │  :8765              │                                      │
 │             │  /mcp/{harness}/sse │  ← Per-harness namespace             │
 │             └─────────────────────┘                                      │
 │                                                                          │
 │  SPECTRUM 2 ── Per-Harness Native Persistence  [ISOLATED STATE]         │
 │                                                                          │
 │  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐               │
 │  │.aider│ │.claud│ │.gemin│ │.codex│ │.opencl│ │.openh│               │
 │  │ hist │ │ mem/ │ │ ctx/ │ │ logs │ │ aw/   │ │ ands/│               │
 │  │ tags │ │ task/│ │ hook/│ │state │ │ mem/  │ │ evnt/│               │
 │  └──────┘ └──────┘ └──────┘ └──────┘ └──────┘ └──────┘               │
 │   Aider   Claude   Gemini   Codex   OpenClaw  OpenHands                │
 │   SINGLE WRITER PER DIR — no cross-harness reads                        │
 │                                                                          │
 │  SPECTRUM 3 ── Intra-Session ACP Handoff  [EPHEMERAL STATE]            │
 │                                                                          │
 │  initialize → session/new → session/prompt                              │
 │       → streaming session/update (thought|msg|tool_call|tool_result)    │
 │       → session/cancel                                                  │
 │  No persistence. Dies with process.                                     │
 │  Single-writer per handoff (pipeline, not concurrent).                  │
 │                                                                          │
 │  SPECTRUM 4 ── Fractal Merkle Task Hierarchy  [COMPOUNDING STATE]      │
 │                                                                          │
 │  root ──┬── goal_A ──┬── subtask_A1  reuse_count:12  priority:0.91     │
 │         │            └── subtask_A2  [compacted skeleton]               │
 │         └── goal_B ──── subtask_B1  reuse_count:1   priority:0.34     │
 │                                                                          │
 │  merkle_hash(node) = SHA256(content_hash ‖ sorted(children_hashes))    │
 │  Append-only Merkle Mountain Range (MMR) root log for audit trail      │
 │  Frequency-weighted retention — see formula below                       │
 │                                                                          │
 └─────────────────────────────────────────────────────────────────────────┘
```

### Write semantics per spectrum

| Spectrum | Trigger | Content | Consistency | Conflict resolution |
|----------|---------|---------|-------------|-------------------|
| 1. Cross-harness | `memory.add()`, post-task hook, `/remember` | LLM-extracted atomic facts | Eventually consistent | Mem0 LLM-mediated ADD / UPDATE / DELETE / NONE. Recency wins on contradiction. |
| 2. Per-harness | Harness-specific auto-update | Native format per harness | Strong (atomic file write) | No cross-harness conflict — separate files, single writer per dir |
| 3. Intra-session | ACP handoff event | Structured JSON-RPC payload | Synchronous | Single writer per handoff; pipeline enforced by ACP session semantics |
| 4. Task hierarchy | Task create / update / complete | Task node + Merkle rehash | Append-mostly + rehash up | Parent aggregates children; Merkle hash detects external tampering |

**Conflict resolution priority (descending):** Git (code) → Per-harness native
→ Mem0 cross-harness → Task hierarchy → ACP session state.

When a harness writes contradictory information to Mem0 (e.g., Claude Code
learns "use snake_case" but Codex later writes "use camelCase"), Mem0's conflict
detection triggers LLM-mediated resolution. The managed enterprise tier (if
configured in Claude Code) takes highest provenance weight.

### Frequency-weighted retention formula

**The prior 30-day age-based pruning policy is structurally wrong and must not
be used.** A task pattern recurring weekly (e.g., "add authenticated endpoint")
accumulates compounding value — its genealogy IS institutional memory. Age is
not a proxy for value; reuse frequency is.

**Three-tier similarity detection for task class identification:**

```
1. Structural signature (fast):
   sig(task) = SHA256(sorted_file_paths_touched ‖ operation_types)
   Exact match → same task class.

2. Embedding similarity (semantic):
   cos_sim(embed(task_a), embed(task_b)) ≥ 0.85 → same class
                                          ≥ 0.70 → related class

3. Tag intersection (explicit):
   jaccard(tags_a, tags_b) ≥ 0.60 → same class

Combined: sim(a, b) = 0.4 × structural + 0.4 × embedding + 0.2 × jaccard
```

**Retention priority formula:**

```
retention_priority =
    0.25 × frequency_score
  + 0.35 × reuse_score
  + 0.10 × depth_penalty
  + 0.15 × outcome_weight
  + 0.15 × recency_boost

where:
  frequency_score  = log₂(1 + access_count) / log₂(1 + max_access_global)
  reuse_score      = log₂(1 + reuse_count) × 2.0
  depth_penalty    = 1.0 / (1.0 + depth × 0.1)
  outcome_weight   = { success: 1.0, partial: 0.7,
                       failure: 0.3, abandoned: 0.1 }
  recency_boost    = exp(−days_since_last_access / half_life)
  half_life        = 90 × (1 + reuse_count × 0.5)
```

The `reuse_count` term both boosts `retention_priority` AND extends `half_life`.
High-reuse branches effectively never expire. A two-year-old node with
`reuse_count = 50` has `half_life = 2340 days` — it MUST be retained. This
implements spaced-repetition semantics on institutional memory. [MEDIUM — formula
grounded in SRS research; thresholds require empirical calibration after
~3 months of operation]

**Compaction triggers:**

```
Memory pressure: Qdrant > 2 GB or node_count > 50,000
  → compact bottom 10% by retention_priority

Branch depth: > 100 completed branches at any single tree level
  → compact lowest-priority nodes at that level

Scheduled:
  Weekly  — recompute all retention scores
  Monthly — full-pass compaction of nodes with priority < 0.1

NEVER: Age-only pruning without frequency weighting
```

Compaction preserves the node skeleton:
`{id, merkle_hash, structural_signature, tags, outcome, retention_metrics, embedding}`.
Full description and artifact refs are dropped. Merkle hashes are recomputed
upward after each compaction; the MMR root log is appended, not rewritten.

### Task node schema

```json
{
  "id": "uuid-v4",
  "parent_id": "uuid-v4 | null",
  "merkle_hash": "sha256(content_hash ‖ sorted(children_hashes))",
  "content": {
    "description": "string",
    "task_class_embedding": "float[768]",
    "task_class_tags": ["string"],
    "harness_origin": "aider|claude_code|gemini_cli|codex|openclaw|openhands",
    "structural_signature": "sha256(sorted_file_paths ‖ operation_types)",
    "outcome": "success|failure|partial|abandoned",
    "artifacts_ref": ["git:sha256", "path:string"]
  },
  "retention_metrics": {
    "access_count": "int",
    "reuse_count": "int",
    "recurrence_score": "float [0,1]",
    "retention_priority": "float",
    "half_life": "float (days, base 90)",
    "last_access_ts": "ISO8601"
  },
  "created_ts": "ISO8601",
  "compacted": "bool"
}
```

### Memory export schema (for director migration)

```json
{
  "export_metadata": {
    "export_ts": "ISO8601",
    "merkle_root": "sha256",
    "source_orchestrator": "string",
    "schema_version": "2.0",
    "spectra_included": ["cross_harness", "per_harness_snapshots", "task_hierarchy"]
  },
  "cross_harness": {
    "memories": [
      {"id": "...", "content": "...", "embedding": "float[768]",
       "metadata": {"harness": "...", "timestamp": "...",
                    "genealogy_id": "...", "confidence": "float"}}
    ],
    "graph_entities": [
      {"id": "...", "name": "...", "type": "...", "properties": {}}
    ],
    "graph_relationships": [
      {"source": "...", "target": "...", "relation": "...", "weight": "float"}
    ]
  },
  "per_harness_snapshots": {
    "aider":       {"files": [{"path": "...", "content": "...", "sha256": "..."}]},
    "claude_code": {"files": [...]},
    "gemini_cli":  {"files": [...]},
    "codex":       {"files": [...]},
    "openclaw":    {"files": [...]},
    "openhands":   {"files": [...]}
  },
  "task_hierarchy": {
    "mmr_root_log": ["sha256 (ordered)"],
    "nodes": [{
      "id": "...", "merkle_hash": "...", "parent_id": "...",
      "retention_metrics": {}, "structural_signature": "...",
      "tags": [], "outcome": "...", "compacted": false
    }]
  }
}
```

---

## 4. Communication Stack

### Layer 1 — ACP (Agent Client Protocol)

**Status as of March 11, 2026:** Pre-1.0 but production-deployed. Maintained by
Zed Industries / JetBrains. JSON-RPC 2.0 over stdio (local) or SSE/HTTP
(remote). SDKs: Python, TypeScript, Rust, Java/Kotlin. 15+ agents in registry.
Remote transports remain work-in-progress; stdio is production-ready for local
co-location. [MEDIUM-HIGH]

**Disambiguation:** IBM's identically-abbreviated Agent Communication Protocol
merged into Google A2A under the Linux Foundation in January 2026. References
to "ACP" in this document are exclusively to the Zed/JetBrains Agent Client
Protocol at agentclientprotocol.com.

**Per-harness ACP support matrix:**

| Harness | Status | Mechanism | Notes |
|---------|--------|-----------|-------|
| Aider | 🟡 In progress | Community `aider-mcp` stdio bridge | Native implementation underway per Zed progress report |
| Claude Code | 🟢 Adapter | `@zed-industries/claude-code-acp` npm v0.16.2 | Feature request #6686 for native open |
| Gemini CLI | 🟢 Native | `--experimental-acp` flag | First ACP integration Aug 2025 |
| Codex | 🟢 Adapter | `codex-acp` adapter (Zed open-sourced) | Also runs as MCP server via `codex mcp-server` |
| OpenClaw | 🟢 Native | `runtime: "acp"`, `acp-router` skill, `acpx` backend | |
| OpenHands | 🟢 Native | `openhands acp` CLI; listed in ACP registry | |

**ACP session lifecycle:**

```
initialize (capability negotiation)
  → InitializeResponse {capabilities: [...], mcp_servers: [...]}
session/new {session_id, config}
  → session/prompt {content: [text|image|audio|diff]}
    → session/update (streaming):
        {type: thought | message_chunk | tool_call | tool_result}
    → session/prompt (follow-up)
  → session/cancel
```

ACP reuses MCP JSON schemas for tool definitions. MCP server configs are passed
to agents during `initialize` — all harnesses receive the OpenMemory MCP server
reference at session start. This is the mechanism by which shared memory is
available cross-harness without direct coupling.

**Filesystem mediation:** `fs/read_text_file`, `fs/write_text_file`,
`fs/list_directory`. Terminal: `terminal/create`, `terminal/output`,
`terminal/waitForExit`. These primitives enable the orchestrator to coordinate
file I/O through ACP rather than raw subprocess.

### Layer 2 — MCP (Model Context Protocol)

Shared MCP servers accessible to all harnesses:

| Server | Port/Transport | Purpose | Harnesses |
|--------|----------------|---------|-----------|
| OpenMemory | :8765 SSE | Cross-harness memory (Spectrum 1) | All six |
| Filesystem | stdio | Structured file access | Claude Code, Codex, Gemini CLI, OpenHands |
| Prometheus Pushgateway | :9091 | Metrics reporting | Orchestrator + hooks |

Claude Code and Codex can also run as MCP servers — expose selectively to the
orchestrator for tool-call-based code generation without full session overhead.

### Layer 3 — Subprocess + Worktree (Fallback and Foundation)

ACP provides structured session semantics on top of this layer, which is the
actual mechanism used by every production multi-harness orchestrator (Superset,
Agent Orchestrator, AgentPool). If ACP is unavailable for any harness, this
layer is complete:

```
Orchestrator process
  ├── git worktree create ../wt-{harness} -b agent/{harness}
  ├── spawn CLI agent as subprocess in tmux pane or process group
  ├── inject prompt via ACP session/prompt or stdin or --message-file
  ├── monitor stdout + exit codes (structured NDJSON preferred)
  ├── coordinate via filesystem (task journal, shared AGENTS.md)
  └── merge results via git (PR per worktree branch)
```

**Aider-specific bridge (MCP fallback for ACP gap):**

```bash
# Install community Aider MCP server
pip install aider-mcp-server

# Invoke Aider non-interactively
aider --yes-always \
      --no-auto-commits \
      --model claude-sonnet-4-6 \
      --message-file /tmp/aider-prompt.md \
      --read AGENTS.md
```

### Graceful degradation

| Layer | Full | Degraded | Failed |
|-------|------|----------|--------|
| ACP | Structured sessions, streaming, filesystem mediation | Subprocess + stdout parsing | Raw CLI invocation |
| MCP | Tool sharing across harnesses | File-based tool coordination | Per-harness isolated tools |
| Mem0 | Cross-harness semantic memory | Per-harness isolated native files | No cross-harness learning |
| Orchestrator | Full DAG + routing | Manual tmux session per harness | Human-driven |

---

## 5. Collision Resolution Matrix

**Severity classes:**
- **HARD:** Prevents concurrent operation; must be mitigated before running
- **SOFT:** Produces suboptimal or inconsistent output; mitigate for production
- **COSMETIC:** No functional impact; optional mitigation

### Complete 15-pair matrix

| # | Pair | Vector | Severity | Mitigation | Reversible? |
|---|------|--------|----------|------------|-------------|
| 1 | Aider / Claude Code | Git `.git/index.lock` race on auto-commit | SOFT | Separate worktrees — eliminates shared index | ✅ |
| 2 | Aider / Gemini CLI | Conventions file double-load | COSMETIC | Symlink CONVENTIONS.md → AGENTS.md; single source | ✅ |
| 3 | Aider / Codex | No shared state files | COSMETIC | None required | ✅ |
| 4 | Aider / OpenClaw | No direct interaction | COSMETIC | Separate worktrees | ✅ |
| 5 | Aider / OpenHands | Both honor AGENTS.md; no conflict | COSMETIC | None required | ✅ |
| 6 | Claude Code / Gemini CLI | CLAUDE.md vs GEMINI.md context fragmentation | SOFT | @AGENTS.md import + GEMINI.md symlink unify to single source | ✅ |
| 7 | Claude Code / Codex | CLAUDE.md vs AGENTS.md + `.claude/` vs `.codex/` | SOFT | Separate worktrees + AGENTS.md as shared source | ✅ |
| 8 | Claude Code / OpenClaw | OpenClaw spawns Claude Code as sub-process | SOFT | Never nest OpenClaw → Claude Code in same worktree; use ACP routing instead | ✅ |
| 9 | Claude Code / OpenHands | Docker sandbox (OpenHands) vs local execution (Claude Code) | SOFT | OpenHands in Docker; Claude Code local. Separate execution environments — by design | ✅ |
| 10 | Gemini CLI / Codex | `.gemini/` vs `.codex/` | COSMETIC | None required — fully namespaced | ✅ |
| 11 | Gemini CLI / OpenHands | Gemini Plan Mode + OpenHands PLAN.md | **SOFT** | Move OpenHands PLAN.md to `.openhands/workspace/PLAN.md` via `workspace_base` config | ✅ |
| 12 | Gemini CLI / OpenClaw | Synchronous hook syscalls + concurrent shell execution | **SOFT-HARD** | Separate worktrees + MCP port isolation + hook rate-limiting via action-validation hook | ✅ |
| 13 | Codex / OpenClaw | `.agent/PLANS.md` potentially visible to OpenClaw sub-agents | COSMETIC | `.agent/` namespace sufficient; OpenClaw reads its own workspace | ✅ |
| 14 | Codex / OpenHands | PLANS.md vs PLAN.md root-level semantic overlap | **SOFT** | Codex → `.agent/PLANS.md` (committed). OpenHands → `.openhands/workspace/PLAN.md` (gitignored). Zero root collision. | ✅ |
| 15 | OpenClaw / OpenHands | Node.js runtime (OpenClaw) vs Docker sandbox (OpenHands) | SOFT | Separate runtimes by design; ACP IPC over stdio bridges them | ✅ |

### Critical mitigations expanded

**Rows 11 and 14 — The PLAN.md collision family:**
This was the most significant live delta in the prior audit cycle. OpenHands
Planning Mode (March 4, 2026) writes PLAN.md to workspace root by default.
Gemini CLI's Plan Mode (v0.32+) can write planning artifacts to workspace root.
Codex ExecPlan uses PLANS.md (plural). All three must be namespaced:

```
Codex ExecPlan template  →  .agent/PLANS.md        (committed, explicit template)
OpenHands PLAN.md        →  .openhands/workspace/  (gitignored, via workspace_base)
Gemini CLI plan output   →  .gemini/plans/          (gitignored, via post-tool hook)
```

**Row 1 — Worktree behavioral degradation (Claude Code, issue #31872):**
Claude Code exhibits a known regression in worktree sessions where the system
prompt injection "This is a git worktree" causes model behavior shift — reduced
adherence to rules, workflows, and skills. Until the upstream fix lands, copy a
full CLAUDE.md into each `../wt-claude/` worktree root at worktree creation
time. The orchestrator bootstrap script handles this automatically.

**SKILL.md divergence (cross-cutting):**
Aider, Claude Code, Codex, and Gemini CLI each use SKILL.md with potentially
incompatible frontmatter schemas. Standardize on Codex's SKILL.md format
(most documented, YAML frontmatter with `name`, `description`, `version`,
`tags`) as the canonical schema. Harness-specific fields are tolerated as
extensions.

---

## 6. Director Architecture

### The director is NOT an AI agent

**This is the most consequential architectural finding of the full research
cycle.** The prior session's conclusion that OpenHands should serve as director
was wrong. OpenHands' DelegationTool delegates only to internal OpenHands
sub-agents. Claude Code's Agent Teams spawn only additional Claude Code
instances. Neither can orchestrate the other five harnesses natively.

The correct pattern is a **thin process orchestrator** — a coordinator that
manages harness processes, git worktrees, and task routing without itself being
an AI agent. This is the pattern implemented by every production multi-harness
tool found in the research audit. [HIGH]

**OpenHands as director was a reasonable inference under the prior information
set:** Its event-sourced ConversationState and deterministic replay remained
valuable design properties. They now inform the OpenHands worker role, not the
director role. The reversal is a factual correction (capability boundary), not
a reasoning error.

### Director selection — provenance note on HARNESS.md

An earlier research prompt proposed a committed `HARNESS.md` routing table —
a human-readable file that harnesses would read for task routing decisions. No
production tool or harness reads HARNESS.MD natively. The concept was sound;
the implementation surface was wrong. It is absorbed here as `orchestrator.yml`
(Tier 3, committed), which serves the identical purpose — a committed,
human-readable, machine-executed routing specification — with the correct
implementation: a process orchestrator config file read by the orchestrator
process, not by individual harnesses.

### Orchestrator selection

Three production tools validated (March 2026):

| Tool | Stars | Protocol support | Worktree isolation | Task DAG | Maturity |
|------|-------|-----------------|-------------------|---------|---------|
| **AgentPool** (phil65) | — | ACP, MCP, AG-UI, OpenCode Server | ✅ | ✅ Teams + chains | Active, early |
| **Superset** (superset.sh) | 3,285 | None (subprocess) | ✅ tmux | ❌ Parallel only | Growing |
| **Agent Orchestrator** (Composio) | 3,288 tests | Plugin-based | ✅ Per-branch PR | ✅ YAML DAG | Production tested |

**Recommendation:** AgentPool for ACP-native setups; Superset for GUI-first
local development. Both are viable; AgentPool's protocol coverage is superior
for the six-harness use case.

### orchestrator.yml schema

```yaml
# orchestrator.yml
version: "2.0"
workspace:
  root: "."
  worktree_prefix: "../wt-"
  branches:
    aider: "agent/aider"
    claude: "agent/claude"
    gemini: "agent/gemini"
    codex: "agent/codex"
    openclaw: "agent/openclaw"
    openhands: "agent/openhands"

memory:
  openmemory_url: "http://localhost:8765"
  qdrant_url: "http://localhost:6333"

routing:
  default_harness: "claude"
  rules:
    - pattern: "interactive pair coding"
      harness: "aider"
      rationale: "Real-time terminal, widest model support"
    - pattern: "multi-file refactoring|architecture"
      harness: "claude"
      rationale: "Native worktrees, sub-agents, 1M context"
    - pattern: "monorepo cross-project|dependency graph"
      harness: "codex"
      rationale: "Native AGENTS.md hierarchy, GPT-5.4"
    - pattern: "CI|non-interactive|automation"
      harness: "codex"
      rationale: "`codex exec` non-interactive mode"
    - pattern: "quick generation|prototype"
      harness: "gemini"
      rationale: "Free tier, fast iteration"
    - pattern: "github issues|PR review|issue triage"
      harness: "openhands"
      rationale: "GitHub integration, headless"
    - pattern: "personal agent|messaging|WhatsApp|Discord"
      harness: "openclaw"
      rationale: "Personal agent gateway (not a coding harness)"

agents:
  aider:
    spawn: "aider --yes-always --no-auto-commits --model claude-sonnet-4-6 --read AGENTS.md"
    acp: false
    bridge: "aider-mcp"
    worktree: true
  claude:
    spawn: "claude --dangerously-skip-permissions"
    acp: true
    adapter: "@zed-industries/claude-code-acp"
    worktree: true
  gemini:
    spawn: "gemini --experimental-acp"
    acp: true
    native: true
    worktree: true
  codex:
    spawn: "codex exec"
    acp: true
    adapter: "codex-acp"
    worktree: true
    mcp_server: "codex mcp-server"
  openclaw:
    spawn: "openclaw start"
    acp: true
    native: true
    worktree: false  # OpenClaw spawns sub-agents; don't isolate its own process
  openhands:
    spawn: "openhands --headless -f AGENTS.md --always-approve"
    acp: true
    native: true
    worktree: true

observability:
  prometheus_pushgateway: "http://localhost:9091"
  task_journal: ".agent/task-journal.ndjson"
  metrics_interval: 60  # seconds
```

### Initialization sequence

```
1. Orchestrator reads orchestrator.yml
2. Validates all harness binaries present (die loudly if not)
3. Verifies Qdrant + OpenMemory MCP running (docker compose ps)
4. Creates git worktrees per routing config (idempotent)
5. For each task assignment:
   a. Selects harness via routing.rules (first match wins)
   b. Spawns harness subprocess in target worktree
   c. If ACP: initialize → pass OpenMemory MCP server config
   d. If no ACP: inject AGENTS.md via stdin or --read flag
   e. Streams task prompt via ACP session/prompt or stdin
   f. Monitors stdout + ACP session/update events
   g. On completion: collect result, update Mem0, push task node
   h. Create PR from worktree branch to main
6. On merge approval: git worktree remove + branch cleanup
```

### Failure recovery

The orchestrator maintains a task journal at `.agent/task-journal.ndjson`
(gitignored) mapping each task to its worktree branch, process PID, ACP session
ID, and current status. On orchestrator crash:

```
1. Read task journal
2. For each in-progress task: check git worktree exists + process alive
3. If process alive: reattach to ACP session by session_id
4. If process dead but worktree exists: re-spawn in same worktree
   (harness re-reads its native state from .{harness}/ dot-dir)
5. If worktree missing: re-create from branch + re-spawn from scratch
```

### Migration path if Claude Code Agent Teams exits experimental

Signal to watch: `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` flag removed from docs.
When triggered:
1. Export Mem0 cross-harness memory via export schema (see §3)
2. Evaluate Agent Teams against criterion: "event-log replay fidelity ≥
   OpenHands 500-step benchmark" (original Grok Prompt 2 specification)
3. If criterion met AND Agent Teams gains model-agnostic routing:
   migrate orchestrator config to Claude Code as coordinator
4. Import Mem0 export into Claude Code's persistent task system
5. Per-harness native memory stays in place (no migration needed)

---

## 7. Observability & Telemetry

Observability is the mechanism by which you know which harness is compounding
value, which is consuming tokens without proportional output, and when the
system's behavioral drift has crossed an intervention threshold. It is not
optional instrumentation — it is the feedback loop that makes the
self-improvement system in §8 work.

### Metrics architecture

```
Harness sessions → per-harness exporter → Prometheus :9090
                                         → Grafana :3000
                                         → Alert rules → Slack/webhook

Orchestrator     → Pushgateway :9091   → Prometheus

OpenMemory MCP   → built-in metrics    → Prometheus

Qdrant           → /metrics endpoint   → Prometheus
```

### Per-harness exporter setup

Each harness spawns with a sidecar metrics exporter (or hook-based reporting
for harnesses without native metrics). The Prometheus Pushgateway at :9091
accepts POST from hooks; Claude Code HTTP hooks, Gemini CLI post-tool hooks,
and Codex exec post-run hooks all write to it.

**Standardized metric set (all harnesses):**

```
# Task throughput
harness_tasks_total{harness, status}                   counter
harness_tasks_duration_seconds{harness, task_class}    histogram

# Token economics
harness_tokens_input_total{harness, model}             counter
harness_tokens_output_total{harness, model}            counter
harness_cost_usd_total{harness, model}                 counter

# Velocity
harness_loc_delta_total{harness, direction}            counter  # lines +/-
harness_files_modified_total{harness}                  counter
harness_test_pass_rate{harness}                        gauge

# Memory
mem0_memories_total{harness}                           gauge
mem0_query_duration_seconds                            histogram
task_hierarchy_nodes_total{status}                     gauge
task_hierarchy_reuse_rate                              gauge

# Routing
orchestrator_routing_decisions_total{harness, pattern} counter
orchestrator_worktree_active                           gauge
```

### Cost ceiling alerts

```yaml
# prometheus/alert_rules.yml
groups:
  - name: harness-cost
    rules:
      - alert: DailyTokenBudgetExceeded
        expr: sum(increase(harness_cost_usd_total[24h])) > 50
        labels:
          severity: critical
        annotations:
          summary: "Daily token spend exceeded $50"

      - alert: HarnessVelocityFloor
        expr: rate(harness_loc_delta_total{direction="add"}[1h]) < 10
        for: 2h
        labels:
          severity: warning
        annotations:
          summary: "Harness {{ $labels.harness }} producing < 10 LOC/hour for 2h"

      - alert: MemoryStagnation
        expr: increase(task_hierarchy_nodes_total[7d]) == 0
        labels:
          severity: warning
        annotations:
          summary: "No new task nodes in 7 days — learning loop stalled"
```

### Velocity measurement

Velocity is measured at three granularities:

**Session velocity:** LOC delta per session, test pass rate, task completion
rate. Computed by the orchestrator at session close.

**Weekly velocity:** Rolling 7-day aggregate per harness. Reported in the
weekly review. Target: each harness should show positive LOC delta and ≥ 80%
task completion rate. Below threshold → routing adjustment.

**Routing efficiency:** Cost-per-feature ratio per harness: `cost_usd / tasks_completed`.
Track over 30-day rolling window. If one harness's cost-per-feature is
consistently > 2× the fleet average, investigate whether routing rules are
misassigning task classes to it.

---

## 8. Self-Improvement Loop

### Architecture

```
Task completion
     │
     ▼
Postmortem (orchestrator)
     │ diff(task_result, AGENTS.md instructions)
     ▼
Instruction gap identified?
  Yes → PR against AGENTS.md / CONVENTIONS.md / per-harness override
     │   with: gap description, task failure reference, proposed fix
     │
     ▼
Human review → approve / reject / amend
     │
     ▼
On merge:
  All harnesses pick up on next session start (no hot-reload)
  Task node updated: outcome → success, reuse_score++
  Mem0 memory updated: new learned fact added
     │
     ▼
Monitor compound learning rate
```

### Compound learning rate target

Track the ratio of instruction mutations merged to total tasks completed over
a rolling 7-day window. Formula:

```
compound_learning_rate = mutations_merged_7d / tasks_completed_7d
```

**Target band: 2–5%.**

Below 2%: Instructions are not learning from task outcomes. Check whether
postmortems are running, whether gap detection is tuned too conservatively, or
whether the task set is too homogeneous to produce new learnable patterns.

Above 5%: Instructions are thrashing. Conflicting mutations are creating
instability. Gate more aggressively — require 2+ task failures of the same
type before accepting a mutation.

### Homogenization prevention

**The risk:** If all six harnesses share AGENTS.md and receive identical
instructions, their per-harness differentiation collapses. The routing table
becomes meaningless. A six-harness system with homogenized behavior has
negative return on complexity.

**Detection:** Weekly Jaccard similarity computation across all per-harness
override files (CLAUDE.md overrides, .aider.conf.yml additions, .gemini/
policy additions, etc.). If pairwise similarity for any two harnesses exceeds
0.85, investigate whether their routing domains have converged.

**Prevention mechanism:** The AGENTS.md spine captures universal truths
(commit conventions, security rules, cross-harness coordination protocols).
Per-harness overrides capture harness-specific strengths. The rule: anything
that only one harness should do goes in that harness's override file, not
AGENTS.md. Anything all harnesses must do goes in AGENTS.md.

If homogenization is detected: review routing rules, add harness-specific
instructions to diverge behavior, and consider removing underperforming
harnesses from the active set rather than letting them accumulate as
redundant workers.

### Drift detection

**Weekly Merkle root comparison:** If the task hierarchy root hash has not
changed in > 7 days, the learning loop has stalled — no new task nodes means
no postmortems ran or no tasks completed. Trigger alert: `MemoryStagnation`
(see §7).

**Instruction file growth audit (monthly):** `git log --oneline AGENTS.md |
wc -l` should increase monotonically. Flat growth = no learning. Exponential
growth = thrashing. Target: 2–8 commits per month.

**Retention priority distribution (monthly):** If > 50% of task nodes have
`retention_priority < 0.2`, compaction is overdue. If > 50% have
`retention_priority > 0.8`, the task distribution is too narrow — the system
is optimizing a small repeated pattern set rather than building generalizable
institutional memory.

---

## 9. Protocol Convergence Trajectory

### Current state (March 2026)

Three protocol families are converging:

| Protocol | Steward | Scope | Local status | Remote status |
|----------|---------|-------|-------------|---------------|
| MCP (Model Context Protocol) | Anthropic | Tool invocation, resource access | Stable (v1.0) | Stable |
| ACP (Agent Client Protocol) | Zed / JetBrains | Agent session management, streaming | Pre-1.0, stdio production-ready | In-progress |
| A2A (Agent-to-Agent, née IBM ACP) | Linux Foundation / Google | Cross-organization agent federation | Spec published | Early |

**IBM ACP disambiguation [HIGH]:** IBM's Agent Communication Protocol was
renamed A2A and merged into Google's agent interoperability effort under the
Linux Foundation in January 2026. It is not the same as Zed's ACP. Any
prior-session references to "ACP" that cite IBM sources refer to A2A.

### Convergence trajectory

**Q1–Q2 2026 (current–near):** ACP and MCP remain complementary and separate.
ACP handles agent session lifecycle; MCP handles tool invocation. Most harnesses
implement both. The de facto local standard is: ACP for session management,
MCP for tool sharing, git worktrees for filesystem isolation.

**Q3–Q4 2026 (projected):** Protocol convergence toward a unified agent
communication stack. ACP's MCP passthrough (already in v0.x) deepens — MCP
tool definitions flow through ACP session config, removing the need for
separate MCP client initialization. AGENTS.md v1.1 (Linux Foundation /
Agentic AI Foundation stewardship) introduces optional YAML frontmatter with
`description` and `tags`, becoming a cross-harness standard rather than a
Codex-only spec. Predicted signal: Claude Code native AGENTS.md support
(Manifold Markets prediction: 62% in 2026). [MEDIUM — trajectory is
directionally clear; timing is speculative]

**2027+ (speculative):** Full unified agent communication protocol subsuming
MCP + ACP + A2A. Orchestrators become thin routing layers over standardized
agent-to-agent message buses. Per-harness specialization shifts from protocol
compliance to model capability and task-class fitness. [LOW — extrapolation
from current convergence vectors; highly uncertain]

### Recursive meta-optimization at federation scale

**The compounding vs. homogenization tension at scale:**

As the self-improvement loop runs across six harnesses sharing a memory
federation, a bifurcation risk emerges:

**Compounding path:** Each harness learns from other harnesses' task outcomes
via Mem0 Spectrum 1. Successful patterns propagate. The fleet becomes more
capable than any individual harness. Institutional memory compounds
super-linearly.

**Homogenization path:** Successful patterns from one harness crowd out
successful patterns from others. All six harnesses receive the same instruction
mutations. The fleet converges to a monoculture. Complexity overhead without
capability gain.

**The governing condition:** Compounding dominates when task routing is
well-differentiated (harnesses work on genuinely different task classes) and
instruction mutations are harness-scoped (per-harness overrides, not only
AGENTS.md). Homogenization dominates when routing is poorly differentiated and
all mutations go to the shared spine.

**Mitigation:** The routing table in orchestrator.yml is the load-bearing
differentiation mechanism. Treat routing rule accuracy as a primary
optimization target — not an afterthought. Monthly routing efficiency review
(cost-per-feature per harness) detects collapsing differentiation before it
reaches homogenization.

### The irreversible first move (revised)

The prior audit identified the bootstrap commit sequence as "irreversible."
This is only true of one layer. The correct characterization:

The first move that genuinely commits you is not the directory layout (fully
reversible in minutes) nor the Mem0 store (exportable). It is writing the
first AGENTS.md instruction that a harness acts on and whose behavioral
consequence is not recorded anywhere. From that moment forward, the gap
between what you can recover (git history) and what you cannot (the causal
chain from instruction to code decision) begins to accumulate.

This means: version AGENTS.md from day one. Every mutation as a commit. The
git log of AGENTS.md is your institutional memory audit trail. Without it,
the export schema in §3 captures what was stored but not why.

---

## 10. Bootstrap Sequence

**Prerequisites:** Node.js ≥ 22, Python 3.12+, Docker Desktop, Git ≥ 2.41
(worktree support), `uv` (Python toolchain). 15–20 minutes on fresh machine.

```bash
#!/usr/bin/env bash
# DEFINITIVE MONOREPO BOOTSTRAP — v2.0
set -euo pipefail

# ━━━ PHASE 0: Toolchain ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# uv (Python toolchain)
curl -LsSf https://astral.sh/uv/install.sh | sh
source ~/.bashrc  # or ~/.zshrc

# Verify prerequisites
for cmd in node git docker; do
  command -v $cmd >/dev/null 2>&1 || { echo "MISSING: $cmd"; exit 1; }
done
echo "Prerequisites: OK"

# ━━━ PHASE 1: Monorepo skeleton ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

mkdir -p ~/monorepo && cd ~/monorepo && git init

# Tier 1: Universal spine
cat > AGENTS.md << 'EOF'
# Agent Instructions

## Identity
This is a multi-harness monorepo. Six agentic coding harnesses are active
concurrently in separate git worktrees. You are running as one of them.
Do not modify files in ../wt-{other-harness}/ directories.

## Conventions
- Conventional commits: feat|fix|chore|docs|refactor|test|perf
- Run tests before every commit
- No auto-commits — orchestrator owns commit lifecycle
- Document rationale for non-obvious decisions in commit body

## Coordination
- Cross-harness memory: OpenMemory MCP at localhost:8765
- Task assignments: see .agent/task-journal.ndjson
- Instruction mutations: propose as PR against AGENTS.md, not direct writes
- Architecture decisions: see ARCHITECTURE.md
EOF

cat > CONVENTIONS.md << 'EOF'
# Code Conventions
## Languages
- Python: ruff format, type hints required, uv for deps
- TypeScript: prettier, strict mode, bun or pnpm
- Shell: bash, set -euo pipefail, shellcheck clean

## Git
- Branch: feature/{name}, fix/{name}, chore/{name}
- PR: description + test evidence required
- Squash merge to main

## Security
- No secrets in code or commit messages
- All API keys via .env (gitignored)
- Validate all external input
EOF

# Tier 2: Harness compatibility layer
cat > CLAUDE.md << 'EOF'
@AGENTS.md
@CONVENTIONS.md

## Claude Code Configuration
- Use Agent Teams (CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1) for parallelizable work
- Use /plan before multi-file architecture changes
- Background long tasks with Ctrl+B
- WorktreeCreate for isolated experiments

## Harness Context
Running in a multi-harness monorepo. Other harnesses are active concurrently.
Do not assume you are the only active agent on this repository.
EOF

ln -sf AGENTS.md GEMINI.md

cat > .aider.conf.yml << 'YAML'
read: [AGENTS.md, CONVENTIONS.md]
model: claude-sonnet-4-6
auto-commits: false
dirty-commits: false
cache-keepalive-pings: 5
map-tokens: 4096
show-model-warnings: false
YAML

cat > .aiderignore << 'EOF'
.agent/
.claude/
.gemini/
.codex/
.openhands/
.openclaw/
docker-compose.yml
orchestrator.yml
EOF

mkdir -p .claude/{rules,skills,agents,commands} .gemini .codex .agent
mkdir -p prometheus

cat > .codex/config.toml << 'TOML'
model = "gpt-5-codex"
approval_policy = "on-request"
sandbox_mode = "workspace"
project_doc_max_bytes = 65536
project_doc_fallback_filenames = ["AGENTS.md", "CONVENTIONS.md"]
TOML

cat > .gemini/settings.json << 'JSON'
{
  "contextFileName": "GEMINI.md",
  "sandbox": "docker",
  "policy": ".gemini/policy.json"
}
JSON

cat > .agent/PLANS.md << 'EOF'
# Codex ExecPlan Template
## Goal
## Subtasks
## Verification criteria
## Harness notes: Running as Codex in agent/codex worktree
EOF

# .gitignore
cat > .gitignore << 'EOF'
.env
.aider.chat.history.md
.aider.input.history
.aider.tags.cache.v3/
.claude/worktrees/
.claude/tasks/
.claude/memory/
.gemini/context/
.openhands/
.openclaw/
.agent/task-journal.ndjson
EOF

# .env.example
cat > .env.example << 'EOF'
ANTHROPIC_API_KEY=
OPENAI_API_KEY=
GOOGLE_API_KEY=
OLLAMA_BASE_URL=http://localhost:11434
EOF

cp .env.example .env
echo "FILL IN .env with your API keys before continuing"

git add -A && git commit -m "chore: monorepo skeleton with AGENTS.md spine v2.0"

# ━━━ PHASE 2: Git worktrees ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

for harness in aider claude gemini codex openclaw openhands; do
  git worktree add ../wt-${harness} -b agent/${harness}
  # Copy CLAUDE.md into each worktree to work around issue #31872
  cp CLAUDE.md ../wt-${harness}/CLAUDE.md
  cp AGENTS.md ../wt-${harness}/AGENTS.md
done
echo "Git worktrees: OK"
git worktree list

# ━━━ PHASE 3: Install harnesses ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

pip install aider-install && aider-install
npm install -g @anthropic-ai/claude-code
npm install -g @google/gemini-cli
npm install -g @openai/codex
npm install -g openclaw@latest
uv tool install openhands --python 3.12

# ACP adapters
npm install -g @zed-industries/claude-code-acp
pip install aider-mcp-server codex-acp

echo "Harnesses installed:"
for cmd in aider claude gemini codex openclaw openhands; do
  $cmd --version 2>/dev/null && echo "  $cmd: OK" || echo "  $cmd: check manually"
done

# ━━━ PHASE 4: Memory stack ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

cat > docker-compose.yml << 'YAML'
services:
  qdrant:
    image: qdrant/qdrant:latest
    ports: ["6333:6333", "6334:6334"]
    volumes: [qdrant_storage:/qdrant/storage]
    restart: unless-stopped

  openmemory:
    image: skpassegna/openmemory-mcp:latest
    ports: ["8765:8765"]
    environment:
      OPENAI_API_KEY: ${OPENAI_API_KEY}
      QDRANT_HOST: qdrant
      QDRANT_PORT: "6333"
      MEM0_GRAPH_BACKEND: kuzu
    depends_on: [qdrant]
    restart: unless-stopped

  prometheus:
    image: prom/prometheus:latest
    ports: ["9090:9090"]
    volumes: ["./prometheus:/etc/prometheus"]
    restart: unless-stopped

  pushgateway:
    image: prom/pushgateway:latest
    ports: ["9091:9091"]
    restart: unless-stopped

  grafana:
    image: grafana/grafana:latest
    ports: ["3000:3000"]
    environment:
      GF_SECURITY_ADMIN_PASSWORD: "admin"
    depends_on: [prometheus]
    restart: unless-stopped

volumes:
  qdrant_storage:
YAML

# Prometheus scrape config
cat > prometheus/prometheus.yml << 'YAML'
global:
  scrape_interval: 60s

scrape_configs:
  - job_name: pushgateway
    static_configs:
      - targets: ['pushgateway:9091']
    honor_labels: true

  - job_name: qdrant
    static_configs:
      - targets: ['qdrant:6333']
    metrics_path: /metrics
YAML

docker compose up -d
sleep 5  # allow services to initialize
echo "Memory stack:"
docker compose ps

# ━━━ PHASE 5: Connect harnesses to OpenMemory MCP ━━━━━━━━━━━━━━━━━━━━━━━━━

# Claude Code
claude mcp add openmemory \
  npx -y supergateway --sse \
  "http://localhost:8765/mcp/claude/sse/${USER}"

# Codex
codex mcp add openmemory \
  --url "http://localhost:8765/mcp/codex/sse/${USER}"

# OpenHands
openhands mcp add openmemory \
  --transport sse \
  "http://localhost:8765/mcp/openhands/sse/${USER}"

# Gemini CLI: run interactively
echo "Gemini: run 'gemini' then: /extensions add openmemory http://localhost:8765/mcp/gemini/sse/${USER}"

# ━━━ PHASE 6: Verify ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

echo ""
echo "=== VERIFICATION ==="
git worktree list
docker compose ps
curl -sf http://localhost:6333 && echo "Qdrant: OK" || echo "Qdrant: FAIL"
curl -sf http://localhost:8765/health && echo "OpenMemory: OK" || echo "OpenMemory: FAIL"
curl -sf http://localhost:9090/-/ready && echo "Prometheus: OK" || echo "Prometheus: FAIL"

echo ""
echo "Bootstrap complete. Fill in .env before running agents."
echo "Grafana: http://localhost:3000 (admin/admin)"
echo "Prometheus: http://localhost:9090"
echo "Qdrant dashboard: http://localhost:6333/dashboard"
```

---

## 11. Reversibility Map

**The fundamental principle:** Reversibility is layer-dependent, not binary.
The prior characterization of the bootstrap as "irreversible" was an overclaim.
The true irreversibilities are behavioral, not structural.

| Layer | Reversible | Mechanism | Time | Notes |
|-------|-----------|-----------|------|-------|
| Git worktrees | ✅ Full | `git worktree remove ../wt-{h}` + `git branch -D agent/{h}` | Seconds | Zero residue |
| Mem0 vector store | ✅ Full | Delete Docker volume: `docker compose down -v` | Seconds | Complete wipe |
| Mem0 graph store | ✅ Full | Embedded Kuzu drops with volume | Seconds | |
| Per-harness dot-dirs | ✅ Full | `rm -rf .aider* .claude/ .gemini/ .openhands/ .openclaw/` | Seconds | Clean re-init on next session |
| ACP session state | ✅ Auto | Ephemeral — dies with process | Instant | |
| Task hierarchy | ✅ Full | Delete task tree files | Seconds | Gitignored |
| OpenHands EventLog | ✅ Full | `rm -rf ~/.openhands/` | Seconds | |
| Docker memory stack | ✅ Full | `docker compose down -v` | Seconds | |
| Repository layout | ✅ Full | `rm -rf` + `git worktree prune` | Seconds | |
| **Instruction file behavioral compounds** | ❌ **Partial** | Git log of AGENTS.md provides state history; reverting a specific instruction requires manually identifying which commit introduced which behavior | **Days to weeks** | **The true irreversibility.** 50+ sessions of accumulated judgment. Without commit-per-mutation discipline (see §8), the evolution path is opaque. |
| **Age-pruned memory branches (old policy)** | ❌ **Permanent** | Compacted content dropped; only skeleton survives | N/A | Why frequency-weighted retention is mandatory, not optional |
| **Downstream code causal chains** | ❌ **Permanent** | Code commits in git history; the causal chain (why this harness chose this approach, informed by which memory) is lost | N/A | Observability (§7) captures correlation, not causation |
| **Routing preference drift** | ⚠️ Difficult | Orchestrator task journal captures routing decisions; full audit requires log archaeology | Hours | Export journal before migration |

**Export before any director migration:** Use the memory export schema from §3.
The export is the only way to preserve cross-harness memory and task hierarchy
across an orchestrator change. Without it, the new orchestrator starts cold.

---

## 12. Velocity Benchmarks

Three tiers calibrate expectations and signal when the architecture is working
vs. when a harness or routing rule requires intervention.

### Tier 1 — Baseline (first 30 days)

The system is being learned. Routing rules are immature. Instruction files are
sparse. Expect low compound learning rate.

| Metric | Target | Below threshold action |
|--------|--------|----------------------|
| Tasks completed per week (fleet total) | > 20 | Check harness spawn success rate |
| Test pass rate (per harness) | > 70% | Review harness instruction overrides |
| Instruction mutations merged | 1–3 / week | Confirm postmortem hooks running |
| Cross-harness memory entries | > 50 | Verify OpenMemory MCP connectivity |
| Cost per task (fleet average) | < $2.00 | Check model config; flag runaway sessions |

### Tier 2 — Compound (days 30–90)

Routing rules have been tuned. Instruction files reflect several weeks of
postmortems. Memory federation is populated. Expect accelerating velocity.

| Metric | Target | Below threshold action |
|--------|--------|----------------------|
| Tasks completed per week | > 60 | Investigate routing table; add harnesses to active set |
| Test pass rate | > 85% | Review per-harness instruction quality |
| Instruction mutations merged | 2–5 / week | Tuning phase; verify mutation quality |
| Task reuse rate (hierarchy) | > 15% | Check task class tagging and similarity detection |
| Cost per task | < $1.50 | Routing optimizing to cheaper harnesses for appropriate tasks |
| Compound learning rate | 2–5% | Core health metric |

### Tier 3 — Mature (90+ days)

Routing is well-calibrated. Instruction files encode significant institutional
knowledge. Memory federation is a genuine asset. The system should show
super-linear improvement in task quality relative to linear token spend.

| Metric | Target | Action if plateau |
|--------|--------|-----------------|
| Tasks completed per week | > 150 | Add harnesses, expand routing, or increase parallelism |
| Test pass rate | > 92% | Near-ceiling; focus on task complexity not volume |
| Task reuse rate | > 30% | Institutional memory is compounding |
| Cost per task | < $1.00 | Routing is accurate; expensive harnesses used sparingly |
| Instruction mutations | 1–3 / week | Fewer mutations = more stability = correct |
| LOC delta per $100 spent | > 500 | Economic benchmark; below threshold = audit routing |

**Anti-patterns that indicate systemic problems:**

Velocity plateau after day 30 with no improvement: routing rules are misassigned;
measure cost-per-feature per harness to find which one is absorbing tasks it
shouldn't handle.

Test pass rate inversely correlated with task volume: harnesses are racing
(shared index contention despite worktree isolation) or instruction mutations
are net-negative. Revert recent AGENTS.md changes and re-measure.

Compound learning rate > 10%: Instruction thrashing. Raise the mutation approval
bar — require 2+ documented failures before accepting any mutation.

---

## 13. Evolutionary Maintenance

### Changelog monitoring

Subscribe to release feeds (RSS or GitHub Actions watching releases):

| Harness | Primary changelog | Secondary |
|---------|------------------|-----------|
| Aider | github.com/Aider-AI/aider/releases | aider.chat/HISTORY.html |
| Claude Code | github.com/anthropics/claude-code/CHANGELOG.md | claudelog.com |
| Gemini CLI | geminicli.com/docs/changelogs | github.com/google-gemini/gemini-cli/releases |
| Codex | developers.openai.com/codex/changelog | github.com/openai/codex |
| OpenClaw | github.com/openclaw/openclaw/releases | docs.openclaw.ai |
| OpenHands | openhands.dev/blog | github.com/OpenHands/OpenHands/releases |

**High-priority signals (review within 24h):**
- New config file formats or default changes
- New collision vectors (new files written to workspace root)
- ACP or MCP adoption changes
- Planning Mode or task/plan system updates (roots new collision patterns)
- `CLAUDE_CODE_SIMPLE` behavior changes

### Update sequence (per harness major release)

```
1. Read changelog → extract: new primitives, config changes, deprecations
2. Check collision matrix (§5): does the update introduce new vectors?
3. Create test worktree: git worktree add ../wt-test -b test/update-{harness}
4. Update harness in test worktree; run regression suite (see below)
5. If clean: update harness in primary + remaining worktrees
6. If architecture-impacting: update ARCHITECTURE.md via PR
7. If instruction-impacting: update AGENTS.md via PR
8. Commit with: chore(harness): update {name} to v{version} - {summary}
9. Run velocity benchmark comparison (48h window before vs after)
10. Remove test worktree
```

### Regression test suite

```bash
#!/usr/bin/env bash
# .agent/regression-test.sh

set -euo pipefail
HARNESS=${1:-"all"}

run_smoke() {
  local h=$1
  echo "── Smoke: $h"
  case $h in
    aider)    aider --version && echo "Aider: OK" ;;
    claude)   claude --version && echo "Claude Code: OK" ;;
    gemini)   gemini --version && echo "Gemini CLI: OK" ;;
    codex)    codex --version && echo "Codex: OK" ;;
    openclaw) openclaw --version && echo "OpenClaw: OK" ;;
    openhands) openhands --version && echo "OpenHands: OK" ;;
  esac
}

run_integration() {
  echo "── Integration: parallel worktree write isolation"
  # Two harnesses, two worktrees, different files — no conflict expected
  echo "test" > ../wt-claude/test-claude.txt
  echo "test" > ../wt-codex/test-codex.txt
  git -C ../wt-claude add test-claude.txt && git -C ../wt-claude commit -m "test: isolation check"
  git -C ../wt-codex add test-codex.txt && git -C ../wt-codex commit -m "test: isolation check"
  git -C ../wt-claude rm test-claude.txt && git -C ../wt-claude commit -m "test: cleanup"
  git -C ../wt-codex rm test-codex.txt && git -C ../wt-codex commit -m "test: cleanup"
  echo "Integration: OK"
}

run_memory() {
  echo "── Memory: OpenMemory MCP connectivity"
  curl -sf http://localhost:8765/health && echo "OpenMemory: OK" || echo "OpenMemory: FAIL"
  curl -sf http://localhost:6333 && echo "Qdrant: OK" || echo "Qdrant: FAIL"
}

run_collision() {
  echo "── Collision: verify no root-level PLAN.md"
  [ ! -f PLAN.md ] && echo "PLAN.md collision: OK" || echo "PLAN.md collision: FAIL — file exists at root"
  [ ! -f PLANS.md ] && echo "PLANS.md collision: OK" || echo "PLANS.md collision: FAIL — file exists at root"
}

if [ "$HARNESS" = "all" ]; then
  for h in aider claude gemini codex openclaw openhands; do
    run_smoke $h
  done
  run_integration
  run_memory
  run_collision
else
  run_smoke $HARNESS
fi
echo ""
echo "Regression suite complete."
```

### Quarterly re-baseline protocol

```
1. Pull all harness changelogs since last quarter
2. Re-evaluate ALL epistemic labels (§14) — upgrade/downgrade based on evidence
3. Re-evaluate director/orchestrator choice against new entrants
4. Run full memory export: python -m mem0 export --format json > mem0-export-{date}.json
5. Verify export integrity: check merkle_root against live tree
6. Audit AGENTS.md instruction compound growth:
   git log --oneline AGENTS.md | wc -l  → compare to prior quarter
7. Compute fleet-level velocity metrics for the quarter (§12)
8. Review routing efficiency: cost-per-feature per harness
9. Check homogenization index: pairwise similarity of per-harness override files
10. Review retention priority distribution in task hierarchy
11. Update ARCHITECTURE.md with findings; commit as chore(arch): q{N} re-baseline
```

---

## 14. Epistemic Status Table

Labels: **HIGH** = verified from primary sources; **MEDIUM** = well-supported
inference; **LOW** = theoretical or speculative; **REFUTED** = prior claim
corrected by new evidence; **CORRECTED** = minor factual fix.

Every REFUTED or CORRECTED entry preserves the provenance of the original claim
so the reasoning that led to it can be audited. The prior claim is sometimes
more informative than the correction — it records the state of the art at the
time it was made.

| Claim | Status | Source / Notes |
|-------|--------|---------------|
| ACP stdio transport is production-ready for local use | **HIGH** | agentclientprotocol.com; 4 language SDKs; 15+ agents; Zed + JetBrains deployed |
| ACP remote transport (HTTP/WebSocket) production-ready | **LOW** | Stated as in-progress; no confirmed production deployment |
| 5/6 harnesses support ACP (Aider excluded) | **HIGH** | Per-harness adapter matrix; Aider native implementation confirmed underway |
| Aider MCP bridge (`aider-mcp`) is a viable fallback | **HIGH** | sengokudaikon/aider-mcp; ACP MCP passthrough mechanism |
| Mem0 OSS is the correct local cross-harness memory backend | **HIGH** | docs.mem0.ai; multi-tenant namespacing; Kuzu graph; OpenMemory MCP |
| Frequency-weighted retention formula is correct | **MEDIUM** | Grounded in SRS research (arxiv:2512.12856); thresholds require empirical calibration |
| 30-day age-based pruning is wrong for this use case | **HIGH** | Structural argument: reuse-frequency is uncorrelated with age |
| Thin process orchestrator > AI agent as director | **HIGH** | DelegationTool is internal-only (OpenHands); Agent Teams is Claude-only (Claude Code); validated by Superset, AgentPool, Agent Orchestrator |
| AGENTS.md is becoming a cross-harness standard | **HIGH** | Linux Foundation / Agentic AI Foundation stewardship; v1.1 proposal active (issue #135) |
| Claude Code will adopt AGENTS.md natively in 2026 | **MEDIUM** | Manifold Markets prediction market: 62% yes |
| HARNESS.md routing table is a named real pattern | **LOW** | Theoretical; no tool reads HARNESS.md natively. Concept absorbed into orchestrator.yml. |
| OpenHands Planning Mode shipped March 4, 2026 | **HIGH** | openhands.dev/blog/openhands-product-update—march-2026 |
| OpenClaw is a personal agent messaging gateway, not a coding harness | **HIGH** | docs.openclaw.ai; spawns coding sub-processes via ACP rather than executing code directly |
| Claude Code worktree behavioral degradation (issue #31872) | **MEDIUM** | Open GitHub issue; multiple user confirmations; no Anthropic acknowledgment yet |
| `CLAUDE_CODE_SIMPLE=1` disables CLAUDE.md, hooks, MCP | **HIGH** | Claude Code changelog; tested |
| GEMINI.md inode deduplication on case-insensitive filesystems | **HIGH** | Gemini CLI v0.32+ changelog |
| Composio Agent Orchestrator and Superset are production-validated | **MEDIUM** | Star counts + test counts; no direct deployment confirmation in this codebase |
| IBM ACP (Agent Communication Protocol) merged into A2A under Linux Foundation, Jan 2026 | **HIGH** | Linux Foundation announcement, Jan 2026 |
| Protocol convergence (MCP + ACP + A2A) by Q4 2026 | **MEDIUM** | Directional convergence is clear; timing is speculative |
| Fleet homogenization risk above 85% pairwise similarity | **MEDIUM** | Threshold is reasoned, not empirically validated |
| Compound learning rate 2–5% is the correct target band | **MEDIUM** | Reasoned from SRS curve; requires empirical calibration |
| **[REFUTED]** "Krieger" persistent coworker ships Q3 2027 | **REFUTED** | Claude Cowork shipped January 12, 2026 (research preview). Projection was based on Mike Krieger's 2025 "1–3 year" statement, which was imprecise and ahead of the actual ship date by 18+ months. Mike Krieger stepped down as CPO to co-lead Labs (Anthropic's internal incubator) in January 2026. |
| **[REFUTED]** OpenHands should serve as director | **REFUTED** | DelegationTool delegates only to internal OpenHands sub-agents, not external harnesses. Reversal is a factual capability boundary correction, not a reasoning error. OpenHands' event-sourced ConversationState and deterministic replay remain design-worthy properties — they now apply to the OpenHands worker role. |
| **[REFUTED]** 30-day age-based pruning is a valid retention policy | **REFUTED** | Structurally wrong. A task recurring weekly has increasing value over time. Replaced by frequency-weighted formula with base half-life of 90 days, extended by reuse_count. |
| **[CORRECTED]** OpenHands Planning Mode date: March 6 → March 4, 2026 | **CORRECTED** | openhands.dev/blog/openhands-product-update—march-2026 (published March 4). Prior session stated March 6 in error. |
| **[CORRECTED]** Bootstrap sequence is "irreversible" | **CORRECTED** | Directory layout and memory store are fully reversible. The true irreversibility is behavioral compounding in instruction files over accumulated sessions — and only if AGENTS.md is not versioned per-mutation in git. |

---

*Compiled March 11, 2026. Sources: agentclientprotocol.com, zed.dev/blog/acp-progress-report,
hexdocs.pm/acpex, claude.com/blog/cowork-research-preview, CNBC Feb 24 2026,
cobusgreyling.medium.com/claude-code-agent-teams, byteiota.com/superset-ide,
github.com/ComposioHQ/agent-orchestrator, phil65.github.io/agentpool,
claudefa.st/blog, releasebot.io/updates/anthropic/claude-code,
geminicli.com/docs/changelogs, developers.openai.com/codex,
github.com/OpenHands/OpenHands/issues/8964,
openhands.dev/blog/openhands-product-update—march-2026,
github.com/agentsmd/agents.md/issues/135, manifold.markets,
arxiv.org/abs/2511.03690, arxiv.org/abs/2512.12856.*

*Next re-baseline: June 2026.*
