# TOOL-ECOSYSTEM.md

**Class:** Ledger  
**Domain identifier:** TOOL-ECOSYSTEM  
**Tier mapping:** Tier 4 (multi-class — observations span coding harnesses, SaaS platforms, and integration/coordination surfaces)  
**ρ-class:** high-ρ  
**Freshness window:** FRESH < 7 days, CURRENT < 21 days, AGING < 60 days, STALE ≥ 60 days  
**Compaction cadence:** Every 2–4 weeks  
**Volume budget:** 80–120 entries before compaction trigger  
**Scope:** Observable changes in the tool, integration, and protocol ecosystem that surrounds execution surfaces. Tracks: new tool releases and major version changes, MCP server availability and protocol evolution, integration additions and deprecations across surfaces, new surfaces entering the institutional field of view, tool acquisitions and discontinuations, and cross-surface protocol developments (MCP, ACP, A2A). Excludes: individual surface capability changes (CAPABILITIES domain), configuration-level changes to specific harnesses (HARNESS-CONFIG domain), and pricing/licensing changes (future TOKEN-ECONOMICS domain).  
**Lifecycle:** Active  
**Created:** 2026-03-13  
**Creation governance:** Intermediate decision (REVIEW) — operator commissioned, agent executed  

---

## Working Ledger

**[TOOL-ECOSYSTEM-001]**  
**Observation date:** 2026-03-13  
**Source:** Direct operational observation (this session); Claude.ai platform capabilities  
**Confidence:** MEDIUM  
**Anchor references:** General — Tier 4 multi-class; Tier 5 coordination (MCP integration layer). No scaffold primitive or formal identifier exists to anchor against — no MCP integration scaffold has been produced, and no surface scaffold covers the MCP protocol layer. This entry is valid as Level 0 intake per DELTA-METABOLISM.md § 3.1; it cannot trigger scaffold revision requests until a formal anchor target exists.  

This session's operational environment exposes the following MCP connector integrations: Linear (https://mcp.linear.app/mcp), Google Calendar (https://gcal.mcp.claude.com/mcp), and Gmail (https://gmail.mcp.claude.com/mcp). The MCP connector architecture in Claude.ai allows users to connect external services that Claude can invoke during conversations, with tools loaded dynamically via the `tool_search` mechanism. Google Drive search is available as a native tool (not via MCP). This represents the observable MCP integration state for the Claude.ai platform as of this date. The MCP protocol ecosystem continues to expand — the system prompt references known partner servers including Figma, Canva, BioRender, Amplitude, Hex, Salesforce, Clay, Asana, Atlassian, Monday, Slack, Box, Shopify, Spotify, Zillow, Amazon, ElevenLabs, and Block.

**Implications:** The MCP ecosystem is expanding faster than the institution's scaffolded surface inventory. Many MCP-connected surfaces (Figma, Canva, Amplitude, Hex, Salesforce) have no dossier-class evidence in the corpus. As the tool ecosystem evolves, the gap between available integrations and scaffolded surfaces will widen unless surface-research scope keeps pace with ecosystem growth.

---

*Production receipt: This domain was created per DELTA-METABOLISM.md § 2.2 with one inaugural entry per § 3.1, under REVIEW governance. Review revision 2026-03-13: anchor reference annotated with honest Level 0 intake status (no formal identifier target exists in the current corpus). Output is presented for operator review.*
