Let me check the project files that bear on the live-ledger and sensing concepts before answering.Good. The live-ledger précis is the key prior document here. It already solved the right problem — the ticker-vs-snapshot distinction, freshness decay, append-only semantics, contradiction preservation — but it solved it as a standalone operational practice, not yet as a structural layer integrated into the scaffold grammar. What I need to do now is formalize the contract between the two layers, define the partitioning rule for what goes where, and determine whether the artifact ladder needs structural revision.

---

## I. The Contract Between Stable Scaffold and Canonical Delta

The scaffold and the delta layer serve complementary functions that must never be collapsed into one artifact. The scaffold holds structural knowledge — primitives, object models, decomposition axes, composition rules, boundary conditions — that changes when the surface's architecture changes, not when its capabilities fluctuate or its pricing shifts. The delta layer holds volatile state — what is true right now, what changed since the last observation, what contradicts what was previously observed. The scaffold tells you what kind of thing something is. The delta layer tells you what that thing is doing today.

The contract has five clauses.

**Clause 1: Directionality.** The scaffold feeds the delta layer with structure. The delta layer feeds the scaffold with corrections. The scaffold defines the domain boundaries, entity list, and axis set within which deltas are recorded. When a delta observation reveals that a scaffold's primitive decomposition is wrong — a surface has added a new architectural primitive, or removed one, or fundamentally restructured — the delta does not silently absorb the structural change. It flags a scaffold revision request. The scaffold is updated through its own editorial process (validation grammar, promotion rules). The delta entry records what happened and when; the scaffold records what the surface now is.

The flow: scaffold defines the frame → deltas accumulate within the frame → some deltas trigger scaffold revision → revised scaffold redefines the frame → cycle continues.

**Clause 2: Temporal semantics.** The scaffold carries a last-verified date per section and an expected refresh cadence (the staleness markers defined in the earlier grammar). But the scaffold's temporal semantics are fundamentally different from the delta layer's. A scaffold section verified in March 2026 that describes Slack's workspace primitive is still valid in September 2026 if Slack's workspace architecture has not changed — even though the section is technically "six months old." The scaffold's age is not its staleness. Its staleness is determined by whether the underlying reality has changed, which is something only the delta layer can detect.

The delta layer's temporal semantics are the live-ledger précis's freshness computation: FRESH (<7d), CURRENT (<30d), AGING (<90d), STALE (>90d). These apply to individual observations, not to structural descriptions. A delta entry that says "Slack raised its API rate limit on March 5" is FRESH for seven days and STALE after ninety, regardless of whether the scaffold's description of Slack's API primitive has changed.

The contract: the delta layer's freshness computation drives sensing priority (which domains need fresh observations). The scaffold's staleness markers drive structural audit priority (which scaffolds need to be re-verified against current reality). These are different timescales and different operations. Confusing them — treating scaffold age as equivalent to delta freshness — is the most common failure mode of systems that try to combine stable description with live sensing in a single artifact.

**Clause 3: What constitutes a scaffold revision trigger.** Not every delta observation triggers a scaffold revision. The vast majority of deltas — pricing changes, benchmark shifts, capability updates, new feature launches, API version bumps — are absorbed by the delta layer without touching the scaffold at all. A scaffold revision is triggered only when:

A surface's primitive object model changes — a new primitive is added, an existing primitive is removed, or the composition rules between primitives change. Example: Slack launches a new primitive type (say, "Canvas" as a persistent document surface within channels). This is a structural change to the object model, not a volatile observation. The scaffold needs a new primitive entry.

A surface's manipulation surface changes architecturally — a new control path (new API, new MCP server, new CLI) is added or an existing one is deprecated. Example: Notion deprecates its v1 API and replaces it with a fundamentally different v2. The scaffold's manipulation-surface axis needs revision.

A surface's auth model changes structurally — trust boundaries are redrawn. Example: Slack adds cross-workspace data sharing that changes which trust zones can be bridged.

The decomposition axes themselves prove inadequate — a new surface or new operational experience reveals that the current axes miss a structurally important dimension. This is the rarest and most consequential revision type.

Everything else — capability improvements, pricing changes, benchmark shifts, new integrations within the existing API, operational findings about best practices, security incidents that don't change the auth model — stays in the delta layer. The delta layer is designed for this volume and velocity. The scaffold is not.

**Clause 4: Reference semantics.** Deltas reference scaffolds using the scaffold's stable primitive identifiers. A delta entry about a Slack API rate limit change references `[slack:api-rest]` as its structural anchor. This reference is what makes the two layers composable: an agent can look up the structural description in the scaffold using the identifier, then look up the current state in the delta layer using the same identifier as a filter key. The scaffold provides the map; the deltas provide the weather.

Scaffolds never reference specific delta entries (because deltas are volatile and have no stable identity beyond their sequential IDs, which carry no structural meaning). Scaffolds reference the delta layer as a whole through their staleness markers: "this section was last verified against the delta layer on [date]."

**Clause 5: Compaction.** The delta layer accumulates without bound. The live-ledger précis already identified the compaction problem (context bloat after 30+ days) and prescribed periodic compaction: compress STALE entries to summaries, preserve FRESH entries verbatim. The compaction discipline for the two-layer system is: when a compaction pass runs on the delta layer, it checks whether any accumulated deltas justify a scaffold revision (per Clause 3). Structural observations that accumulated as deltas but actually represent primitive-level changes get promoted into scaffold revisions. Non-structural observations get compressed in place. The compaction pass is the moment when the delta layer's temporal knowledge gets distilled back into the scaffold's structural knowledge.

This is the metabolism. The scaffold is the skeleton. The deltas are the blood. Compaction is the liver — it filters what the blood carries and occasionally sends signals that the skeleton needs to adapt.

---

## II. The Partitioning Rule: What Belongs Where

The partition is determined by a single question: **does this knowledge describe what kind of thing something is, or does it describe what that thing is currently doing?**

### Stable scaffold territory

**Primitive object models.** What atoms exist, how they compose, what the containment hierarchy is. Slack's workspace-channel-thread-message-block hierarchy is stable scaffold material. It changes only when Slack restructures its architecture.

**Decomposition axes and structural patterns.** The axes themselves, the convergent/divergent primitive patterns across surfaces, the structural comparisons. These change only when the set of entities in the domain changes enough to reveal new structural patterns or invalidate old ones.

**Boundary conditions and scope declarations.** What a surface is and is not. These change only when a surface fundamentally pivots (which is rare and consequential enough to justify a scaffold revision).

**Auth and trust topology.** The structural auth model — what kinds of permissions exist, how they inherit, what trust zones the surface creates. Not which specific permissions are set (that's operational configuration, not structural description).

**Manipulation surface architecture.** What control paths exist (REST API, GraphQL, CLI, MCP, webhook, browser). Not the specific endpoint URLs or response schemas at the field level (those change frequently and belong in adapter contracts or delta observations).

**Composition rules and design teleology as structural property.** How the surface's primitives compose, what the surface was designed to do architecturally. Not what the institution should use it for (that's teleological manual territory) and not what it can do today at the capability frontier (that's delta territory).

**Failure mode taxonomy.** The structural failure modes — what classes of things go wrong. Not specific incidents (those are delta entries).

### Delta layer territory

**Capability claims.** "GPT-5.4 scores X on benchmark Y." "Slack now supports Z in its API." "Perplexity's citation accuracy is 63%." These are volatile. They change with model generations, platform releases, and independent testing. A scaffold that embeds capability claims directly will silently decay as the claims age.

**Pricing and token economics.** All pricing, rate limits, context window sizes, and cost-per-operation figures. These change on vendor schedules with no structural signal. They belong in delta entries tagged by surface identifier, refreshed at the cadence the live-ledger domain architecture prescribes.

**Benchmark shifts and competitive positioning.** "Claude is now better than GPT at X." "Linear has overtaken Jira in NPS for teams under 50." These are volatile market observations, not structural descriptions.

**API version-specific details.** Exact endpoint schemas, response field names, specific rate limit numbers, deprecation notices. These belong in adapter contracts (which reference the scaffold's structural description) and are refreshed via delta entries when they change.

**Operational findings and practitioner consensus.** "The best pattern for using Slack as an operator bus is X." "Community consensus on Notion formulas has shifted from Y to Z." These are valuable but volatile. They belong in delta entries that feed into teleological manual revisions, not in the scaffold itself.

**Security incidents and vulnerability reports.** Specific events that affect trust boundaries without changing the structural auth model. If the structural auth model itself changes (new permission type, new trust zone boundary), that triggers a scaffold revision per Clause 3.

**Product roadmap and aspirational content.** What a surface's developers plan to do. This is aspirational leakage if placed in a scaffold. It belongs in delta entries tagged as SPECULATIVE or LOW confidence.

### The borderline case: what about features that seem structural but are really capability?

Example: "Notion supports AI-generated summaries within database views." Is this a new primitive (scaffold) or a new capability (delta)? The test: does this change the object model? Does it introduce a new kind of atom, or a new composition rule between existing atoms? If Notion's AI summaries are a new block type within the existing block primitive, they are a capability extension of an existing primitive — delta territory. If they represent a fundamentally new architectural layer (say, a "semantic layer" that mediates between databases and views in a way that changes how those primitives relate), they are a scaffold revision trigger. The question is always structural: does it change what kind of thing this is, or does it change what this thing can currently do?

---

## III. Impact on the Artifact Ladder

The current six-level ladder is:

Level 0: Inquiry lineage (pedigree)
Level 1: Primitive exegesis (dossier)
Level 2: Teleological manual / cross-entity taxonomy
Level 3: Adapter/manipulation contract
Level 4: Registry row
Level 5: Canonical delta

The stable/volatile distinction reveals that Level 5 (canonical delta) is underspecified. In the current ladder, it occupies a single slot at the top of the compression stack. But the analysis above shows it is not a compression of the scaffold — it is a parallel temporal layer that interacts with the scaffold through a specific contract. The delta layer does not summarize the scaffold; it tracks changes to the reality the scaffold describes.

The revised ladder should make this explicit by splitting the vertical into two tracks that share a common structural spine:

### The Structural Track (stable, revision-cadenced)

**Level 0: Inquiry lineage.** Pedigree. The prompts, raw reports, and method records that produced the research. Archived.

**Level 1: Enduring descriptive scaffold.** The permanent substrate. Three species (surface, layer, cross-cutting). Validated against the twelve-check grammar. Revision-triggered only by structural changes (Clause 3).

**Level 2: Cross-entity taxonomy.** The convergence/divergence synthesis across scaffolds within a domain. Revision-triggered when entity set changes or when accumulated deltas reveal false convergences.

**Level 3: Teleological manual.** Per-surface or per-organ operational specification. Revision-triggered when scaffold revisions change the underlying primitive model, or when accumulated delta observations shift the operational best practices enough to justify a rewrite.

**Level 4: Adapter/manipulation contract.** Per-surface control-path specification. Revision-triggered when manipulation-surface axis in the scaffold changes, or when API-specific deltas accumulate enough to require contract update.

**Level 5: Registry row.** The maximally compressed structural entry. Revision-triggered when any upstream level changes enough to invalidate the compressed form.

**Level 6: Canonical law.** The constitutional claims that have earned canon status through the promotion pipeline. Revision-triggered only by deliberate ratification.

### The Temporal Track (volatile, freshness-cadenced)

**Delta Domain Ledgers.** One per domain, as the live-ledger précis prescribes. Each domain maps to one or more scaffold sections via the stable primitive identifiers. Entries are append-only, timestamped, source-attributed, confidence-labeled, freshness-decayed. Domains are defined by what changes independently (the live-ledger précis's domain criterion).

**Compaction Snapshots.** Periodic compressions of delta ledgers where STALE entries are summarized and structural-change signals are routed to scaffold revision requests. These snapshots are the temporal track's equivalent of the structural track's compression endcaps — they provide a lower-resolution view of accumulated temporal state.

**Sensing Directives.** The instructions that drive future delta-layer population: what domains need fresh observations, what surfaces have aging coverage, what specific questions need answers. These are the temporal track's method artifacts — they specify the ongoing inquiry rather than one-shot research.

### The interface between tracks

The structural track and temporal track share three interface points:

**Scaffold revision requests.** Generated when delta observations meet Clause 3 criteria. Flow from temporal to structural.

**Staleness verification signals.** Generated when scaffold staleness markers exceed their expected refresh cadence. Flow from structural to temporal (as sensing priority assignments).

**Identifier spine.** The stable primitive identifiers defined in the structural track serve as the indexing key for the temporal track. Every delta entry references the scaffold primitive(s) it pertains to. This is what makes the two tracks composable without being coupled.

### What this means for future daemonized operation

When the control-plane and receipt grammar are mature enough to support automated sensing, the temporal track becomes the daemon's operating surface. The daemon runs sensing passes against the delta domain ledgers, populates fresh entries, runs compaction, generates scaffold revision requests, and generates sensing directives for the next cycle. The structural track is what the daemon reads to understand the domain structure it is sensing within. The daemon does not modify the structural track directly — it generates revision requests that enter the scaffold's editorial process.

This separation means the daemon can be aggressive about sensing (high-frequency, broad coverage, speculative confidence levels welcome) without risking structural corruption. The scaffold remains stable. The deltas churn. The compaction metabolism filters between them. This is the exact architecture the live-ledger précis was groping toward, now formalized as a two-track system with an explicit contract.

---

## IV. Method Pedigree: Where the Generative Machinery Lives

The old prompting lineage — the Grok directives, the CI engineering transcripts, the sensing prompts — is pedigree for the method layer. It should not live inside scaffolds. It should not live inside deltas. It should live in method artifacts that abstract the generative machinery from its accidental execution history.

The method layer already has its core artifact: the research-packet grammar defined earlier (seven components: domain declaration, fixed decomposition axes, four-tier source discipline, progressive depth stacking, output grammar, adversarial consistency check, compression endcap). That grammar was abstracted from the old lineage and improved. The old lineage's value has been fully extracted into the grammar. The lineage itself becomes Level 0 (inquiry lineage / pedigree) — archived for provenance, never loaded into active sessions, never cited as authority.

Sensing directives (in the temporal track) are method artifacts too — they specify the ongoing inquiry process for delta-layer population. The live-ledger sensing prompt (PROMPT-GROK-LIVE_LEDGER_SENSING.md) is a prototype. The improved form would use the research-packet grammar's source discipline and output grammar but adapt them for the delta format: observation-first rather than mechanism-first, freshness-labeled rather than verification-date-labeled, and tagged to scaffold primitive identifiers rather than free-standing.

The key structural point: **the method layer is what carries the DNA of the old prompting lineage forward, abstracted and sharpened.** The scaffolds carry the structural knowledge. The deltas carry the temporal knowledge. The methods carry the procedural knowledge — how to produce scaffolds, how to populate deltas, how to run compaction, how to conduct cross-entity synthesis. When a new domain enters the system, the method layer is what an agent or operator consults to produce the scaffold, set up the delta ledgers, and begin sensing. The methods are the reusable generative engine. The scaffolds and deltas are what the engine produces.

This three-way separation — structural substrate, temporal state, generative method — is the complete grammar. It can engender high-fidelity research without dragging forward the accidental prompts that happened to work in prior sessions. The prompts were instances. The method is the type. The scaffolds are the products. The deltas are the living state. Each has its own layer, its own update cadence, its own authority level, and its own relationship to the others.

---

## V. The Grammar, Complete

The root grammar now contains:

**The artifact taxonomy** (eight classes plus the enduring descriptive scaffold as a permanent substrate class distinct from ephemeral scaffolds).

**The artifact ladder** (structural track: inquiry lineage → scaffold → cross-entity taxonomy → teleological manual → adapter contract → registry row → canonical law; temporal track: delta domain ledgers + compaction snapshots + sensing directives; interface: revision requests, staleness signals, identifier spine).

**The scaffold grammar** (eleven properties, ten anti-patterns, twelve validation checks, three species, spawn grammar, four compression depths, open-world extension law).

**The stable/volatile partition** (structural knowledge in scaffolds, temporal knowledge in deltas, the five-clause contract between them, the compaction metabolism that filters between them).

**The method layer** (research-packet grammar, sensing-directive grammar, compaction protocol; all abstracted from the old lineage, none carrying the old lineage's accidental form).

**The promotion rules** (evidence → synthesis → adversarial testing → ratification; scaffolds never promote to canon directly — their content promotes through downstream artifacts that earn authority independently).

**The boundary law** (repo ratifies, exocortex coordinates, ontology projects; scaffold describes, delta senses, method generates, canon legislates).

This grammar is now compatible with daemonized operation: the temporal track is the daemon's operating surface, the structural track is its reference frame, the method layer is its instruction set, and the contract between tracks prevents sensing from corrupting structure. The grammar does not require the daemon to exist yet — it works in fully human-operated mode. But it carries in its DNA the capacity for continuous automated refresh, which is what the question asked for.

The scaffold is permanent because it describes structure. The delta is volatile because it tracks state. The method is reusable because it specifies procedure. Canon is earned because it survives promotion. Nothing carries forward as a canonical relic that has not earned its position through the grammar's own rules. The old prompts are honored as pedigree for the method, then archived. The generative machinery they embodied has been abstracted, sharpened, and formalized. It is ready to produce the next generation of artifacts without carrying yesterday's cruft.