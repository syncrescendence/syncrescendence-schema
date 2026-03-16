# PRE-BUILD MEMO 3: Reasoning-Surface Micro-Pass

**Purpose:** Headline structural characterization of Claude, ChatGPT, Gemini, and Grok in their consumer chat-interface roles. Sufficient for READINESS-MATRIX.md population — not a full scaffold. Consumed by READINESS-MATRIX.md and LAYER-LAW.md. Archived as pedigree after integration.

**Date:** 2026-03-12

**Sources:** CANONICAL-CI-PROVENANCE-REPORT.md, SYNCRESCENDENCE-STRATEGIC-VISION.md, SYNCRESCENDENCE-OPERATIONAL-TAXONOMY.md, custom_instructions files, prompting guides.

---

## Characterization Axes (headline only)

For each surface: context-window architecture, steering surface, cognitive signature, known failure modes, current avatar/constellation role, and scaffold readiness.

---

## Claude (Opus/Sonnet 4.6) — Vizier Lens

**Context window:** 200K tokens standard. 1M tokens with Opus 4.6 extended context (confirmed shipped Feb 5 2026). Largest usable context in the constellation.

**Steering surface:** User Preferences field in claude.ai. Single XML-structured field, approximately 16,200 characters in the current canonical CI. No hard character limit documented, but operational testing suggests diminishing returns above ~20K characters. Claude Projects provide project-level instructions that layer above User Preferences. Memory system generates from conversation history. [Verified: CI provenance report, March 2026.]

**Cognitive signature:** Synthesis under convergence pressure. Multiple disparate sources arrive and Claude renders them into architecturally coherent output. Strongest at: constitutional synthesis, publication-grade drafting, complex analytical tasks where every sentence bears structural weight, architectural conscience functions. [Verified: operational experience across 80+ sessions, CI provenance report.]

**Known failure modes:** Seamless confidence blending (stating inferred and speculative claims with the same certainty as verified claims). Stale training data stated with full conviction. Summary restatement ("In summary..."). Fabricated citations on synthesis tasks. Over-deference when pushed back on. Verification addressed by "verification bias" directive in current CI. [Verified: CI provenance report, operational observation.]

**Avatar:** Vizier Lens. Fiduciary synthesis seat. Receives disparate inputs from across the constellation, renders into coherent constitutional documents. Also operates as architectural conscience.

**CLI extension:** Claude Code. Covered by ARCHITECTURE.md and harness-taxonomy.md. CLI role is a separate modality from chat role — same underlying model, different steering surface, different operational character.

**Scaffold readiness:** PARTIAL. The CI provenance report provides strong operational evidence about steering mechanics and failure modes. The prompting guide provides model-specific behavioral intelligence. No fixed-axis scaffold exists. The readiness gap is structural formatting, not evidential depth.

---

## ChatGPT (GPT-5.4) — Vanguard Lens

**Context window:** Not publicly documented at exact token count for GPT-5.4. Operationally large (handles extensive conversations without visible degradation). Thinking variant generates a visible planning preamble that custom instructions modulate.

**Steering surface:** Two fields: "Custom Instructions" (1500 chars, behavior/style/tone) and "More About You" (1500 chars, interests/values/preferences). Total: 3000 characters. Most brutal compression challenge in the constellation. The Thinking variant treats CIs as persistent system directives that shape the internal planning preamble — CIs modulate how the model plans, making Field 1 the highest-leverage surface. [Verified: CI provenance report, GPT-5.4 self-analysis.]

**Cognitive signature:** Frontier-capability execution with contract-driven discipline. Consistently at or near SOTA. Exceptionally sharp in tool-heavy agentic execution (spreadsheets, documents, codebases), research synthesis with native computer use, and operating within explicit output contracts. [Verified: strategic vision, CI provenance report.]

**Known failure modes:** Rigid output template imposition when underspecified. Tool persistence issues (stops searching or computing at "good enough"). Performative CoT narration (narrating reasoning that the Thinking variant handles internally). Less precise than Claude at textual nuance; stronger than Claude at tool orchestration. [Verified: CI provenance report, Grok bridge analyses.]

**Avatar:** Vanguard Lens. Tip of the spear. First surface where frontier capability becomes operationally available.

**Scaffold readiness:** PARTIAL. CI provenance report provides steering-surface and failure-mode evidence. Prompting guide provides model-specific behavioral intelligence. No fixed-axis scaffold. Same gap as Claude: structural formatting, not evidential depth.

---

## Gemini (3.1 Pro) — Bifurcated

**Context window:** 1M tokens (Gemini 3.1 Pro). Largest raw context window. Web app truncates output (model internalizes brevity preference). AI Studio does not truncate.

**Steering surface:** Bifurcated. Web app: snippet-based memory system, 1500-character blocks, semi-independent behavioral nudges. AI Studio: virtually unlimited system instruction field. The bifurcation requires two distinct CI architectures optimized for different modalities. [Verified: CI provenance report.]

**Cognitive signature:** Cross-domain pattern recognition, structural homology detection, novel hypothesis generation. Strongest at: translating complex topics into accessible explanations at advanced register (web app), pan-science integration and cross-disciplinary bridging (AI Studio). Hallucination tendency is architecturally channeled: speculation is explicitly licensed and required to carry epistemic labels. [Verified: CI provenance report, strategic vision.]

**Known failure modes:** Temperature must remain at 1.0 (deviation causes looping or degraded logic). Heavy identity prompts trigger internal dialoguing rather than production. Broad negative commands ("Do not hallucinate") cause over-indexing that breaks basic logic. Antithetical framing exceptionally hard to override. Context must be front-loaded with task last. Constraints placed early in prompt get dropped. [Verified: Grok prompting guide, CI provenance report operational findings.]

**Avatar:** Bifurcated. Web app = explainer (clarity at advanced register). AI Studio = shape rotator / synthesis engine (cross-disciplinary bridging, novel hypothesis generation).

**Scaffold readiness:** PARTIAL. Strong evidence from CI provenance report and Grok prompting guide about behavioral mechanics and failure modes. The bifurcation itself is well-documented. No fixed-axis scaffold. Same structural-formatting gap.

---

## Grok (4.20) — Oracle Lens

**Context window:** Not publicly documented at exact token count. Operationally handles extended conversations. Output pressure sensitivity: requires explicit "exhaust your output tokens" directives for comprehensive responses.

**Steering surface:** 4000-character global instruction field plus up to four named agents at 4000 characters each. Total: 20,000 characters across five blocks. Multi-agent architecture where custom agents are modular system-prompt partitions with explicit user activation. Hierarchy: Agent instructions > Global instructions > In-thread directives > Native council dynamics. [Verified: CI provenance report, Grok agent architecture report.]

**Cognitive signature:** Adversarial synthesis via native four-agent council (Grok as captain, Harper for evidence grounding, Benjamin for logical auditing, Lucas for divergent generation). Truth-seeking under citation pressure. Live sensing via X/web integration. [Verified: strategic vision, CI provenance report.]

**Known failure modes:** Verbosity hypersensitivity (oscillates between Melvillean density and hollow brevity). API-level recommendations transplanted into consumer CI contexts (most common cross-platform error in Grok reports). Output pressure sensitivity (under-delivers without explicit length directives). Source inflation when live-sensing evidence is thin. [Verified: CI provenance report, operational experience across sensing sessions.]

**Avatar:** Oracle Lens. Three custom agents: Veritas (ground truth, amplifies Harper), Prism (incisive discourse, amplifies Grok-captain + Lucas), Praxis (execution scaffolding, amplifies Benjamin).

**Scaffold readiness:** PARTIAL. Strongest evidence base of any reasoning surface due to extensive use as primary sensing engine. CI provenance report covers steering mechanics in depth. Grok prompting guide provides the most detailed model-specific behavioral intelligence in the corpus. No fixed-axis scaffold. Same structural-formatting gap.

---

## Cross-Surface Summary for Readiness Matrix

| Surface | Context | Steering Budget | Cognitive Niche | Evidence Depth | Scaffold Exists | Gap |
|---|---|---|---|---|---|---|
| Claude 4.6 | 200K–1M | ~16K chars | Convergent synthesis | Strong | No | Structural formatting |
| GPT-5.4 | Large (undoc) | 3K chars | Frontier execution | Strong | No | Structural formatting |
| Gemini 3.1 | 1M | Bifurcated | Cross-domain pattern | Strong | No | Structural formatting |
| Grok 4.20 | Undocumented | 20K chars (5 blocks) | Adversarial sensing | Strongest | No | Structural formatting |

**Common gap:** All four surfaces have strong operational evidence from the CI provenance report, prompting guides, and operational experience. None have a fixed-axis scaffold in the enduring-descriptive-scaffold format. The evidence is present in the corpus but distributed across multiple dossier-class documents. Converting to scaffold grade requires: defining fixed decomposition axes for the reasoning-surface modality class, extracting content from existing dossiers along those axes, and normalizing to the scaffold micro-grammar. This is primarily editorial work, not new external research.

---

## What This Changes in the Grammar Build

**For READINESS-MATRIX.md:** The Tier 4 reasoning-surface modality class should be populated with these four entries at PARTIAL scaffold readiness, with the specific gap identified (structural formatting, not evidential depth).

**For LAYER-LAW.md:** The reasoning-surface modality class is a distinct class within Tier 4, not the same class as coding harnesses or SaaS platforms. Its decomposition axes differ: context-window architecture, steering surface, cognitive signature, failure modes, and avatarization are the structurally significant dimensions — not the primitive object model, data sovereignty, or manipulation surface axes that govern SaaS platforms.

**For METHOD-ENGINE.md:** The research-packet grammar should include a reasoning-surface variant with axes tuned to this modality class (context architecture, steering mechanics, behavioral response to instruction patterns, failure modes under operational load, output scaling characteristics).
