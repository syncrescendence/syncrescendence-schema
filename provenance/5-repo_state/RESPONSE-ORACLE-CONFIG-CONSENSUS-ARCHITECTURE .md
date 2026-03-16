**1. Config Verdict**  
The ideal successor-shell config architecture is already 80% realized in the live root: a compact constitutional core at root level, functional decomposition across a small set of operator surfaces, native-grain playbooks as the operational doctrine layer, thin committed harness adapters for local state, and explicit projection/render operators for all downstream surfaces (harnesses, chat packets, dotfiles, exocortex).  

Direct observation from the current repo: AGENTS.md already codifies the Five Shell Invariants, root-law file list, federal offices, and harness-differentiation rule; README.md declares the four modal burdens (constitutional/teleological/modal/metabolic) and lists exactly the root surfaces that must carry them; DISSERTATION-CH02 formalizes the layered flow constitution → executive → program → playbooks → operators → exocortex projection; CLAUDE.md and GEMINI.md function as harness veneers that reference the constitution without duplicating it.  

Proposed refinement (not yet enforced): every non-constitutional artifact must be either (a) hand-authored only in its lawful canonical source or (b) rendered by operators/Makefile from those sources. This prevents the drift the predecessor shell suffered and respects the independent harness research (Claude Code, Gemini CLI, OpenClaw, Aider, etc.) that each surface loads memory/config differently and cannot safely share one monolithic file. Symlinks are rejected: harness loading semantics, browser/chat packet models, and local dotfile state are fundamentally non-portable. The result is executable constitutional truth that projects cleanly without creating second constitutions or personality fanfic.

**2. Canonical File Decomposition**  
AGENTS.md  
- Core purpose: sole constitutional source of truth for the entire successor shell (observed).  
- What belongs: Five Shell Invariants, Root Law (allowed root entries), Federal Offices (Commander/Adjudicator/Ajna/Cartographer/Psyche teleology + burdens), Harness Differentiation Rule, Avatar Registry.  
- What must be removed if present: any operational how-to, stylistic flavor, or harness-specific instructions (none currently present).  
- Displaced material moves to: INTER-OFFICE.md (routing), playbooks/<office>/PLAYBOOK.md (modality), or offices/<office>/README.md (local scratch).  

BOOT.md  
- Core purpose: session-start alignment ritual (observed).  
- What belongs: checklist referencing constitution + live executive/program state + git status.  
- What must be removed: any constitutional claims (none present).  
- Displaced material moves to: AGENTS.md (if any law creeps in).  

WORK-LOOP.md  
- Core purpose: metabolic cycle that turns raw work into durable state (observed).  
- What belongs: orient → objective-lock → execute → emit-receipts → update-state → dispatch → compact → handoff.  
- What must be removed: office-specific or harness-specific variants (none present).  
- Displaced material moves to: playbooks/<surface>/PLAYBOOK.md or validated-patterns/.  

INTER-OFFICE.md  
- Core purpose: default routing doctrine and modality distinctions (observed).  
- What belongs: office modalities, cross-office payload rules, routing by burden not label.  
- What must be removed: any constitutional invariants (none present).  
- Displaced material moves to: AGENTS.md.  

CONTINUOUS-IMPROVEMENT.md  
- Core purpose: compaction and antifragile iteration law (observed).  
- What belongs: directive-close loop, weekly scoring, three improvement destinations (regulation/quality/automation).  
- What must be removed: surface-specific tactics (none present).  
- Displaced material moves to: operators/ or playbooks/.  

CLAUDE.md  
- Core purpose: harness-facing operational veneer for Claude Code (observed).  
- What belongs: default Commander/Adjudicator posture, reference to root operators, lane discipline.  
- What must be removed: any constitutional law (none present; it already defers to AGENTS.md).  
- Displaced material moves to: AGENTS.md or playbooks/commander/.  

GEMINI.md  
- Core purpose: harness-facing operational veneer for Gemini CLI (observed).  
- What belongs: default Cartographer posture, reference to root operators, sensing-before-promotion rule.  
- What must be removed: any constitutional law (none present).  
- Displaced material moves to: AGENTS.md or playbooks/cartographer/.  

README.md  
- Core purpose: shell orientation and root-layout map (observed).  
- What belongs: purpose, modal structure, operating rule, root layout, pedigree recovery, design principle, validation targets.  
- What must be removed: any constitutional claims (none present).  
- Displaced material moves to: AGENTS.md.  

**3. Harness Adapter Strategy**  
- Copied: only immutable constants required by the harness (e.g. .claude/settings.json, skills, commands — observed in .claude/ structure).  
- Rendered: any content that references constitutional truth (CLAUDE.md and .gemini/GEMINI.md are already rendered veneers).  
- Referenced: via explicit "read AGENTS.md first" boilerplate (already present in both CLAUDE.md and GEMINI.md).  

Thin adapter veneers are sufficient for any harness that loads a single instruction file (Claude Code, Gemini CLI). A full committed adapter directory (.claude/, .gemini/) is required only when the harness maintains local state, custom skills, or dotfile conventions that cannot be expressed in a single veneer. Future surfaces (OpenClaw, Opencode, OpenHands, Aider) follow the same test: if they need local runtime state or custom command palettes, create .openclaw/ etc.; otherwise project a single PLAYBOOK.md reference.  

Local interface state (e.g. .claude/ workspace cache) is never promoted to constitutional truth — it remains runtime-only (explicit in AGENTS.md Root Interface Rule). This matches harness research: each tool's memory and config precedence is non-portable; fighting that creates drift.

**4. Office Identity / Behavior Separation Model**  
Constitutional role definitions live only in AGENTS.md (teleology, burden, federal boundaries — observed).  

Office-local INIT / README / playbook material lives in offices/<office>/ and playbooks/<office>/PLAYBOOK.md (observed structure).  

Harness-native operational instructions live in the harness veneer (CLAUDE.md style) or .claude/ adapter.  

Stylistic / avatarized flavor lives exclusively in the office playbook and is explicitly scoped as "native grain for prompting, not law" (Oracle PLAYBOOK.md already does this cleanly).  

This decomposition prevents role richness from polluting behavior because the constitution never contains avatar prose, and operators/Makefile will fail any render that injects flavor text into a CLI harness file. Observed alignment: DISSERTATION-CH02 already separates "office layer" (federal) from "playbook layer" (grain); current CLAUDE.md and GEMINI.md respect the boundary.

**5. Chat-Surface Projection Model**  
Oracle, Vanguard, Vizier, Diviner, Augur, Fabricator, Alchemist, Archivist are not repo-native harnesses; they are packet-relay surfaces.  

What belongs in playbooks: full doctrine and prompting grain (playbooks/oracle/PLAYBOOK.md is the live template — observed).  

What belongs in packet templates: bounded output contract, content-proof requirement, return-path expectation, assessment hook (explicit in Oracle PLAYBOOK.md and WEB-SURFACE-PACKET-STANDARD referenced therein).  

What belongs in relay operators: injection logic, receipt capture, and landing into communications/ (observed in orchestration/relay/ and EXOCORTEX-CONTROL-PLANE-CC91).  

What must never be written as stable local config: any persistent state or policy for chat surfaces; they are ephemeral projection targets only. Every packet must carry the clause "land response into repo lineage for assessment" (Oracle PLAYBOOK.md doctrine). This keeps chat surfaces as hypersensing instruments, never second constitutions.

**6. Dotfile / Obsidian / GitHub / Website / MCP Treatment**  
- Root dotfiles (.gitignore, .gitattributes, .claude/, .gemini/): treated as tracked harness adapters (observed in AGENTS.md Root Interface Rule).  
- .obsidian/: runtime/local interface state only — explicitly non-canonical and never rendered from constitution (observed in README.md).  
- GitHub metadata / workflows: infrastructure config, rendered from operators/ or Makefile targets (not constitutional).  
- Website / edge config / Caddy / Cloudflare: deployment projection generated by operators/webshell/ (observed).  
- MCP server manifests: exocortex control-plane matter (EXOCORTEX-CONTROL-PLANE-CC91).  
- Exocortex connector artifacts: control-plane artifacts (EXOCORTEX-TELEOLOGY-REGISTRY-CC90 and manifest.json — observed).  

None of these are constitutional; all are either adapters, runtime state, or projections downstream of the constitution → operators → projection flow in DISSERTATION-CH02.

**7. Recommended Render-And-Validate Pipeline**  
Canonical sources (hand-authored, never generated):  
- AGENTS.md  
- offices/<office>/README.md and playbooks/<office>/PLAYBOOK.md (core teleology only)  
- BOOT.md, WORK-LOOP.md, INTER-OFFICE.md, CONTINUOUS-IMPROVEMENT.md  
- orchestration/state/EXOCORTEX-*-REGISTRY-*.json (teleology/control-plane)  

Rendered/generated:  
- CLAUDE.md, GEMINI.md, and all future harness veneers  
- .claude/settings.json and equivalent adapter files  
- Chat-surface packet templates  
- GitHub workflows, website config, MCP manifests  
- Ontology projections  

Hand-authored and remain so: playbooks/<surface>/PLAYBOOK.md (doctrine) and offices/ local scratch.  

Validators (extend existing Makefile):  
- make inventory (already present)  
- make check-artifact-law (already present)  
- New: make render-adapters (projects veneers)  
- New: make validate-constitution (scans for forbidden flavor text or duplicated law)  
- New: make exocortex-control-plane-audit (from CC91)  

Mandatory anti-drift tests (run in CI and before every git push):  
- Every harness veneer must contain "read AGENTS.md first" reference.  
- No file outside AGENTS.md may define federal office boundaries.  
- Every chat packet must contain assessment landing clause.  
- Diff check: rendered files must exactly match operator output or test fails.  

This pipeline is already partially live (Makefile + operators/) and directly implements the "law generates config" proof in DISSERTATION-CH03.

**8. Migration Order**  
1. (Immediate) Clean root files per Section 2: move any displaced material, add explicit "this file defers to AGENTS.md" header where missing.  
2. (Day 1) Extend Makefile with render-adapters and validate-constitution targets; wire existing .claude/ and .gemini/ into render.  
3. (Day 2) Create offices/<office>/README.md and playbooks/<office>/PLAYBOOK.md skeletons for remaining offices using oracle/PLAYBOOK.md as template.  
4. (Day 3) Add chat-surface packet operators and relay injection for Oracle/Vizier/etc. using existing orchestration/relay/ scaffold.  
5. (Week 1) Port all future harness adapters (OpenClaw etc.) under the same render rule; add their directories only if local state required.  
6. (Week 2) Implement full CI anti-drift suite; run make check-artifact-law on every root file.  
7. (Ongoing) Every new artifact must land via the render pipeline or be rejected by validators.  

This order is lossless, references only live artifacts, and turns the current shell into the executable constitution required by the Oracle Hypersensing Directive.