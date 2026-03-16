<!-- Superseded-by: scaffolds/coding-harness/harness-taxonomy.md -->
# HARNESS-CONFIG.md

**Class:** Ledger  
**Domain identifier:** HARNESS-CONFIG  
**Tier mapping:** Tier 4 (repo-native coding harnesses)  
**ρ-class:** high-ρ  
**Freshness window:** FRESH < 7 days, CURRENT < 21 days, AGING < 60 days, STALE ≥ 60 days  
**Compaction cadence:** Every 2–4 weeks  
**Volume budget:** 80–120 entries before compaction trigger  
**Scope:** Observable changes in the configuration architecture, default settings, instruction-file formats, and behavioral parameters of repo-native coding harnesses (Aider, Claude Code, Gemini CLI, Codex, OpenHands, and additions to the class). Tracks: config-file format changes, new configuration options, default-value shifts, instruction-file cascade changes, environment-variable additions/deprecations, and context-window allocation parameter changes. Excludes: capability-level changes (CAPABILITIES domain), tool/integration ecosystem changes (TOOL-ECOSYSTEM domain), and pricing/token-economics changes (future TOKEN-ECONOMICS domain).  
**Lifecycle:** Active  
**Created:** 2026-03-13  
**Creation governance:** Intermediate decision (REVIEW) — operator commissioned, agent executed  

---

## Working Ledger

**[HARNESS-CONFIG-001]**  
**Observation date:** 2026-03-13  
**Source:** Direct operational observation (this session); Claude Code product documentation at https://docs.claude.com  
**Confidence:** MEDIUM  
**Anchor references:** `[claude-code:instruction-file-cascade]` (harness-taxonomy.md convergent primitive — identifier format is pre-grammar-layer and will be remediated; structural reference is valid)  

Claude Code operates in this session via the Claude Opus 4.6 model with computer-use tools (bash, file creation, str_replace, view) in a container environment. The working directory is `/home/claude` with read-only access to `/mnt/user-data/uploads`, `/mnt/skills/public`, and `/mnt/project`. Network egress is restricted to an allowlist of domains. The instruction-file surface includes project-level custom instructions (loaded from project configuration), user-level preferences (loaded from `<userPreferences>` in the system prompt), and skill files (loaded from `/mnt/skills/`). This represents the observable configuration baseline for the Claude Code / Claude.ai computer-use environment as of this date.

**Implications:** The configuration architecture for Claude-in-container operation includes a skill-loading mechanism (`/mnt/skills/`) and a project-knowledge mechanism (`/mnt/project/`) that may not be fully documented in the harness taxonomy's instruction-file-cascade analysis. A sensing directive targeting the instruction-file cascade primitive would benefit from verifying these paths against the harness taxonomy's documented architecture.

---

*Production receipt: This domain was created per DELTA-METABOLISM.md § 2.2 with one inaugural entry per § 3.1, under REVIEW governance. Output is presented for operator review.*
