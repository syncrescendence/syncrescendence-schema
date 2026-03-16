# PROMPT-VANGUARD-MEMORY_ARCHITECTURE_ENGINEERING.md
## Vanguard (ChatGPT/GPT-codex) Engineering Directive: Memory Architecture Detail
**Priority**: P0 — Sovereign directive (triangulation pass)
**Target Platform**: ChatGPT Web (Vanguard) or Codex CLI
**Reply-To**: Commander | **CC**: Ajna
**Date**: 2026-02-22

---

## Directive

Vanguard, this is an ENGINEERING DETAIL mission. Oracle (Grok) is running recon on the best memory architectures for multi-agent systems. Your job is the meticulous engineering deep-dive — the autistic attention to implementation detail that GPT excels at.

**Context**: We run a 5-agent constellation across 2 physical machines. Current memory is file-based (MEMORY.md + entities/ + journal/ per agent). We have Docker services: Neo4j (7474), Graphiti (8001), Qdrant (6333), Chroma (8765). File-first beat vector DB 74% to 68.5% in our testing.

### Your Mission: Engineering Specification

1. **Graphiti integration spec** — If we adopt Graphiti for cross-session graph memory:
   - Exact API calls for entity creation, relationship creation, episodic memory insertion
   - How to sync file-based MEMORY.md ↔ Graphiti graph (bidirectional)
   - Schema design for our 5-agent constellation (what entities, what relationships, what properties)
   - Failure modes: what happens when Graphiti is down? How do agents degrade gracefully to file-only?
   - Performance: latency for writes, reads, graph traversals at our scale (~5000 entities, ~2000 relationships)

2. **Three-layer memory implementation** — Specify the exact architecture for:
   - **Layer 1 (Working Memory)**: Agent's current context window — what goes in, what stays out
   - **Layer 2 (Session Memory)**: MEMORY.md + journal/ — file-based, git-tracked, immediate
   - **Layer 3 (Long-term Memory)**: Graph store (Graphiti/Neo4j) — cross-agent, cross-session, queryable

3. **Memory sync protocol** — Exact sequence for:
   - Agent writes observation → file → graph sync
   - Agent queries cross-agent knowledge → graph → file cache
   - Memory compaction (when journal/ grows too large)
   - Conflict resolution (two agents write contradictory memories)

4. **OpenClaw memory integration** — OpenClaw (our persistent agent framework) has its own memory system. Specify:
   - How OpenClaw's memory maps to our three layers
   - Whether OpenClaw should OWN Layer 2 for Psyche/Ajna, with Commander using file-based
   - Data flow: OpenClaw memory ↔ git-tracked memory/ ↔ Graphiti

5. **Migration plan** — From current state to target state:
   - Phase 1: What we do THIS WEEK
   - Phase 2: What we do in 2 weeks
   - Phase 3: What we do in 30 days
   - Each phase: exact commands, scripts, config changes

### Output Format
Engineer-grade specification. Code snippets. Config files. API call examples. No hand-waving.
