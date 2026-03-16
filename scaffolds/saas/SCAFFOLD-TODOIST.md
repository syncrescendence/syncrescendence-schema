# SCAFFOLD-TODOIST.md

**Class:** Enduring descriptive scaffold | **Species:** Surface scaffold
**Scope:** Todoist as a SaaS work/knowledge/automation surface — its structural primitives, task-capture architecture, filter system, manipulation paths, trust boundaries, and architectural features. Covers: Todoist across web, desktop, and mobile clients, including NLP Quick Add, filter query language, Karma gamification, Sync API, and AI Assist. Excludes: Doist's other products (Twist), and any prescriptive institutional role assignment.
**Modality class:** SaaS work / knowledge / automation surfaces | **Surface slug:** `todoist`
**Authority level:** 1-curated | **Lifecycle:** Active
**Upstream:** report-todoist.md (observed 2026-02-14); SCAFFOLD-GRAMMAR.md §§ 3–5
**Downstream:** SCAFFOLD-SAAS-LAYER.md; future teleological manual
**Freshness threshold:** Moderate-ρ | **Last updated:** 2026-03-13
**Production method:** Dossier-to-scaffold conversion at Level 2, DELEGATED
**Evidence base:** report-todoist.md; Todoist Help Center; Todoist developer documentation

---

## Axis 1 — Primitive Object Model

**`[todoist:task]`** The atomic unit. A rich object carrying content, description, temporal metadata (due date/time, fixed or floating), priority (P1–P4 with color coding), parent/child relationships (sub-tasks with shallow nesting encouraged), labels, project membership, and assignee. Tasks are existentially independent — they can exist without a project (living in Inbox), without a date, or without a label. *Epistemic: verified. Source: Todoist docs; report § 3.1. Observed: 2026-02-14.*

**`[todoist:project]`** Primary organizational silo representing distinct outcomes or areas of responsibility. Projects support hierarchical nesting (Work > Marketing > Q1 Campaign). Color-coded. Support Board view (Kanban), List view, and Calendar view. *Epistemic: verified. Source: Todoist docs; report § 3.2. Observed: 2026-02-14.*

**`[todoist:section]`** Sub-divider within a project, grouping tasks into named stages or categories. Sections create visual/logical partitions without requiring sub-projects. *Epistemic: verified. Source: Todoist docs; report § 3.2. Observed: 2026-02-14.*

**`[todoist:label]`** Cross-cutting categorization tag. Labels function as GTD "contexts" (@office, @phone, @errands) and can be used as filter predicates. Flat namespace (no nesting). *Epistemic: verified. Source: Todoist docs; report § 3.3. Observed: 2026-02-14.*

**`[todoist:filter]`** Saved boolean-logic queries over the task database. Filter syntax supports AND/OR/NOT operators, field predicates (priority, due date, label, project, assignee, creation date), and temporal functions (today, overdue, next 7 days). Filters are the primary power-user manipulation surface. *Epistemic: verified. Source: Todoist docs; report § 3.4. Observed: 2026-02-14.*

**`[todoist:comment]`** Per-task threaded discussion with file attachments and voice notes. Comments provide the contextual annotation layer. *Epistemic: verified. Source: Todoist docs. Observed: 2026-02-14.*

## Axis 2 — Data Sovereignty Model

**`[todoist:cloud-native-sync]`** Cloud-hosted with Sync API (v9) providing real-time bidirectional synchronization across all clients. Incremental sync using sync tokens. No self-hosted option. *Epistemic: verified. Source: Todoist developer docs; report § 4. Observed: 2026-02-14.*

## Axis 3 — Manipulation Surface

**`[todoist:nlp-quick-add]`** Natural language processing for task creation. "Buy milk every 3rd Monday at 5pm #Errands p1" parses into structured task metadata (title, recurrence, time, label, priority). The fastest capture path in the class — designed to make recording faster than forgetting. Global keyboard shortcut across all clients. *Epistemic: verified. Source: Todoist docs; report § 3.1. Observed: 2026-02-14.*

**`[todoist:filter-query-language]`** Boolean-logic query syntax: `(today & p1) | (@urgent & overdue)`. Supports nested expressions, temporal predicates, label/project/assignee filtering. Power users construct "perspectives" (Eat the Frog, Friday Review, Quick Wins). *Epistemic: verified. Source: Todoist docs; report §§ 3.4, 9.2. Observed: 2026-02-14.*

**`[todoist:rest-sync-api]`** REST API and Sync API (v9) for external automation, Zapier/IFTTT integration, and custom tooling. Community MCP server implementations exist for AI agent integration. *Epistemic: verified. Source: Todoist developer docs; report § 6. Observed: 2026-02-14.*

**`[todoist:keyboard-shortcuts]`** Comprehensive keyboard navigation: Q (Quick Add), Cmd+K (Command Palette on web), navigation shortcuts for project/filter jumping. *Epistemic: verified. Source: Todoist docs; report § 9.1. Observed: 2026-02-14.*

**`[todoist:ai-assist]`** AI-powered task suggestions, due date recommendations, and task decomposition. Emerging feature. *Epistemic: verified (feature existence); provisional (actively evolving). Source: Todoist docs; report § 7. Observed: 2026-02-14.*

## Axis 4 — Auth and Trust Boundary

**`[todoist:workspace-sharing]`** Shared projects with collaborator roles (can edit, can view). Team workspaces for organizational use. *Epistemic: verified. Source: Todoist docs. Observed: 2026-02-14.*

## Axis 5 — Receipt and Audit Surface

**`[todoist:activity-log]`** Per-project activity log recording task creation, completion, edits, and comments with timestamps. *Epistemic: verified. Source: Todoist docs. Observed: 2026-02-14.*

**`[todoist:karma-gamification]`** Productivity visualization system with points, levels (Beginner → Enlightened), streak tracking, and trend charts. Gamifies task completion for retention. Dopamine loop reinforcing capture-and-complete habit. *Epistemic: verified. Source: Todoist docs; report § 2.3. Observed: 2026-02-14.*

**`[todoist:completed-tasks-archive]`** Searchable archive of completed tasks with completion timestamps. Provides productivity history. *Epistemic: verified. Source: Todoist docs. Observed: 2026-02-14.*

## Axis 6 — Design Teleology and Anti-Role

**`[todoist:frictionless-capture-teleology]`** Todoist's design teleology is that utility is inversely proportional to input friction. Every design decision (NLP parsing, global shortcuts, Quick Add, cross-platform native feel via Crocus design system) optimizes for the speed of capturing a thought. *Epistemic: verified (product features); inferred (teleological characterization). Source: report §§ 1, 2.1, 3.1. Observed: 2026-02-14.*

**`[todoist:cognitive-functionalism-aesthetic]`** Visual design subordinated to data display. Crocus design system achieves native feel per platform (iOS swipes, desktop keyboard-centric). Whitespace as navigational primitive. Priority colors as the primary visual signal. *Epistemic: verified (visual features); inferred (functionalism characterization). Source: report §§ 2.1–2.2. Observed: 2026-02-14.*

**`[todoist:anti-role-project-management]`** No Gantt charts, no resource allocation, no workflow state machines, no time tracking, no sprint management. Todoist is a personal/team task capture system, not an enterprise project management platform. *Epistemic: inferred. Source: report §§ 5, 6. Observed: 2026-02-14.*

**`[todoist:anti-role-document-authoring]`** No document/wiki surface. Task descriptions support basic formatting but Todoist does not function as a knowledge base. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-14.*

## Axis 7 — Failure Modes

**`[todoist:flat-label-limitation]`** Labels are flat (no hierarchy), limiting complex contextual categorization compared to TickTick's nested tags. *Epistemic: verified. Source: report § 5. Observed: 2026-02-14.*

**`[todoist:inbox-accumulation]`** The ease of capture creates inbox accumulation — tasks dumped into Inbox without processing. The GTD "process" phase requires discipline the tool does not enforce. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-14.*

## Axis 8 — Power-User Ceiling

**`[todoist:filter-perspective-construction]`** Power users construct saved filters as "perspectives" for different work modes: "Eat the Frog" (today & p1), "Friday Review" (created: -7 days), "Quick Wins" (label duration filters). The filter query language is the primary power-user differentiator. *Epistemic: verified. Source: report §§ 3.4, 9.2. Observed: 2026-02-14.*

**`[todoist:api-automation-integration]`** Sync API enables custom productivity dashboards, Zapier/IFTTT workflows, and MCP server integration for AI agents. Community maintains active automation ecosystem. *Epistemic: verified. Source: Todoist developer docs; report § 6. Observed: 2026-02-14.*

## Axis 9 — Reversibility

**`[todoist:low-structural-lock-in]`** Task data exports via API (JSON) or CSV. The flat task/project/label model is structurally portable. Lock-in is in filter configurations and Karma history, not data complexity. *Epistemic: inferred. Source: structural analysis. Observed: 2026-02-14.*

---

## Twelve-Check Validation Summary
All twelve checks pass. 25 primitives. Nine axes populated.

*Production receipt: Stage A3 target 3. Primitive count: 25.*
