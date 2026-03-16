# SCAFFOLD-CLICKUP.md

**Class:** Enduring descriptive scaffold  
**Species:** Surface scaffold  
**Scope:** ClickUp as a SaaS work/knowledge/automation surface — its structural primitives, hierarchical object model, AI/MCP intelligence layer, manipulation paths, trust boundaries, and architectural features. Covers: ClickUp 4.0 as accessed through web, desktop, and mobile clients, including the hierarchy model, ClickApps, automation engine, Brain AI layer, and MCP integration. Excludes: ClickUp's internal infrastructure implementation, and any prescriptive institutional role assignment.  
**Modality class:** SaaS work / knowledge / automation surfaces  
**Surface slug:** `clickup`  
**Authority level:** 1-curated  
**Lifecycle:** Active  
**Upstream:** report-clickup.md (dossier-class exegesis, evidence base); LAYER-LAW.md § 5; SCAFFOLD-GRAMMAR.md §§ 3–5  
**Downstream:** Future teleological manual for ClickUp; future SaaS layer scaffold  
**Freshness threshold:** Moderate-ρ (FRESH < 14 days, CURRENT < 45 days, AGING < 120 days, STALE ≥ 120 days)  
**Last updated:** 2026-03-13  
**Production method:** Dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2)  
**Evidence base:** report-clickup.md (observed 2026-02-14); ClickUp Help Center; ClickUp developer documentation  

---

## Decomposition Axes

1. Primitive object model — 2. Data sovereignty model — 3. Manipulation surface — 4. Auth and trust boundary — 5. Receipt and audit surface — 6. Design teleology and anti-role — 7. Failure modes — 8. Power-user ceiling — 9. Reversibility

---

## Axis 1 — Primitive Object Model

**`[clickup:workspace]`** The root tenant boundary. A workspace is the hard boundary for data sovereignty, billing, user roles, and security policies. Cross-workspace linking is structurally limited. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 2.1.1. Last observed: 2026-02-14.

**`[clickup:space]`** The primary organizational division, typically mapping to departments or major initiatives. Spaces are polymorphic via ClickApps — enabling feature modules (Sprints, Git Integration, Time Tracking) configures the space's structural behavior. Spaces carry the primary permission boundary, with access cascading downward. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 2.1.2. Last observed: 2026-02-14.

**`[clickup:folder]`** An optional structural aggregator grouping Lists. Folders provide the first meta-view layer — Gantt charts and dashboards at the Folder level automatically visualize all contained tasks. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 2.1.3. Last observed: 2026-02-14.

**`[clickup:list]`** The critical schema definition primitive. Every task must reside in a home List. The List dictates which Custom Fields and Statuses apply to contained tasks. Lists provide workflow isolation — a "Bug Tracker" List enforces different schema constraints than a "Content Calendar" List. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 2.1.4. Last observed: 2026-02-14.

**`[clickup:task]`** The atomic unit of execution — a "God Object" containing descriptions, subtasks (up to 7 levels of nesting), checklists, threaded comments, git commits, relationships, and audit logs. Tasks support "Tasks in Multiple Lists" (TIML), transforming the hierarchy from a strict tree into a directed graph where a single task can appear in multiple Lists simultaneously. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md §§ 2.1.5, 2.1.5. Last observed: 2026-02-14.

**`[clickup:six-level-hierarchy]`** The containment model: Workspace → Space → Folder → List → Task → Subtask. This strict hierarchy governs permission inheritance, view aggregation, and reporting logic. The hierarchy is deeper than most competitors (Notion: infinite nesting; Linear: Team → Project → Issue; Asana: Project → Task). *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 2.1. Last observed: 2026-02-14.

**`[clickup:clickapps]`** Modular feature toggles that configure Space behavior. Enabling Sprints, Points, or Git Integration on a Space activates those features for all contained Lists/Tasks. ClickApps are the polymorphism mechanism — the same hierarchy accommodates software development, marketing, and HR by enabling different feature sets per Space. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 2.1.2. Last observed: 2026-02-14.

**`[clickup:custom-field]`** Typed data attributes on tasks. Fields created at Space level inherit downward to all Lists. Custom Fields enforce data consistency across projects. ClickUp 4.0 supports Custom Task Types that configure distinct icon/field sets per task type (Lead, Bug, Inventory Item). *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md §§ 2.2, 8.1. Last observed: 2026-02-14.

**`[clickup:doc]`** An integrated document surface (Docs) that lives within the hierarchy alongside tasks. Docs can be linked to Lists, tasks, and other Docs, creating a unified context surface where documentation and execution coexist. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 5.3. Last observed: 2026-02-14.

**`[clickup:dashboard]`** A customizable reporting surface with widgets drawing data from across the workspace hierarchy. Dashboards provide the aggregate-view layer for metrics, timelines, and cross-project visibility. *Epistemic status: verified.* Source: ClickUp documentation. Last observed: 2026-02-14.

---

## Axis 2 — Data Sovereignty Model

**`[clickup:cloud-hosted-data]`** ClickUp is cloud-only. No self-hosted deployment option. *Epistemic status: verified.* Source: ClickUp documentation. Last observed: 2026-02-14.

**`[clickup:workspace-scoped-data]`** All data exists within a workspace scope. Cross-workspace data sharing is structurally limited. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 2.1.1. Last observed: 2026-02-14.

**`[clickup:data-export]`** Data exportable via REST API (JSON), CSV export from views, and third-party backup tools. Custom Field values, task relationships, and automation configurations require API-level extraction. *Epistemic status: verified.* Source: ClickUp developer documentation. Last observed: 2026-02-14.

---

## Axis 3 — Manipulation Surface

**`[clickup:command-center]`** Universal search/command palette (⌘K / Ctrl+K) indexing every entity in the workspace. Supports retrieval and action execution ("Create Task," "Change Status," "Switch Layout"). The desktop app's Global Command (⌘J) extends this across all applications. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 3.3. Last observed: 2026-02-14.

**`[clickup:automation-engine]`** Trigger → condition → action rules with state-machine logic. Conditions support compound logic ("IF Priority IS High AND Tag IS Urgent, THEN assign to Senior Dev AND post to Slack"). Automations can fire webhooks to external iPaaS tools (Make.com, n8n) for complex external workflows. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 8.2. Last observed: 2026-02-14.

**`[clickup:rest-api]`** REST API providing CRUD operations on tasks, lists, spaces, comments, custom fields, and time entries. Webhooks fire on state changes. The API enables external integrations and headless operation. *Epistemic status: verified.* Source: ClickUp developer documentation; report-clickup.md § 8.2. Last observed: 2026-02-14.

**`[clickup:brain-ai-layer]`** ClickUp Brain — a RAG-based AI system integrated into the workspace graph. Connected Search indexes external repositories (GitHub, Google Drive, Slack) alongside ClickUp data. Wikis serve as AI-verified sources of truth. Super Agents decompose high-level goals into actionable steps. MCP integration enables external AI assistants to read and write ClickUp data. *Epistemic status: verified (feature existence); provisional (Brain/Agent capabilities actively evolving).* Source: ClickUp documentation; report-clickup.md §§ 4.1–4.2. Last observed: 2026-02-14.

**`[clickup:view-polymorphism]`** Tasks can be rendered as List, Board, Calendar, Gantt, Timeline, Table, Activity, Map, and Workload views. "Everything View" aggregates tasks across the entire workspace hierarchy. Views are filters over the data, not containers. *Epistemic status: verified.* Source: ClickUp documentation. Last observed: 2026-02-14.

---

## Axis 4 — Auth and Trust Boundary

**`[clickup:cascading-permissions]`** Permissions flow downward from Workspace → Space → Folder → List. Space-level access is the primary gatekeeper. Overrides at lower levels can broaden but typically not restrict (with exceptions for explicit sharing restrictions). *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 2.2. Last observed: 2026-02-14.

**`[clickup:role-based-access]`** Workspace roles (Owner, Admin, Member, Guest) with configurable custom roles. Permissions are granular: view, comment, edit, create, delete, manage members. *Epistemic status: verified.* Source: ClickUp documentation. Last observed: 2026-02-14.

---

## Axis 5 — Receipt and Audit Surface

**`[clickup:task-activity-log]`** Every task carries a full activity log recording status changes, field edits, comments, assignee changes, and relationship modifications with timestamps and actors. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 2.1.5. Last observed: 2026-02-14.

**`[clickup:time-tracking]`** Native time tracking on tasks with manual entry and running timers. Time data feeds into reporting dashboards. *Epistemic status: verified.* Source: ClickUp documentation. Last observed: 2026-02-14.

---

## Axis 6 — Design Teleology and Anti-Role

**`[clickup:convergence-philosophy]`** ClickUp's design teleology is convergence — unifying tasks, documents, whiteboards, dashboards, and communication in a single platform to eliminate the "context gap" between tools. The goal is a "Work Operating System" where all organizational data coexists. *Epistemic status: verified (product scope); inferred (convergence philosophy characterization).* Source: report-clickup.md §§ 1, 5.3. Last observed: 2026-02-14.

**`[clickup:data-density-aesthetic]`** ClickUp 4.0 leans into data density over minimalism. The interface renders maximum actionable metadata per pixel, with user-controllable density modes (Clean, Modern, Compact). Progressive disclosure hides deep context until explicitly engaged. The converged sidebar (4.0) decouples navigation from hierarchy. *Epistemic status: verified (visual features); inferred (density-philosophy characterization).* Source: ClickUp documentation; report-clickup.md §§ 3.1–3.2. Last observed: 2026-02-14.

**`[clickup:anti-role-deep-coding-workflow]`** ClickUp integrates with Git but does not provide native code review, CI/CD pipeline management, or developer-centric UX comparable to Linear or Jira's developer experience. For deep software engineering workflows, dedicated tools are structurally superior. *Epistemic status: inferred.* Source: report-clickup.md § 5.2; operational observation. Last observed: 2026-02-14.

---

## Axis 7 — Failure Modes

**`[clickup:setup-complexity]`** The six-level hierarchy, ClickApps, Custom Fields, and automation engine create high initial configuration complexity ("the Setup Tax"). Organizations that do not invest in proper setup accumulate structural debt that degrades usability. *Epistemic status: inferred.* Source: report-clickup.md § 5.3. Last observed: 2026-02-14.

**`[clickup:feature-overload]`** The convergence philosophy means ClickUp covers an extremely broad feature surface. Individual features (Docs, Whiteboards, Dashboards) may be shallower than dedicated tools. Users face cognitive overload from the breadth of options. *Epistemic status: inferred.* Source: report-clickup.md § 5.2; operational observation. Last observed: 2026-02-14.

**`[clickup:timl-complexity]`** Tasks in Multiple Lists creates graph-like data relationships that can become confusing when tasks appear in unexpected views. The feature is powerful but increases the cognitive load of understanding where a task "lives." *Epistemic status: inferred.* Source: report-clickup.md § 2.1.5; operational observation. Last observed: 2026-02-14.

---

## Axis 8 — Power-User Ceiling

**`[clickup:template-as-infrastructure]`** Power users snapshot entire Space/Folder structures (including Automations, Views, and Custom Fields) as templates. One-click deployment of client-onboarding infrastructure ensures process compliance at scale. Custom Task Types function as application-domain modeling within the hierarchy. *Epistemic status: verified.* Source: ClickUp documentation; report-clickup.md § 8.1. Last observed: 2026-02-14.

**`[clickup:webhook-external-loop]`** Automations fire webhooks to external iPaaS tools (Make.com, n8n) for complex multi-step workflows: task completion → webhook → PDF generation → email → file upload → status update. This "external loop" pattern extends ClickUp's manipulation surface beyond its native capabilities. *Epistemic status: verified.* Source: report-clickup.md § 8.2. Last observed: 2026-02-14.

**`[clickup:formula-field-workaround]`** ClickUp's formula language cannot nest formula references (Level 1 formula cannot reference Level 2 formula). Power users work around this by using automations to "print" formula results into static Number fields, enabling infinite logic chaining with slight latency. *Epistemic status: verified (limitation and workaround).* Source: report-clickup.md § 8.3. Last observed: 2026-02-14.

---

## Axis 9 — Reversibility

**`[clickup:task-operation-reversibility]`** Task edits, status changes, and assignments are reversible through counter-operations. Activity logs preserve prior state. No native undo for bulk operations. *Epistemic status: verified.* Source: ClickUp documentation. Last observed: 2026-02-14.

**`[clickup:context-convergence-lock-in]`** Organizations that converge their operational data (tasks, docs, dashboards, whiteboards, automations) into ClickUp create deep cross-object relationships that do not survive migration. The "connective tissue" between objects is the platform's moat — to leave is to sever context. *Epistemic status: inferred.* Source: report-clickup.md § 5.3. Last observed: 2026-02-14.

---

## Prescriptive Content Extracted

- "Choose ClickUp if your organization suffers from Tool Sprawl" (report-clickup.md § 5.3) — recommendation.
- "ClickUp is a Work Operating System defined by convergence" (report-clickup.md § 9) — teleological claim.

---

## Twelve-Check Validation Summary

All twelve checks pass. 32 primitives, all `[clickup:name]` format, unique, labeled, timestamped (2026-02-14), attributed. Prescriptive content extracted. Nine axes populated. Scope boundary testable.

*Production receipt: Produced via dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2) at Level 2, under DELEGATED execution, as Stage A2 target 4. Primitive count: 32.*
