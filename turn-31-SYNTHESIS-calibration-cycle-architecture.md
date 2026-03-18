# SYNTHESIS: Calibration Cycle Architecture and Agent Interaction Model

**Type:** Synthesis  
**Turn:** 31  
**Sovereign verbatim:** "We dispatch to both. A/B test. I'm not even sure how we would use the API. [...] Reason through everything I just wrote, one up me and contribute more high reasoning to the plan, and begin our explicitly defined interactional dynamic."

---

## I. Grok as two entities

The Sovereign's observation is structurally correct and the implications run deeper than an A/B test. Grok 4.20 on grok.com and Grok 4.1 Fast via API are not the same surface at different price points. They are different cognitive instruments.

Grok 4.20 on grok.com operates inside the full consumer stack: DeepSearch traverses X in real time, Big Brain Mode activates the internal council (Grok, Harper, Benjamin, Lucas), and the SuperGrok custom instructions carry whatever adversarial tuning the Sovereign has accumulated. The model's intelligence advantage comes from training on X's data exhaust — the real-time discourse of practitioners, founders, engineers, and researchers who break news, debate implementations, and share operational findings on the platform before anywhere else. This makes grok.com-Oracle a sensing instrument: it sees what others have discovered, triangulates across sources that other models can't access, and produces adversarial intelligence grounded in practitioner reality. The custom instructions compound this by steering the council toward the project's specific concerns.

Grok 4.1 Fast via API operates outside that stack. It has web search and X search as server-side tools ($2.50-$5/1K calls), but these are keyword-query tools, not the curated traversal that DeepSearch performs. The 2M context window is its primary advantage — the entire grammar layer, the axis set, the twelve-check schema, the epistemic protocol, and the research question fit in a single prompt with room to spare. This makes API-Oracle a decomposition instrument: it processes the grammar-aligned prompt with the full constitutional frame loaded, producing structured evidence packets that are scaffold-ready by construction. What it lacks is the sensing reach — it won't find the practitioner testimonial buried in an X thread from three days ago.

The A/B test therefore measures two genuinely different capabilities against the same target. grok.com-Oracle produces evidence grounded in practitioner reality and live platform intelligence, potentially discovering primitives that no other agent would find because the evidence exists only on X. API-Oracle produces evidence grounded in the grammar layer's decomposition frame, potentially achieving higher structural fidelity because the full constitutional context was in the prompt. The disagreement between them is itself diagnostic: where they agree, the evidence is strong. Where grok.com finds something API-Oracle missed, the sensing advantage is proven. Where API-Oracle produces cleaner decomposition, the context-injection advantage is proven.

This dual-dispatch should become standard methodology for Oracle commissions: grok.com for sensing, API for structured decomposition, disagreement between them as signal.

### The X Articles gap

The Sovereign names a specific intelligence gap: X Articles (long-form, curated, refined expressions) are inaccessible to both Grok versions programmatically. Practitioners who write Articles are producing the highest-fidelity publicly available evidence about tool ecosystems, operational patterns, and architectural decisions — exactly what grammar-aligned research needs. The current workaround (manual transcription) is the right move but doesn't scale. Claude in Chrome scheduled shortcuts could partially automate this: a shortcut that navigates to specific X Article URLs, extracts text, and saves to the repo. This is a Bootstrap B concern — the bridge exists in principle, the configuration is deferred until the research patterns stabilize.

For the calibration cycle specifically: if the Sovereign knows of X Articles about Slack's architecture, API ecosystem, or practitioner usage patterns, manually transcribing and dropping them into `dossiers/saas/` as supplementary evidence before the cycle runs would increase evidence quality. The grammar-aligned prompt can reference them alongside `report-slack.md`.

## II. The salon and atrium architecture

The Sovereign's spatial metaphor is architecturally precise. Each agent interaction is a salon — a bounded conversational space where one agent (or one agent-pair) conducts work across sequential turns. The salon produces artifacts typed by the existing taxonomy (Q/A, synthesis, dispatch). These artifacts live in the salon's directory as the primary record of what happened.

The artifact atrium is the cross-cutting visibility layer. Canonical or progressing synthesis artifacts get symlinked from their salon into a shared directory where any agent entering any salon can see the progression of the whole. The atrium is read-only in the sense that artifacts are never authored there — they're authored in salons and linked to the atrium when they reach a threshold of institutional relevance.

### Directory structure for agent interactions

```
interactions/
├── vizier-sovereign/          # Claude.ai sessions (this conversation and successors)
│   ├── schema-3/              # Current thread
│   │   ├── turn-31-SYNTHESIS-calibration-cycle-architecture.md
│   │   ├── turn-31-SPEC-artifact-templates.md
│   │   └── ...
│   └── schema-4/              # Future threads
├── commander/                 # Claude Code sessions
│   ├── bootstrap-a/
│   │   ├── turn-01-DISPATCH-bootstrap-prompt.md
│   │   ├── turn-02-QA-commander-report.md
│   │   └── ...
│   └── calibration-slack/     # The research cycle's Commander work
├── adjudicator/               # Codex sessions
│   └── calibration-slack/
├── cartographer/              # Gemini CLI sessions
│   └── calibration-slack/
├── oracle-grok-com/           # grok.com sessions (manual relay)
│   └── calibration-slack/
├── oracle-api/                # Grok API sessions (programmatic)
│   └── calibration-slack/
├── vanguard/                  # ChatGPT sessions (manual relay)
│   ├── phase3-strategy/
│   └── research-methodology/
└── ajna/                      # OpenClaw sessions
    └── bootstrap-a/
```

### The atrium

```
atrium/                        # Symlinks only — never author here
├── SYNTHESIS-calibration-cycle-architecture.md -> ../interactions/vizier-sovereign/schema-3/turn-31-...
├── SPEC-artifact-templates.md -> ../interactions/vizier-sovereign/schema-3/turn-31-...
├── CALIBRATION-DELTA-slack.md -> ../research/calibration-slack/CALIBRATION-DELTA.md
└── ...
```

The atrium provides progressive disclosure for any agent entering the system cold. Instead of traversing every salon to understand what happened, the agent reads the atrium's symlinks — a curated view of the institutional progression. Symlinks are added when an artifact reaches institutional significance (accepted synthesis, ratified specification, completed research output). The Sovereign or Vizier decides what reaches the atrium. The atrium never replaces the salon — it indexes it.

### Salon protocol

Within each salon, turns are numbered sequentially. Each turn produces one or more artifacts, each typed (Q/A, synthesis, dispatch) and named by turn number plus type plus subject. The turn structure mirrors what the Sovereign described: the Sovereign's input opens the turn, the agent's artifacts constitute the turn's output, returning dispatches from other agents are part of the same turn.

Web-surface salons (Vizier-Sovereign, Vanguard, Oracle-grok.com) require manual transcription into the repo. CLI-surface salons (Commander, Adjudicator, Cartographer, Oracle-API, Ajna) write directly. The transcription tax exists only for web surfaces — and the calibration cycle's A/B test will reveal exactly how much of that tax is justified by evidence quality differences.

## III. The calibration cycle — revised plan

### Agents and their salons

| Agent | Surface | Dispatch method | Salon directory |
|---|---|---|---|
| **Adjudicator** | Codex CLI | Sovereign opens Codex pointed at repo, pastes forensic prompt | `interactions/adjudicator/calibration-slack/` |
| **Cartographer** | Gemini CLI | Sovereign opens Gemini CLI pointed at repo, pastes homology prompt | `interactions/cartographer/calibration-slack/` |
| **Oracle (grok.com)** | grok.com | Sovereign pastes adversarial prompt into grok.com, transcribes result | `interactions/oracle-grok-com/calibration-slack/` |
| **Oracle (API)** | Grok 4.1 Fast | Commander calls xAI API via bash/script | `interactions/oracle-api/calibration-slack/` |
| **Commander** | Claude Code | Sovereign opens Claude Code pointed at repo | `interactions/commander/calibration-slack/` |

### Revised operation sequence

**Step 0 — Vizier produces the SKILL.md and four prompt variants.** (Next turn's artifact.) The invariant spine plus Adjudicator-forensic, Cartographer-homology, Oracle-adversarial (grok.com), and Oracle-structured (API) variants. These go into `methods/grammar-aligned-research/SKILL.md` and the prompt variants into the same directory.

**Step 1 — Sovereign dispatches Adjudicator, Cartographer, and Oracle-grok.com in parallel.** Three terminals or surfaces, three prompts, simultaneous. Each agent reads from the repo (grammar layer + dossier) and produces their evidence packet.

**Step 2 — Commander dispatches Oracle-API.** Commander calls the xAI API with the structured-decomposition variant. This requires a script — a `curl` call or a small Python script that sends the prompt with grammar-layer context to `api.x.ai/v1/chat/completions` using model `grok-4-1-fast-reasoning`. Commander writes the script, runs it, captures the output. The $19.83 budget is more than sufficient — one research prompt at 2M context is roughly $0.40.

**Step 3 — Evidence packets land.** Adjudicator and Cartographer write directly to `research/calibration-slack/`. Oracle-grok.com's output is transcribed by the Sovereign. Oracle-API's output is captured by Commander. Four evidence packets total.

**Step 4 — Commander produces disagreement map.** Reads all four packets, compares axis-by-axis, classifies disagreement types. Writes `DISAGREEMENT-MAP.md` to `research/calibration-slack/`.

**Step 5 — Commander produces calibration delta.** Applies five-dimension matrix against existing `scaffolds/saas/SCAFFOLD-SLACK.md`. Writes `CALIBRATION-DELTA.md`.

**Step 6 — Commander emits invocation receipt.** Writes `INVOCATION-RECEIPT.md`.

**Step 7 — Commander updates HANDOFF-CURRENT.md and symlinks significant outputs to the atrium.**

### What the A/B test reveals

The Oracle-grok.com vs Oracle-API comparison tells us whether the sensing advantage (X-trained intelligence, DeepSearch, council architecture) produces structurally different evidence than the context-injection advantage (full grammar layer in prompt, structured decomposition). If grok.com finds primitives that API missed, those primitives likely came from practitioner evidence on X. If API produces cleaner axis-aligned decomposition, the grammar-as-context thesis is validated. Both outcomes are useful. The worst outcome — identical results — would suggest the dual-dispatch adds cost without information gain.

The Adjudicator-Cartographer-Oracle triad tells us whether different cognitive signatures produce genuinely divergent decompositions when given the same axes. If they converge tightly, the methodology is robust and one agent might suffice. If they diverge meaningfully, the disagreement extraction protocol earns its keep.

## IV. Why this is the right first move

The calibration cycle accomplishes six things simultaneously:

1. **Pays down the research debt** by producing the first grammar-aligned evidence the institution has ever generated.
2. **Tests the research methodology** by running it against a known baseline (existing Slack scaffold) where the delta is measurable.
3. **Generates the first operational receipts** that Phase 3's Lane B contracts will later formalize.
4. **Proves or disproves the context-injection thesis** — whether the grammar layer can substitute for the lost conversational context from the original Grok research sessions.
5. **Calibrates the fleet** — reveals which agents produce the most useful evidence, which cognitive-signature adaptations matter, and whether the dual-Oracle dispatch is worth the cost.
6. **Produces the first artifacts in the salon/atrium architecture** — testing whether the interaction-documentation model works in practice before we encode it as institutional law.

Everything the institution does next — wider research, fleet calibration, Bootstrap B, the constitutional repo — depends on what this cycle reveals. The cycle is small enough to complete in one session but real enough to generate the operational evidence that everything downstream requires.

---

*The grammar is the lens. The CLI fleet is the instrument array. The repo is the darkroom. The calibration cycle is the first exposure.*
