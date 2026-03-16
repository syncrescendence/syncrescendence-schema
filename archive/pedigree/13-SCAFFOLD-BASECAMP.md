# SCAFFOLD-BASECAMP.md

**Class:** Enduring descriptive scaffold | **Species:** Surface scaffold
**Scope:** Basecamp as a SaaS work/knowledge/automation surface — its structural primitives, opinionated methodology, manipulation paths, trust boundaries, and architectural features. Covers: Basecamp 4 including the Project Capsule model, six core tools, Hill Charts, Card Table, Doors, and API. Excludes: HEY email, 37signals' other products, and any prescriptive institutional role assignment.
**Modality class:** SaaS work / knowledge / automation surfaces | **Surface slug:** `basecamp`
**Authority level:** 1-curated | **Lifecycle:** Active
**Upstream:** report-basecamp.md (observed 2026-02-17); SCAFFOLD-GRAMMAR.md §§ 3–5
**Downstream:** SCAFFOLD-SAAS-LAYER.md; future teleological manual
**Freshness threshold:** Moderate-ρ | **Last updated:** 2026-03-13
**Production method:** Dossier-to-scaffold conversion at Level 2, DELEGATED
**Evidence base:** report-basecamp.md; Basecamp documentation; Shape Up documentation

---

## Axis 1 — Primitive Object Model

**`[basecamp:project-capsule]`** Atomic organizational unit — a walled-garden container holding all tools, files, and conversations for a specific undertaking. Projects enforce spatial insulation. Every content item has a permanent URL. *Epistemic: verified. Source: Basecamp docs; report § 2.1. Observed: 2026-02-17.*

**`[basecamp:message-board]`** Asynchronous long-form communication. Rich-text editor (Trix) encouraging paragraphs/headers. Posts require titles (forcing complete-thought formulation). "Boosts" provide acknowledgment without notification overhead. *Epistemic: verified. Source: Basecamp docs; report § 2.2.1. Observed: 2026-02-17.*

**`[basecamp:todo-list]`** Task containers functioning as "Scopes" in Shape Up. Threaded discussion on each item, multi-person assignment, file attachments. Lists represent discrete completable bodies of work. *Epistemic: verified. Source: Basecamp docs; report § 2.2.2. Observed: 2026-02-17.*

**`[basecamp:campfire]`** Project-scoped ephemeral chat. Contained within the project capsule, invisible outside. Important decisions expected to be promoted to Message Board. *Epistemic: verified. Source: Basecamp docs; report § 2.2.4. Observed: 2026-02-17.*

**`[basecamp:docs-files]`** File storage with color-coded folders, visual tile grid, version history as narrative timeline, in-place replacement preserving discussion threads. *Epistemic: verified. Source: Basecamp docs; report § 2.2.3. Observed: 2026-02-17.*

**`[basecamp:schedule]`** Agenda-style shared milestone/deadline primitive with external calendar integration (iCal). Focuses on shared milestones, not individual time-blocking. *Epistemic: verified. Source: Basecamp docs; report § 2.2.5. Observed: 2026-02-17.*

**`[basecamp:automatic-check-ins]`** Asynchronous stand-up replacement. Scheduled questions at configurable intervals aggregated into reports. *Epistemic: verified. Source: Basecamp docs; report § 2.2.6. Observed: 2026-02-17.*

**`[basecamp:hill-chart]`** Uncertainty visualization mapping work onto a bell curve: uphill (figuring out) → top (unknowns solved) → downhill (executing). Manual dot-dragging captures human judgment about confidence. Derived from Shape Up. *Epistemic: verified. Source: Basecamp docs; report § 2.3. Observed: 2026-02-17.*

**`[basecamp:card-table]`** Project-scoped Kanban board for process flow visualization, integrated with to-do primitives. *Epistemic: verified. Source: Basecamp docs; report § 2.4. Observed: 2026-02-17.*

**`[basecamp:doors]`** Integration primitive embedding links to external services as portal elements within the project capsule. Positions Basecamp as the "launcher" for specialized external tools. *Epistemic: verified. Source: Basecamp docs; report § 2.5. Observed: 2026-02-17.*

**`[basecamp:lineup]`** Timeline meta-view of all active projects showing start/end dates. Visualizes capacity at the organizational level. *Epistemic: verified. Source: report § 4.3. Observed: 2026-02-17.*

**`[basecamp:mission-control]`** Health dashboard aggregating Hill Chart data and deadline status to flag projects falling behind. Management-by-exception tool. *Epistemic: verified. Source: report § 4.3. Observed: 2026-02-17.*

## Axis 2 — Data Sovereignty Model

**`[basecamp:cloud-hosted-monolith]`** Cloud-only. Ruby on Rails "Majestic Monolith" with Hotwire/Turbo server-rendered HTML. No self-hosted deployment. *Epistemic: verified. Source: report § 3.1. Observed: 2026-02-17.*

## Axis 3 — Manipulation Surface

**`[basecamp:jump-menu]`** ⌘J keyboard navigation for instant cross-project teleportation. *Epistemic: verified. Source: report § 6.1. Observed: 2026-02-17.*

**`[basecamp:rest-api]`** REST API (bc3-api) enabling custom reporting, automated nudges, and external BI integration. *Epistemic: verified. Source: Basecamp API docs; report § 6.2. Observed: 2026-02-17.*

**`[basecamp:hey-notification-center]`** Centralized notification aggregation ("Hey!" menu) replacing per-project red-dot alerts. Converts interrupts into user-initiated feed. *Epistemic: verified. Source: report § 3.3. Observed: 2026-02-17.*

## Axis 4 — Auth and Trust Boundary

**`[basecamp:client-toggle]`** Per-item visibility toggle (Visible to Client / Private to Team). Creates backstage/front-stage separation without duplicate projects. *Epistemic: verified. Source: report § 4.2. Observed: 2026-02-17.*

**`[basecamp:account-project-access]`** Roles: Owner, Admin, Member. Access granted at account/project level. No per-project permission schemes. *Epistemic: verified. Source: Basecamp docs. Observed: 2026-02-17.*

## Axis 5 — Receipt and Audit Surface

**`[basecamp:contextual-discussion-attachment]`** Discussion attached to artifacts (files, to-dos, messages) rather than in side channels. Creates persistent contextual audit trail. *Epistemic: verified. Source: report § 4.1. Observed: 2026-02-17.*

**`[basecamp:version-history]`** File version history and message edit tracking. *Epistemic: verified. Source: Basecamp docs. Observed: 2026-02-17.*

## Axis 6 — Design Teleology and Anti-Role

**`[basecamp:opinionated-rigidity]`** Convention over configuration. Fixed tools in every project. No custom fields, no workflow FSMs, no configurable dashboards. The "anti-Jira" position. *Epistemic: verified (product structure); inferred (anti-Jira characterization). Source: report §§ 5.1, 7. Observed: 2026-02-17.*

**`[basecamp:shape-up-encoding]`** Physical manifestation of Shape Up methodology. Hill Charts, Scopes, and Cooldowns are Shape Up concepts encoded in the product. Methodology-tool coupling is the primary moat. *Epistemic: verified. Source: Shape Up docs; report § 5.2. Observed: 2026-02-17.*

**`[basecamp:calm-design-philosophy]`** Aesthetic/interaction design optimizing for reduced anxiety: hand-drawn illustrations, generous whitespace, centralized notifications, asynchronous-first communication. *Epistemic: verified (features); inferred (philosophy characterization). Source: report §§ 3, 3.2, 3.3. Observed: 2026-02-17.*

**`[basecamp:anti-role-granular-analytics]`** No cross-project Gantt charts, resource utilization reports, sprint velocity metrics, or time tracking. *Epistemic: inferred. Source: report §§ 5.1, 6.2. Observed: 2026-02-17.*

## Axis 7 — Failure Modes

**`[basecamp:limited-structural-complexity]`** Flat project model and lack of custom fields/workflows limit applicability for complex cross-functional organizations. *Epistemic: inferred. Source: report § 5.1. Observed: 2026-02-17.*

**`[basecamp:reporting-ceiling]`** Native reporting limited to Mission Control and Lineup. Advanced analytics require API extraction to external tools. *Epistemic: inferred. Source: report § 6.2. Observed: 2026-02-17.*

## Axis 8 — Power-User Ceiling

**`[basecamp:api-driven-reporting]`** Custom dashboards via API extraction to external BI tools. Automated scripts for overdue-task reminders and Hill Chart nudges. *Epistemic: verified. Source: report § 6.2. Observed: 2026-02-17.*

**`[basecamp:notification-hygiene-mastery]`** Notification schedules, Focus Mode, "Quietly Follow" for attention management at organizational scale. *Epistemic: verified. Source: report § 6.3. Observed: 2026-02-17.*

## Axis 9 — Reversibility

**`[basecamp:methodology-lock-in]`** Shape Up methodology coupling: leaving Basecamp means abandoning the encoded workflow structure. *Epistemic: inferred. Source: report § 5.2. Observed: 2026-02-17.*

**`[basecamp:low-data-lock-in]`** Flat data model exports cleanly via API. Structural lock-in is in methodology, not data complexity. *Epistemic: inferred. Source: structural analysis. Observed: 2026-02-17.*

---

## Prescriptive Content Extracted
- "Basecamp is unequivocally the best at protecting the team's attention" (report § 7).
- "For the Wizard, maximum leverage through mastery of attention" (report § 7).

## Twelve-Check Validation Summary
All twelve checks pass. 30 primitives. All `[basecamp:name]` format, unique, labeled, timestamped, attributed. Nine axes populated. Scope boundary testable.

*Production receipt: Stage A3 target 1. Primitive count: 30.*
