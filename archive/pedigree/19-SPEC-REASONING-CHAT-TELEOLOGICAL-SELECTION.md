# SPEC-REASONING-CHAT-TELEOLOGICAL-SELECTION.md

**Class:** Specification  
**Species:** Teleological manual  
**Scope:** Institutional guidance for deploying reasoning/chat surfaces within the Syncrescendence architecture. Prescribes which surface to use for which task type based on cognitive-signature matching, defines handoff contracts between surfaces, specifies anti-roles and boundary conditions, and provides operational heuristics for CI engineering per surface. Covers: Claude Chat, ChatGPT, Gemini Chat, Grok in their consumer chat-interface roles. Does not prescribe: per-surface CI text (that belongs in the canonical CIs themselves), CLI/coding-harness deployment (separate modality, separate teleological manual), SaaS tool selection (separate specification), or daemon/runtime governance.  
**Authority level:** 0-provisional (second specification-production invocation; advances on operator review)  
**Lifecycle:** Active  
**Upstream:** SCAFFOLD-REASONING-CHAT-LAYER.md (accepted); 4 accepted reasoning/chat surface scaffolds; CANONICAL-CI-PROVENANCE-REPORT.md  
**Downstream:** Per-surface CI revision cycles; cross-modality handoff specifications; operational governance protocols  
**Last updated:** 2026-03-13  
**Production method:** Specification production (DRAFT-METHOD-SPECIFICATION-PRODUCTION.md) — second invocation  
**Evidence base:** SCAFFOLD-REASONING-CHAT-LAYER.md convergent/divergent/synthesis zones; 4 surface scaffold Axis 3 (cognitive signature), Axis 6 (handoff contract), and Axis 7 (platform constraints) entries; CI provenance report cross-platform parity analysis  

---

## 1. The Selection Problem

The reasoning/chat class contains four surfaces with distinctive cognitive signatures that persist across steering configurations (`[reasoning-chat:cognitive-signature-is-model-architecture-not-steering]`). No amount of CI engineering can make Claude behave like Grok's adversarial council or make Grok produce Claude-quality architectural synthesis. Selection is therefore primarily a cognitive-signature-to-task matching problem: route the task to the surface whose native cognitive character is best suited, then refine behavior via CIs within that character.

This manual prescribes: which surface for which task type (§2), handoff contracts between surfaces (§3), anti-roles that define what each surface should not be asked to do (§4), CI engineering heuristics per constraint surface (§5), and failure-mode-aware operational rules (§6).

---

## 2. Cognitive-Signature-to-Task Matching

Each surface has a cognitive signature that makes it structurally superior for specific task types. The following prescriptions derive from `[reasoning-chat:distinctive-cognitive-signature]` and the Axis 3 entries of all four surface scaffolds.

### 2.1 Claude Chat — Deploy for Synthesis and Constitutional Work

**Assign to Claude when the task requires:** convergent synthesis from multiple disparate sources, publication-grade drafting where every sentence bears structural weight, architectural analysis where precision and coherence outweigh speed, constitutional or governance document production, and long-form analytical work benefiting from the 200K–1M token context window and extended thinking.

**Structural justification:** `[claude-chat:synthesis-under-convergence]` is Claude's defining cognitive strength. The generous steering surface (`[claude-chat:user-preferences-field]`) allows precise behavioral calibration without compression. Extended thinking (`[claude-chat:extended-thinking]`) enables multi-step reasoning on complex analytical tasks. Claude Projects (`[claude-chat:project-instructions]`) provide per-context scoping.

**Do not assign to Claude when:** the task requires real-time sensing of current events (route to Grok), the task requires cross-domain speculative hypothesis generation (route to Gemini), or the task requires maximum-capability tool orchestration with minimal steering overhead (route to ChatGPT).

### 2.2 ChatGPT — Deploy for Frontier Execution and Tool-Heavy Work

**Assign to ChatGPT when the task requires:** tool-heavy agentic execution (spreadsheets, documents, codebases), research synthesis with native computer use, operating within explicit output contracts, and any task where maximum frontier capability matters more than specific cognitive character.

**Structural justification:** `[chatgpt:frontier-execution]` with contract-driven discipline makes ChatGPT the strongest tool orchestrator in the class. The Thinking variant's planning preamble (`[chatgpt:thinking-variant]`) treats CIs as output contracts, producing high-fidelity contract compliance. The broadest native tool suite (`[chatgpt:native-computer-use]`) supports complex multi-tool workflows.

**Do not assign to ChatGPT when:** the task requires nuanced prose craft where the distinction between inference and observation matters (route to Claude), the task requires adversarial truth-seeking under citation pressure (route to Grok), or the task requires cross-domain pattern recognition with licensed speculation (route to Gemini).

### 2.3 Gemini Chat — Deploy for Cross-Domain Pattern Recognition and Explanation

**Assign to Gemini when the task requires:** structural homology detection across domains, cross-disciplinary bridging, novel hypothesis generation where productive speculation is valued, translating complex topics into accessible explanations at advanced register, and pan-science integration.

**Structural justification:** `[gemini-chat:cross-domain-pattern-recognition]` leverages Google's training on cross-sector patterns. The AI Studio surface (`[gemini-chat:ai-studio-xml-architecture]`) provides full constitutional framing with synthesis directives. Licensed speculation with epistemic labeling (`[gemini-chat:hallucination-as-channeled-feature]`) channels the model's tendency toward novel synthesis productively.

**Deploy on the correct surface:** Web app for lightweight explanation tasks. AI Studio for deep synthesis requiring full constitutional framing. The bifurcation (`[gemini-chat:bifurcated-steering]`) means deploying Gemini on the wrong surface for the task type produces degraded results.

**Do not assign to Gemini when:** the task requires strict factual accuracy under citation pressure (route to Grok), the task requires publication-grade prose where epistemic precision outweighs speculation (route to Claude), or the task requires tool-heavy document manipulation (route to ChatGPT).

### 2.4 Grok — Deploy for Adversarial Sensing and Triangulated Intelligence

**Assign to Grok when the task requires:** real-time intelligence gathering from X/web, adversarial truth-seeking where internal debate strengthens the output, four-source triangulated research (first-party docs, experts, community, pioneers), ground-truth verification under citation pressure, and sensing current-state information that other models can only access via bolt-on search tools.

**Structural justification:** `[grok:adversarial-synthesis]` via the native council and `[grok:live-sensing]` via X/web integration make Grok the strongest sensing and truth-verification engine. The named agent system (`[grok:multi-agent-ci-architecture]`) allows mission-specialized modulation: Veritas for evidence, Prism for characterization, Praxis for execution scaffolding.

**Match the agent to the task:** Deploy Veritas when the task is evidence-grounding. Deploy Prism when the task is incisive characterization. Deploy Praxis when the task is execution planning. Use the Oracle foundation (no agent) for general intellectual collaboration.

**Do not assign to Grok when:** the task requires publication-grade synthesis where the output IS the deliverable (route to Claude — Grok's intelligence is raw material, Claude's synthesis is the refined product), or the task requires maximum-capability tool orchestration (route to ChatGPT).

---

## 3. Handoff Contracts Between Surfaces

The constellation's power comes from routing tasks to the surface whose cognitive signature is best suited, then handing off outputs to the surface that should process them next. The following handoff contracts derive from `[reasoning-chat:cognitive-signature-is-model-architecture-not-steering]` and the Axis 6 entries of all four scaffolds.

### 3.1 Grok → Claude (Primary Intelligence Pipeline)

**Contract:** Grok produces triangulated intelligence reports. Claude receives, edits, and architecturally renders them into canonical artifacts. Claude's bridge-analysis role catches errors in Grok's output — especially the API-to-consumer translation failures that are Grok's most common cross-platform error (`[grok:api-consumer-translation-failure]`).

**Boundary:** Grok provides evidence-grounded intelligence; Claude provides editorial and architectural rendering. The handoff artifact is a triangulated report. Claude should not treat Grok's reports as paste-ready output — they are input signals requiring architectural rendering.

**Traceability:** `[claude-chat:receives-from-grok]`, `[grok:produces-for-claude]`, CI provenance report § Methodology.

### 3.2 ChatGPT → Claude (Frontier Capability Assessment)

**Contract:** ChatGPT tests frontier capabilities as they become available (new model releases, new tools). Claude receives capability assessments and integrates them into the institutional knowledge architecture.

**Boundary:** ChatGPT assesses what is newly possible; Claude determines what it means for the institution.

**Traceability:** `[chatgpt:vanguard-constellation-role]`, `[claude-chat:vizier-constellation-role]`.

### 3.3 Gemini → Claude (Speculative Synthesis Refinement)

**Contract:** Gemini generates cross-domain hypotheses and novel structural homologies with licensed speculation. Claude receives these as candidate insights and applies epistemic discipline — verifying, refining, or rejecting them against the institutional knowledge base.

**Boundary:** Gemini generates; Claude validates. Gemini's speculative output should never enter the institutional knowledge base without Claude's epistemic-labeling pass.

**Traceability:** `[gemini-chat:cross-domain-pattern-recognition]`, `[gemini-chat:hallucination-as-channeled-feature]`, `[claude-chat:synthesis-under-convergence]`.

### 3.4 Any Surface → Any Surface (General Routing Rule)

**Contract:** When a task's requirements shift mid-conversation from one cognitive signature to another, the operator should route to the appropriate surface rather than forcing the current surface to operate outside its native character. A task that begins as Grok-class sensing (triangulated research) and transitions to Claude-class synthesis (architectural rendering) should be handed off at the transition point.

**Boundary:** The handoff artifact should be explicit — a summary of findings, a structured output, or a file — not an assumption that the receiving surface can infer context from the prior surface's conversation.

**Traceability:** `[reasoning-chat:cognitive-signature-is-model-architecture-not-steering]`.

---

## 4. Anti-Roles and Boundary Conditions

Each surface's anti-roles define what it should not be asked to do, derived from the Axis 6 anti-role entries and the synthesis observation that failure modes persist despite mitigation (`[reasoning-chat:failure-modes-persist-despite-mitigation]`).

| Surface | Do Not Ask It To | Route Instead To |
|---|---|---|
| Claude | Perform real-time sensing; generate adversarial counter-arguments; produce maximum-tool-orchestration output | Grok (sensing); Grok (adversarial); ChatGPT (tool orchestration) |
| ChatGPT | Produce nuanced epistemic-status-aware prose; perform truth-verification under citation pressure | Claude (epistemic prose); Grok (truth verification) |
| Gemini | Produce strictly factual output under citation pressure; serve as the primary knowledge-architecture surface | Grok (factual citation); Claude (architecture) |
| Grok | Produce publication-grade final deliverables; perform deep tool orchestration | Claude (final deliverables); ChatGPT (tool orchestration) |

**Traceability:** All four surface scaffolds, Axis 6 anti-role entries and Axis 3 failure-mode entries.

---

## 5. CI Engineering Heuristics by Constraint Surface

The CI engineering discipline is dictated by the platform's constraint surface, not by the model's capability (`[reasoning-chat:constraint-surface-determines-ci-engineering-discipline]`). The following heuristics prescribe how to engineer CIs for each surface.

**Claude (quality maximization).** The generous single-field surface means every directive has room to breathe. Selection criterion: "what produces the highest behavioral yield?" not "what fits?" XML structure parses well. Patch surgically when the existing CI architecture is sound — do not rewrite what works. Reserve character space for high-yield directives rather than filling the field.

**ChatGPT (compression engineering).** The 3000-character budget means every word is a lever. Field 1 (behavior contract) is the highest-leverage surface because it shapes the Thinking variant's planning preamble. Field 2 (identity scaffold) should remain lean — unused characters earn their keep by absence. Test every directive against "does this produce measurable behavioral change within 1500 characters?"

**Gemini (dual-architecture management).** Two surfaces require two CI architectures. Web app: behavior-only snippets, no identity declarations (identity triggers internal dialoguing). AI Studio: full XML with synthesis directives. Never transplant a web-app snippet into AI Studio or vice versa. Place constraints at the end of instructions, not the beginning (early constraints get dropped). Front-load context, task last.

**Grok (decomposition engineering).** 20,000 characters across five blocks. The global field IS Grok — it carries the complete universal behavioral contract. Named agents inherit the global and add domain-specific amplification. Design agents to amplify specific council members. Use the "does this sentence teach something the previous one did not?" self-check to calibrate verbosity. Strategic vocabulary deployment teaches the model its own voice.

**Traceability:** `[reasoning-chat:constraint-surface-determines-ci-engineering-discipline]`; `[reasoning-chat:character-budget-constraint]`; CI provenance report §§ Platform 1–4.

---

## 6. Failure-Mode-Aware Operational Rules

Failure modes persist despite CI-level mitigation (`[reasoning-chat:failure-modes-persist-despite-mitigation]`). Operational resilience requires knowing which modes to expect and designing around them.

**Rule 1: Verify Claude's epistemic claims.** When Claude produces synthesis that blends observation and inference seamlessly, assume epistemic-status blending has occurred unless labeling is explicit. Request "label each claim as observation, inference, or speculation" for high-stakes analytical outputs.

**Rule 2: Provide ChatGPT with explicit output contracts.** When ChatGPT produces verbose multi-section structures for simple queries, the cause is under-specification. Provide format, length, and structure expectations explicitly. The Thinking variant interprets CIs as output contracts — leverage this.

**Rule 3: Never front-load prohibitions on Gemini.** Broad negative commands break Gemini's logic. Place prohibitions at the end of instructions. Use narrow, specific constraints rather than broad categorical ones. License speculation explicitly — suppressing it degrades output quality.

**Rule 4: Calibrate Grok's output pressure explicitly.** Without explicit thoroughness directives, Grok under-delivers. Include length or depth expectations. When Grok oscillates between density and brevity, the inline self-check ("does this sentence teach something new?") is the calibration tool. Do not trust Grok's self-reports about other models' optimal steering — always bridge-analyze through Claude.

**Rule 5: Use the triangulation methodology for any cross-platform steering decision.** Models are unreliable self-reporters (`[reasoning-chat:models-are-unreliable-self-reporters]`). When updating CIs, triangulate across four sources (first-party docs, experts, community, pioneers) rather than relying on any model's self-analysis.

**Traceability:** `[reasoning-chat:characteristic-failure-modes]`; `[reasoning-chat:failure-modes-persist-despite-mitigation]`; `[reasoning-chat:models-are-unreliable-self-reporters]`; all four surface scaffolds Axis 3.

---

## Validation Summary

| Criterion | Status | Notes |
|---|---|---|
| Upstream traceability | PASS | Every prescription cites layer-scaffold primitives, surface-scaffold entries, or CI provenance report findings |
| Actionability | PASS | Cognitive-signature matching, handoff contracts, anti-role table, CI heuristics, and operational rules are specific enough for operator action |
| Scope boundary | PASS | Reasoning/chat surface deployment only; no CLI, SaaS, daemon/runtime, or CI-text prescription |
| Descriptive-prescriptive boundary | PASS | Does not re-describe scaffold content; derives prescriptions from it |
| Falsifiability | PASS | Every matching heuristic, handoff contract, and operational rule could be wrong and can be tested against operational experience |

---

*Production receipt: Second specification-production invocation under REVIEW governance. Specification type: teleological manual. Upstream: SCAFFOLD-REASONING-CHAT-LAYER.md (accepted) + 4 accepted surface scaffolds. Six sections: cognitive-signature-to-task matching, handoff contracts, anti-roles, CI engineering heuristics, failure-mode-aware operational rules. Every prescription traces to identified scaffold primitives or synthesis observations. Specification-production method now has 2 invocations across 2 modality classes (SaaS + reasoning/chat), satisfying Level 1→2 diversity criterion in substance.*
