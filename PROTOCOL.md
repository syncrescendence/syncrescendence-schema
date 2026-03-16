# Syncrescendence — Inter-Agent Protocol (Bootstrap A)

This protocol governs the working repository during Bootstrap A. It will be revised
at Bootstrap B after the first receipt-bearing research cycle produces operational evidence.

## Roles
- **Sovereign** — Human operator. Merge authority. Final judgment on acceptance and promotion.
- **Vizier** (Claude.ai) — Synthesis, production, commission crafting. Decision advisory.
- **Vanguard** (ChatGPT) — Strategic vision, gap detection, schema design. Decision advisory.
- **Commander** (Claude Code) — Execution, filesystem operations. Execution authority only.
- **Adjudicator** (Codex) — Verification, audit. Execution authority only.
- **Oracle** (Grok) — Adversarial research. Execution authority only.
- **Cartographer** (Gemini CLI) — Survey, mapping. Execution authority only.

Decision authority (what to build, what to accept, what to promote) rests with
Sovereign, advised by Vizier and Vanguard. Execution authority (how to build,
how to validate, how to research) is delegated to the fleet under commission.

## Write discipline (Bootstrap A)
- `grammar/` — Read-only after initial population. Amendments require Sovereign authorization.
- `HANDOFF-CURRENT.md` — Commander updates after Sovereign approval.
- All other directories accept writes from commissioned agents during governed work cycles.

## File lifecycle
draft → review (Sovereign) → accepted. Superseded artifacts move to `archive/pedigree/`
with a `Superseded-by: <successor-path>` header prepended.

## Receipt expectation
Every governed work cycle should emit an invocation receipt recording: what ran,
on whose commission, against what inputs, what it produced, what readiness judgment
resulted, and where outputs landed. Receipt format formalized at Bootstrap B.
