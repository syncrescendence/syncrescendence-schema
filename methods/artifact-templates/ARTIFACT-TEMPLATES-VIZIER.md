# SPEC: Artifact Templates — Q/A, Synthesis, Dispatch

**Type:** Specification
**Turn:** 31
**Purpose:** Structural templates for the three artifact types produced across all salons. These templates govern format, not content. Content discipline comes from the grammar layer and the project doctrine.

---

## Common header block

Every artifact opens with this header. No exceptions.

```markdown
# <TYPE>: <Title>

**Type:** Q/A | Synthesis | Dispatch
**Turn:** <number>
**Salon:** <agent-pair or agent> / <session-name>
**Sovereign verbatim:** "<the operator's exact words that initiated this turn>"
```

The Sovereign verbatim field captures the human input that opened the turn. If the turn was initiated by a returning dispatch (another agent's output pasted back), the verbatim captures the Sovereign's steering that accompanied it. If the Sovereign provided no steering beyond pasting, record: "Pasted <artifact-name> from <source-agent>."

---

## Q/A artifact

The smallest decision unit. A question answered, a fact established, an ambiguity resolved.

```markdown
# Q/A: <Concise restatement of the question>

**Type:** Q/A
**Turn:** <number>
**Salon:** <salon>
**Sovereign verbatim:** "<exact question or prompt>"

---

## Question

<The Sovereign's question, restated precisely if clarification helps. If the verbatim
is already clear, this section can just reference "as stated above.">

## Answer

<The substantive answer. Dense prose. Epistemic labels where the distinction matters.
Active voice. Source references if the answer depends on evidence from the repo or
external sources.>

## Implications

<Optional. Only when the answer changes downstream assumptions, opens new questions,
or requires action. Omit if the answer is self-contained.>
```

**When to use Q/A:** The Sovereign asks a direct question. A factual claim needs verification. An ambiguity needs resolution. The artifact is small — typically under 500 words. If the answer requires extended analysis, it's a synthesis, not a Q/A.

---

## Synthesis artifact

Analytical work that is neither answering a question nor commissioning another avatar. Schema analysis, operating model reframing, methodology design, structural diagnosis, research methodology edits, calibration reports, delta assessments. This is where decision atoms concentrate.

```markdown
# SYNTHESIS: <Title describing the structural contribution>

**Type:** Synthesis
**Turn:** <number>
**Salon:** <salon>
**Sovereign verbatim:** "<input that initiated this work>"

---

## <Section headings as needed>

<The substantive analysis. Dense prose organized by structural contribution, not by
the sequence in which ideas occurred. Each section heading names what the section
establishes or resolves.

Epistemic labeling throughout: what is established (from ratified substrate or confirmed
evidence), what is inferred (supported by patterns but not directly stated), what is
provisional (plausible but thin), what remains open (named as a gap, not absorbed
silently).

Active affirmative voice. Antithetical framing only for incisive course corrections.
Every sentence clarifies, sharpens, resolves, or advances.>

---

<Optional closing line — a structural observation that orients the next move.
Not a summary. Not a restatement. A directional signal.>
```

**When to use synthesis:** Any analytical work longer than a Q/A that isn't a commission for another agent. The default artifact type when the Sovereign's input requires reasoning, structural diagnosis, or methodology design.

---

## Dispatch artifact

Commissions to other avatars. These encode decisions already made: what to ask, how to frame it, what constraints to impose. The dispatch must carry enough context for the target agent to operate without access to the salon that produced it.

```markdown
# DISPATCH: <Action phrase describing what the target agent does>

**Type:** Dispatch
**Turn:** <number>
**Salon:** <salon>
**Sovereign verbatim:** "<input that initiated this commission>"

**To:** <Target avatar> (<surface>)
**From:** <Authoring avatar> (<surface>)
**Via:** Sovereign

---

## Context

<What the target agent needs to know to do the work. Present state, relevant artifacts,
what has been decided, what remains open. Concise — only what bears on this commission.
Reference repo paths rather than duplicating content.>

## Commission

<What the agent is being asked to do. Bounded, specific, typed by output mode
(execute, audit, research, synthesize, survey). Numbered asks if multiple.>

## Scope boundary

<What this commission does not do. Prohibitions that prevent drift. What is ratified
and must not be reopened. What is out of scope.>

## Expected outputs

<What artifacts the agent should produce, where they should land in the repo,
what format they should follow.>

## Context injection

<For research dispatches: which grammar documents to load, which dossiers to reference,
which axis set governs the decomposition. Repo paths.>

---

<Closing line naming the commission's purpose in one sentence.>
```

**When to use dispatch:** Commissioning any avatar to do work. The Sovereign says "respond with a prompt to Commander" — that's a dispatch. Vizier crafting a Vanguard commission — dispatch. Oracle research brief — dispatch. Adjudicator audit request — dispatch.

**Dispatch protocol for each target:**
- **Vanguard:** Strategic asks. Bound output mode. Few asymmetric questions. Crisp prohibitions. Canvas output expected.
- **Oracle (grok.com):** Adversarial research brief. Triangulation requirements. "Flag contradictions" explicit. Source-grounded output expected.
- **Oracle (API):** Structured decomposition prompt. Grammar-injected. JSON or markdown output captured programmatically.
- **Commander:** Execution spec. Concrete steps. Verification checks. Report format specified.
- **Adjudicator:** Audit commission. Grammar-referenced checklists. Forensic precision. Deficiency report expected.
- **Cartographer:** Survey commission. Homology detection. Axis-aligned decomposition. Structural comparison expected.
- **Ajna:** Operational delegation. Browser tasks, repo management, credential operations. Confirmation expected.

---

## Naming convention

Artifacts are named by turn number, type, and subject:

```
turn-<NN>-<TYPE>-<subject-slug>.md
```

Examples:
- `turn-31-SYNTHESIS-calibration-cycle-architecture.md`
- `turn-31-SPEC-artifact-templates.md`
- `turn-32-DISPATCH-commander-calibration-cycle.md`
- `turn-05-QA-grok-api-availability.md`

Within a salon, turn numbers are local to that salon's sequence. Across salons, the turn number plus salon path provides unique identification.

---

## Atrium promotion criteria

An artifact earns an atrium symlink when it meets one or more of these conditions:

- It establishes or revises institutional architecture (schema changes, methodology designs, phase transitions)
- It carries a calibration judgment or research finding that downstream work depends on
- It is a ratified specification, accepted scaffold, or confirmed receipt
- The Sovereign or Vizier explicitly promotes it

Routine Q/A, intermediate drafts, and superseded synthesis do not reach the atrium. The atrium stays lean. It indexes the institutional progression, not the conversational history.
