# CONSTRUCTION BRIEF: METHOD-ENGINE.md

## Document Identity
**Name:** METHOD-ENGINE.md
**Artifact class:** Method (defines reusable analytical operations — this document is itself an instance of the class it governs)
**Teleology:** Defines the institution's reusable generative operations: the abstracted, invocable methods by which scaffolds are produced, deltas are sensed, compaction is executed, cross-entity synthesis is performed, and other repeatable knowledge-work is carried out. This is the constitution of the third track — the generative track that carries the abstracted research engine, distinct from the stable structural track and the volatile temporal track.

## Relationship to Upstream Documents

**KNOWLEDGE-ARCHITECTURE-ROOT.md § 6 (The Three Tracks)** defines the generative method track: "the reusable procedures for producing scaffolds, populating deltas, running compaction, and conducting cross-entity synthesis. It is derived from the research lineage that produced the strongest artifacts in the corpus, with the accidental prompting patterns discarded and the structural primitives preserved." METHOD-ENGINE.md is the canonical specification of this track.

**ARTIFACT-GRAMMAR.md § 2.9 (Method Class Grammar)** defines method-class artifacts: input specification, procedural steps, output specification, validation criteria, scope declaration. Every method the method engine defines must be a well-formed method-class artifact per this grammar. The class grammar specifies what a method IS; the method engine specifies what methods the institution USES and how new methods are created.

**SCAFFOLD-GRAMMAR.md § 4 (Production Procedure)** specifies the seven-step structural operation sequence for producing enduring descriptive scaffolds. This is the institution's most developed production procedure and the primary candidate for method abstraction. METHOD-ENGINE.md must abstract this procedure into a reusable, invocable method without restating it. The abstraction adds: invocation protocol (how the method is triggered), parameterization (what varies per invocation — the surface, the modality class, the evidence set), and output validation (how to verify the method produced a well-formed scaffold).

**SCAFFOLD-GRAMMAR.md § 5 (Dossier-to-Scaffold Bridge)** specifies the six structural deltas between dossiers and scaffolds. This is a transformation specification that the method engine should reference as the structural basis for a "dossier-to-scaffold conversion" method.

**DELTA-METABOLISM.md § 5 (Sensing-Directive Processing)** specifies how sensing directives are received, prioritized, dispatched, and completed. The dispatch step (§ 5.3) specifies what a sensing task must produce but defers the reusable sensing procedure to METHOD-ENGINE.md. The method engine must define the sensing method: what inputs it takes (a sensing directive), what steps it follows (identify sources, observe, record entry, anchor to primitive), and what output it produces (a well-formed delta entry that completes the directive).

**DELTA-METABOLISM.md § 4 (Compaction Protocol)** specifies the compaction operation. The method engine should reference this as the structural basis for a "compaction" method, adding invocation protocol and output validation.

**The research lineage** that produced the corpus's strongest artifacts (harness-taxonomy.md, the fourteen surface exegeses, the Live Ledger Précis, the CI Provenance Report) is the evidential basis for method abstraction. The method engine derives its procedures from what actually worked in production, not from theoretical research methodology.

## The Core Design Problem

The method engine must solve three problems simultaneously:

1. **Abstraction without loss.** The scaffold production procedure and the sensing procedure are already specified in concrete terms. The method engine must abstract them into reusable, parameterized operations without losing the structural specificity that makes them useful. Too much abstraction produces a generic "research methodology" document that tells you nothing concrete. Too little abstraction produces a copy of the scaffold grammar and delta metabolism. The right level: each method specifies its input contract, its procedural steps at the structural-operation level (not the prose-writing level), its output contract, and its validation criteria — parameterized so the same method can be invoked for different surfaces, domains, and evidence sets.

2. **Method creation governance.** The institution needs not just a set of initial methods but a governance process for creating new methods, validating them, and promoting them along the authority ladder. How does a new method earn authority? By being tested against real production tasks (per ARTIFACT-GRAMMAR.md § 2.9 promotion behavior). The method engine must specify the lifecycle of a method from draft through operational validation to institutional reliance.

3. **Scope boundary with operational documents.** Methods specify *what structural operations to perform*. Teleological manuals specify *who performs them and under what operational conditions*. The method engine must stay on the method side of this boundary. A sensing method specifies the structural steps for re-observing a primitive; a teleological manual for Perplexity specifies that Perplexity executes sensing methods for its assigned domains. The method engine does not assign agents to methods.

## Required Section Structure

### § 0. Query Handle
Domain: institutional generative operations. Class: method. Upstream: ARTIFACT-GRAMMAR.md § 2.9; SCAFFOLD-GRAMMAR.md §§ 4, 5; DELTA-METABOLISM.md §§ 4, 5; KNOWLEDGE-ARCHITECTURE-ROOT.md § 6. Downstream: All method invocations, READINESS-MATRIX.md (method coverage assessment), teleological manuals (which consume methods as the procedures their assigned agents execute).

### § 1. Governing Principles (≤3 paragraphs)
The generative method track is the institution's abstracted research engine. It carries the reusable procedures for producing knowledge artifacts, populating temporal observations, running compaction, and conducting cross-entity synthesis. Methods are derived from operational experience — what actually worked in production — with the accidental patterns discarded and the structural primitives preserved. The method engine is not a research-methodology textbook; it is a catalog of tested, invocable operations that produce well-formed artifacts under the grammar layer's constraints.

Methods are distinct from the procedures they abstract. SCAFFOLD-GRAMMAR.md § 4 specifies the scaffold production procedure. The method engine wraps that procedure in an invocation protocol (how to trigger it), parameterization (what varies per invocation), and output validation (how to verify the result). The procedure lives in the scaffold grammar; the invocable method lives here.

Source: root § 6 (generative method track), artifact grammar § 2.9 (method class grammar).

### § 2. Method Architecture

Define the structural anatomy of a method — what every method in the institution must contain:

**Input contract** — what the method requires to begin. Typed inputs: what artifact classes, evidence sets, or signals the method consumes. Parameterization: what varies per invocation (the target surface, the domain, the evidence set, the scaffold species).

**Procedural steps** — the structural operations the method performs, specified at the operation level (not the prose-writing level). Each step specifies its input (from the prior step or from the method's inputs), its transformation, and its output. Steps reference upstream specifications (scaffold grammar, delta metabolism) rather than restating them.

**Output contract** — what the method produces. Typed outputs: what artifact class, what identifier format, what validation the output must pass. The output contract connects the method to the grammar layer: a scaffold-production method's output must pass the twelve-check schema; a sensing method's output must be a well-formed delta entry.

**Validation criteria** — how the method's output is verified. For scaffold production: the twelve-check validation schema. For sensing: entry well-formedness per DELTA-METABOLISM.md § 3.1. For compaction: provenance-preservation verification per DELTA-METABOLISM.md § 4.3.

**Scope declaration** — what domain or artifact type the method governs, and what it does not govern.

Source: artifact grammar § 2.9 (method class required components). The method architecture must be consistent with the class grammar's required components while adding the invocation-protocol and parameterization layers.

### § 3. The Initial Method Set

Define the institution's starting catalog of methods. Each method is specified per the architecture in § 2. These methods are derived from procedures already specified in the grammar layer:

**Scaffold production method** — abstracted from SCAFFOLD-GRAMMAR.md § 4. Input: evidence set (dossiers, primary sources, operational experience), target scope and species declaration, modality-class axis set. Procedural steps: the seven structural operations (scope → axes → primitives → identifiers → labels → staleness → assembly/validation), referenced rather than restated. Output: a well-formed enduring descriptive scaffold passing the twelve-check schema. Parameterized by: surface (for surface scaffolds), modality class (for layer scaffolds), concern (for cross-cutting scaffolds).

**Dossier-to-scaffold conversion method** — derived from SCAFFOLD-GRAMMAR.md § 5. Input: one or more dossier-class surface exegeses, the target surface's modality-class axis set. Procedural steps: the six structural deltas (axis declaration, primitive extraction, identifier assignment, epistemic labeling, staleness connection, prescriptive content removal), each referencing the scaffold production procedure's corresponding step. Output: a well-formed enduring surface scaffold. This is a specialized variant of the scaffold production method, optimized for the specific case where the source material is existing dossier-class exegeses.

**Sensing method** — derived from DELTA-METABOLISM.md § 5.3. Input: a sensing directive (`SD:` format), the target domain ledger, source access appropriate to the primitive's domain. Procedural steps: identify observation sources for the targeted primitive, observe the primitive's current state, record the observation as a well-formed delta entry anchored to the primitive identifier, evaluate the observation against structural-change criteria, generate a scaffold revision request if criteria are met. Output: a well-formed delta entry that completes the sensing directive.

**Compaction method** — derived from DELTA-METABOLISM.md § 4. Input: a domain ledger that has triggered a compaction condition (volume or cadence). Procedural steps: classify entries by freshness tier (FRESH/CURRENT preserved, AGING conditional, STALE compacted), produce a compaction snapshot summarizing STALE entries with cross-references, archive compacted entries, verify provenance preservation. Output: a compacted domain ledger with archived originals.

**Cross-entity synthesis method** — derived from the layer-scaffold production process. Input: multiple surface scaffolds within the same modality class. Procedural steps: identify convergent primitives across surfaces, identify divergent primitives unique to individual surfaces, synthesize cross-cutting structural observations, assemble into a layer scaffold's three-zone structure. Output: a well-formed layer scaffold. This method has not yet been tested in production (no layer scaffold has been produced under the grammar layer), so it enters the catalog at authority Level 0 (intake) pending operational validation.

Additional methods will be added to the catalog as the institution's operational repertoire expands. The initial set covers the production and maintenance operations already specified in the grammar layer.

Source: scaffold grammar §§ 4, 5 (scaffold production, dossier-to-scaffold bridge). Delta metabolism §§ 4, 5 (compaction, sensing). The research lineage that produced harness-taxonomy.md and the surface exegeses (evidential basis for the scaffold production and dossier-to-scaffold methods).

### § 4. Method Lifecycle

Specify how methods are created, tested, promoted, and retired:

**Method creation** — a new method is created when a repeatable production pattern is identified from operational experience. The method is drafted per the architecture in § 2, enters the catalog at authority Level 0 (intake), and is tested against real production tasks.

**Method validation** — a method is validated by invoking it on at least one real production task and verifying that the output passes its declared validation criteria. Validation advances the method to Level 1 (curated). Repeated successful production across diverse inputs advances it to Level 2 (operational).

**Method evolution** — methods are revised when their procedures prove insufficient (new failure modes discovered, new structural requirements identified, new grammar-layer constraints imposed). Method revision follows the same governance as specification revision: the revised method earns its authority from Level 0 under the new version, not from the predecessor's authority.

**Method retirement** — a method that is superseded by a more effective procedure, or that governs an operation the institution no longer performs, transitions to pedigree status per ARTIFACT-GRAMMAR.md § 4.3.

Source: artifact grammar § 2.9 (method promotion behavior), artifact grammar § 4 (promotion ladder gates).

### § 5. Boundary with Operational Configuration

Specify the boundary between the method engine and operational documents (teleological manuals, agent assignments, scheduling):

Methods specify *what structural operations to perform and what well-formed output looks like*. Teleological manuals specify *who performs the method, under what operational conditions, with what tools, and on what schedule*. A sensing method specifies the steps for re-observing a primitive; a teleological manual for a sensing agent specifies which domains that agent is responsible for, what sources it consults, and how often it runs.

This boundary keeps the method engine abstract enough to survive agent reassignment, tool changes, and operational reorganization. If the institution switches from Perplexity to a different sensing surface, the sensing method does not change — only the teleological manual changes.

Source: root § 1 (boundary law — the distinction between constitutional/method-level specification and operational assignment). Layer law § 5 (Tier 4 surfaces carry teleological manuals that consume methods).

## Anti-Patterns
- Do NOT restate SCAFFOLD-GRAMMAR.md § 4's production procedure — reference and parameterize it
- Do NOT restate DELTA-METABOLISM.md §§ 4–5 — reference and wrap them in invocation protocol
- Do NOT become a generic research-methodology essay divorced from the grammar layer
- Do NOT assign specific agents or operators to methods — that is teleological-manual territory
- Do NOT specify surface-specific operational details (which sources to consult for Slack, how to access Claude's API) — those belong in teleological manuals
- Do NOT define new production procedures that should live in their upstream documents (new scaffold types would be specified in scaffold grammar amendments, not here)
- Do NOT let the method catalog become exhaustive at the expense of the governance framework — the initial methods demonstrate the pattern; the lifecycle enables extension
- Do NOT overpromote ARCHITECTURE.md
- Do NOT use retired terminology

## Source Documents to Load
1. ARTIFACT-GRAMMAR.md § 2.9 (ratified — method class grammar)
2. SCAFFOLD-GRAMMAR.md §§ 4, 5 (ratified — scaffold production procedure, dossier-to-scaffold bridge)
3. DELTA-METABOLISM.md §§ 4, 5 (ratified — compaction protocol, sensing-directive processing)
4. KNOWLEDGE-ARCHITECTURE-ROOT.md § 6 (ratified — three tracks, generative method track)
5. NAMING-AND-ADDRESSING.md §§ 2, 3, 5 (ratified — identifier formats that methods must produce compliant output against)
6. LAYER-LAW.md § 5 (ratified — Tier 4 modality classes whose decomposition axes parameterize scaffold methods)
7. harness-taxonomy.md (specimen: the artifact whose production lineage is the primary evidence for method abstraction)

## Validation Checks (post-draft)
- [ ] Method architecture specifies: input contract, procedural steps, output contract, validation criteria, scope declaration
- [ ] The initial method set includes at minimum: scaffold production, dossier-to-scaffold conversion, sensing, compaction, cross-entity synthesis
- [ ] Each method in the initial set references (not restates) its upstream procedure specification
- [ ] Each method's output contract connects to the grammar layer's validation apparatus (twelve-check schema, entry well-formedness, provenance verification)
- [ ] Method lifecycle specifies: creation, validation, evolution, retirement
- [ ] The boundary with operational configuration is explicitly stated
- [ ] No method assigns specific agents, surfaces, or operational schedules
- [ ] No method restates procedures already specified in scaffold grammar or delta metabolism
- [ ] The cross-entity synthesis method is honestly labeled as untested (Level 0)
- [ ] The method architecture is consistent with ARTIFACT-GRAMMAR.md § 2.9's required components
- [ ] Total length: 2500–4000 words (the method engine is a governance and catalog document, not a procedure manual — the procedures live upstream)

## Downstream Artifacts This Document Unlocks
READINESS-MATRIX.md uses the method catalog to assess method coverage (which operations have tested methods, which do not). Teleological manuals consume methods as the procedures their assigned agents execute — the method is the "what," the teleological manual is the "who/when/how." All scaffold producers and delta producers invoke methods from this catalog. Future method creation follows the lifecycle specified here.

## Drafter
Opus for §§ 1, 2, 4, 5 (governing principles, method architecture, lifecycle, operational boundary — these involve non-delegable architectural judgment about the generative track's abstraction level and governance). Sonnet may assist with § 3 (initial method set) under a tightly scoped sub-brief, since each method in the set is a structured wrapping of already-ratified upstream procedures rather than new architectural work.
