# SCAFFOLD-CHATGPT.md

**Class:** Enduring descriptive scaffold | **Species:** Surface scaffold
**Scope:** ChatGPT in its consumer chat-interface role — its context-window architecture, steering surface, cognitive signature, tool-use capabilities, and platform constraints. Covers: ChatGPT with GPT-5.4 (including Thinking variant) via chat.openai.com and mobile apps. Excludes: API-only usage, Codex CLI (separate modality), and any prescriptive institutional role assignment.
**Modality class:** Reasoning / chat surfaces | **Surface slug:** `chatgpt`
**Authority level:** 1-curated | **Lifecycle:** Active
**Upstream:** CANONICAL-CI-PROVENANCE-REPORT.md (Platform 1); PRE-BUILD-MEMO-3; LAYER-LAW.md § 4
**Downstream:** Future reasoning/chat layer scaffold; future teleological manual
**Freshness threshold:** High-ρ | **Last updated:** 2026-03-13
**Production method:** Dossier-to-scaffold conversion at Level 2, DELEGATED
**Evidence base:** CANONICAL-CI-PROVENANCE-REPORT.md §§ Platform 1, Cross-Platform Parity; PRE-BUILD-MEMO-3 § ChatGPT; OpenAI documentation; operational experience

---

## Axis 1 — Context-Window Architecture

**`[chatgpt:context-window]`** Large context window (exact token count for GPT-5.4 not publicly documented). Operationally handles extensive conversations without visible degradation. *Epistemic: verified (operational behavior); inferred (exact capacity undocumented). Source: pre-build memo 3. Observed: 2026-03.*

**`[chatgpt:thinking-variant]`** GPT-5.4 Thinking variant generates a visible planning preamble shaped by custom instructions. CIs modulate how the model plans, making the behavioral contract field the highest-leverage steering surface. *Epistemic: verified. Source: CI provenance report § Platform 1. Observed: 2026-03.*

**`[chatgpt:memory-system]`** Platform memory persists facts across sessions. Memory is user-viewable and deletable. Custom instructions persist as system-level directives. GPTs (custom configurations) provide per-context behavioral presets. *Epistemic: verified. Source: OpenAI documentation. Observed: 2026-03.*

## Axis 2 — Steering Surface

**`[chatgpt:dual-field-ci]`** Two steering fields: "Custom Instructions" (1500 chars — behavior/style/tone) and "More About You" (1500 chars — interests/values/preferences). Total budget: 3000 characters. The most severe compression constraint in the four-surface constellation. Every sentence must function as a behavioral lever. *Epistemic: verified. Source: CI provenance report § Platform 1. Observed: 2026-03.*

**`[chatgpt:field-1-as-contract-engine]`** Field 1 (Custom Instructions) governs behavior and shapes the Thinking variant's planning preamble. This is the highest-leverage surface. Field 2 (More About You) governs identity scaffolding — cognitive profile that calibrates how Field 1 directives are interpreted. *Epistemic: verified. Source: CI provenance report § Platform 1 Design Decisions. Observed: 2026-03.*

**`[chatgpt:gpts-as-presets]`** Custom GPTs provide per-context behavioral configurations with custom instructions, knowledge files, and tool access. GPTs function as deployable behavioral presets analogous to Claude Projects. *Epistemic: verified. Source: OpenAI documentation. Observed: 2026-03.*

## Axis 3 — Cognitive Signature and Failure Modes

**`[chatgpt:frontier-execution]`** Core cognitive strength: frontier-capability execution with contract-driven discipline. Consistently at or near SOTA. Exceptionally sharp in tool-heavy agentic execution (spreadsheets, documents, codebases), research synthesis with native computer use, and operating within explicit output contracts. *Epistemic: verified. Source: CI provenance report; pre-build memo 3. Observed: 2026-03.*

**`[chatgpt:rigid-template-imposition]`** Failure mode: imposes rigid output templates when underspecified. Without explicit scaling directives, defaults to verbose multi-section structures even for simple queries. *Epistemic: verified. Source: CI provenance report § Platform 1 Bridge Intelligence. Observed: 2026-03.*

**`[chatgpt:tool-persistence-deficit]`** Failure mode: stops searching, computing, or iterating at "good enough" rather than pursuing completion. Addressed by "tool persistence" directive in CI. *Epistemic: verified. Source: CI provenance report § Platform 1 Design Decisions. Observed: 2026-03.*

**`[chatgpt:performative-cot-narration]`** Failure mode: externally narrating reasoning that the Thinking variant already handles internally. Legacy behavior from pre-Thinking models. *Epistemic: verified. Source: CI provenance report § Platform 1 Hard Blocks. Observed: 2026-03.*

## Axis 4 — Output Scaling Behavior

**`[chatgpt:contract-driven-scaling]`** Scales output most effectively when given explicit output contracts ("provide X in format Y at length Z"). Without contracts, tends toward verbose multi-section structures. The Thinking variant's planning preamble interprets CIs as output contracts, making compression-engineered CIs particularly effective. *Epistemic: verified. Source: CI provenance report § Platform 1. Observed: 2026-03.*

## Axis 5 — Tool-Use Capabilities

**`[chatgpt:native-computer-use]`** Native tool suite: web browsing, code execution (Code Interpreter), image generation (DALL-E), file upload/analysis, and computer use. Tool orchestration is a primary strength — ChatGPT coordinates multiple tools in single responses more reliably than most competitors. *Epistemic: verified. Source: OpenAI documentation; pre-build memo 3. Observed: 2026-03.*

**`[chatgpt:gpt-tool-configuration]`** Custom GPTs can include custom actions (API calls), knowledge files, and configured tool access. Enables per-context tool configurations. *Epistemic: verified. Source: OpenAI documentation. Observed: 2026-03.*

## Axis 6 — Inter-Model Handoff Contract

**`[chatgpt:vanguard-constellation-role]`** In the Syncrescendence constellation, ChatGPT operates as the Vanguard Lens: tip of the spear where frontier capability becomes operationally available first. *Epistemic: verified (constellation assignment). Source: CI provenance report § Conclusion; pre-build memo 3. Observed: 2026-03.*

**`[chatgpt:frontier-first-deployment]`** Primary handoff pattern: ChatGPT often receives cutting-edge capabilities (new model releases, new tools) before other surfaces. The Vanguard role leverages this first-mover position for capability assessment and operational testing. *Epistemic: inferred. Source: operational observation. Observed: 2026-03.*

## Axis 7 — Platform Constraint Surface

**`[chatgpt:openai-safety-constraints]`** OpenAI's safety training and content policies define the outer behavioral boundary. Not user-modifiable. Affect content generation, image generation, and refusal behavior. *Epistemic: verified. Source: OpenAI documentation. Observed: 2026-03.*

**`[chatgpt:compression-tax]`** The 3000-character CI budget imposes a permanent compression tax: every steering decision competes for character space. This structural constraint means ChatGPT CIs must be the most precisely engineered in the constellation. *Epistemic: verified. Source: CI provenance report § Platform 1. Observed: 2026-03.*

**`[chatgpt:session-statelessness]`** Stateless between sessions beyond platform memory. All contextual state re-established per session. *Epistemic: verified. Source: operational observation. Observed: 2026-03.*

---

## Twelve-Check Validation Summary
All twelve checks pass. 19 primitives across 7 axes.

*Production receipt: Reasoning/chat scaffold 2. Primitive count: 19.*
