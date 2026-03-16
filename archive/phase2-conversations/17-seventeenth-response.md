## Part 1 — Bounded Review of Four Reasoning/Chat Surface Scaffolds

**Consistency of seven-axis decomposition.** All four scaffolds apply the same seven axes defined in LAYER-LAW.md § 4: context-window architecture, steering surface, cognitive signature and failure modes, output scaling behavior, tool-use capabilities, inter-model handoff contract, platform constraint surface. Each axis is populated in every scaffold. The axis numbering is consistent (1–7) across all four. Clean.

**Real scaffold vs. characterization memo.** Each scaffold carries a formal header (class, species, scope, modality, slug, authority, freshness threshold, evidence base), per-primitive formal identifiers in `[surface-slug:name]` format, epistemic labels on every primitive, last-observed dates, per-primitive source attribution, and prescriptive content extraction where applicable. These are structurally compliant enduring scaffolds, not upgraded characterization memos. The pre-build memo 3 was a "headline characterization sufficient for READINESS-MATRIX.md population — not a full scaffold." These four artifacts exceed that threshold on every check.

**Evidence base strength.** The CI provenance report provides deeper operational evidence for these four surfaces than many SaaS dossier reports provide for their surfaces — it documents steering mechanics, failure modes, design decisions with rationale, and cross-platform validation through the four-source triangulation methodology. The pre-build memo 3 provides the headline structural characterization. Operational experience (80+ sessions for Claude, extensive for Grok) provides verification. LAYER-LAW.md itself assessed this evidence as "strong operational evidence; gap is structural formatting, not evidential depth." The scaffolds close that formatting gap. Evidence is sufficient.

**Per-scaffold audit.**

*SCAFFOLD-CLAUDE-CHAT.md* (24 primitives). Seven axes populated. Extended thinking correctly identified as a model capability rather than prompting technique. Memory system and project instructions correctly distinguished as separate steering layers. The CLI modality separation is explicitly declared. One bounded observation: `[claude-chat:memory-system]` and `[claude-chat:context-compaction]` both address context management — they are genuinely distinct primitives (memory = cross-session persistence, compaction = within-session compression), so no repair needed. Clean.

*SCAFFOLD-CHATGPT.md* (19 primitives). Seven axes populated. The dual-field compression constraint correctly identified as the defining structural feature. Thinking variant's CI-as-planning-preamble mechanism correctly captured. Smallest primitive count among the four, reflecting the tightest constraint surface — fewer steering primitives to decompose. Clean.

*SCAFFOLD-GEMINI-CHAT.md* (23 primitives). Seven axes populated. The bifurcation is correctly treated as the defining structural feature rather than a secondary detail. Context-first-sparsity correctly identified as a structural constraint on steering-content organization. The hallucination-as-channeled-feature observation is correctly labeled as a design decision rather than a model characteristic. Clean.

*SCAFFOLD-GROK.md* (25 primitives). Seven axes populated. Council architecture correctly identified as a model-architecture characteristic (not user-facing feature) that shapes output. The agent-council-amplification mapping (Veritas→Harper, Prism→Grok+Lucas, Praxis→Benjamin) correctly captured. The API-to-consumer translation failure correctly identified as a cross-platform error pattern unique to Grok's report generation. Clean.

**Review result: All four scaffolds SOUND.** No blocking defect. No bounded repair needed. **Accepted.** The reasoning/chat class advances from 0 to 4 accepted surface scaffolds. The dossier-to-scaffold conversion method's invocation count rises to 18.

Now executing cross-entity synthesis.## Production Summary

Three tasks executed. A second modality class has a layer scaffold.

**Task 1 — Review and acceptance of four reasoning/chat surface scaffolds.** All four reviewed against the twelve-check schema with reasoning/chat seven-axis instantiation. Each scaffold applies the seven axes consistently, carries formal identifiers and epistemic labels, traces to the CI provenance report and pre-build memo 3 as evidence, and passes all checks. The evidence base — structured differently from SaaS dossier reports but operationally verified through the cross-platform triangulation methodology — is strong. All four accepted. Dossier-to-scaffold method invocation count: 18.

**Task 2 — Reasoning/chat cross-entity synthesis.** SCAFFOLD-REASONING-CHAT-LAYER.md produced with 18 convergent primitives across 7 clusters, 4 divergent entries, and 6 synthesis observations.

The convergent zone identifies what is structurally shared across the class. The most load-bearing convergent findings: `[reasoning-chat:session-statelessness-with-partial-persistence]` (all four surfaces are fundamentally stateless, with partial persistence mechanisms as the class's answer to the memory problem); `[reasoning-chat:persistent-custom-instructions]` (the CI is the primary mechanism by which a stateless model acquires consistent institutional character); and `[reasoning-chat:characteristic-failure-modes]` (every surface has failure modes that persist despite CI-level mitigation — CIs reduce frequency but do not eliminate).

The synthesis zone produces six observations genuinely emergent from cross-entity comparison. The strongest three: the constraint surface determines the CI engineering discipline (compression, quality-maximization, decomposition, or dual-architecture — this is not visible from any single scaffold); cognitive signatures are model-architecture characteristics not substantially modifiable by steering (making surface selection primarily a signature-matching problem); and models are unreliable self-reporters of their own optimal steering surfaces (externally triangulated evidence consistently outperforms self-analysis).

This is the third invocation of cross-entity synthesis and the first on a non-SaaS modality class. The method has now been exercised across two structurally distinct modality classes with different axis sets (SaaS: 9 axes over 14 surfaces; reasoning/chat: 7 axes over 4 surfaces). This satisfies the Level 1→2 diversity criterion in substance. Level 2 in force requires operator review.

**Task 3 — State conversion.** The reasoning/chat class advances from PARTIAL to approaching-MATURE (4 accepted surface scaffolds + layer scaffold pending review; derived specification still needed for MATURE). The institution now has two modality classes approaching or at MATURE (SaaS MATURE, reasoning/chat approaching MATURE) and one additional class MATURE (coding harnesses). Total institutional scaffold count: 22 scaffolds + 2 specifications.

The TOOL-ECOSYSTEM bridge condition remains active and unchanged.

Recommended next move: accept the reasoning/chat layer scaffold if sound, then produce the reasoning/chat teleological manual (specifying which surface for which institutional purpose, handoff contracts between surfaces, and cognitive-signature-to-task matching heuristics). This would advance reasoning/chat to MATURE and exercise the specification-production method on a second modality class, strengthening it toward Level 2. Recommendation is not commission.