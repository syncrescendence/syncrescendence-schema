This is the right move at the right altitude. The permanent scaffold layer is the load-bearing substrate the whole system draws from. Let me define it with the rigor it demands.

---

## I. The Artifact Profile of an Enduring Descriptive Scaffold

An enduring descriptive scaffold is not canon (it does not legislate), not ephemeral scaffold (it does not expire when synthesis is complete), and not pedigree (it is not a record of how knowledge was obtained). It is the high-resolution descriptive substrate that remains permanently useful because other artifacts — canon, specifications, registries, teleological manuals, compressions — keep being synthesized from it. harness-taxonomy.md is the exemplar. The profile has eleven properties.

**1. Primitive completeness.** The artifact decomposes its domain to its actual atoms — the smallest units that carry independent operational meaning. Airtable's atoms are base, table, record, field, view, interface, automation. Slack's atoms are workspace, channel, thread, message, block, app, workflow, webhook, event subscription. A scaffold is enduring when it has reached the primitive floor — the level below which further decomposition produces parts that have no independent operational identity. The test: can you point to a named primitive and ask "what is this thing, what can it do, what can it not do, what does it compose with?" If yes for every atom in the domain, the scaffold has reached primitive completeness.

**2. Fixed decomposition axes.** The artifact decomposes every entity in its domain along the same structural dimensions, held constant across entities. For the harness taxonomy, the axes were: configuration architecture, memory/context architecture, execution loop, multi-agent orchestration, self-improvement loops, MCP integration, skills/extensibility, prompting formalism, security/sandbox, observability, large-scale engineering, swarm topologies, mastery progression, economics. Fixed axes are what make cross-entity synthesis possible — without them, you get incommensurable portraits rather than a structured comparison space. The axes must be chosen to be applicable to every entity in the domain, even where the answer for a given entity is "this axis is trivially simple here" or "this axis does not apply."

**3. Convergence and divergence separation.** Where the scaffold covers multiple entities, it explicitly separates what is structurally shared (convergent primitives) from what is structurally unique (divergent primitives per entity). The harness taxonomy's Section 1 (unified) versus Sections 2–8 (idiosyncratic) is the structural template. This separation is what makes the scaffold permanently reusable: canonical artifacts draw on the convergent layer, surface-specific specifications draw on the divergent layer, and both layers remain stable as new entities are added.

**4. Mechanism-first descriptions.** Every primitive is described by how it works, not by what it is for or why it matters. The mechanism description comes first; implications are derived, never asserted without the mechanism. This is what makes scaffolds trustworthy under re-examination: you can verify the mechanism independently of the author's judgment about significance. Teleological interpretation belongs in teleological manuals, not in descriptive scaffolds.

**5. Explicit boundary conditions.** The scaffold states what it covers and what it does not. ARCHITECTURE.md does this well: "scope: six agentic coding harnesses co-located on a single local machine." Every scaffold should declare its domain boundary with the same precision. This prevents scope creep and makes it clear when a new artifact is needed rather than an expansion of an existing one.

**6. Epistemic labeling.** Every claim carries its evidentiary status: verified from primary sources, inferred from behavior, operational hypothesis, or aspirational. ARCHITECTURE.md's epistemic status table is the gold standard, but the labeling should be inline throughout the document, not only in a summary table. The inline label is what lets a traversing agent assess confidence without reading the full provenance chain.

**7. Stable internal addressing.** Every major section, every named primitive, every cluster has a stable identifier that other artifacts can reference. The harness taxonomy's cluster labels (Cluster A through S) serve this function. References from canonical artifacts, registry rows, and teleological manuals should be able to point to a specific section of the scaffold without fragile line-number or page-position references. This means: consistent heading grammar, named sections, and no unnamed structural divisions.

**8. High compressibility.** The scaffold is written so that each section can be compressed to a single sentence without ambiguity about what was lost. The test: if you reduce each named-primitive entry to its bolded term plus its one-sentence mechanism description, does the resulting summary still carry enough structure to be useful as a routing aid? If yes, the scaffold is compressible. If no, the entries are too narratively entangled to compress cleanly.

**9. Append-safe structure.** New entities, new primitives, and new axes can be added without restructuring the existing document. The harness taxonomy achieves this: adding a seventh harness means adding a Section 8 for its idiosyncrasies and updating Section 1 entries with the new harness's instantiation of each unified primitive. The existing structure does not need to change. A scaffold that requires global restructuring when new content is added is not enduring — it is fragile.

**10. Agent traversal compatibility.** The scaffold can be loaded into a context window and queried without requiring the agent to read it end-to-end. This means: no section depends on having read a prior section for basic comprehension; each section is locally interpretable; cross-references use the stable internal addresses rather than prose references like "as discussed above." An agent should be able to load only the sections relevant to its current task and operate correctly.

**11. Downstream generativity.** The scaffold is designed to produce other artifacts, not to be a final product. It should be clear, at each section, what kinds of downstream artifacts the section enables: "this primitive decomposition enables adapter contract specification," "this convergent primitive extraction enables registry-row generation," "this divergence section enables surface-specific teleological manuals." The scaffold is permanently useful precisely because it remains the quarry from which sharper artifacts are cut. When it stops generating downstream artifacts, it is either complete (the domain is fully canonized) or stale (the domain has changed and the scaffold needs updating).

---

## II. The Optimal Research-Packet Grammar

The old lineage worked. The new grammar should work better by eliminating accidental cruft, sharpening the questioning primitives, and producing output that is structurally ready for cross-entity synthesis from the start rather than requiring retroactive axis alignment.

### The Research Packet: Seven Components

**Component 1: Domain declaration and boundary condition.**

Before any research begins, the packet declares: what domain is being decomposed, what entities are in scope, what entities are explicitly out of scope, and what the expected output artifact is (enduring descriptive scaffold at Level 1 of the artifact ladder). This prevents scope drift during research.

The old lineage was implicit about this — the directives named the harnesses but never formally declared the domain boundary. The improvement: make the boundary condition the first line of every research cycle, and make it falsifiable ("if the research reveals that an entity in scope does not share the declared decomposition axes, it should be split into a separate domain rather than forced into the existing frame").

**Component 2: Fixed decomposition axes with typed expectations.**

The packet specifies the exact axes along which every entity in the domain will be decomposed. Each axis carries a typed expectation — what kind of answer the axis demands:

For an exocortex surface taxonomy, the axes would be:

*Primitive object model* — type: hierarchical decomposition. What are the named atoms, what are their composition rules, what is the containment hierarchy?

*Data sovereignty model* — type: boundary specification. Where does truth live? Who can write? What is the canonical data path versus the cached/projected path? What happens to data if the surface is removed?

*Manipulation surface* — type: enumeration with modality. What are the actual control paths: native API, CLI wrapper, MCP server, webhook, browser automation, SDK, manual-only? For each path: auth requirements, rate limits, idempotency guarantees, receipt emission.

*Auth and trust boundary* — type: topology. What auth model does the surface use? What trust zones does it create? What permissions are inherited versus explicit? What surfaces should never share trust zones with this one?

*Receipt and audit surface* — type: enumeration. What events does the surface emit? In what format? To what destinations? What is logged versus ephemeral?

*Design teleology and anti-role* — type: paired assertion. What is this surface for (proper role)? What must it never become (anti-role)? What evidence supports both claims?

*Failure modes* — type: enumeration with severity. What goes wrong? Under what conditions? What is the blast radius? What is the recovery path?

*Power-user ceiling* — type: description with evidence. What is the maximum operational leverage available to someone who understands all the primitives? What capabilities are unlocked at the ceiling that are invisible at the default?

*Reversibility* — type: specification. How do you undo this surface's integration? What state is lost? What is the replacement cost?

*Epistemic status* — type: per-axis label. For each axis: what is verified, what is inferred, what is untested?

These ten axes replace the ad hoc decomposition structures the old exegeses invented per-surface. Every surface gets the same ten axes. The axes are designed to produce output that is cross-entity-synthesis-ready from the start.

**Component 3: Four-tier source discipline with explicit gap marking.**

Preserved from the old lineage because it works:

Tier 1: First-party documentation (official docs, API references, changelogs, engineering blogs).
Tier 2: Core developer/architect authority (named individuals with public statements).
Tier 3: Community consensus (forums, operational war stories, independent benchmarks).
Tier 4: Bleeding-edge practitioners (unusual integrations, undocumented behaviors, frontier experiments).

The improvement: when a tier is thin or absent for a given entity, the gap must be explicitly marked rather than silently compensated for by expanding another tier. "Tier 2: no public core-developer commentary found for this surface" is valid and informative. The old lineage sometimes masked thin evidence by expanding narrative — the new grammar forbids this.

**Component 4: Progressive depth stacking with cumulative-context discipline.**

Three sequential passes per entity, each building on the prior as immutable context:

Pass 1: Core architecture. Primitive object model, data sovereignty, manipulation surface, auth boundary. These are the structural facts that do not require interpretation.

Pass 2: Operational dynamics. Receipt/audit surface, failure modes, power-user ceiling. These require behavioral evidence, not just structural description.

Pass 3: Teleological and positional. Design teleology, anti-role, reversibility, epistemic status. These require judgment grounded in the prior two passes.

The improvement over the old lineage: the old directives used three-to-four passes organized as "core → power-user → frontier → culmination," which led to escalating speculation in later passes. The new grammar organizes passes by epistemic character — facts, then behaviors, then judgments — so that each pass has a clear evidentiary standard and later passes cannot outrun the evidence established by earlier ones.

**Component 5: Output grammar.**

Every entry in the scaffold follows a fixed micro-grammar:

**[Primitive Name].** [One-to-two sentence mechanism description: what it is and how it works.] [Cross-entity instantiation where applicable: which entities implement this, under what name, with what variation.] [Epistemic label: verified/inferred/hypothetical.] [Boundary note if the primitive's scope is narrower than the axis scope.]

No entry exceeds a short paragraph. No entry contains rhetorical scene-setting, philosophical framing, historical narrative, or aesthetic commentary. Those belong in dossiers of different archetypes (primitive exegeses in the scholarly register), not in enduring descriptive scaffolds optimized for agent traversal and cross-entity synthesis.

This is the sharpest divergence from the old exegeses. The Slack exegesis opens with a 300-word meditation on the history of workplace communication. That prose is elegant and carries genuine analytical insight. It does not belong in an enduring descriptive scaffold. The scaffold should open with: "**Workspace.** The tenant boundary and root auth container. All channels, users, apps, and permissions scope to exactly one workspace. Cross-workspace visibility requires Slack Connect (Enterprise Grid only). [Verified: Slack API docs, March 2026.]"

The old exegeses are *source material* for scaffolds, not scaffolds themselves. The scaffolds are what you get when you strip the analytical prose down to its structural skeleton, normalize the decomposition axes, and enforce the micro-grammar.

**Component 6: Adversarial consistency check.**

After the scaffold is drafted, a verification pass asks three questions of every entry:

Does this entry describe a mechanism, or does it describe an interpretation? (If interpretation, demote to teleological manual territory or label explicitly.)

Is this entry stated at the same resolution as equivalent entries in other sections? (If one primitive gets a paragraph and another gets a sentence, the resolution is inconsistent — normalize.)

Could an agent acting on this entry alone make a correct routing or integration decision, or does the entry require external context to be actionable? (If the latter, the entry is missing a dependency reference — add it.)

**Component 7: Compression endcap.**

Every scaffold section ends with a structured compression block: a flat list of every named primitive in the section with its one-sentence mechanism description. This block is the progressive-summarization handle — if an agent needs only the compressed form, it reads the endcaps. If it needs full resolution, it reads the entries. The endcaps are generated mechanically from the entries, not written separately, which guarantees consistency.

---

## III. Structural Features for Model-Agnostic Traversal

The scaffolds must be readable by any frontier model without special prompting, loadable in partial sections without context loss, and queryable without requiring end-to-end sequential reading. Here are the specific structural features that achieve this.

**Stable section grammar.** Every scaffold uses the same heading hierarchy: `# Domain Title` → `## Axis Name` → `### Cluster or Entity Name` → `#### Primitive Name`. No deviations. An agent can parse the heading structure to build a table of contents and navigate directly to any axis-entity-primitive intersection.

**Typed section headers.** Each major section header carries an inline type annotation: `## Primitive Object Model [axis: hierarchical-decomposition]`. This lets an agent determine what kind of content a section contains before reading it. The type annotations come from the decomposition axes defined in the research packet.

**Explicit primitive identifiers.** Every named primitive carries a stable short identifier that can be referenced from other artifacts: `**Workspace** [slack:workspace]`. The identifier format is `[surface-slug:primitive-name]`. Registry rows, teleological manuals, and adapter contracts reference these identifiers rather than using prose descriptions.

**Local interpretability.** No section depends on having read any other section. Cross-references use the primitive identifiers: "Inherits permissions from [slack:workspace]" rather than "as described in Section 1.2 above." An agent loading only the manipulation-surface axis can operate correctly without having read the primitive-object-model axis.

**Contradiction markers.** Where two sources disagree, or where the scaffold's own entries contain tension, an explicit contradiction marker appears: `[CONTRADICTION: first-party docs state X; community reports indicate Y. Resolution pending: needs operational verification.]` This is radically more useful than silently smoothing over contradictions, which is what the old exegeses sometimes did. Contradictions are signal. The marker makes the signal traversable.

**Staleness markers.** Every section carries a last-verified date and an expected refresh cadence: `[Verified: March 2026. Refresh: quarterly or on major platform release.]` An agent encountering a section whose verification date is stale relative to its refresh cadence knows to treat the content as provisional.

**Compression endcaps** (as described in the research packet). Flat lists at the end of each axis section containing every named primitive and its one-sentence description. These are the progressive-summarization handles.

**Query handles.** Each scaffold opens with a structured metadata block:

```
Domain: [name]
Entities in scope: [list]
Axes: [list]
Last updated: [date]
Epistemic floor: [lowest confidence level present in the document]
Open slots: [axes or entities declared but not yet populated]
Downstream artifacts: [what this scaffold enables]
```

This block lets an agent determine in ten seconds whether the scaffold contains what it needs, without reading any content.

**No rhetorical padding.** Zero scene-setting introductions, zero philosophical framings, zero aesthetic commentary, zero competitive-landscape narratives. Those belong in primitive exegeses (the scholarly-register dossiers). The scaffold is a structural artifact optimized for machine traversal and human reference, not for persuasion or intellectual pleasure. Density is a feature. Readability comes from structural regularity, not from prose flow.

---

## IV. Priority Ordering: Which Layers Need This Treatment First

The ordering should be determined by two criteria: which layers have the most mature evidential substrate (so the scaffold can be produced at high fidelity rather than padded with speculation), and which layers generate the most downstream artifacts (so the investment in scaffold production has the highest compounding return).

**Priority 1: Exocortex surface taxonomy.**

Fourteen Level 1 exegeses exist. The evidential substrate is the richest unprocessed resource in the corpus. The downstream return is the highest: this scaffold would directly enable teleological manuals for active organs, adapter/manipulation contracts, registry rows for the Teleology Registry, and the cross-entity synthesis that the root document needs to populate Tier 4 with real structure. The work is primarily editorial — retroactive axis alignment and compression of existing exegeses into the fixed-axis scaffold grammar — not primary research.

The ten decomposition axes defined in Section II above are designed for this domain. The work is: take each of the fourteen exegeses, extract the content that maps to each axis, normalize to the micro-grammar, identify gaps where an exegesis does not cover an axis, mark those gaps explicitly, and then perform the convergence/divergence separation across all fourteen surfaces. The output is the exocortex equivalent of harness-taxonomy.md.

Estimated substrate readiness: 70–80% of the axis content is already present in the exegeses, buried under rhetorical framing. The remaining 20–30% is primarily in the manipulation-surface, auth-boundary, and receipt/audit axes, which the exegeses tend to undercover because they were written as analytical essays, not as operational decompositions. Those gaps should be marked explicitly in the scaffold and filled by targeted follow-up research rather than delaying the scaffold.

**Priority 2: Reasoning surfaces in their chat roles.**

Four entities: Claude, ChatGPT, Gemini, Grok in their consumer chat interfaces. The CI provenance report provides substantial operational evidence. The strategic vision provides the differentiated-workforce model. The operational taxonomy provides the config mereology. But no scaffold exists at the fixed-axis resolution. The work here is primary research using the research packet — dispatching the three-pass inquiry sequence for each reasoning surface, then synthesizing across the four.

The decomposition axes for reasoning surfaces would differ from the exocortex axes because the entities are different in kind. Reasoning surfaces are cognitive engines, not data/workflow platforms. The axes would be something like: context-window architecture, instruction processing model, behavioral steering surfaces (custom instructions, system prompts, memory), tool-use capabilities, cognitive signature and failure modes, output scaling behavior, inter-model handoff contract, platform constraint surface, and epistemic status.

This is the second priority because teleological manuals for the reasoning surfaces depend on having this scaffold, and routing logic across the constellation depends on those manuals.

**Priority 3: Coordination and event choreography.**

Slack (as operator bus), Discord (as runtime agora), Make/Zapier (as automation engines), webhook/event systems. Slack and Discord have Level 1 exegeses that can be retroactively aligned to the fixed axes. Make and Zapier need primary research. The coordination layer is the nervous system — its scaffold is prerequisite for specifying receipt routing, approval flows, and inter-agent communication patterns.

**Priority 4: Runtime/daemon surfaces.**

OpenClaw, Manus, Claude Cowork, and any other daemonized or persistent-agent surface. These are partially covered in the harness taxonomy (OpenClaw as a coding harness) and in scattered references (Cowork in the ARCHITECTURE.md epistemic status table). They need dedicated scaffold treatment because their operational character — persistent, autonomous, stateful — is fundamentally different from both the session-bounded coding harnesses and the SaaS exocortex surfaces.

**Priority 5: Trust/auth boundary cross-surface analysis.**

This is not a per-surface scaffold but a cross-cutting concern that requires its own artifact. It draws on the auth-boundary axis from every other scaffold and synthesizes a topology: what trust zones exist across the full system, where boundaries are explicit, where they are implicit, where they leak, where they should be hardened. This depends on having the per-surface scaffolds (Priorities 1–4) populate their auth-boundary axes first.

**Priority 6: Cloud/backend substrate and model-routing/memory layers.**

Supabase, Cloudflare Workers, GitHub infrastructure, LiteLLM, Mem0, vector stores. These need Level 1 research from scratch. Lower priority because they are infrastructure — their scaffold enables adapter contracts and deployment specifications, but not the routing logic and teleological manuals that the higher-priority scaffolds enable.

**Priority 7: Observability/eval.**

Deferred until operational surfaces exist to observe. The scaffold for this layer will be thin until there is real traffic to instrument. The ARCHITECTURE.md observability section for the coding harness layer is the current best practice and can be referenced as a template when this layer activates.

---

## The Synthesis

What I have defined here is not the root document. It is the specification for the permanent descriptive quarry from which the root document, and all subsequent canonical artifacts, draw their substance.

The artifact profile says what makes a scaffold enduring. The research packet says how to produce one. The traversal grammar says how to write one so it stays useful under machine traversal. The priority ordering says where to point the engine first.

The old exegeses are valuable source material but they are not scaffolds in this sense — they are scholarly primitive exegeses written for a human reader in an analytical register. The scaffolds that need to exist are structural compressions of those exegeses into the fixed-axis, micro-grammar, agent-traversable format defined above. For the domains that have exegeses (the fourteen SaaS surfaces, the six coding harnesses), the work is primarily editorial: extract, normalize, compress, mark gaps. For the domains that lack exegeses (reasoning surfaces in chat roles, daemonized runtimes, automation engines, cloud substrates), the work is primary research using the improved research packet, followed by the same normalization into scaffold form.

The resulting scaffold layer — once populated across the priority ordering — becomes the permanent descriptive substrate from which the root document's per-tier summaries are synthesized, from which teleological manuals are derived, from which registry rows are extracted, from which adapter contracts are specified, and against which all future canonical claims are tested. It is the quarry. Everything else is cut from it.