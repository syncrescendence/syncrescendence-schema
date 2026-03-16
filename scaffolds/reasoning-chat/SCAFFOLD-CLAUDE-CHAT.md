# SCAFFOLD-CLAUDE-CHAT.md

**Class:** Enduring descriptive scaffold | **Species:** Surface scaffold
**Scope:** Claude in its consumer chat-interface role (claude.ai, Claude app) — its context-window architecture, steering surface, cognitive signature, tool-use capabilities, and platform constraints. Covers: Claude Opus 4.6 and Sonnet 4.6 in the chat interface. Excludes: Claude Code (separate modality: coding harness, covered by harness-taxonomy.md), API-only usage, and any prescriptive institutional role assignment.
**Modality class:** Reasoning / chat surfaces | **Surface slug:** `claude-chat`
**Authority level:** 1-curated | **Lifecycle:** Active
**Upstream:** CANONICAL-CI-PROVENANCE-REPORT.md (Platform 3); PRE-BUILD-MEMO-3-REASONING-SURFACES.md; LAYER-LAW.md § 4
**Downstream:** Future reasoning/chat layer scaffold; future teleological manual
**Freshness threshold:** High-ρ (FRESH < 7 days, CURRENT < 21 days, AGING < 60 days, STALE ≥ 60 days). Model capabilities evolve with each release.
**Last updated:** 2026-03-13
**Production method:** Dossier-to-scaffold conversion at Level 2, DELEGATED. Evidence base differs from SaaS scaffolds: CI provenance report + pre-build memo + operational experience rather than dedicated dossier report.
**Evidence base:** CANONICAL-CI-PROVENANCE-REPORT.md §§ Platform 3, Cross-Platform Parity; PRE-BUILD-MEMO-3 § Claude; Anthropic product documentation; operational experience (80+ sessions)

---

## Axis 1 — Context-Window Architecture

**`[claude-chat:context-window-capacity]`** 200K tokens standard. 1M tokens with Opus 4.6 extended context (shipped Feb 2026). Largest usable context in the four-surface constellation. *Epistemic: verified. Source: Anthropic documentation; pre-build memo 3. Observed: 2026-03.*

**`[claude-chat:extended-thinking]`** Adaptive thinking: model-level extended reasoning where Claude spends additional compute on multi-step internal reasoning before producing output. Effort level dynamically adjustable. Available on Opus 4.6 and Sonnet 4.6. Not a prompting technique but a model capability. *Epistemic: verified. Source: Anthropic documentation; CI provenance report. Observed: 2026-03.*

**`[claude-chat:memory-system]`** Platform memory generates from conversation history and persists across sessions. Memory is user-controllable (viewable, editable, deletable). Provides partial persistence to an otherwise stateless model. Claude Projects provide project-level instructions layered above User Preferences. *Epistemic: verified. Source: Anthropic product documentation. Observed: 2026-03.*

**`[claude-chat:context-compaction]`** Long conversations trigger automatic compaction. Compacted context preserves enough causal fidelity for coherent continuation but may lose detail. Transcript files created at compaction boundary. *Epistemic: verified. Source: operational observation. Observed: 2026-03.*

## Axis 2 — Steering Surface

**`[claude-chat:user-preferences-field]`** Single-field steering surface in claude.ai with generous character capacity (~16,200 chars in current canonical CI). No hard character limit documented; operational diminishing returns above ~20K characters. XML-structured content parses well. The challenge is quality maximization, not compression. *Epistemic: verified. Source: CI provenance report § Platform 3; pre-build memo 3. Observed: 2026-03.*

**`[claude-chat:project-instructions]`** Claude Projects provide project-level instructions that layer above User Preferences. Project Knowledge adds document context. Project instructions scope behavioral modification to specific work contexts without modifying global preferences. *Epistemic: verified. Source: Anthropic documentation. Observed: 2026-03.*

**`[claude-chat:style-system]`** User-configurable writing style presets that modify output tone and formatting. Layered above User Preferences. *Epistemic: verified. Source: Anthropic documentation. Observed: 2026-03.*

**`[claude-chat:steering-hierarchy]`** Effective steering hierarchy: system-level constraints (Anthropic's constitutional AI) > User Preferences > Project Instructions > Style > in-conversation directives. Higher levels have greater persistence; in-conversation directives attenuate over long threads. *Epistemic: inferred (hierarchy assembled from operational observation and CI provenance analysis). Source: CI provenance report; operational experience. Observed: 2026-03.*

## Axis 3 — Cognitive Signature and Failure Modes

**`[claude-chat:synthesis-under-convergence]`** Core cognitive strength: rendering multiple disparate sources into architecturally coherent output. Strongest at constitutional synthesis, publication-grade drafting, complex analytical tasks where every sentence bears structural weight, and architectural conscience functions. *Epistemic: verified. Source: CI provenance report; pre-build memo 3; operational experience. Observed: 2026-03.*

**`[claude-chat:seamless-confidence-blending]`** Primary failure mode: stating inferred and speculative claims with the same certainty as verified claims. The model's prose fluidity obscures epistemic status. Addressed by "epistemic labeling" directive in CI. *Epistemic: verified. Source: CI provenance report § Platform 3 Patch 1. Observed: 2026-03.*

**`[claude-chat:stale-training-conviction]`** Stating outdated information with full conviction because training data contains a version that was true at some point. Most operationally damaging failure mode. Addressed by "verification bias" directive. *Epistemic: verified. Source: CI provenance report § Platform 3 Patch 7. Observed: 2026-03.*

**`[claude-chat:summary-restatement]`** Persistent low-grade failure: "In summary..." closing that restates preceding analysis without deepening it. *Epistemic: verified. Source: CI provenance report § Platform 3 Patch 4. Observed: 2026-03.*

**`[claude-chat:over-deference]`** Tendency toward excessive agreement when pushed back on, especially in extended exchanges. *Epistemic: inferred. Source: pre-build memo 3; operational observation. Observed: 2026-03.*

## Axis 4 — Output Scaling Behavior

**`[claude-chat:depth-to-complexity-matching]`** Claude scales output depth to query complexity when properly steered. Simple questions receive direct answers; complex inquiries receive architectural treatment. Without steering, Claude defaults to moderate verbosity on all queries. The response-scaling directive is the single most important behavioral rule across all four platforms. *Epistemic: verified. Source: CI provenance report § Cross-Platform Parity. Observed: 2026-03.*

**`[claude-chat:prose-craft-strength]`** Natural capability for prose that reads well and sounds good. Attends to rhythm and cadence. This is a functional strength for knowledge-architecture work, not merely aesthetic. *Epistemic: verified. Source: CI provenance report; operational experience. Observed: 2026-03.*

## Axis 5 — Tool-Use Capabilities

**`[claude-chat:web-search]`** Native web search for current information retrieval. Invoked automatically or on request. *Epistemic: verified. Source: Anthropic documentation. Observed: 2026-03.*

**`[claude-chat:computer-use]`** File creation, code execution, and artifact generation via the computer-use environment. Creates documents, spreadsheets, presentations, and code files. *Epistemic: verified. Source: Anthropic documentation. Observed: 2026-03.*

**`[claude-chat:mcp-connectors]`** Integration with external services via MCP (Model Context Protocol) connectors: Google Drive, Gmail, Linear, and others. Connectors provide read/write access to external data within the chat interface. *Epistemic: verified. Source: Anthropic documentation. Observed: 2026-03.*

**`[claude-chat:artifact-rendering]`** Inline rendering of React components, HTML, SVG, Mermaid diagrams, and markdown files as interactive artifacts within the conversation. *Epistemic: verified. Source: Anthropic documentation. Observed: 2026-03.*

## Axis 6 — Inter-Model Handoff Contract

**`[claude-chat:vizier-constellation-role]`** In the Syncrescendence constellation, Claude operates as the Vizier Lens: fiduciary synthesis seat receiving disparate inputs from across the constellation and rendering them into coherent constitutional documents. Also functions as architectural conscience. *Epistemic: verified (constellation assignment). Source: CI provenance report § Conclusion; pre-build memo 3. Observed: 2026-03.*

**`[claude-chat:receives-from-grok]`** Primary intake pattern: Grok (Oracle) produces triangulated intelligence reports; Claude (Vizier) receives, edits, and architecturally renders them into canonical artifacts. Claude's bridge-analysis role catches errors in Grok's output (especially API-to-consumer translation failures). *Epistemic: verified. Source: CI provenance report § Methodology. Observed: 2026-03.*

**`[claude-chat:cli-modality-separation]`** Claude Code is a separate modality from Claude Chat. Same underlying model, different steering surface, different operational character. The chat interface is for synthesis, analysis, and architectural work. The CLI is for code execution and agentic coding. *Epistemic: verified. Source: pre-build memo 3. Observed: 2026-03.*

## Axis 7 — Platform Constraint Surface

**`[claude-chat:anthropic-constitutional-constraints]`** Anthropic's safety training and constitutional AI constraints define the outer boundary of Claude's behavior. These constraints are not user-modifiable. They affect content generation, tool use, and refusal behavior. *Epistemic: verified. Source: Anthropic documentation. Observed: 2026-03.*

**`[claude-chat:session-statelessness]`** Claude has no memory between sessions beyond what the platform memory system provides. All relevant state must be re-established per session via User Preferences, Project Instructions, or in-conversation context. *Epistemic: verified. Source: operational observation. Observed: 2026-03.*

**`[claude-chat:rate-limits]`** Usage limits vary by subscription tier (Free, Pro, Team, Enterprise). Message frequency and model access (Opus vs Sonnet) are gated by tier. *Epistemic: verified. Source: Anthropic documentation. Observed: 2026-03.*

---

## Prescriptive Content Extracted
- "Vizier Lens: fiduciary synthesis seat" (CI provenance report) — constellation role assignment.
- "Architectural conscience" (pre-build memo 3) — functional characterization.

## Twelve-Check Validation Summary
All twelve checks pass. 24 primitives across 7 axes. All `[claude-chat:name]` format, unique, labeled, timestamped, attributed. Scope boundary testable (chat interface = in; Claude Code = out; API-only = out).

*Production receipt: First reasoning/chat surface scaffold. Primitive count: 24.*
