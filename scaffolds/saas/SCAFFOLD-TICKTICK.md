# SCAFFOLD-TICKTICK.md

**Class:** Enduring descriptive scaffold | **Species:** Surface scaffold
**Scope:** TickTick as a SaaS work/knowledge/automation surface — its structural primitives, integrated productivity model (task + calendar + habit + note), manipulation paths, trust boundaries, and architectural features. Covers: TickTick across web, desktop, and mobile clients, including the unified timeline, Pomodoro timer, habit tracker, and Smart Lists. Excludes: TickTick's internal infrastructure, and any prescriptive institutional role assignment.
**Modality class:** SaaS work / knowledge / automation surfaces | **Surface slug:** `ticktick`
**Authority level:** 1-curated | **Lifecycle:** Active
**Upstream:** report-ticktick.md (observed 2026-02-14); SCAFFOLD-GRAMMAR.md §§ 3–5
**Downstream:** SCAFFOLD-SAAS-LAYER.md; future teleological manual
**Freshness threshold:** Moderate-ρ | **Last updated:** 2026-03-13
**Production method:** Dossier-to-scaffold conversion at Level 2, DELEGATED
**Evidence base:** report-ticktick.md; TickTick Help Center

---

## Axis 1 — Primitive Object Model

**`[ticktick:task]`** Polymorphic atomic unit carrying title, rich-text description (Markdown), priority flags (four-tier color-coded), temporal metadata (due date, start date, duration, reminders), tags (nested hierarchy), and parent/child subtask relationships. Subtasks are independent objects inheriting parent properties. NLP engine parses natural-language input into structured metadata. *Epistemic: verified. Source: TickTick docs; report §§ 2.1–2.1.3. Observed: 2026-02-14.*

**`[ticktick:list]`** Primary organizational container (equivalent to "project"). Lists grouped into folders (two-level hierarchy: Folder > List > Task > Subtask). Deliberate depth limitation prevents nesting paralysis. *Epistemic: verified. Source: TickTick docs; report § 2.2. Observed: 2026-02-14.*

**`[ticktick:smart-list]`** Dynamic view generated via query logic over task metadata. Pre-baked (Today, Tomorrow, Next 7 Days) and custom (boolean filter expressions). Smart Lists are the power-user's primary read-path manipulation surface. *Epistemic: verified. Source: TickTick docs; report § 2.2.2. Observed: 2026-02-14.*

**`[ticktick:note]`** Distinct primitive lacking completion state. Acknowledges that not all captured information is actionable. Notes can be converted to tasks and vice versa. Notes appear in Kanban views alongside tasks. *Epistemic: verified. Source: TickTick docs; report § 2.3. Observed: 2026-02-14.*

**`[ticktick:habit]`** Distinct object class separate from recurring tasks. Missed habits do not become "overdue" — they register as gaps in streaks, preventing red-badge anxiety. Support check-in with log values (quantity, pages read). Feed into separate analytics engine generating heatmaps and consistency scores. *Epistemic: verified. Source: TickTick docs; report § 2.4. Observed: 2026-02-14.*

**`[ticktick:calendar-event]`** External calendar events ingested via ICS subscription, rendered as non-completable temporal slots alongside tasks. Creates the "Unified Timeline" — the cornerstone of TickTick's temporal integration. *Epistemic: verified. Source: TickTick docs; report § 2.6. Observed: 2026-02-14.*

**`[ticktick:tag]`** Cross-cutting categorization with nested hierarchy (parent/child tags). Enables granular context-based filtering. Nesting is a differentiator vs. Todoist's flat labels. *Epistemic: verified. Source: TickTick docs; report § 2.5. Observed: 2026-02-14.*

**`[ticktick:pomodoro-timer]`** Integrated focus timer with configurable work/break intervals. Tracks focus sessions per task, generating productivity analytics. Bridges intent (task) and execution (focused time). *Epistemic: verified. Source: TickTick docs; report § 3. Observed: 2026-02-14.*

## Axis 2 — Data Sovereignty Model

**`[ticktick:cloud-hosted-data]`** Cloud-hosted with cross-platform sync. No self-hosted option. Offline support with local caching and sync-on-reconnect. *Epistemic: verified. Source: TickTick docs. Observed: 2026-02-14.*

## Axis 3 — Manipulation Surface

**`[ticktick:nlp-task-creation]`** Natural language parsing for task input including recurrence patterns, times, tags, and priorities. Comparable to Todoist NLP but with toggleable Smart Recognition. *Epistemic: verified. Source: TickTick docs; report § 2.1.3. Observed: 2026-02-14.*

**`[ticktick:unified-calendar-view]`** Tasks, calendar events, and habits rendered in a single temporal view. Tasks can be drag-dropped onto the calendar to create time blocks. This temporal integration — converting a static to-do into a scheduled time block — is the platform's defining manipulation primitive. *Epistemic: verified. Source: TickTick docs; report §§ 1.1, 2.6. Observed: 2026-02-14.*

**`[ticktick:kanban-board-view]`** Tasks and notes rendered as cards on a configurable board. Column definitions customizable per list. *Epistemic: verified. Source: TickTick docs; report § 2.3. Observed: 2026-02-14.*

**`[ticktick:rest-api]`** REST API for external automation and integration. Supports task CRUD, project management, and webhook-like capabilities via third-party connectors (Zapier, IFTTT). *Epistemic: verified. Source: TickTick developer docs. Observed: 2026-02-14.*

## Axis 4 — Auth and Trust Boundary

**`[ticktick:shared-list-collaboration]`** Lists can be shared with collaborators for task assignment and joint management. Sharing is at the list level. *Epistemic: verified. Source: TickTick docs. Observed: 2026-02-14.*

## Axis 5 — Receipt and Audit Surface

**`[ticktick:habit-analytics]`** Heatmaps, consistency scores, and monthly reports for habit tracking. Separate analytics engine from task completion tracking. *Epistemic: verified. Source: TickTick docs; report § 2.4. Observed: 2026-02-14.*

**`[ticktick:pomodoro-statistics]`** Focus session tracking with per-task and aggregate time reports. *Epistemic: verified. Source: TickTick docs. Observed: 2026-02-14.*

**`[ticktick:activity-history]`** Task completion history with timestamps. *Epistemic: verified. Source: TickTick docs. Observed: 2026-02-14.*

## Axis 6 — Design Teleology and Anti-Role

**`[ticktick:temporal-integration-teleology]`** TickTick's design teleology is the unification of time and task. The platform assumes that a task without temporal dimension is an unfulfilled intention, and a calendar without task context is an empty grid. The unified timeline solves "time blindness" inherent in list-only apps. *Epistemic: verified (features); inferred (teleology). Source: report §§ 1, 1.1. Observed: 2026-02-14.*

**`[ticktick:integrated-productivity-os]`** Convergence of task management, calendar, habits, notes, and Pomodoro into a single platform. Reduces the "interaction tax" of switching between specialized tools. *Epistemic: verified (features); inferred (OS characterization). Source: report § 1. Observed: 2026-02-14.*

**`[ticktick:anti-role-team-project-management]`** No workflow state machines, no sprint management, no resource allocation, no cross-team reporting. TickTick is a personal/small-team productivity system, not an enterprise project management tool. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-14.*

## Axis 7 — Failure Modes

**`[ticktick:feature-density-overwhelm]`** The breadth of integrated features (tasks + calendar + habits + Pomodoro + notes + Kanban) can overwhelm new users. The platform lacks strong progressive disclosure — most features are immediately visible. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-14.*

**`[ticktick:limited-relational-depth]`** No cross-list relational linking. Tasks relate to lists and tags but not to each other beyond parent/child subtask relationships. *Epistemic: inferred. Source: structural analysis. Observed: 2026-02-14.*

## Axis 8 — Power-User Ceiling

**`[ticktick:smart-list-construction]`** Boolean-logic filter expressions for dynamic views. Power users construct context-dependent perspectives (energy-based, time-available, priority-weighted). *Epistemic: verified. Source: TickTick docs; report § 2.2.2. Observed: 2026-02-14.*

**`[ticktick:calendar-time-blocking]`** Drag-and-drop task-to-calendar scheduling. Power users convert daily to-do lists into time-blocked schedules, bridging intention and execution. *Epistemic: verified. Source: TickTick docs; report § 2.6. Observed: 2026-02-14.*

## Axis 9 — Reversibility

**`[ticktick:moderate-data-portability]`** Task data exportable via API and CSV. Habit streaks, Pomodoro statistics, and Smart List configurations are not natively portable. *Epistemic: inferred. Source: structural analysis. Observed: 2026-02-14.*

---

## Twelve-Check Validation Summary
All twelve checks pass. 25 primitives. Nine axes populated.

*Production receipt: Stage A3 target 4. Primitive count: 25.*
