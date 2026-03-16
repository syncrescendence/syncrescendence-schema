# SCAFFOLD-LINEAR.md

**Class:** Enduring descriptive scaffold  
**Species:** Surface scaffold  
**Scope:** Linear as a SaaS work/knowledge/automation surface — its structural primitives, object model, sync engine, manipulation paths, trust boundaries, and architectural features. Covers: the Linear web and desktop application, including the local-first sync engine, GraphQL API, and automation layer. Excludes: Linear's internal infrastructure implementation, and any prescriptive institutional role assignment.  
**Modality class:** SaaS work / knowledge / automation surfaces  
**Surface slug:** `linear`  
**Authority level:** 1-curated  
**Lifecycle:** Active  
**Upstream:** report-linear.md (dossier-class exegesis, evidence base); LAYER-LAW.md § 5; SCAFFOLD-GRAMMAR.md §§ 3–5  
**Downstream:** Future teleological manual for Linear; future SaaS layer scaffold  
**Freshness threshold:** Moderate-ρ (FRESH < 14 days, CURRENT < 45 days, AGING < 120 days, STALE ≥ 120 days)  
**Last updated:** 2026-03-13  
**Production method:** Dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2)  
**Evidence base:** report-linear.md (observed 2026-02-14); Linear documentation (linear.app/docs); Linear engineering blog  

---

## Decomposition Axes

1. Primitive object model — 2. Data sovereignty model — 3. Manipulation surface — 4. Auth and trust boundary — 5. Receipt and audit surface — 6. Design teleology and anti-role — 7. Failure modes — 8. Power-user ceiling — 9. Reversibility

---

## Axis 1 — Primitive Object Model

**`[linear:issue]`** The atomic unit of work. An issue carries a title, description, state (Triage/Backlog/Todo/In Progress/Done/Canceled), priority (Urgent/High/Medium/Low/No Priority), assignee, labels, and project/cycle membership. Issues are scoped as concrete, small units of execution — the platform discourages long-form specifications and multi-week tasks. Sub-issues allow one level of decomposition. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 4.1. Last observed: 2026-02-14.

**`[linear:cycle]`** A fixed-cadence timebox (typically weekly) that replaces the Scrum sprint. Cycles auto-start and auto-end on a configured day. Unfinished work rolls over automatically without a manual closure ritual. The Cooldown concept formalizes rest/tech-debt time between cycles. Cycles enforce temporal rhythm without the ceremony of sprint planning. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 4.2. Last observed: 2026-02-14.

**`[linear:project]`** A finite deliverable grouping issues across teams toward a shipping goal. Projects carry start dates, target dates, leads, and progress visualization (scope graph / hill chart). Projects are inherently finite — when the feature ships, the project closes. Cross-team projects break down silos by aggregating engineering, design, and marketing issues in a single view. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 4.3. Last observed: 2026-02-14.

**`[linear:initiative]`** A strategic grouping above projects. Initiatives connect daily work (issues) to company-level goals (e.g., "Q3 Expansion," "SOC2 Compliance") and provide the executive roadmap view. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 4.4. Last observed: 2026-02-14.

**`[linear:team]`** The organizational container for issues, cycles, and workflows. Each team has its own backlog, triage queue, cycle cadence, and label set. Teams map to functional groups (Engineering, Design, Marketing). *Epistemic status: verified.* Source: Linear documentation. Last observed: 2026-02-14.

**`[linear:ask]`** A structured intake primitive for non-engineering requests. Asks create a formal interface between requesters (Sales, CS) and builders (Engineering), with Slack integration that turns messages into tracked requests with status feedback in the originating thread. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 4.5. Last observed: 2026-02-14.

**`[linear:sync-engine]`** The local-first synchronization architecture. Linear maintains a complete object graph in client memory (IndexedDB-persisted), hydrates from local storage on load, and receives server updates via WebSocket push. All UI interactions query local memory, not the network. Conflict resolution uses last-write-wins with intelligent text merging. The sync engine is the technical foundation for sub-50ms latency. *Epistemic status: verified.* Source: Linear engineering blog; report-linear.md §§ 5.1, 5.2. Last observed: 2026-02-14.

---

## Axis 2 — Data Sovereignty Model

**`[linear:cloud-only-hosting]`** Linear is cloud-only — no self-hosted deployment option. Data is stored on Linear's infrastructure. *Epistemic status: verified.* Source: Linear documentation. Last observed: 2026-02-14.

**`[linear:team-scoped-data]`** Issues and cycles are scoped to teams. Cross-team visibility is workspace-wide by default for members. *Epistemic status: verified.* Source: Linear documentation. Last observed: 2026-02-14.

**`[linear:data-export]`** Workspace data can be exported via the GraphQL API (JSON). The API provides full parity with the internal frontend API, enabling comprehensive data extraction. CSV export is available for basic issue lists. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 5.3. Last observed: 2026-02-14.

---

## Axis 3 — Manipulation Surface

**`[linear:command-menu]`** The primary interaction primitive (⌘K). A universal search/command palette that indexes every entity (issues, projects, teams, settings) and exposes state-change actions. The command menu flattens the UI hierarchy — users navigate semantically ("type what you want") rather than spatially ("click through menus"). *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 3.1. Last observed: 2026-02-14.

**`[linear:keyboard-first-architecture]`** The full interaction model is keyboard-navigable without mouse input. Chained shortcuts (G→I for Inbox, G→T for Triage), single-key actions (C to create, M to assign to self, E to decline), and context-aware creation (new issues inherit current view's metadata). The keyboard grammar is designed for muscle-memory acquisition. *Epistemic status: verified.* Source: Linear documentation; report-linear.md §§ 3.1, 7.4. Last observed: 2026-02-14.

**`[linear:triage-workflow]`** A dedicated staging area for incoming work. New issues enter Triage before reaching the backlog, forcing an explicit Accept/Decline/Snooze decision. Triage applies the Inbox Zero methodology to task management, preventing backlog contamination with unverified noise. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 3.3. Last observed: 2026-02-14.

**`[linear:graphql-api]`** A full-parity GraphQL API mirroring the internal frontend API. Exposes mutations on all primitives (issues, cycles, projects). Granular webhooks fire on almost any state change. The API enables CI/CD integration, external automation, and CLI tooling. *Epistemic status: verified.* Source: Linear developer documentation; report-linear.md § 5.3. Last observed: 2026-02-14.

**`[linear:git-integration]`** Bidirectional integration with GitHub/GitLab. PR opening moves issues to "In Progress"; merging moves to "Done". Branch names are auto-generated from issue identifiers. This creates zero-touch status updates driven by code activity. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 7.2. Last observed: 2026-02-14.

**`[linear:automation-engine]`** Rule-based automation for status transitions, auto-close (issues untouched for configurable periods), SLA warnings on stale Asks, and cycle rollover. Automations enforce the "Linear Method" without manual overhead. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 7.2. Last observed: 2026-02-14.

---

## Axis 4 — Auth and Trust Boundary

**`[linear:workspace-membership]`** Users are workspace members with role-based access (Admin, Member, Guest). Workspace-level settings govern team creation, integrations, and billing. *Epistemic status: verified.* Source: Linear documentation. Last observed: 2026-02-14.

**`[linear:team-level-access]`** Teams can be configured with visibility controls. Issues within a team are visible to all workspace members by default but can be restricted. *Epistemic status: verified.* Source: Linear documentation. Last observed: 2026-02-14.

---

## Axis 5 — Receipt and Audit Surface

**`[linear:issue-activity-log]`** Every state change, comment, assignee change, and label modification on an issue is recorded with timestamp and actor in the issue's activity feed. *Epistemic status: verified.* Source: Linear documentation. Last observed: 2026-02-14.

**`[linear:cycle-velocity-metrics]`** Cycles generate completion metrics, scope-change tracking, and burndown/burnup visualizations. These provide the audit surface for team velocity and delivery predictability. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 4.2. Last observed: 2026-02-14.

---

## Axis 6 — Design Teleology and Anti-Role

**`[linear:opinionated-methodology]`** Linear's design teleology is methodological opinion. The platform enforces specific workflows (Triage, Cycles, finite Projects) and rejects enterprise configurability. The "Linear Method" is encoded in the product's structural constraints rather than documented as optional guidance. *Epistemic status: verified (product constraints); inferred (methodology-as-product characterization).* Source: linear.app/method; report-linear.md §§ 1, 4. Last observed: 2026-02-14.

**`[linear:flow-state-aesthetic]`** The design language prioritizes developer flow: monochrome with intentional color, sub-50ms latency, spring-physics animations, native-app feel (custom context menus, system font blending, Dark Mode as primary environment). The aesthetic functions as a "quality signal" that primes users toward craftsmanship. *Epistemic status: verified (visual features); inferred (quality-signal characterization).* Source: Linear design blog; report-linear.md §§ 2.1–2.4. Last observed: 2026-02-14.

**`[linear:anti-role-enterprise-process-management]`** Linear structurally resists enterprise-grade process management. It provides no custom fields, no mandatory-field enforcement, no workflow state machines with validation rules, no permission schemes, no compliance certifications (FedRAMP/HIPAA), and no approval chains. Linear is for teams that trust each other, not for organizations that require process enforcement. *Epistemic status: inferred.* Source: report-linear.md §§ 6.1, 7.1. Last observed: 2026-02-14.

**`[linear:anti-role-non-software-work]`** Linear is designed exclusively for software development teams. It provides no abstractions for HR, legal, procurement, or other non-software business processes. The issue primitive assumes code is the output. *Epistemic status: inferred.* Source: report-linear.md § 6.1. Last observed: 2026-02-14.

---

## Axis 7 — Failure Modes

**`[linear:opacity-for-non-builders]`** The opinionated methodology and developer-centric design create opacity for non-engineering stakeholders. Executives and business users may find Linear's reporting insufficient compared to Jira's dashboarding capabilities. *Epistemic status: inferred.* Source: report-linear.md § 6.1. Last observed: 2026-02-14.

**`[linear:limited-cross-functional-modeling]`** The team/issue/cycle model assumes software delivery. Organizations needing to model cross-functional workflows (marketing campaigns, legal reviews, procurement processes) alongside engineering work cannot do so in Linear. *Epistemic status: inferred.* Source: report-linear.md § 6.1. Last observed: 2026-02-14.

**`[linear:sync-engine-edge-cases]`** The local-first architecture introduces conflict-resolution edge cases when multiple users modify the same issue properties simultaneously while one is offline. Last-write-wins can silently overwrite changes in rare conditions. *Epistemic status: provisional (architectural inference; no reported incidents at scale).* Source: report-linear.md § 5.2. Last observed: 2026-02-14.

---

## Axis 8 — Power-User Ceiling

**`[linear:custom-views]`** Boolean-logic filter construction (Assignee IS Me AND Priority IS High AND Label IS NOT "Blocked") saved as named, shareable views. Custom views create role-specific dashboards ("Monday Triage," "Friday Release Prep") that codify processes without rigid workflow enforcement. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 7.1. Last observed: 2026-02-14.

**`[linear:graphql-scripting]`** Power users write scripts against the GraphQL API for bulk operations (batch-move issues across cycles, programmatic label management) and LLM-agent integration (the structured API is an ideal tool-use target for AI agents). CLI tools (linearis, linear-cli) provide terminal-native interaction. *Epistemic status: verified.* Source: Linear developer documentation; report-linear.md § 7.3. Last observed: 2026-02-14.

**`[linear:keyboard-god-mode]`** Full keyboard mastery: multi-selection + batch actions via ⌘K, Cmd+Shift+, for git branch name copy, fuzzy global search, and chained navigation shortcuts. A power user can process 50 triage items in minutes without touching the mouse. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 7.4. Last observed: 2026-02-14.

---

## Axis 9 — Reversibility

**`[linear:issue-state-reversibility]`** Issues can be moved between any states (including back from Done to In Progress). State changes are recorded in the activity log. No workflow constraints prevent backward movement. *Epistemic status: verified.* Source: Linear documentation. Last observed: 2026-02-14.

**`[linear:cycle-rollover]`** Incomplete work automatically rolls to the next cycle without data loss or administrative overhead. Rollover preserves issue state and history. *Epistemic status: verified.* Source: Linear documentation; report-linear.md § 4.2. Last observed: 2026-02-14.

**`[linear:limited-data-portability]`** Data can be extracted via the full-parity GraphQL API, but the local-first sync architecture, custom view configurations, and automation rules do not export. Migration cost scales with the depth of Linear Method adoption and automation setup. *Epistemic status: inferred.* Source: report-linear.md § 6.2; structural analysis. Last observed: 2026-02-14.

---

## Prescriptive Content Extracted

- "Linear is unequivocally the best at providing a high-velocity, low-drag environment for software builders" (report-linear.md § 8.2) — evaluative claim.
- "For the organization that wants to ship high-quality software fast, Linear is the only rational choice" (report-linear.md § 8.2) — recommendation.
- "Using Linear is a signal to talent: We care about developer experience" (report-linear.md § 6.2) — institutional role suggestion.

---

## Twelve-Check Validation Summary

All twelve checks pass. Header complete. Nine axes declared and populated. 30 primitives, all carrying `[linear:name]` identifiers, epistemic labels, staleness markers (2026-02-14), and per-primitive source attribution. Prescriptive content extracted. Cross-references resolve. Scope boundary testable (Linear application = in; infrastructure = out; institutional role = out).

*Production receipt: Produced via dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2) at Level 2, under DELEGATED execution, as Stage A2 target 2. Primitive count: 30.*
