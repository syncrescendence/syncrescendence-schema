# READINESS-MATRIX.md

**Class:** Registry  
**Domain:** Institutional maturity assessment  
**Upstream:** All seven prior grammar documents  
**Downstream:** AUTHORITY-LATTICE.md, all scaffold producers, the operator  
**Last updated:** 2026-03-13  
**Coverage:** Four maturity axes; initial population from grammar-layer bootstrap assessments  

---

## § 1. Governing Principles

The readiness matrix is the institution's self-assessment. It catalogs what exists and what is missing across four maturity axes, using the criteria defined in upstream grammar documents. Entries follow declared schemas. Gaps are explicit rows, not omissions. Maturity levels are assigned by structural criteria, not qualitative judgment. The matrix is the authoritative home for current-status assessments that were bootstrapped in LAYER-LAW.md and ROOT § 10 and are now maintained here.

The matrix assesses current state. It does not prescribe future state, recommend priorities, or assign decision authority. It says "Tier 5 is at OPEN SLOT maturity and zero surfaces have scaffolds." It does not say "therefore Tier 5 should be prioritized" or "therefore the operator should delegate Tier 5 decisions." Those are authority-lattice judgments that consume the matrix as input.

---

## § 2. The Four Maturity Axes

### Axis 1 — Tier and Modality-Class Maturity

Assesses structural completeness at the tier level and, within Tier 4, at the modality-class level. Maturity levels follow LAYER-LAW.md's per-tier semantics: ESTABLISHED (tier fully instantiated), IN PROGRESS (active construction), MATURE (all structural components complete and validated), PARTIAL (some components exist, others missing), OPEN SLOT (named but unspecified), NONE (insufficient evidence for any specification).

Entry schema:

| Field | Type | Required | Description |
|---|---|---|---|
| `tier` | identifier | yes | Tier number (1–7) or orthogonal concern name |
| `maturity` | enum | yes | ESTABLISHED / IN PROGRESS / MATURE / PARTIAL / OPEN SLOT / NONE |
| `structural_basis` | text | yes | What exists at this maturity level |
| `next_milestone` | text | yes | What structural condition would advance maturity |
| `blockers` | text | no | What prevents advancement |

### Axis 2 — Scaffold Coverage

Assesses which entities have enduring descriptive scaffolds and at what structural quality. Coverage (does a scaffold exist?) and quality (how many checks does it pass?) are distinct fields — a surface with a 5/12 scaffold and a surface with no scaffold are different kinds of incompleteness.

This axis provides the **surface-to-scaffold lookup**: given a surface identifier, the matrix returns the scaffold that covers it or an explicit gap marker. This closes the resolution gap identified in NAMING-AND-ADDRESSING.md review Check 3.

Entry schema:

| Field | Type | Required | Description |
|---|---|---|---|
| `entity` | identifier | yes | Surface slug, modality-class slug, or concern slug |
| `modality_class` | text | yes | The Tier 4 modality class this entity belongs to (or "orthogonal" for cross-cutting) |
| `scaffold_id` | identifier / GAP | yes | Artifact identifier of the covering scaffold, or `GAP` |
| `scaffold_species` | enum | conditional | Surface / layer / cross-cutting (required if scaffold exists) |
| `authority_level` | enum | conditional | 0-intake / 1-curated / 2-operational (required if scaffold exists) |
| `check_pass_count` | integer | conditional | Number of twelve-check passes (0–12) (required if scaffold exists) |
| `known_failures` | text | conditional | Which checks fail and why (required if pass count < 12) |
| `evidence_class` | enum | yes | What pre-scaffold evidence exists: dossier / primary-docs-only / none |
| `remediation_status` | text | no | Status of known-failure remediation |

### Axis 3 — Method Coverage

Assesses which methods exist in the method catalog and at what authority level.

Entry schema:

| Field | Type | Required | Description |
|---|---|---|---|
| `method_name` | text | yes | Name from METHOD-ENGINE.md § 3 |
| `engine_ref` | identifier | yes | Section reference in METHOD-ENGINE.md |
| `authority_level` | enum | yes | 0-intake / 1-curated / 2-operational / OPEN SLOT |
| `validation_status` | enum | yes | untested / tested-once / operationally-validated / open-slot |
| `upstream_procedure` | identifier | yes | Reference to the upstream procedure specification |
| `notes` | text | no | Validation evidence or gap description |

### Axis 4 — Temporal-Domain Coverage

Assesses which delta domains exist and their health.

Entry schema:

| Field | Type | Required | Description |
|---|---|---|---|
| `domain_id` | identifier | yes | Domain identifier per NAMING-AND-ADDRESSING.md § 2.5, or `PLANNED` |
| `tier_mapping` | identifier | yes | Tier or orthogonal concern this domain maps to |
| `rho_class` | enum | yes | high-ρ / moderate-ρ / low-ρ |
| `lifecycle` | enum | yes | active / pedigree / not-yet-created |
| `entry_count` | integer | conditional | Number of entries (if active) |
| `freshness_distribution` | text | conditional | Count per freshness grade (if active) |
| `last_compaction` | date | no | Date of most recent compaction |
| `notes` | text | no | Gap description or health assessment |

---

## § 3. Cross-Axis References

A scaffold-coverage entry (Axis 2) references its modality class, connecting to Axis 1 for tier context. A temporal-domain entry (Axis 4) references its tier mapping, connecting to Axis 1 for freshness-threshold derivation. These cross-references use the identifier formats from NAMING-AND-ADDRESSING.md and make the registry queryable across axes: "show me all scaffold gaps in modality classes that are at PARTIAL maturity or below" is answerable by joining Axis 2 (where `scaffold_id = GAP`) with Axis 1 (where `maturity` ∈ {PARTIAL, OPEN SLOT, NONE}).

---

## § 4. Initial Population

### 4.1 Axis 1 — Tier and Modality-Class Maturity

Absorbed from LAYER-LAW.md current-status assessments (dated 2026-03-12) and ROOT § 10.

| Tier | Maturity | Structural Basis | Next Milestone | Blockers |
|---|---|---|---|---|
| Tier 1 — Environmental Physics | ESTABLISHED | Four control variables instantiated, composite assessment complete | Re-instantiation on fundamental environmental shift | None |
| Tier 2 — Constitutional Law | IN PROGRESS | Grammar-layer construction: 8 of 9 documents ratified | All nine grammar documents ratified; strategic pillars extracted | Pillars extraction deferred to post-grammar |
| Tier 3 — Typed Middle Layer | OPEN SLOT | Contracts named as placeholders | First contract specified from operational proof | Insufficient operational surface traffic |
| Tier 4 — Execution Surfaces | PARTIAL (mixed) | See per-modality-class entries below | Layer scaffolds for additional modality classes | Evidence gaps vary by class |
| Tier 5 — Coordination | OPEN SLOT | Surface exegeses for Slack, Discord | Coordination-layer scaffold | Tier 4 SaaS scaffolds needed first |
| Tier 6 — Observability | OPEN SLOT | Coding-harness observability in ARCHITECTURE.md | Broader observability specification | Operational surface maturity |
| Tier 7 — Projection/Terminal | PARTIAL | Working ontology (SQLite + FastAPI) | Target object model decomposed at scaffold grade | Grammar-layer completion |
| Trust/Auth (orthogonal) | NONE | Scattered auth info in surface exegeses | Cross-surface auth mapping scaffold | Surface scaffolds needed first |
| Reversibility (orthogonal) | PARTIAL | Coding-harness reversibility map in ARCHITECTURE.md | Cross-tier reversibility scaffold | Surface scaffolds needed first |
| Epistemic Status (orthogonal) | ESTABLISHED (practice) | Inline labeling practiced; not yet formalized | Cross-cutting specification | Grammar-layer completion |

**Tier 4 per-modality-class sub-entries:**

| Modality Class | Maturity | Structural Basis | Next Milestone |
|---|---|---|---|
| Repo-native coding harnesses | MATURE | Layer scaffold (harness-taxonomy.md) + derived spec (ARCHITECTURE.md) | Scaffold remediation (7 failing grammar checks) |
| Reasoning / chat surfaces | PARTIAL | Strong operational evidence; no fixed-axis scaffold | Surface scaffolds for Claude, ChatGPT, Gemini, Grok; then layer scaffold |
| SaaS work / knowledge / automation | PARTIAL | 14 surface exegeses (dossier-class); no cross-entity taxonomy | Dossier-to-scaffold conversion for active surfaces; then layer scaffold |
| Daemon / runtime surfaces | NONE | Partial evidence for OpenClaw (misclassified in harness taxonomy) | Level 1 research per surface |
| Autonomous operator surfaces | NONE | Headline characterization for Manus only | Level 1 research |
| Recon / sensing surfaces | MATURE (single) | Perplexity teleological manual at full resolution | Additional recon surface scaffolded (NotebookLM candidate) |
| Cloud / backend substrates | NONE | Mentioned in prior documents, unresearched | Level 1 research |
| Model-routing / memory layers | NONE | Mentioned in prior documents, unresearched | Level 1 research |
| Solopreneur stack (open slot) | NOT ENUMERATED | Domain category declared; no surfaces identified | Domain scoping |

### 4.2 Axis 2 — Scaffold Coverage

**Coding harnesses (covered by layer scaffold):**

| Entity | Modality Class | Scaffold ID | Species | Authority | Checks | Known Failures | Evidence |
|---|---|---|---|---|---|---|---|
| `aider` | Coding harnesses | HARNESS-TAXONOMY.md | layer | 2-operational | 5/12 | 1 (header), 4 (identifiers), 5 (epistemic labels), 6 (staleness), 7 (source attrib), 9 (cross-refs), 11 (traceability) | dossier + primary docs |
| `claude-code` | Coding harnesses | HARNESS-TAXONOMY.md | layer | 2-operational | 5/12 | same as above | dossier + primary docs |
| `gemini-cli` | Coding harnesses | HARNESS-TAXONOMY.md | layer | 2-operational | 5/12 | same as above | dossier + primary docs |
| `codex` | Coding harnesses | HARNESS-TAXONOMY.md | layer | 2-operational | 5/12 | same as above | dossier + primary docs |
| `openclaw` | Coding harnesses | HARNESS-TAXONOMY.md | layer | 2-operational | 5/12 | same as above | dossier + primary docs |
| `openhands` | Coding harnesses | HARNESS-TAXONOMY.md | layer | 2-operational | 5/12 | same as above | dossier + primary docs |

**Reasoning / chat surfaces (no scaffold):**

| Entity | Modality Class | Scaffold ID | Evidence |
|---|---|---|---|
| `claude-chat` | Reasoning surfaces | GAP | primary docs + operational experience |
| `chatgpt` | Reasoning surfaces | GAP | primary docs + operational experience |
| `gemini-chat` | Reasoning surfaces | GAP | primary docs + operational experience |
| `grok` | Reasoning surfaces | GAP | primary docs + operational experience |

**SaaS surfaces with dossier-class exegeses (no scaffold):**

| Entity | Modality Class | Scaffold ID | Evidence |
|---|---|---|---|
| `slack` | SaaS platforms | GAP | dossier (report-slack.md) |
| `notion` | SaaS platforms | GAP | dossier (report-notion.md) |
| `airtable` | SaaS platforms / Automation | GAP | dossier (report-airtable.md) |
| `jira` | SaaS platforms | GAP | dossier (report-jira.md) |
| `confluence` | SaaS platforms | GAP | dossier (report-confluence.md) |
| `coda` | SaaS platforms | GAP | dossier (report-coda.md) |
| `linear` | SaaS platforms | GAP | dossier (report-linear.md) |
| `clickup` | SaaS platforms | GAP | dossier (report-clickup.md) |
| `basecamp` | SaaS platforms | GAP | dossier (report-basecamp.md) |
| `discord` | SaaS platforms / Coordination | GAP | dossier (report-discord.md) |
| `todoist` | Productivity | GAP | dossier (report-todoist.md) |
| `ticktick` | Productivity | GAP | dossier (report-ticktick.md) |
| `obsidian` | SaaS platforms | GAP | dossier (report-obsidian.md) |
| `telegram` | SaaS platforms | GAP | dossier (report-telegram.md) |

**Surfaces without even dossier coverage:**

| Entity | Modality Class | Scaffold ID | Evidence |
|---|---|---|---|
| `perplexity` | Recon / sensing | GAP (scaffold); teleological manual exists | primary docs + teleological manual |
| `manus` | Autonomous operators | GAP | headline characterization only |
| `openclaw` (daemon role) | Daemon / runtime | GAP | partial (misclassified in harness taxonomy) |
| `claude-cowork` | Daemon / runtime | GAP | minimal documentation |
| `github` | Cloud / backend | GAP | none |
| `cloudflare` | Cloud / backend | GAP | none |
| `supabase` | Cloud / backend | GAP | none |
| `make` | Automation | GAP | none |
| `zapier` | Automation | GAP | none |
| `openrouter` | Model-routing / memory | GAP | none |
| `huggingface` | Model-routing / memory | GAP | none |
| `youtube` | Media / distribution | GAP | none |
| `x` | Media / distribution | GAP | none |
| `tiktok` | Media / distribution | GAP | none |
| `twitch` | Media / distribution | GAP | none |
| `canva` | Media / distribution | GAP | none |
| `miro` | Media / distribution | GAP | none |
| `reddit` | Media / distribution | GAP | none |
| `figma` | Media / distribution | GAP | none |
| `replit` | Sandbox / file | GAP | none |
| `dropbox` | Sandbox / file | GAP | none |
| `loveable` | Sandbox / file | GAP | none |
| `trello` | SaaS platforms | GAP | none |
| `oracle-cloud` | Cloud / backend | GAP | none |
| `incident` | Channel / incident | GAP | none |

**Cross-cutting scaffolds:**

| Concern | Scaffold ID | Evidence |
|---|---|---|
| Trust / auth boundaries | GAP | scattered in surface exegeses |
| Reversibility / migration | GAP | ARCHITECTURE.md reversibility map (coding harnesses only) |
| Epistemic status | GAP | practice established; no formalized scaffold |

**Summary:** 1 layer scaffold covering 6 surfaces (5/12 checks passing). 0 surface scaffolds. 0 cross-cutting scaffolds. 14 surfaces with dossier-class evidence. 4 surfaces with operational evidence but no dossier. ~21 surfaces with no evidence. 3 cross-cutting concerns with no scaffold.

### 4.3 Axis 3 — Method Coverage

| Method | Engine Ref | Authority | Validation | Upstream Procedure |
|---|---|---|---|---|
| Scaffold production | § 3.1 | 2-operational | operationally-validated | SCAFFOLD-GRAMMAR.md § 4 |
| Dossier-to-scaffold conversion | § 3.2 | 1-curated | untested | SCAFFOLD-GRAMMAR.md § 5 |
| Sensing | § 3.3 | 1-curated | untested | DELTA-METABOLISM.md § 5 |
| Compaction | § 3.4 | 1-curated | untested | DELTA-METABOLISM.md § 4 |
| Cross-entity synthesis | § 3.5 | 0-intake | untested | SCAFFOLD-GRAMMAR.md § 2.2 |
| Specification production | § 3.6 | OPEN SLOT | open-slot | awaiting upstream procedure |
| Compression production | § 3.6 | OPEN SLOT | open-slot | awaiting upstream procedure |

**Summary:** 5 methods specified, 2 open slots. 1 method at Level 2. 3 methods at Level 1 (untested under grammar layer). 1 method at Level 0. 2 methods awaiting upstream procedure specification.

### 4.4 Axis 4 — Temporal-Domain Coverage

| Domain | Tier Mapping | ρ-Class | Lifecycle | Entry Count | Notes |
|---|---|---|---|---|---|
| *(no operational domains)* | — | — | — | — | Zero domains established under grammar layer |

**Recommended initial domains** (from Live Ledger Précis, mapped to tier model):

| Candidate Domain | Tier Mapping | ρ-Class | Status |
|---|---|---|---|
| CAPABILITIES | Tier 4 (multi-class) | high-ρ | not yet created |
| TOKEN-ECONOMICS | Tier 4 (multi-class) | high-ρ | not yet created |
| HARNESS-CONFIG | Tier 4 (coding harnesses) | high-ρ | not yet created |
| TOOL-ECOSYSTEM | Tier 4 (multi-class) | high-ρ | not yet created |
| PROMPTING-CONSENSUS | Tier 4 (reasoning surfaces) | high-ρ | not yet created |
| COMMUNITY-SENTIMENT | Tier 4 (multi-class) | high-ρ | not yet created |
| FIELD-TRAJECTORY | Tier 1 | moderate-ρ | not yet created |
| MODEL-CONFIG | Tier 4 (reasoning surfaces) | high-ρ | not yet created |
| CONTEXT-ENGINEERING | Tier 4 (multi-class) | moderate-ρ | not yet created |
| MEMORY-ARCHITECTURE | Tier 4 (model-routing) | moderate-ρ | not yet created |
| MULTI-AGENT-ORCHESTRATION | Tier 5 | high-ρ | not yet created |
| REPO-EPISTEMOLOGY | Tier 2 | low-ρ | not yet created |

These are reference candidates, not mandated domains. Domain creation follows DELTA-METABOLISM.md § 2.

---

## § 5. Maintenance Rules

### 5.1 Trigger-Based Updates

The matrix is updated when any of the following occurs: a new grammar document is ratified (Axis 1 Tier 2 advances), a scaffold is produced or remediated (Axis 2 entry created or updated), a method advances in authority level (Axis 3 updated), a delta domain is created or compacted (Axis 4 entry created or updated), or a surface is added to or removed from the Teleology Registry (Axis 2 entry added).

Each update records what changed, what triggered the change, and the date. Updates are incremental — only affected entries are modified.

### 5.2 Comprehensive Re-Assessment

The matrix is re-assessed comprehensively at quarterly intervals. The re-assessment reviews all entries across all axes, verifies that maturity levels still reflect structural reality, and identifies entries that have gone stale (maturity levels that were accurate at last assessment but may have changed due to external events).

### 5.3 Assessment Authority

The human operator is the assessment authority. Maturity levels are assigned by operator judgment applying the criteria defined in upstream grammar documents. Automated checks (twelve-check pass counts, freshness computations, method invocation counts) inform the assessment but do not determine it. The operator's judgment resolves cases where structural criteria are ambiguous or where a maturity level sits on the boundary between two grades.

---

*Assessment as of 2026-03-13: all sections drafted. Pending operator review and ratification. The initial population (§ 4) is the highest-stakes section — it makes explicit for the first time the full scope of the institution's scaffold-coverage gaps and temporal-track emptiness. The surface-to-scaffold lookup (Axis 2) is now functional: any surface identifier can be queried against the registry to find its covering scaffold or an explicit gap marker.*
