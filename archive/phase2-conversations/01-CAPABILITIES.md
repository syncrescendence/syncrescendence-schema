# CAPABILITIES.md

**Class:** Ledger  
**Domain identifier:** CAPABILITIES  
**Tier mapping:** Tier 4 (multi-class — observations span coding harnesses, reasoning surfaces, SaaS platforms, and other modality classes)  
**ρ-class:** high-ρ  
**Freshness window:** FRESH < 7 days, CURRENT < 21 days, AGING < 60 days, STALE ≥ 60 days  
**Compaction cadence:** Every 2–4 weeks (high-ρ default per DELTA-METABOLISM.md § 4.1)  
**Volume budget:** 80–120 entries before compaction trigger  
**Scope:** Observable changes in the capabilities, feature sets, and functional boundaries of execution surfaces across all Tier 4 modality classes. Tracks: new capabilities added, existing capabilities removed or deprecated, capability behavior changes, model performance shifts, feature-flag changes. Excludes: pricing changes (separate domain candidate TOKEN-ECONOMICS), configuration-level changes (separate domain candidate HARNESS-CONFIG), and tool/integration ecosystem changes (separate domain candidate TOOL-ECOSYSTEM).  
**Lifecycle:** Active  
**Created:** 2026-03-13  
**Creation governance:** Intermediate decision (REVIEW) — operator commissioned, agent executed  

---

## Working Ledger

**[CAPABILITIES-001]**  
**Observation date:** 2026-03-13  
**Source:** Direct operational observation (this session); Anthropic product documentation  
**Confidence:** MEDIUM  
**Anchor references:** General — reasoning-surface modality class; no surface scaffold primitive exists yet for Claude-chat to anchor against  

Claude's current model generation is Claude 4.6, with Opus 4.6 and Sonnet 4.6 as the active variants. Opus 4.6 is operating in this session with access to extended thinking, web search, computer use (file creation, bash execution), image search, persistent storage for artifacts, past-chat search, Google Drive integration, and multiple MCP connectors (Linear, Google Calendar, Gmail). The model identifier string is `claude-opus-4-6`. This represents the operational capability baseline for the Claude reasoning surface as of this date. Haiku remains at the 4.5 generation (`claude-haiku-4-5-20251001`). The gap between the Opus/Sonnet generation (4.6) and Haiku generation (4.5) is an observable structural fact about the reasoning-surface modality class — Anthropic's model tiers do not advance in lockstep.

**Implications:** The capability baseline for the Claude reasoning surface has advanced since the dossier-class evidence in the corpus was last updated. Any scaffold or specification referencing Claude capabilities should verify against this observation rather than assuming prior-generation baselines.

---

*Production receipt: This domain was created per DELTA-METABOLISM.md § 2.2 with one inaugural entry per § 3.1, under REVIEW governance, as the first temporal-track activation under the grammar layer. Output is presented for operator review.*
