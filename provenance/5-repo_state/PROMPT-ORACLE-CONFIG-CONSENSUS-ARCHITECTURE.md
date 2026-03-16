# Oracle Hypersensing Directive: Unified Config and Harness Architecture

**Priority**: P0  
**Target Platform**: Oracle (Grok Web)  
**Date**: 2026-03-06  
**Reply-To**: Commander + Sovereign  

---

## Stateless Briefing

Assume you know nothing about Syncrescendence.

Syncrescendence is a sovereign multi-agent operating shell that uses multiple AI harnesses and chat surfaces, each with different configuration primitives, memory semantics, tool interfaces, and prompting grain.

The goal is not to force all surfaces into one identical file.
The goal is to centralize the right truths once, then project thin, harness-native adapters and office-specific veneers without creating config drift, behavioral incoherence, or duplicated constitutional matter.

We have already done independent harness research on:

- Claude Code
- Codex
- Gemini CLI
- OpenClaw
- OpenHands
- Aider
- Opencode

That research strongly suggests:

- each harness has its own native grain
- memory and config precedence are harness-specific
- a single source of truth is only useful if it decomposes correctly
- "one big master file" becomes pathological if it mixes constitutional law, runtime process, role identity, and harness-native instructions

## Current Live Shell

Canonical repo:
- `https://github.com/syncrescendence/syncrescendence`

Live root files:

- `AGENTS.md`
- `BOOT.md`
- `CLAUDE.md`
- `GEMINI.md`
- `WORK-LOOP.md`
- `INTER-OFFICE.md`
- `CONTINUOUS-IMPROVEMENT.md`
- `README.md`
- `Makefile`

Tracked harness adapters:

- `.claude/`
- `.gemini/`

Likely future or adjacent adapter/problem surfaces:

- OpenClaw / Ajna / Psyche
- Manus
- Claude Cowork
- Google AI Studio
- NotebookLM
- Opencode
- OpenHands
- Aider
- Obsidian

Current federal office model:

- Commander / Claude Code
- Adjudicator / Codex
- Cartographer / Gemini CLI
- Ajna / OpenClaw MBA
- Psyche / OpenClaw Mac mini

Current chat / external intelligence surfaces:

- Vanguard / ChatGPT
- Vizier / Claude Web
- Diviner / Gemini Web
- Oracle / Grok
- Augur / Perplexity
- Fabricator / Manus
- Alchemist / Google AI Studio
- Archivist / NotebookLM

## What Has Changed Since Earlier Prompting

We are no longer designing around a small early repo with `engine/` and `ARCH-*` files as the main coordination scaffold.

We now have:

- a successor-shell constitution at root
- office federalism
- playbooks per surface
- a communications lane
- exocortex teleology and surface registries
- exocortex connector control-plane artifacts
- ontology projection operators
- a CLI↔web relay prototype for chat surfaces
- a larger exocortex centralized under `syncrescendence@gmail.com`

The config problem is therefore bigger than "how should CLAUDE.md and AGENTS.md relate?"

It is now:

How should constitutional truth, work-loop truth, office identity, harness-specific instructions, dotfiles, chat-surface packets, exocortex adapters, and ontology projection all fit together without drift?

## Required Anchor Files

Read these first:

- `AGENTS.md`
- `BOOT.md`
- `WORK-LOOP.md`
- `INTER-OFFICE.md`
- `CLAUDE.md`
- `GEMINI.md`
- `README.md`
- `playbooks/oracle/PLAYBOOK.md`
- `orchestration/state/impl/DISSERTATION-CH02-INSTITUTIONAL-ARCHITECTURE-v1.md`
- `orchestration/state/impl/DISSERTATION-CH03-BUILT-REALITY-v1.md`
- `orchestration/state/impl/EXOCORTEX-TELEOLOGY-REGISTRY-CC90.md`
- `orchestration/state/impl/EXOCORTEX-CONTROL-PLANE-CC91.md`

Also inspect enough of:

- `.claude/`
- `.gemini/`
- `offices/`
- `playbooks/`
- `operators/`

to understand how the live shell is actually projecting config and role.

## Your Mission

Design the ideal config architecture for the current successor shell.

This is not a "best practices for AGENTS.md" question.
It is a harmonization problem across heterogeneous harnesses and chat surfaces.

You should answer:

1. what truths must remain constitutional and shared
2. what truths should be separated by file/function
3. what should be harness-specific
4. what should be office-specific
5. what should be dotfile adapter state
6. what should be projected/generated rather than manually authored
7. how to prevent role/avatar richness from polluting operational behavior

## Specific Questions To Answer

### 1. Constitutional Decomposition

Given the current root surfaces, tell us what belongs in:

- `AGENTS.md`
- `BOOT.md`
- `WORK-LOOP.md`
- `INTER-OFFICE.md`
- `CONTINUOUS-IMPROVEMENT.md`
- `CLAUDE.md`
- `GEMINI.md`
- `README.md`

For each file:

- core purpose
- what belongs there
- what must be removed from there if present
- what other file should hold that displaced material

### 2. Harness Adapter Strategy

We need a principled strategy for:

- `.claude/`
- `.gemini/`
- future OpenClaw adapter surfaces
- future `opencode`, `openhands`, `aider` adapter surfaces if adopted

Answer:

- which information should be copied vs rendered vs referenced
- when thin adapter veneers are sufficient
- when a harness deserves its own committed adapter directory
- how to keep local interface state from becoming constitutional truth

### 3. Office Identity vs Harness Behavior

One live tension is that each office has:

- teleology
- burden-bearing role
- distinct modality / characterization

But too much role text can pollute or destabilize actual behavior.

Design the right decomposition for:

- constitutional role definitions
- office-local INIT / README / playbook material
- harness-native operational instructions
- stylistic / avatarized flavor

We want high-fidelity identities without turning configs into personality fanfic.

### 4. Chat Surfaces and Packet Projection

Oracle, Augur, Vanguard, Vizier, Diviner, Manus, NotebookLM, and Google AI Studio are not repo-native harnesses in the same way the CLIs are.

How should their config/projection model work?

Specifically:

- what belongs in playbooks
- what belongs in packet templates
- what belongs in relay operators
- what should never be written as if it were stable local config

### 5. Dotfiles, Obsidian, GitHub, Website, and MCP

We also need a coherent answer for adjacent config surfaces:

- root dotfiles
- `.obsidian/`
- GitHub metadata / workflows
- website / edge config / Caddy / Cloudflare-style deployment config
- MCP server manifests
- exocortex connector artifacts

Should these be treated as:

- constitutional config
- infrastructure config
- projections/adapters
- runtime state
- exocortex control-plane matter

### 6. Render and Validation Pipeline

We suspect the right long-term answer is:

- keep high-order truth in a small number of canonical files
- render or derive thinner harness-specific projections
- validate the results with operators

Design that pipeline concretely.

What are the right canonical sources?
What should be rendered?
What should remain hand-authored?
What validators should exist?
What anti-drift tests are mandatory?

## Output Contract

Return exactly these sections:

1. `Config Verdict`
2. `Canonical File Decomposition`
3. `Harness Adapter Architecture`
4. `Office Identity / Behavior Separation Model`
5. `Chat-Surface Projection Model`
6. `Dotfile / Obsidian / GitHub / Website / MCP Treatment`
7. `Recommended Render-And-Validate Pipeline`
8. `Migration Order`

## Content-Proof Requirement

Every major claim should:

- cite the current repo artifact(s) you used
- distinguish direct observation from your proposed architecture
- call out where the harness research aligns or conflicts with the live shell

## Boundary Rule

Do not lazily recommend symlinks or "just use one master file everywhere" unless you explicitly justify it against:

- different harness loading semantics
- different memory semantics
- local dotfile state
- browser/chat surfaces
- future office growth

This answer should be executable as a real config constitution, not generic prompt-engineering advice.
