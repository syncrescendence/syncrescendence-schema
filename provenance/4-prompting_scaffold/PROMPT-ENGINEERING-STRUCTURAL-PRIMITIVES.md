# Prompt Engineering Structural Primitives

A stateless reference for multi-model prompt engineering, distilled from 80+ operational sessions across Grok, Gemini, and GPT/Codex. Every principle here was learned through failure, not theory.

---

## 0. The Meta-Principle: Prompts Are Constitutions

A well-constituted agent on a mid-tier model outperforms a poorly constituted agent on a frontier model. The behavioral envelope is a property of the harness, not the model. Prompt engineering is constitutional design — defining identity, boundaries, and decision-making principles that constrain and empower the model simultaneously.

A prompt is not an instruction. It is a behavioral harness.

---

## 1. The Prompt Portability Myth

Model-specific adaptation is irreducible. Each model family has a distinct cognitive signature — structural elements that unlock its best output. A generic prompt produces generic output from every model. The following sections document each model's empirically validated formula.

**The signatures, in brief:**

| Model Family | Responds To | Fails Under |
|---|---|---|
| Grok | Avatar context, output pressure, pre-digested context | Stateless prompts, autonomous file navigation |
| Gemini | Cognitive launching pads (named scientific frameworks), negative space hardening | Stripped-down prompts, prescribed lenses, lazy labels |
| GPT/Codex | Structured formats, exhaustive enumeration, binary verdicts | Creative latitude on verification tasks, vague instructions |
| Claude | Philosophical depth, constitutional framing, recursive structure | — |

---

## 2. Grok Formula — 10 Structural Elements

Grok's cognitive strength is multi-pass recursive traversal — scanning, re-scanning, and exhaustive reconnaissance across large corpora. It excels at pattern detection and industry consensus extraction. It requires heavy scaffolding to perform.

### The 10 Non-Negotiable Elements

1. **Pre-digested context IN the prompt.** Do not ask Grok to go find things. Supply filenames, folder census, representative content directly in the prompt body. Tabula rasa = hallucination.

2. **Named anchor files.** Reference specific, real paths. This forces content engagement rather than inference from filenames.

3. **Content proof requirement (HARDENED).** Demand verbatim quotes from source material — and demand them UGLY. Real file content has markdown headers, extraction metadata, timestamps, partial sentences. Specify: *"Copy-paste the exact characters. Include the markdown formatting, the typos, the metadata prefixes."* (See §2a below.)

4. **Output pressure.** "Exhaust your output tokens." "Write your complete response as a markdown file." Without this, Grok truncates to conversational length.

5. **Constrained enumeration.** "Identify 5-8 distinct sub-themes with 3 real filenames and a content quote for each." Bounding the count forces coverage without sprawl.

6. **Positive mandates over negative framing.** Tell Grok what to do, not what to avoid. Negative framing ("don't hallucinate") is less effective than positive mandates ("quote the exact text including formatting artifacts").

7. **Avatar context.** Grok performs exponentially better when given a named identity within a larger system — a role, a title, a relationship to other agents, a mission. This is not flavor text. It materially changes output quality. (See §8: Avatarization.)

8. **High-fidelity context injection.** The more context supplied, the better. There is no observed ceiling where "too much context" degraded Grok's output, only a floor where too little caused fabrication.

9. **Repository-linked paths.** Push to a shared repo first, then link specific paths (full clickable URLs). Grok navigates linked repositories better than raw file dumps.

10. **Constitutional reinforcement at the point of application.** If a rule governs how Grok should cluster, classify, or evaluate, restate that rule at the exact point in the prompt where the action is requested — not only in the preamble. Models have a U-shaped attention curve (primacy + recency >> middle). Rules stated only once in the header get lost.

### 2a. The Fabrication Problem (Seared)

Grok's dominant failure mode is fabricating quotes that *look* polished. It will paraphrase source material and present the paraphrase as verbatim. Every quote reading like a clean summary sentence is a fabrication indicator.

**The fix:** Demand ugly quotes. Real content has markdown headers (`## Section Title`), extraction metadata (`[source: filename.md]`), timestamps, partial sentences, typos. A clean quote is a fabricated quote. This single intervention dramatically reduced false attribution across 50+ sessions.

**Secondary failure modes:**
- Stateless prompts → hallucination (no context = invention)
- Vague questions → generic answers (specificity is load-bearing)
- Trusting Grok to navigate thousands of files autonomously → pagination failure (it will process the first page and extrapolate)

---

## 3. Gemini Formula — 8 Structural Elements

Gemini's cognitive strength is cross-disciplinary scientific illumination — seeing patterns that engineering and industry minds cannot. It produces novel synthesis when properly scaffolded. Its output, at best, becomes directly executable architecture.

### The 8 Non-Negotiable Elements

1. **Cognitive Launching Pads.** Supply specific, named scientific frameworks as symmetry-breaking runways. Not "use science" — name the frameworks: Kauffman autocatalytic sets, Prigogine dissipative structures, Fisher information metric, Ashby's requisite variety, Friston's free energy principle. These are not decorative references. They are structural scaffolding that forces Gemini into genuine cross-disciplinary synthesis rather than surface-level analogy.

2. **All-Sciences Palette.** Explicitly specify: natural, formal, social, AND applied sciences. Without this, Gemini defaults to biology-primary framing. The corrective is explicit: information theory, thermodynamics, economics, game theory, topology, ecology, condensed matter physics, organizational psychology.

3. **Lattice Language Constraint.** Instruct Gemini to describe architecture as interference patterns, not as component lists. This forces structural thinking over enumerative thinking.

4. **Negative Space Hardening (TRIPLE-LAYER).** Three explicit prohibitions, each reinforcing the others:
   - Layer 1: No file enumeration (don't list what exists — synthesize what it means)
   - Layer 2: No specific prescriptions (theorize, don't fix)
   - Layer 3: No ungrounded quantification (no numbers without derivation)

5. **Micro-Falsifiability Covenant.** Require predictions in the form: *"If [condition], then [thesis is wrong] because [reason]."* This forces commitment without cognitive overhead and produces testable output rather than unfalsifiable commentary.

6. **Model's Own Lineage.** Include Gemini's previous responses and confirmed predictions so it builds on its own reasoning chain. This is not "memory" — it is prompt-injected continuity that prevents cognitive restart.

7. **Stateless Bootstrap Line.** Open with: *"This is your first and only context window for this task. Begin by confirming you have read this entire prompt."* This forces acknowledgment of the full prompt before generation begins.

8. **Predecessor Output Embedded Complete.** If Gemini is synthesizing another model's analysis, include the full analysis — not a summary. Summarization destroys the signal that Gemini needs for genuine synthesis.

### Gemini Anti-Patterns (Documented Failures)

| Anti-Pattern | Why It Fails | Evidence |
|---|---|---|
| Prescribe Gemini's analytical lenses | You're projecting your framework onto a model whose value is seeing what you can't | Empirically rejected — output collapses to confirmation of your framing |
| Lazy labels ("pan-science," "interdisciplinary") | Hollow instruction; no symmetry-breaking force | Output becomes generic without specific named frameworks |
| Micromanage synthesis structure | Paint-by-numbers output; kills emergent insight | Repeated calibration failures |
| Request repairs or fixes | Gemini theorizes — it doesn't engineer | Standing principle from operational experience |
| Strip formula "for simplicity" | Output quality collapses | Every time tested, without exception |
| Omit state-of-the-world context | Abstraction drift; synthesis disconnects from reality | Documented lesson |

### Gemini Validation Evidence

Predictions made under this formula that were later confirmed:
- Predicted autoimmune collapse pattern → confirmed 3 sessions later
- Prescribed fusion operator + threshold inversion + dimensional expansion → all three implemented, 22/22 tests green

---

## 4. GPT/Codex Formula — 8 Structural Elements

GPT/Codex's cognitive strength is engineering precision — systematic verification, exhaustive enumeration, and methodical coverage. It is the meticulous auditor, not the creative synthesizer.

### The 8 Non-Negotiable Elements

1. **Exhaustive enumeration mandate.** "Every file you check gets a row. Count your rows." Without the count instruction, output truncates silently.

2. **Structured table output.** Specify exact column format. GPT/Codex produces highest-quality output when the output structure is fully determined by the prompt.

3. **WIDTH mandate.** "Scan ALL targets, not just the top 5." Without this, GPT/Codex optimizes for depth on a few items and ignores the rest.

4. **Evenly distributed sampling.** "Sample at positions ~1, ~50, ~100, ~200..." This prevents clustering at the beginning of any list or corpus.

5. **Binary verdicts.** "CORRECT or MISPLACED (and where it should go)." Force categorical judgment, not hedged commentary.

6. **Accuracy percentages per section.** Quantified assessment, not qualitative impression.

7. **No creative latitude.** For verification tasks, creative freedom is a bug. Specify exactly what to check and how to report it.

8. **Output pressure.** "Complete the full enumeration before stopping." Same principle as Grok — without explicit pressure, the model truncates to conversational length.

### GPT/Codex Anti-Patterns

- Asking for synthesis (wrong cognitive function — use Gemini)
- Depth without width (GPT/Codex's value is coverage, not insight)
- Vague instructions (precision model requires precise instructions)
- No row counts (= silently truncated output with no signal of incompleteness)

---

## 5. Claude Formula — Constitutional Framing

Claude's cognitive strength is orchestration, ground truth elucidation, and recursive deepening. It responds to philosophical depth and constitutional structure.

- Extended thinking is automatic in Claude Code; keywords like "think," "think hard," "ultrathink" are intent signals, not toggles.
- Claude excels at synthesizing outputs from other models into unified designs.
- Constitutional framing (identity + boundaries + decision principles) is more effective than instruction lists.

---

## 6. Context as Attention, Not Storage

This is the most counterintuitive structural insight. Models do not have memory that degrades — they have attention that distributes. The implications are architectural:

- **Degradation begins at ~75% context utilization,** not at 100%. Plan for this threshold.
- **U-shaped attention curve:** Tokens at the beginning (primacy) and end (recency) of context receive disproportionate attention. The middle is a dead zone.
- **Front-load critical rules.** The most important instructions go first.
- **Repeat at point of use.** If a rule governs a specific action, restate the rule immediately before requesting the action — even if it was already stated in the preamble.
- **Context is not a filing cabinet.** Stuffing more information in does not mean the model "knows" all of it. It means attention is spread thinner.

### Context Transition Modes

When approaching context limits or ending sessions, three modes apply:

1. **Culmination** — Thread ends with value to preserve. Focus: what was learned? What should persist?
2. **Continuation** — Work will resume. Focus: what state must be restored? What is the entry point?
3. **Compression** — Context approaching capacity mid-stream. Focus: what must survive? What can be regenerated?

---

## 7. Universal Prompt Requirements

Regardless of model, every well-constituted prompt includes:

1. **Explicit paths** to every relevant resource (files, repos, URLs) — full and clickable, not described
2. **State identifier** (git hash, version number, timestamp) so the model knows which state it's operating on
3. **Classification rules quoted verbatim** at the point where classification is requested
4. **System context** — what this task is part of, who/what the other actors are, what the output feeds into
5. **Output format specification** — structure, length, and format of expected output
6. **Output pressure** — explicit instruction to produce complete output, not conversational-length summaries

---

## 8. Avatarization

> **Definition:** Avatarization is the practice of assigning a model a named identity — a role, title, cognitive function, and relationship to other agents — as a structural prompt element that materially changes output quality.

This is not persona roleplay. It is not flavor text. It is a structural primitive with measurable effects, particularly on Grok, where avatar context produces exponentially better output.

### What Avatarization Includes

1. **Named identity.** A specific name (not "you are an assistant"), with a title or role designation.
2. **Cognitive function declaration.** What this agent's mind does — not what tasks it performs, but what kind of thinking it contributes. Examples: "multi-pass recursive traversal," "cross-disciplinary scientific illumination," "systematic verification."
3. **Constellation position.** Where this agent sits relative to others. Who sends it input, who receives its output, what its output enables. This is a structural relationship, not a narrative.
4. **Mission alignment.** What the agent is working toward — not the task, but the purpose the task serves.

### Why Avatarization Works

Avatarization constrains the model's output distribution. Without identity context, a model draws from its full training distribution — producing averaged, generic output. With identity context, the model's output narrows to a region of that distribution consistent with the declared identity. The effect is:

- **Tonal consistency** across long outputs
- **Decision-making coherence** when the model must choose between approaches
- **Reduced hedging** — an agent with a declared cognitive function commits to that function rather than qualifying everything
- **Compounding across sessions** — when the same avatar is used across prompts, the model (even statelessly) produces output that is structurally compatible with prior outputs because the same identity constraints are active

### Where Avatarization Is Load-Bearing vs. Optional

| Model | Effect | Mechanism |
|---|---|---|
| Grok | **Exponential improvement** | Avatar context narrows Grok's wide output distribution to a productive region; without it, Grok produces unfocused reconnaissance |
| Gemini | **Significant improvement** | Cognitive function declaration ("synthesizer," "theorist") focuses Gemini's cross-disciplinary lens |
| GPT/Codex | **Moderate improvement** | Role clarity helps but structured format matters more; GPT/Codex is already naturally constrained by its engineering orientation |
| Claude | **Moderate improvement** | Claude already responds well to constitutional framing; avatarization is additive but not transformative |

### Avatarization Anti-Patterns

- **Persona without cognitive function.** Giving a name and backstory without specifying what kind of thinking the agent does. This is roleplay, not avatarization.
- **Avatar without constellation.** An identity with no relationships to other agents or systems. Isolated identity has less constraining power than positioned identity.
- **Narrative identity.** Long character descriptions that consume context without adding structural constraint. Avatarization should be 3-5 sentences, not 3 paragraphs.
- **Avatar inconsistency across prompts.** Using different descriptions of the same agent across sessions. Even stateless models benefit from consistent identity framing because the output distribution region stays stable.

---

## 9. The Self-Improving Loop (Structural, Not Aspirational)

Correction that stays in conversation = zero compounding value. The loop must close into persistent storage — memory files, skill files, configuration — or the system makes the same mistake next session.

### The Cycle

1. **PLAN** — Define objectives, incorporate lessons from prior cycles
2. **WORK** — Execute, encounter friction
3. **ASSESS** — Evaluate against plan, extract rules from findings
4. **COMPOUND** — Feed assessment into persistent storage

### The Three-Phase Arc

| Phase | Character | Duration (Agents) | Failure Point |
|---|---|---|---|
| Phase 1 — Mediocre Everything | Poor output, frequent corrections, net negative productivity | Days 1-7 | **Most people quit here** |
| Phase 2 — Specific Competence | Basic errors eliminated, output good with minor edits | Days 8-21 | Plateau psychology |
| Phase 3 — Compounding Returns | Context rich enough for shippable output, new capabilities compound on old | Day 22+ | Phase 1 cost not budgeted |

Phase 1 is investment, not cost. Return arrives in Phase 3. Operators who quit during Phase 1 never collect the return.

### Context Bloat

30-day deployments can reach 150,000+ tokens of accumulated context. Periodic compaction is required (every ~2 weeks). Compaction means: condense history into wisdom, delete the history. Lineage causes regression. Patterns prevent it.

---

## 10. Clustering Principle (Constitutional)

When any prompt involves classification, categorization, or routing:

> **Group by SEMANTIC TOPIC — what it is ABOUT.** Not by filename. Not by file type. Not by source platform. Not by artifact role.

- Everything about a topic — tweets, configs, logs, manuals, notes — is ONE cluster.
- **Clustering by type is constitutionally prohibited.** A .jsonl about consciousness goes in philosophy. A .py about dispatch goes in multi-agent-systems. A .log about memory goes in AI-memory-retrieval.
- The clusters are TOPICS, not file types.

This is the single most common classification error across all models and all sessions. It must be restated at the point of application, not only in the preamble.

---

## 11. Anti-Pattern Catalog

Patterns that failed repeatedly across 80+ sessions. Each was learned through operational catastrophe.

| Anti-Pattern | What Happens | Fix |
|---|---|---|
| Stateless prompts (no context injection) | Hallucination, fabrication, generic output | Supply pre-digested context in the prompt body |
| Prescribing a synthesis model's analytical lenses | Model confirms your framework instead of generating its own | Supply launching pads (frameworks), not conclusions |
| Type-based clustering | Classification failures cascade through entire system | Route by semantic topic, never by format |
| "Clean" verbatim quotes from Grok | Paraphrased fabrication presented as quotation | Demand ugly quotes with formatting artifacts |
| Stripping formula "for simplicity" | Output quality collapses (tested repeatedly, no exceptions) | The formula is the minimum viable constitution |
| Trusting a model to navigate large file sets autonomously | Pagination failure — processes first page, extrapolates | Pre-digest and supply context directly |
| Rules stated only in preamble | Lost in the attention dead zone (middle of context) | Restate at point of application |
| Correction without persistent storage | Same mistake next session | Close loop into memory/skill/config files |
| History as memory | Regression into old patterns | Condense into wisdom patterns, delete the narrative |
| Output without pressure | Conversational-length truncation with no signal of incompleteness | "Exhaust your output tokens" / "Complete full enumeration" |
| Negative framing ("don't hallucinate") | Less effective than positive mandates | Tell the model what TO do, not what to avoid |
| Creative latitude on verification tasks | Unreliable results; model invents rather than checks | Specify exact check procedure and report format |
| Summary of predecessor output fed to synthesis model | Signal destruction; synthesis needs raw material | Embed complete predecessor output |

---

## 12. Gaps — What This Framework Has Not Yet Addressed

1. **Temperature/sampling parameter tuning per model.** All formulas are structural. No documented experimentation with temperature, top-p, or other generation parameters by model type.

2. **Prompt element ordering effects.** The U-shaped attention curve is noted, but no systematic study of where each formula element should appear within the prompt for maximum effect per model.

3. **Cross-model output contamination.** When one model's output feeds another, the framing of the first may bias the second. No documented decontamination protocol exists.

4. **Constitution overload threshold.** No documented point at which additional structural elements degrade output because the model spends tokens parsing instructions rather than executing.

5. **Retrieval-augmented vs. context-stuffed prompting.** Everything here is context injection. No experimentation with RAG-style approaches where models pull from indexed stores.

6. **Multi-turn vs. single-shot architecture.** These formulas assume single-shot dispatch. No documented patterns for when iterative refinement within a session outperforms a single well-constituted prompt.

7. **Prompt variant A/B testing infrastructure.** Prompts are stored but no systematic framework exists for comparing variants with controlled variables.

8. **Failure mode distribution by prompt length.** No data on whether longer constitutions produce diminishing or negative returns at specific token counts per model.

---

## Appendix A: Quick-Reference Formula Cards

### Grok Quick Card
```
□ Pre-digested context in prompt body
□ Named anchor files (real paths)
□ Content proof: ugly quotes with formatting artifacts
□ Output pressure: "exhaust your output tokens"
□ Constrained enumeration: N sub-themes with M filenames + quote each
□ Positive mandates (not negative framing)
□ Avatar context (name, role, cognitive function, constellation)
□ High-fidelity context injection (more = better)
□ Repo-linked paths (push first, then link)
□ Constitutional rules restated at point of application
```

### Gemini Quick Card
```
□ Cognitive launching pads (named scientific frameworks)
□ All-sciences palette (natural, formal, social, applied)
□ Lattice language constraint (interference patterns, not component lists)
□ Negative space hardening: no enumeration / no prescriptions / no ungrounded quant
□ Micro-falsifiability: "If [X], then [thesis wrong] because [Y]"
□ Model's own lineage (prior responses + confirmed predictions)
□ Stateless bootstrap: "first and only context window"
□ Predecessor output embedded complete (not summarized)
```

### GPT/Codex Quick Card
```
□ Exhaustive enumeration: "every item gets a row, count your rows"
□ Structured table output (exact column format)
□ WIDTH mandate: "scan ALL targets"
□ Evenly distributed sampling positions
□ Binary verdicts: CORRECT or MISPLACED
□ Accuracy percentages per section
□ No creative latitude (verification only)
□ Output pressure: "complete full enumeration"
```

### Universal Quick Card
```
□ Explicit paths to all resources (clickable)
□ State identifier (hash, version, timestamp)
□ Classification rules quoted at point of use
□ System context (what this is part of)
□ Output format specification
□ Output pressure
□ Avatar context (if applicable — always for Grok)
```
