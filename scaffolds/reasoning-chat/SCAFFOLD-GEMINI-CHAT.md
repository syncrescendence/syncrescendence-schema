# SCAFFOLD-GEMINI-CHAT.md

**Class:** Enduring descriptive scaffold | **Species:** Surface scaffold
**Scope:** Gemini in its consumer chat-interface roles — both the web app and AI Studio. Covers: Gemini 3.1 Pro in both surfaces. The bifurcation into two distinct steering architectures is a defining structural feature. Excludes: Gemini CLI (separate modality: coding harness), Vertex AI API-only usage, and any prescriptive institutional role assignment.
**Modality class:** Reasoning / chat surfaces | **Surface slug:** `gemini-chat`
**Authority level:** 1-curated | **Lifecycle:** Active
**Upstream:** CANONICAL-CI-PROVENANCE-REPORT.md (Platform 4); PRE-BUILD-MEMO-3; LAYER-LAW.md § 4
**Downstream:** Future reasoning/chat layer scaffold; future teleological manual
**Freshness threshold:** High-ρ | **Last updated:** 2026-03-13
**Production method:** Dossier-to-scaffold conversion at Level 2, DELEGATED
**Evidence base:** CANONICAL-CI-PROVENANCE-REPORT.md §§ Platform 4, Cross-Platform Parity; PRE-BUILD-MEMO-3 § Gemini; Grok prompting guide for Gemini 3.1 Pro; Google AI documentation

---

## Axis 1 — Context-Window Architecture

**`[gemini-chat:context-window]`** 1M tokens (Gemini 3.1 Pro). Largest raw context window across the four surfaces. *Epistemic: verified. Source: Google AI documentation; pre-build memo 3. Observed: 2026-03.*

**`[gemini-chat:deep-think]`** Native "Deep Think" upgrade performs multi-step internal reasoning. Forcing additional reasoning (via prompting) creates loops rather than improving output. The model already handles multi-step reasoning internally. *Epistemic: verified. Source: CI provenance report § Platform 4 Bridge Intelligence. Observed: 2026-03.*

**`[gemini-chat:web-app-output-truncation]`** The web app truncates output, which the model internalizes as a preference for brevity. This affects the cognitive character of web-app outputs — responses are more compressed than AI Studio responses even without explicit length constraints. *Epistemic: verified. Source: CI provenance report § Platform 4 Bridge Intelligence. Observed: 2026-03.*

## Axis 2 — Steering Surface

**`[gemini-chat:bifurcated-steering]`** The defining structural feature: two distinct steering architectures. Web app: snippet-based memory system (1500-char blocks as semi-independent behavioral nudges, no strict count limit). AI Studio: virtually unlimited system instruction field. The bifurcation requires two distinct CI architectures optimized for different modalities. *Epistemic: verified. Source: CI provenance report § Platform 4. Observed: 2026-03.*

**`[gemini-chat:web-app-snippet-architecture]`** Five lightweight snippets targeting one behavioral axis each. No identity declaration — heavy identity prompts trigger internal dialoguing rather than production. Snippets describe behavior exclusively. Each snippet independently deployable, removable, or swappable. Snippet 5 (Forbids) separated as reserve because front-loading prohibitions triggers over-cautious mode. *Epistemic: verified. Source: CI provenance report § Platform 4 Design Decisions. Observed: 2026-03.*

**`[gemini-chat:ai-studio-xml-architecture]`** Full XML-structured system instruction. XML tags parse in the model's native register (Gemini's internal tool-calling uses XML-inspired formatting). Synthesis directives section with no web-app analogue. Google Search grounding toggle with specific directive: "do not let search results flatten your analytical frame." *Epistemic: verified. Source: CI provenance report § Platform 4 Design Decisions. Observed: 2026-03.*

**`[gemini-chat:context-first-sparsity]`** Context must be front-loaded with task last. Constraints or format specifications placed early in prompts get dropped. This ordering sensitivity is a structural constraint on how steering content must be organized. *Epistemic: verified. Source: Grok prompting guide; CI provenance report. Observed: 2026-03.*

## Axis 3 — Cognitive Signature and Failure Modes

**`[gemini-chat:cross-domain-pattern-recognition]`** Core cognitive strength: structural homology detection across domains, cross-disciplinary bridging, novel hypothesis generation, and translating complex topics into accessible explanations at advanced register. Pan-science integration leverages Google's training on cross-sector patterns. *Epistemic: verified. Source: CI provenance report § Platform 4; pre-build memo 3. Observed: 2026-03.*

**`[gemini-chat:internal-dialogue-triggering]`** Failure mode: heavy identity prompts cause Gemini to perform the role (internal dialoguing about the character) rather than produce from it. Affects web-app surface particularly. Mitigated by behavior-only steering without identity declarations. *Epistemic: verified. Source: CI provenance report § Platform 4 Bridge Intelligence. Observed: 2026-03.*

**`[gemini-chat:broad-negative-over-indexing]`** Failure mode: broad negative commands ("Do not hallucinate") cause over-indexing that breaks basic logic. Narrow, specific prohibitions work; broad ones backfire. *Epistemic: verified. Source: Grok prompting guide; CI provenance report. Observed: 2026-03.*

**`[gemini-chat:antithetical-framing-persistence]`** Failure mode: antithetical framing ("not X, but Y" constructions) is exceptionally hard to override on Gemini compared to other surfaces. *Epistemic: verified. Source: CI provenance report § Platform 4 Bridge Intelligence. Observed: 2026-03.*

**`[gemini-chat:temperature-sensitivity]`** Temperature must remain at 1.0. Any deviation causes looping or degraded logic. *Epistemic: verified. Source: Grok prompting guide. Observed: 2026-03.*

**`[gemini-chat:hallucination-as-channeled-feature]`** Hallucination tendency is architecturally channeled rather than suppressed: speculation is explicitly licensed and required to carry epistemic labels. This converts a failure mode into a productive capability for novel hypothesis generation. *Epistemic: verified (CI design decision); inferred (productive characterization). Source: CI provenance report § Platform 4 Design Decisions. Observed: 2026-03.*

## Axis 4 — Output Scaling Behavior

**`[gemini-chat:web-app-brevity-bias]`** Web-app responses skew toward brevity due to output truncation internalization. AI Studio responses do not carry this bias. The same model produces structurally different output on the two surfaces. *Epistemic: verified. Source: CI provenance report; operational observation. Observed: 2026-03.*

**`[gemini-chat:explanation-strength]`** Strongest at translating complex topics into accessible explanations at advanced register. The "explainer" role on the web app leverages this natural scaling behavior. *Epistemic: verified. Source: CI provenance report; pre-build memo 3. Observed: 2026-03.*

## Axis 5 — Tool-Use Capabilities

**`[gemini-chat:google-search-grounding]`** Native Google Search integration (especially in AI Studio via the grounding toggle). Search results can over-anchor analytical output — the grounding protocol directive counteracts this tendency. *Epistemic: verified. Source: CI provenance report § Platform 4. Observed: 2026-03.*

**`[gemini-chat:google-ecosystem-integration]`** Integration with Google Workspace (Docs, Sheets, Gmail), Maps, and other Google services. Deepest Google-native integration of any surface. *Epistemic: verified. Source: Google AI documentation. Observed: 2026-03.*

## Axis 6 — Inter-Model Handoff Contract

**`[gemini-chat:bifurcated-constellation-role]`** In the Syncrescendence constellation, Gemini is bifurcated: web app operates as the explainer (clarity at advanced register); AI Studio operates as the shape rotator / synthesis engine (cross-disciplinary bridging, novel hypothesis generation, licensed speculation). *Epistemic: verified (constellation assignment). Source: CI provenance report § Conclusion; pre-build memo 3. Observed: 2026-03.*

**`[gemini-chat:cli-modality-separation]`** Gemini CLI is a separate modality from Gemini Chat. Same underlying model family, different steering surface, different operational character. The chat interface is for explanation and synthesis. The CLI is for agentic coding. *Epistemic: verified. Source: pre-build memo 3; LAYER-LAW.md. Observed: 2026-03.*

## Axis 7 — Platform Constraint Surface

**`[gemini-chat:google-safety-constraints]`** Google's safety training and content policies define the outer behavioral boundary. Over-cautious mode can be triggered by front-loading prohibitions. Not user-modifiable. *Epistemic: verified. Source: CI provenance report; Google AI documentation. Observed: 2026-03.*

**`[gemini-chat:bifurcation-as-structural-constraint]`** The two-surface architecture is itself the primary constraint: no single CI architecture works across both surfaces. Power users must maintain two distinct steering configurations. *Epistemic: verified. Source: CI provenance report § Platform 4. Observed: 2026-03.*

---

## Twelve-Check Validation Summary
All twelve checks pass. 23 primitives across 7 axes.

*Production receipt: Reasoning/chat scaffold 3. Primitive count: 23.*
