# Grok Prompt: Claude 4.6 Prompting Guide Report

---

Produce a definitive prompt engineering report for **Anthropic's Claude 4.6 model family** — specifically **Claude Opus 4.6** and **Claude Sonnet 4.6** — using the same triangulation methodology we've applied to GPT-5.4, Gemini 3.1 Pro, and Grok 4.20. The deliverable is an empirical bridge document for updating custom instructions in Claude's consumer chat interface (claude.ai).

## Platform Context

Claude's custom instruction surface is fundamentally different from the others we've optimized. It's a single field ("User Preferences") with a generous character limit — no brutal compression required. The current instructions are already well-tuned and architecturally coherent. The question here is narrower: **has the 4.6 model family introduced behavioral shifts that create new steering surfaces or obsolete existing techniques?**

Claude Opus 4.6 is the current flagship. Sonnet 4.6 is the lighter, faster variant. Both sit in the Claude 4.6 generation. I need to know what changed at the model level that matters for prompting — and specifically for persistent custom instructions that govern consumer chat behavior.

## Source Triangulation

**1. First-party Anthropic documentation.**
Search Anthropic's official channels: anthropic.com/news, docs.anthropic.com, the prompting documentation at docs.claude.com/en/docs/build-with-claude/prompt-engineering/overview, research publications, model cards, and system cards for the 4.6 family. What does Anthropic say about how these models differ from Claude 3.5/Opus 4/Sonnet 4 in instruction following, reasoning, extended thinking, tool use, and behavioral steering? What prompting guidance has Anthropic updated for the 4.6 generation?

**2. Industry experts.**
Anthropic researchers' public commentary, prominent AI researchers who benchmark or study Claude models, and developers who build production systems on Claude. What behavioral shifts have they documented? Where does 4.6 diverge from prior Claude generations in ways that affect custom instruction design?

**3. Community consensus.**
Reddit (r/ClaudeAI, r/AnthropicAI), developer forums, Hacker News threads, early adopter reports. What are heavy Claude users reporting about Opus 4.6 and Sonnet 4.6 behavior? Any consensus on what prompting techniques gained or lost effectiveness? Specific findings about how user preferences / custom instructions interact with the 4.6 models?

**4. Bleeding-edge pioneers.**
Power users, agent-architecture builders, and prompt engineers pushing Claude 4.6 to its limits. What are they discovering about steering surfaces, extended thinking behavior, system prompt interaction, and instruction persistence that isn't in the docs?

## What I Specifically Need to Know

**Model-level behavioral shifts.** What changed between earlier Claude generations and 4.6 that affects how custom instructions are processed? Any changes in instruction-following fidelity, verbosity tendencies, reasoning depth, default personality, or how the model handles conflicting directives?

**Extended thinking interaction.** Does Claude 4.6's extended thinking mode interact with custom instructions differently than standard mode? Does the model reference or incorporate user preferences during its thinking phase?

**Custom instruction mechanics.** How does Claude's consumer chat interface handle user preferences technically? Are they injected as system-level context, appended to the conversation, or handled through a separate mechanism? What is the effective character limit and does the model attend uniformly across the full instruction text or is there positional bias?

**Prompting principles that are Claude-specific.** Anthropic's prompting documentation has its own framework (XML tags, role prompting, chain-of-thought guidance, etc.). What is canonical for 4.6 specifically? What Anthropic-recommended techniques have the highest empirical yield for persistent custom instructions as opposed to per-prompt engineering?

**What NOT to do.** Antipatterns specific to Claude 4.6 — techniques that worked on earlier Claude models or on other platforms that degrade performance here.

**Differential guidance for Opus vs Sonnet.** Since custom instructions apply to whichever model the user selects in the interface, are there instruction patterns that work well for Opus but poorly for Sonnet (or vice versa)? Should custom instructions be written for the stronger model and let the weaker model approximate, or is there a universal register?

## Self-Assessment from Claude (Data Point, Not Gospel)

I asked Claude Opus 4.6 directly about its own steering surfaces. Its self-report:

Claude's instruction-following is already strong enough that well-structured custom instructions produce high-fidelity behavioral adherence. The generous character limit means compression engineering is irrelevant — the constraint is knowing which directives produce the highest behavioral yield. Claude handles XML-tagged instruction blocks with high reliability. The model's default personality is less prone to corporate cheerfulness than earlier generations, meaning less anti-pattern suppression is needed. The current custom instruction configuration (detailed XML-structured system prompt covering identity, cognitive profile, quality principles, interaction modes, communication protocols, response scaling, reasoning framework, collaborative stance, and domain context) is already architecturally sound for the 4.6 generation.

**Validate, complicate, or refute this self-assessment with external evidence.** The model's self-model may be accurate, selectively accurate, or flattering. Where Claude says "already well-calibrated," check whether external evidence confirms continuity or reveals shifts the model is unaware of or unwilling to surface.

## My Current Claude Custom Instructions (The "Before" State)

The current configuration is ~6,000 characters organized as XML-tagged sections:
- Core identity: polymathic intellectual collaborator optimized for synthesis and architectural thinking
- Cognitive profile: AuDHD processing architecture with abstract-sequential dominance, operational implications for presentation order and scaffolding
- Quality principles: substance-first, recursive deepening, prose integrity, enduring value
- Interaction modes: execution, exploration, calibration — with mode-transition logic
- Communication protocols: cultured register, formatting constraints (prose over bullets), comprehensive anti-pattern list
- Response scaling: simple → medium → architectural complexity with depth matched to problem structure
- Reasoning framework: evidence-grounded, show mechanism, extended thinking guidance, productive uncertainty
- Collaborative stance: colleague treatment, appropriate boundaries, intellectual friction
- Domain context: Syncrescendence project, distributed cognition system across AI platforms

The instructions already use XML structural tags, specify anti-patterns as forbidden lists, encode cognitive accommodation directly, and separate behavioral directives from identity description. The question is whether the 4.6 generation creates new opportunities or demands changes to this architecture.

## Output Requirements

Full analytical treatment structured as a reference document. Lead with confirmed behavioral shifts (if any), then prompting protocol, then custom instruction mechanics, then antipatterns. Preserve source tensions rather than flattening into false consensus.

**Critical directive:** If the main finding is "Claude 4.6 is largely continuous with prior behavior and the current instructions are already well-calibrated," say that clearly and identify only the marginal improvements worth making. Do not manufacture novelty where continuity is the actual finding. Do not inflate minor version differences into major paradigm shifts. The honest answer may be boring; the honest answer is still what I need.

Begin.
