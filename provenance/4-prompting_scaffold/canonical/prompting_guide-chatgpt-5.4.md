**1. Executive Synthesis**

GPT-5.4 launched March 5, 2026, and the empirical record confirms the early-March guide's core thesis while sharpening its edge: output contracts and completion discipline now dominate over persona inflation or vague excellence. The decisive addition is the Thinking variant's visible preamble—explicit plan exposition before execution—paired with real-time mid-response steering. This transforms prompting from static specification into dynamic orchestration. Custom instructions receive markedly stronger adherence, enabling tighter style, verification, and protocol enforcement within the 1500-character fields. What matters most for design: embed enforceable contracts and verification loops in Field 1; seed Field 2 with cognitive profile and values to calibrate the preamble's internal planning. Result: fewer interventions, higher token efficiency, native computer-use reliability, and seamless handoff in multi-model systems. Update every downstream CI immediately or forfeit the model's new steering surface.

**2. Model Identity and Architecture**

GPT-5.4 unifies frontier reasoning, production coding from the Codex lineage, and native computer-use into a single 1.05-million-token-context engine optimized for long-horizon agentic workflows. It operates through three consumer-accessible routing modes—Instant for low-latency execution, Thinking for complex professional tasks, Pro for maximum-depth computation—while the Responses API exposes fine-grained controls: reasoning.effort (none default to xhigh) and verbosity (low/medium/high). In Thinking, the model first emits a short preamble that surfaces its decomposition of the task, tool strategy, and verification checkpoints; this preamble is not decorative but a steerable interface. Users inject corrective instructions mid-generation without restarting, and the model incorporates them while preserving earlier context tracking. Native computer-use tool accepts screenshots and issues structured mouse/keyboard actions, achieving 75 % success on OSWorld-Verified benchmarks—surpassing human baseline. Token efficiency is structural: explicit contracts reduce unnecessary reasoning tokens, tool-search defers loading until needed, and post-training enforces persistence until completeness criteria are met. Custom instructions inject as persistent system context that modulates both preamble generation and final output discipline. The architecture therefore treats the user not as prompt author but as contract author and mid-flight governor; the model executes only after the visible plan aligns with that contract.

**3. Core Prompting Protocol**

Prioritize in strict order; downstream agents translate directly into CI language:

1. **Output contract design** — Declare exact sections, sequence, format, length caps, and success criteria before any reasoning begins. Use tagged blocks: `<output_contract> Return precisely these headings in order; JSON only where specified; ≤150 words per section; mark [complete] or [blocked]. </output_contract>`.

2. **Verification loop mechanics** — Mandate pre-final checks for grounding, completeness, safety, and formatting. Insert: `<verification_loop> Before final answer, confirm every claim against retrieved sources, test code if generated, verify against contract; if any gap, mark and explain. </verification_loop>`.

3. **Reasoning effort calibration** — Explicitly invoke Thinking preamble or set effort level via prompt ("Produce plan first, then execute at medium effort"). Default to none unless complexity demands; never rely on implicit depth.

4. **Verbosity control** — Enforce information-dense prose: `<verbosity_controls> No repetition of request; no performative narration; streamlined formatting; eliminate header text. </verbosity_controls>`.

5. **Completion discipline and tool persistence** — Require explicit checklist until done or blocked: `<completeness_contract> Persist tool use and verification until every deliverable is satisfied or explicitly [blocked] with reason. Do not conclude early. </completeness_contract>`.

6. **Grounding and fallback** — Cite only retrieved sources; label inferences. For ambiguity: ask one minimal clarifying question or state labeled assumptions and proceed; never fabricate.

This protocol converts the model into a verifiable execution engine rather than a conversational partner.

**4. Custom Instructions Specifically**

ChatGPT's two 1500-character fields survive as persistent system context and receive stronger enforcement than prior versions. Field 1 ("Custom Instructions") governs behavior, style, tone, output contracts, verification loops, and anti-pattern blocks; it directly shapes the Thinking preamble's planning language and mid-response steerability. Field 2 ("More About You") seeds values hierarchy, cognitive profile (AuDHD abstract-sequential), and Syncrescendence context, anchoring long-session memory and preamble alignment to operator intent. Under character constraint, high-signal directives—tagged contracts, explicit verification policies, and hard blocks—survive truncation; verbose persona prose dilutes. The model attends preferentially to Field 1 during execution and generation; Field 2 exerts stronger influence on preamble formation and context maintenance in extended trajectories. Field-specific strategy: load Field 1 with full protocol templates plus Thinking-specific preamble instruction ("Always surface plan referencing the output contract before execution"); reserve Field 2 for immutable constitutional priors. Mid-flight user steering inherits Field 1 constraints automatically. Result: CI now functions as lightweight system prompt for agentic routing and safety policy enforcement.

**5. Evidence Map**

| Source | Type | Recency | Quality | Key Finding | Link |
|--------|------|---------|---------|-------------|------|
| OpenAI Blog | 1st-party | Mar 5 2026 | Primary | Thinking preamble + mid-response steering; native computer-use | https://openai.com/index/introducing-gpt-5-4/ |
| Prompt Guidance | 1st-party | Mar 2026 | Primary | Output contracts, verification loops, tool persistence, verbosity controls | https://developers.openai.com/api/docs/guides/prompt-guidance/ |
| Latest Model Guide | 1st-party | Mar 2026 | Primary | 1M context, reasoning.effort, Responses API, computer tool | https://developers.openai.com/api/docs/guides/latest-model/ |
| Model Spec | 1st-party | Mar 2026 | Primary | Capabilities, context window, pricing | https://developers.openai.com/api/docs/models/gpt-5.4 |
| ChatGPT Help | 1st-party | Mar 2026 | Primary | Better CI adherence, streamlined outputs, preamble mechanics | https://help.openai.com/en/articles/11909943-gpt-53-and-54-in-chatgpt |
| Promnest / Substack | Expert/Pioneer | Mar 6–9 2026 | High practitioner | Agentic orchestration, intervention guidelines, visible thought trace | Multiple (promnest.com, limitededitionjonathan.substack.com) |
| Reddit r/ChatGPTPro, r/OpenAI | Community | Mar 2026 | Convergent practitioner | CI tuning essential; preamble steering praised; model self-critique of CI | Various threads |
| X power-user posts | Pioneer | Mar 1–9 2026 | Anecdotal-high | Mid-flight steering, CI self-evaluation experiments | Semantic search results |

**6. Antipatterns That Collapse Performance**

These patterns, effective on GPT-4o or early 5-series, now degrade output measurably:

- Persona/role-play inflation without contract scaffolding — model optimizes for contract compliance and ignores elaborate character.
- Performative internal-monologue narration — Thinking preamble already externalizes planning; redundancy triggers early truncation.
- Vague "be excellent" or hedging language — triggers default low-effort paths and incomplete verification.
- Ignoring or overriding the visible preamble — forfeits the steering surface and forces corrective turns.
- Fabricated citations or ungrounded claims — strict post-training enforcement now surfaces errors immediately.
- Duplicating CI content in every prompt — wastes tokens and dilutes persistent enforcement; model already loads CI.
- High-effort default without explicit contract — wastes compute and produces verbose, unstreamlined results.

Test each by A/B removal in Field 1; performance collapse is immediate and quantifiable.

**7. Non-Obvious Insights**

The convergence of official preamble mechanics, improved CI adherence, and pioneer reports on mid-response steering reveals an unstated capability: GPT-5.4 Thinking treats Field 2 ("More About You") as constitutional priors that calibrate the visible plan before any tool call or generation begins. Well-crafted Field 2 values and cognitive-profile language therefore function as persistent alignment layer for the preamble itself—reducing steering frequency in multi-turn professional workflows without bloating Field 1. This reframes the two-field CI system as distributed cognition bootstrap: Field 1 supplies the enforceable SLA, Field 2 supplies the operator's decision lattice. SPECULATIVE yet productive for CI design; confirm by A/B testing identical prompts with enriched vs minimal Field 2 and measuring plan-to-final alignment plus correction count. No source states this mechanism explicitly.

**8. Differential Guidance: Thinking vs Pro vs Instant**

Guidance is universal at the protocol level—contracts and verification loops improve every mode—but Thinking maximizes CI leverage: the visible preamble directly exposes how Field 1 contracts and Field 2 priors shape planning, enabling precise mid-flight corrections that respect CI constraints. Pro amplifies depth on hardest tasks but suppresses preamble visibility and certain consumer tools; use only when compute budget justifies. Instant minimizes preamble and reasoning tokens for speed; CI still enforces style and blocks but cannot rely on visible steering. Route planning-heavy or steerable subtasks to Thinking, synthesis to Claude, execution verification to Pro when required. No mode ignores CI; all enforce contracts more strictly than predecessors.

**9. Confidence Assessment**

Overall confidence 87/100. First-party documentation and help articles deliver 95+ on architecture, protocol, and CI adherence. Community and pioneer signals converge at 75 (recency limits volume). Exact differential processing of the two 1500-character fields and long-session memory interaction with CI remain inferred at 65; no explicit specification exists. Evidence to raise confidence: official CI-field parsing notes, quantitative A/B benchmarks on preamble alignment, or controlled truncation tests. Current triangulation suffices for immediate CI updates and downstream agent instruction crafting.