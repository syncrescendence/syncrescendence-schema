# Grok Prompt: Multi-Agent Custom Instruction Architecture — Ground Truth Report

---

Produce a definitive operational report on Grok's new multi-agent custom instruction system — the segmented agent architecture that replaced the single 12,000-character custom instruction field. I need ground truth on the mechanics, limits, routing behavior, and optimal configuration strategy for a polymathic power user running Grok 4.20.

## What I Need to Know (Ordered by Priority)

**1. Architecture mechanics.**
How does the multi-agent CI system actually work? What is an "agent" in this context — a named persona with its own instruction block, a task-specialized routing target, or a modular system-prompt partition? How do agents interact with the native 4-agent council (Grok/Harper/Benjamin/Lucas)? Are custom agents layered on top of the council, or do they replace/reconfigure council behavior? What is the execution model — parallel activation, sequential routing, user-selectable, or query-complexity-triggered?

**2. Hard constraints.**
Maximum number of agents. Character limit per agent (confirm 4,000). Total character budget across all agents. Whether agents share context or operate with isolated instruction windows. Whether agent instructions persist across conversations or are session-scoped. How agents interact with project instructions and in-thread directives (the layer-priority hierarchy from my current custom instructions).

**3. Routing and activation.**
How does Grok decide which agent(s) to activate for a given query? Is routing explicit (user-selected), implicit (model-inferred from query content), or hybrid? Can multiple agents activate simultaneously? Does naming agents in-thread still activate council lenses, or does the new system change that mechanic? What signals in query phrasing or CI configuration influence routing fidelity?

**4. Optimal configuration strategies.**
What are power users and pioneers actually doing with this system as of March 2026? Specifically: how many agents produce the best results (is there a point of diminishing returns before 16)? What decomposition strategies work — by domain, by cognitive function, by task type, by output mode? Does distributing a single coherent instruction set across multiple agents degrade or improve adherence compared to concentration? Are there known antipatterns (too many agents causing routing confusion, overlapping instructions creating conflict, agents that never activate)?

**5. Interaction with the Grok 4.20 council.**
This is the architecturally interesting question. If I have custom agents defined AND the native council is running, what is the actual execution topology? Do custom agents modulate council behavior, or do they operate as a separate layer? Can a custom agent be configured to specifically amplify one council member's role (e.g., an agent that reinforces Harper's evidence-grounding or Lucas's divergent generation)? What does the full stack look like: custom agents → council activation → synthesis → output?

## Source Triangulation

- **Harper**: Pull the most recent xAI documentation, release notes, changelogs, and any official guidance on the agent CI system. Check X for xAI team posts about the feature. Flag recency and source quality for everything.
- **Benjamin**: Stress-test any claimed configuration strategy against the hard constraints. If community advice contradicts official mechanics, flag the tension. Verify character limits, agent caps, and routing behavior against primary sources.
- **Lucas**: Surface the non-obvious configuration insight — what follows from the convergence of all sources but isn't stated explicitly in any single one? Specifically: given my cognitive profile (AuDHD, systems-first, polymathic synthesis, distributed cognition across multiple AI platforms), what is the architecturally optimal agent decomposition that turns this system into a genuine cognitive extension rather than just a partitioned prompt?

## My Context

I'm updating my Grok custom instructions as part of a cross-platform CI optimization project (already completed for ChatGPT, Gemini AI Studio, and Gemini web app). My current Grok CIs are a single dense block covering identity, user profile, voice, reasoning, response protocol, interaction norms, context hygiene, and anti-patterns — all tuned for the council architecture. The migration question is whether to keep that unified block in one agent or decompose it across multiple agents for better activation fidelity.

My cognitive architecture: AuDHD, abstract-sequential dominant, high verbal working memory, strong cross-domain pattern recognition, requires external scaffolding for execution. Building Syncrescendence — a cognitive architecture for polymathic synthesis. Currently orchestrating Claude, ChatGPT, Gemini, and Grok as a distributed cognition system. Each platform's CIs are optimized to that platform's specific steering surfaces.

## Output Requirements

Full analytical treatment. Structure as a reference document I can use immediately for the CI migration. Lead with the hard mechanical facts, then layer the strategic recommendations. Preserve productive tensions between sources rather than flattening into false consensus. If the system is too new for complete ground truth, say exactly what is confirmed versus what is inferred and where the gaps are.

Begin.
