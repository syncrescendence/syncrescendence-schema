# SCAFFOLD-REASONING-CHAT-LAYER.md

**Class:** Enduring descriptive scaffold  
**Species:** Layer scaffold  
**Scope:** The reasoning/chat modality class — convergent primitives shared across the four scaffolded surfaces, divergent primitives idiosyncratic to each surface, and synthesis observations emergent from cross-entity comparison. Input surfaces: Claude Chat, ChatGPT, Gemini Chat, Grok. Excludes: coding harnesses (separate modality), SaaS platforms (separate modality), daemon/runtime surfaces, API-only usage, and any prescriptive institutional role assignment.  
**Modality class:** Reasoning / chat surfaces  
**Authority level:** 1-curated  
**Lifecycle:** Active  
**Upstream:** SCAFFOLD-CLAUDE-CHAT.md, SCAFFOLD-CHATGPT.md, SCAFFOLD-GEMINI-CHAT.md, SCAFFOLD-GROK.md; LAYER-LAW.md § 4; SCAFFOLD-GRAMMAR.md § 2.2; METHOD-ENGINE.md § 3.5  
**Downstream:** Future teleological manuals per surface; future cross-cutting scaffolds (trust/auth across modalities); future reasoning/chat specifications  
**Freshness threshold:** High-ρ (FRESH < 7 days, CURRENT < 21 days, AGING < 60 days, STALE ≥ 60 days). Model capabilities evolve with each release; steering-surface mechanics may change on any platform update.  
**Last updated:** 2026-03-13  
**Production method:** Cross-entity synthesis (METHOD-ENGINE.md § 3.5) — third invocation, first on a non-SaaS modality class. Level 1.  
**Evidence base:** 4 accepted reasoning/chat surface scaffolds; CANONICAL-CI-PROVENANCE-REPORT.md (cross-platform parity analysis); PRE-BUILD-MEMO-3-REASONING-SURFACES.md  

---

## Convergent Zone

*Primitives present across three or more of the four scaffolded reasoning/chat surfaces. Identifiers use the modality-class slug `reasoning-chat`. Convergence threshold: 3+/4 (majority of class). Seven-axis decomposition per LAYER-LAW.md § 4.*

---

### Cluster 1 — Context-Window Architecture

**`[reasoning-chat:large-context-window]`** All four surfaces provide large context windows suitable for extended analytical conversations: Claude (200K–1M tokens), ChatGPT (large, undocumented exact count), Gemini (1M tokens), Grok (undocumented, operationally large). Context capacity is a defining characteristic of the class — these are not lightweight chatbots but reasoning engines capable of processing substantial input. Present in 4/4. *Epistemic: verified (capacities documented or operationally confirmed). Sources: all 4 scaffolds (Axis 1). Observed: 2026-03.*

**`[reasoning-chat:session-statelessness-with-partial-persistence]`** All four surfaces are fundamentally stateless between sessions. Each provides partial persistence mechanisms: platform memory (Claude, ChatGPT), custom instructions/preferences that persist (all four), and project/GPT/agent-level behavioral presets (Claude Projects, ChatGPT GPTs, Grok custom agents). The partial persistence is the class's answer to the statelessness problem — it provides behavioral continuity without full conversational memory. Present in 4/4. *Epistemic: verified. Sources: all 4 scaffolds (Axis 1 + Axis 7). Observed: 2026-03.*

**`[reasoning-chat:internal-reasoning-capability]`** Three of four surfaces have documented internal reasoning capabilities that operate before output generation: Claude's extended/adaptive thinking, ChatGPT's Thinking variant (visible planning preamble), and Gemini's Deep Think. Grok's council architecture serves an analogous function (internal multi-agent debate before synthesis) though it is a model-architecture characteristic rather than a toggleable mode. The class has moved beyond single-pass inference to multi-step internal deliberation. Present in 4/4 (all have some form, though implementation varies). *Epistemic: verified. Sources: all 4 scaffolds (Axis 1). Observed: 2026-03.*

---

### Cluster 2 — Steering Surface

**`[reasoning-chat:persistent-custom-instructions]`** All four surfaces provide a mechanism for persistent behavioral steering that applies across sessions: User Preferences (Claude), Custom Instructions dual-field (ChatGPT), snippet-based memory + AI Studio system instructions (Gemini), global instruction field + custom agents (Grok). The CI is the primary mechanism by which a stateless model acquires consistent institutional character. Present in 4/4. *Epistemic: verified. Sources: all 4 scaffolds (Axis 2). Observed: 2026-03.*

**`[reasoning-chat:steering-hierarchy]`** All four surfaces implement a multi-level steering hierarchy where higher levels have greater persistence: platform safety constraints > persistent CIs > project/session-level instructions > in-conversation directives. The hierarchy determines how behavioral conflicts resolve — platform safety always wins; in-conversation directives attenuate over long threads. Present in 4/4. *Epistemic: verified (Claude, Grok hierarchies explicitly documented); inferred (ChatGPT, Gemini hierarchies assembled from operational observation). Sources: all 4 scaffolds (Axis 2). Observed: 2026-03.*

**`[reasoning-chat:context-scoped-presets]`** Three of four surfaces provide per-context behavioral presets layered above the global CI: Claude Projects, ChatGPT GPTs, Grok custom agents. Gemini achieves this through its bifurcated surface (web app vs AI Studio function as distinct context-scoped configurations) rather than through an explicit preset mechanism. The preset primitive allows a single operator to maintain multiple behavioral configurations for different work contexts. Present in 4/4 (functionally, though Gemini's mechanism differs structurally). *Epistemic: verified. Sources: all 4 scaffolds (Axis 2). Observed: 2026-03.*

**`[reasoning-chat:character-budget-constraint]`** Every surface imposes a constraint on the steering surface that shapes CI engineering: ChatGPT's 3000-character dual-field (most severe), Gemini's bifurcated architecture (most structurally complex), Grok's 20,000-character multi-agent system (most generous but requiring decomposition), Claude's generous single-field (least constrained but subject to diminishing returns above ~20K). The constraint surface determines the CI engineering discipline: compression (ChatGPT), decomposition (Grok), quality maximization (Claude), or dual-architecture management (Gemini). Present in 4/4. *Epistemic: verified. Sources: all 4 scaffolds (Axis 2). Observed: 2026-03.*

---

### Cluster 3 — Cognitive Signature and Failure Modes

**`[reasoning-chat:distinctive-cognitive-signature]`** Each surface has a distinctive cognitive strength that persists across steering configurations: Claude's synthesis-under-convergence, ChatGPT's frontier-execution with contract discipline, Gemini's cross-domain pattern recognition, Grok's adversarial synthesis via council. These signatures are model-architecture characteristics, not merely CI-induced behaviors — they persist even under minimal steering. The cognitive signature is the primary reason to select one surface over another for a specific task. Present in 4/4. *Epistemic: verified. Sources: all 4 scaffolds (Axis 3). Observed: 2026-03.*

**`[reasoning-chat:characteristic-failure-modes]`** Every surface has documented failure modes that persist despite CI-level mitigation: Claude's seamless confidence blending and stale-training conviction, ChatGPT's rigid template imposition and tool-persistence deficit, Gemini's internal-dialogue triggering and broad-negative over-indexing, Grok's verbosity hypersensitivity and source inflation. CIs mitigate but do not eliminate these failure modes. Present in 4/4. *Epistemic: verified. Sources: all 4 scaffolds (Axis 3). Observed: 2026-03.*

**`[reasoning-chat:epistemic-labeling-gap]`** All four surfaces, without steering, tend to blend empirical claims, logical inferences, and speculative synthesis in prose that obscures epistemic status. The "epistemic labeling" directive is present in all four canonical CIs and addresses this convergent failure mode. The gap is structural to the class — language models generate fluent prose that naturally obscures epistemic joints. Present in 4/4 (addressed in all four CIs). *Epistemic: verified. Sources: CI provenance report § Cross-Platform Parity; all 4 scaffolds (Axis 3). Observed: 2026-03.*

---

### Cluster 4 — Output Scaling Behavior

**`[reasoning-chat:depth-to-complexity-scaling]`** All four surfaces scale output depth to query complexity when properly steered. Without steering, each defaults differently: Claude to moderate verbosity, ChatGPT to verbose multi-section structures, Gemini web app to brevity (output truncation internalization), Grok variably depending on council engagement. The "response scaling matched to complexity" directive is the single most important behavioral rule across the entire four-surface constellation. Present in 4/4. *Epistemic: verified. Sources: CI provenance report § Cross-Platform Parity; all 4 scaffolds (Axis 4). Observed: 2026-03.*

---

### Cluster 5 — Tool-Use Capabilities

**`[reasoning-chat:web-search-integration]`** All four surfaces provide web search capability: Claude (native web search), ChatGPT (web browsing), Gemini (Google Search grounding), Grok (X/web live search). The integration depth varies — Grok's is the most tightly integrated (real-time X feed); Gemini's requires grounding-protocol directives to prevent over-anchoring; Claude's and ChatGPT's are tool-call based. Present in 4/4. *Epistemic: verified. Sources: all 4 scaffolds (Axis 5). Observed: 2026-03.*

**`[reasoning-chat:file-document-processing]`** All four surfaces accept file uploads and process document content: Claude (file creation + code execution + artifacts), ChatGPT (Code Interpreter + file analysis), Gemini (file upload + Google Workspace integration), Grok (file upload). Capability depth varies — Claude and ChatGPT provide the deepest file-creation capabilities. Present in 4/4. *Epistemic: verified. Sources: all 4 scaffolds (Axis 5). Observed: 2026-03.*

**`[reasoning-chat:image-generation]`** Three of four surfaces provide native image generation: ChatGPT (DALL-E), Grok (Aurora/Flux), Gemini (native generation). Claude does not provide image generation (it generates SVG/HTML visualizations but not raster images). Present in 3/4. *Epistemic: verified. Sources: ChatGPT, Grok, Gemini scaffolds (Axis 5). Observed: 2026-03.*

---

### Cluster 6 — Inter-Model Handoff Contract

**`[reasoning-chat:constellation-role-assignment]`** All four surfaces carry named roles in the Syncrescendence constellation: Claude (Vizier — fiduciary synthesis), ChatGPT (Vanguard — frontier execution), Gemini (bifurcated explainer / shape rotator), Grok (Oracle — adversarial sensing). The constellation assigns each surface a role matched to its cognitive signature. Present in 4/4. *Epistemic: verified (constellation design). Sources: all 4 scaffolds (Axis 6). Observed: 2026-03.*

**`[reasoning-chat:cli-modality-separation]`** Three of four surfaces have a distinct CLI/coding-harness modality: Claude Chat vs Claude Code, Gemini Chat vs Gemini CLI, ChatGPT vs Codex CLI. The chat interface and the coding harness share an underlying model but operate under different steering surfaces with different operational characters. This modality separation is a structural pattern of the class — the same model serves different functions through different surfaces. Grok does not currently have a documented CLI counterpart. Present in 3/4. *Epistemic: verified. Sources: Claude, ChatGPT, Gemini scaffolds (Axis 6). Observed: 2026-03.*

---

### Cluster 7 — Platform Constraint Surface

**`[reasoning-chat:vendor-safety-constraints]`** All four surfaces operate under vendor-imposed safety training and content policies that define the outer behavioral boundary: Anthropic's constitutional AI (Claude), OpenAI's safety policies (ChatGPT), Google's safety training (Gemini), xAI's content policies (Grok). These constraints are not user-modifiable and affect content generation, refusal behavior, and tool use. The constraints vary in restrictiveness across vendors. Present in 4/4. *Epistemic: verified. Sources: all 4 scaffolds (Axis 7). Observed: 2026-03.*

**`[reasoning-chat:subscription-gated-access]`** All four surfaces gate model access and usage limits by subscription tier: Claude (Free/Pro/Team/Enterprise), ChatGPT (Free/Plus/Team/Enterprise), Gemini (Free/Advanced/Business), Grok (X Premium tiers). The subscription tier determines which model versions are accessible, how many messages can be sent, and what tool capabilities are available. Present in 4/4. *Epistemic: verified. Sources: all 4 scaffolds (Axis 7). Observed: 2026-03.*

---

## Divergent Zone

*Per-surface entries identifying each surface's architecturally defining primitives and the structural commitment they represent.*

---

### Claude Chat — The Synthesis Seat

Defining divergent primitives: `[claude-chat:extended-thinking]` (model-level adaptive reasoning, not a prompting technique — unique capability in the class), `[claude-chat:user-preferences-field]` (most generous single-field CI surface — quality maximization rather than compression), `[claude-chat:project-instructions]` (project-scoped behavioral layering with Project Knowledge), `[claude-chat:mcp-connectors]` (MCP integration for external service access within chat), `[claude-chat:synthesis-under-convergence]` (cognitive signature: rendering disparate sources into architecturally coherent output). **Structural commitment:** The fiduciary synthesis seat where disparate inputs converge into constitutional cogency. The generous steering surface and extended thinking capability optimize for depth and precision over speed.

### ChatGPT — The Frontier Executor

Defining divergent primitives: `[chatgpt:dual-field-ci]` (most severe compression constraint — 3000 chars), `[chatgpt:thinking-variant]` (CIs modulate the planning preamble, making the behavioral contract field the highest-leverage surface), `[chatgpt:frontier-execution]` (cognitive signature: SOTA capability with contract-driven discipline, strongest tool orchestration), `[chatgpt:compression-tax]` (structural constraint forcing the most precisely engineered CIs in the constellation), `[chatgpt:native-computer-use]` (broadest native tool suite). **Structural commitment:** The frontier tip of the spear. Maximum capability, maximum compression constraint. Every CI word is a lever because there are only 3000 characters to work with.

### Gemini Chat — The Bifurcated Pattern Engine

Defining divergent primitives: `[gemini-chat:bifurcated-steering]` (two distinct CI architectures required — the defining structural feature), `[gemini-chat:web-app-snippet-architecture]` (lightweight behavior-only nudges, no identity), `[gemini-chat:ai-studio-xml-architecture]` (full constitutional framing with synthesis directives), `[gemini-chat:cross-domain-pattern-recognition]` (cognitive signature: structural homology detection across domains), `[gemini-chat:hallucination-as-channeled-feature]` (speculation licensed and epistemic-labeled rather than suppressed), `[gemini-chat:internal-dialogue-triggering]` (heavy identity prompts cause role performance rather than production). **Structural commitment:** The cross-domain pattern engine that requires split management — one surface for lightweight explanation, another for deep synthesis. The bifurcation is the cost of accessing the model's full capability range.

### Grok — The Adversarial Sensing Engine

Defining divergent primitives: `[grok:council-architecture]` (native four-agent internal council producing adversarially stress-tested synthesis), `[grok:multi-agent-ci-architecture]` (20,000-character multi-block system with named agents amplifying specific council members), `[grok:live-sensing]` (native X/web real-time integration — the primary sensing capability in the constellation), `[grok:verbosity-hypersensitivity]` (oscillation between density and hollow brevity — most consequential behavioral challenge), `[grok:agent-council-amplification]` (Veritas→Harper, Prism→Grok+Lucas, Praxis→Benjamin mapping), `[grok:didactic-vocabulary-habit]` (CI teaches the model its own voice through example). **Structural commitment:** The Socratic sensing engine. The council architecture produces internally adversarial output. Live sensing provides real-time intelligence. The multi-agent CI system allows mission-specialized modulation of the council's internal debate weighting.

---

## Synthesis Zone

*Cross-cutting observations emergent from comparing all four surfaces. Each cites multiple surfaces and states structural insight not derivable from any single scaffold.*

---

**`[reasoning-chat:constraint-surface-determines-ci-engineering-discipline]`** The most fundamental structural insight of this class: the CI engineering discipline is dictated by the platform's constraint surface, not by the model's capability. ChatGPT's 3000-character budget demands compression engineering where every word functions as a lever. Claude's generous field demands quality-maximization engineering where every directive earns its place through behavioral yield. Grok's multi-agent architecture demands decomposition engineering where the universal contract separates cleanly from mission-specific amplifications. Gemini's bifurcation demands dual-architecture engineering where two distinct configurations serve different modalities of the same model. The same six universal behavioral principles (response scaling, epistemic labeling, active voice, anti-patterns, collaborative pushback, cognitive accommodation) express differently under each constraint surface. *Epistemic: inferred. Sources: all 4 scaffolds (Axis 2 compared); CI provenance report § Cross-Platform Parity, § Meta-Principles. Observed: 2026-03.*

**`[reasoning-chat:cognitive-signature-is-model-architecture-not-steering]`** The cognitive signatures — Claude's convergent synthesis, ChatGPT's frontier execution, Gemini's cross-domain pattern recognition, Grok's adversarial council synthesis — persist across steering configurations and are not substantially modifiable by CI engineering. CIs can amplify or constrain a cognitive signature but cannot fundamentally alter it. This means surface selection is primarily a cognitive-signature matching problem: the task's requirements should determine which model's native cognitive character is best suited, and the CI refines the behavior within that character. Attempting to steer Claude toward Grok-style adversarial sensing, or Grok toward Claude-style publication-grade synthesis, produces inferior results compared to using the natively suited surface. *Epistemic: inferred. Sources: all 4 scaffolds (Axis 3 compared); CI provenance report § Meta-Principles. Observed: 2026-03.*

**`[reasoning-chat:failure-modes-persist-despite-mitigation]`** Every surface's characteristic failure modes survive CI-level mitigation. Claude still occasionally blends epistemic status despite the labeling directive. ChatGPT still imposes templates despite scaling directives. Gemini still triggers internal dialogue despite behavior-only steering. Grok still oscillates in verbosity despite the inline self-check. CIs reduce frequency and severity but do not eliminate the failure modes. This means operational resilience requires knowing which failure modes to expect from which surface and designing handoff contracts that route around them — not assuming CIs have solved them. *Epistemic: inferred. Sources: all 4 scaffolds (Axis 3 compared); operational experience. Observed: 2026-03.*

**`[reasoning-chat:six-universal-behavioral-principles]`** Six behavioral principles converge across all four platforms independently through the triangulation methodology: response scaling matched to complexity, epistemic labeling, active affirmative voice, anti-pattern consistency, collaborative pushback stance, and cognitive profile accommodation. Their universality confirms empirical convergence — each emerged independently and proved its worth on multiple platforms. These six principles constitute the behavioral substrate of the reasoning/chat class: any surface in this class benefits from them regardless of its specific cognitive signature. *Epistemic: verified (convergence confirmed across four independent triangulation processes). Sources: CI provenance report § Cross-Platform Parity; all 4 scaffolds. Observed: 2026-03.*

**`[reasoning-chat:cli-chat-modality-duality]`** Three of four surfaces have a distinct CLI counterpart (Claude Code, Codex CLI, Gemini CLI). The same underlying model serves two structurally different modality classes through different steering surfaces. This duality reveals that the model is not the surface — the surface is the combination of model + steering architecture + interaction modality + platform constraints. A "Claude scaffold" must specify which surface it describes (chat or CLI) because the primitives, failure modes, and operational character differ between them. The duality also creates a cross-modality coordination opportunity: insights about model behavior in the CLI modality inform chat steering, and vice versa. *Epistemic: inferred. Sources: Claude, ChatGPT, Gemini scaffolds (Axis 6 compared). Observed: 2026-03.*

**`[reasoning-chat:models-are-unreliable-self-reporters]`** Models are unreliable reporters of their own optimal steering surfaces. GPT-5.4's self-analysis was "selectively accurate." Claude's self-assessment was directionally correct but needed filtering. Grok's council produced reports requiring significant editorial intervention. The triangulation methodology exists precisely because no model can be trusted to accurately describe its own behavioral characteristics. Externally triangulated evidence (first-party docs + experts + community + pioneers) consistently outperforms model self-analysis. *Epistemic: verified. Sources: CI provenance report §§ Platform 1–4, § Meta-Principles. Observed: 2026-03.*

---

## Prescriptive Content Boundary

This scaffold contains no prescriptive, evaluative, or role-assignment content. The constellation role assignments documented in the divergent zone describe the current institutional configuration, not recommendations. Teleological assignments ("use Claude for X, Grok for Y") belong in a reasoning/chat teleological manual, not in this scaffold.

---

## Twelve-Check Validation Summary

| Check | Status | Notes |
|---|---|---|
| 1 — Header compliance | PASS | All required fields present |
| 2 — Axis declaration | PASS | Three-zone structure per layer-scaffold species |
| 3 — Primitive granularity | PASS | Convergent at structural-role level |
| 4 — Primitive identifiers | PASS | Convergent: `[reasoning-chat:*]`; divergent: per-surface `[slug:*]` references; synthesis: `[reasoning-chat:*]` |
| 5 — Epistemic status labeling | PASS | Every primitive and observation labeled |
| 6 — Staleness markers | PASS | All carry observed dates; high-ρ declared |
| 7 — Source attribution | PASS | Per-primitive source attribution |
| 8 — Descriptive purity | PASS | Prescriptive boundary explicit |
| 9 — Cross-reference integrity | PASS | Convergent self-contained; divergent cross-references resolve to surface scaffolds |
| 10 — Species-specific completeness | PASS | All three zones substantive; 4/4 surfaces in divergent zone |
| 11 — Downstream traceability | PASS | All primitives addressable |
| 12 — Scope boundary testability | PASS | 4 named reasoning/chat surfaces = in; CLI modalities = out; SaaS = out |

---

*Production receipt: Third cross-entity synthesis invocation, first on a non-SaaS modality class (reasoning/chat, 7-axis decomposition vs. SaaS 9-axis). Convergent primitives: 18. Synthesis observations: 6. The method has now been exercised on two structurally distinct modality classes with different axis sets, satisfying the Level 1→2 diversity criterion in substance. Level 2 advancement in force requires operator review of this output.*
