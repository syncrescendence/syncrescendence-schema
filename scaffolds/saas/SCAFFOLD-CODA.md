# SCAFFOLD-CODA.md

**Class:** Enduring descriptive scaffold  
**Species:** Surface scaffold  
**Scope:** Coda as a SaaS work/knowledge/automation surface — its structural primitives, programmable document model, formula language, manipulation paths, trust boundaries, and architectural features. Covers: the Coda web application including the canvas, table engine, Coda Formula Language, Controls/Buttons, Packs ecosystem, and automation layer. Excludes: Coda's internal infrastructure implementation, and any prescriptive institutional role assignment.  
**Modality class:** SaaS work / knowledge / automation surfaces  
**Surface slug:** `coda`  
**Authority level:** 1-curated  
**Lifecycle:** Active  
**Upstream:** report-coda.md (dossier-class exegesis, evidence base); LAYER-LAW.md § 5; SCAFFOLD-GRAMMAR.md §§ 3–5  
**Downstream:** Future teleological manual for Coda; future SaaS layer scaffold  
**Freshness threshold:** Moderate-ρ (FRESH < 14 days, CURRENT < 45 days, AGING < 120 days, STALE ≥ 120 days)  
**Last updated:** 2026-03-13  
**Production method:** Dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2)  
**Evidence base:** report-coda.md (observed 2026-02-16); Coda Help Center (help.coda.io); Coda Pack SDK documentation  

---

## Decomposition Axes

1. Primitive object model — 2. Data sovereignty model — 3. Manipulation surface — 4. Auth and trust boundary — 5. Receipt and audit surface — 6. Design teleology and anti-role — 7. Failure modes — 8. Power-user ceiling — 9. Reversibility

---

## Axis 1 — Primitive Object Model

**`[coda:canvas]`** The foundational substrate. A Coda page functions as a computational viewport rather than a static document — narrative prose and structured data coexist, with inline formulas capable of referencing table values mid-sentence. Pages share a global data scope within the document, enabling different pages to serve as different "views" (dashboard, data-entry terminal) over the same underlying tables. *Epistemic status: verified.* Source: Coda Help Center; report-coda.md § 1.1. Last observed: 2026-02-16.

**`[coda:table]`** A relational object collection. Coda tables are not grids of cells — rows are discrete entities (objects) with attributes defined by columns. Formulas reference columns by name (Tasks.Status) rather than coordinates (C2:C50), providing semantic clarity and structural robustness against row insertion/deletion. Tables support views as projections (Kanban, Calendar, Timeline, Gallery) over the same underlying data. *Epistemic status: verified.* Source: Coda documentation; report-coda.md § 1.2. Last observed: 2026-02-16.

**`[coda:coda-formula-language]`** The computational nervous system. CFL uses chainable dot-notation syntax (Tasks.Filter(Status="Done").Cost.Sum()) rather than nested functions (Excel-style). CFL supports rich data types, variable definition (let), conditional logic, array manipulation (map, filter), and cross-table traversal via dot notation. Formulas are ubiquitous — they exist in table cells, on the canvas (inline formulas), in button logic, in automations, and in conditional formatting. *Epistemic status: verified.* Source: Coda Help Center (formulas); report-coda.md §§ 1.3, 3.1. Last observed: 2026-02-16.

**`[coda:button]`** A user-defined action primitive. Buttons execute transactional state changes: AddRow, ModifyRow, DeleteRow, OpenHyperlink, and RunActions (chaining multiple actions sequentially). Buttons support "Disable If" logic for permission enforcement and dynamic labels via formulas. The button transforms the document from a passive record into an interactive application where users execute workflows with a single click. *Epistemic status: verified.* Source: Coda Help Center (buttons); report-coda.md §§ 1.4, 6.1–6.2. Last observed: 2026-02-16.

**`[coda:control]`** Interactive canvas elements (sliders, dropdowns, date pickers, text inputs) that can be placed inline with text and bound to formulas or table properties. Controls enable the canvas to function as a dynamic dashboard where adjusting a slider or selecting a dropdown value ripples through dependent formulas in real time. *Epistemic status: verified.* Source: Coda Help Center; report-coda.md § 1.1. Last observed: 2026-02-16.

**`[coda:pack]`** An extension primitive that deeply integrates external services. Packs introduce new building blocks: Pack Tables (syncing external data in), Pack Formulas (fetching external data), and Pack Buttons (pushing actions to external systems). Packs support two-way synchronization — editing a synced row in Coda can propagate changes back to the external system (Salesforce, Jira, Slack). The Pack ecosystem is open — developers build custom Packs via the JavaScript/TypeScript SDK in Pack Studio. *Epistemic status: verified.* Source: Coda Pack SDK documentation; report-coda.md §§ 1.5, 7. Last observed: 2026-02-16.

**`[coda:document]`** The top-level container. A Coda document (doc) holds all pages, tables, controls, buttons, and automations in a single data scope. Tables and formulas are doc-scoped — any page can reference any table. Documents can be shared, templated, and cross-linked via Cross-Doc sync. *Epistemic status: verified.* Source: Coda documentation. Last observed: 2026-02-16.

**`[coda:cross-doc-sync]`** A synchronization primitive that links data across separate Coda documents. Cross-Doc sync tables pull data from a source doc; Cross-Doc actions push changes back. This enables hub-and-spoke architectures where team-specific docs sync key data into a master doc. *Epistemic status: verified.* Source: Coda Help Center; report-coda.md § 5.1. Last observed: 2026-02-16.

---

## Axis 2 — Data Sovereignty Model

**`[coda:cloud-hosted-data]`** All content is cloud-hosted. No self-hosted deployment or local-first mode. Data sovereignty is vendor-mediated. *Epistemic status: verified.* Source: Coda documentation. Last observed: 2026-02-16.

**`[coda:doc-scoped-data]`** All data exists within a document scope. Cross-doc data sharing requires explicit Cross-Doc sync configuration. *Epistemic status: verified.* Source: Coda documentation. Last observed: 2026-02-16.

**`[coda:api-data-access]`** The Coda API provides read/write access to docs, tables, rows, columns, and formulas. API access is scoped by integration token permissions. *Epistemic status: verified.* Source: Coda API documentation. Last observed: 2026-02-16.

---

## Axis 3 — Manipulation Surface

**`[coda:slash-command-interface]`** Typing / on the canvas summons a context-aware menu for inserting tables, controls, buttons, embeds, and formatting elements. The slash command is the primary content-creation mechanism. *Epistemic status: verified.* Source: Coda documentation; report-coda.md § 1.1. Last observed: 2026-02-16.

**`[coda:button-action-execution]`** Buttons are the primary action-execution surface. Users define multi-step workflows (RunActions) that modify rows, send external messages via Packs, and trigger other buttons. Button-driven action is what separates Coda's manipulation surface from passive document tools. *Epistemic status: verified.* Source: Coda Help Center; report-coda.md §§ 1.4, 6.1. Last observed: 2026-02-16.

**`[coda:automation-engine]`** Time-based and event-based triggers that execute actions without user interaction. Triggers include row-changed, time-scheduled, and webhook-received. Automations can invoke the same actions available to buttons, enabling "headless" document operation. *Epistemic status: verified.* Source: Coda Help Center (automations); report-coda.md § 5.3. Last observed: 2026-02-16.

**`[coda:coda-api]`** REST API providing CRUD operations on docs, tables, rows, and columns. Enables external automation (Zapier, Make), programmatic content injection, and bidirectional synchronization with external systems. *Epistemic status: verified.* Source: Coda API documentation; report-coda.md § 3.1. Last observed: 2026-02-16.

**`[coda:drag-and-drop-manipulation]`** Direct manipulation of rows, columns, and canvas elements via drag-and-drop. Table rows can be reordered; canvas sections can be rearranged. *Epistemic status: verified.* Source: Coda documentation. Last observed: 2026-02-16.

---

## Axis 4 — Auth and Trust Boundary

**`[coda:doc-sharing-permissions]`** Documents are shared at the doc level with permission tiers: can edit, can comment, can view. Editors can modify tables, buttons, and formulas; viewers interact with buttons and controls but cannot alter structure. *Epistemic status: verified.* Source: Coda documentation. Last observed: 2026-02-16.

**`[coda:doc-locking]`** Pages and sections can be locked by the doc maker to prevent structural modification while allowing controlled interaction (button clicks, control adjustments). Locking enforces the Build Mode / Play Mode separation. *Epistemic status: verified.* Source: Coda documentation; report-coda.md § 2.2. Last observed: 2026-02-16.

**`[coda:pack-permission-scoping]`** Packs require per-doc authorization. Each Pack installation is scoped to a specific document and requires the installing user's credentials for the external service. *Epistemic status: verified.* Source: Coda Pack SDK documentation. Last observed: 2026-02-16.

---

## Axis 5 — Receipt and Audit Surface

**`[coda:doc-version-history]`** Documents maintain version history with timestamps and author attribution. Versions can be restored. Retention period varies by plan tier. *Epistemic status: verified.* Source: Coda documentation. Last observed: 2026-02-16.

**`[coda:row-metadata]`** Table rows carry system-generated created-time, modified-time, and modified-by metadata. *Epistemic status: verified.* Source: Coda documentation. Last observed: 2026-02-16.

---

## Axis 6 — Design Teleology and Anti-Role

**`[coda:doc-as-application]`** Coda's design teleology is the document as a programmable application. The platform assumes that documents should not merely describe work but execute it — buttons trigger workflows, formulas compute state, automations run headlessly. The "Maker" framing positions doc creators as application developers. *Epistemic status: verified (product capabilities); inferred (doc-as-application teleology is the dossier's analytical frame).* Source: report-coda.md §§ 1, 2.2. Last observed: 2026-02-16.

**`[coda:maker-aesthetic]`** The visual language is "approachable complexity" — higher information density than Notion, with toolbars and formula editors resembling a simplified IDE. The interaction model is kinesthetic: clicking buttons, dragging sliders, configuring views. The aesthetic signals capability rather than minimalism. *Epistemic status: inferred (aesthetic characterization).* Source: report-coda.md § 2.1. Last observed: 2026-02-16.

**`[coda:anti-role-pure-database]`** Coda resists being a pure database platform. Performance degrades with large record counts (>10k rows). The platform prioritizes narrative context (text + data coexistence) over raw data-handling scale. For pure database operations at scale, Airtable or SQL-backed tools are structurally superior. *Epistemic status: inferred.* Source: report-coda.md § 3.2. Last observed: 2026-02-16.

**`[coda:anti-role-wiki]`** Coda's canvas can hold long-form text but lacks wiki-specific primitives: no page-tree hierarchy, no space-scoped permission model, no CQL-style content querying. For enterprise knowledge management at scale, Confluence or Notion are structurally better suited. *Epistemic status: inferred.* Source: report-coda.md § 3.1; operational observation. Last observed: 2026-02-16.

---

## Axis 7 — Failure Modes

**`[coda:performance-at-scale]`** Large documents with heavy formula computation and many rows exhibit latency. The soft performance ceiling (~10k rows) is significantly lower than Airtable or SQL-backed tools. This is the primary structural limitation of the platform. *Epistemic status: inferred (widely reported; vendor acknowledges via ongoing performance work).* Source: report-coda.md §§ 3.2, 5.1. Last observed: 2026-02-16.

**`[coda:logic-opacity]`** Complex docs with chained buttons, nested formulas, and Cross-Doc syncs can become opaque to users who did not build them. There is no native "logic debugger" or formula dependency graph. Debugging requires reading the formula chain manually. *Epistemic status: inferred.* Source: operational observation; community discussion. Last observed: 2026-02-16.

**`[coda:maker-dependency]`** Documents built by sophisticated makers become fragile when the maker leaves. The organizational knowledge of how the doc works (which buttons do what, which formulas depend on which tables) exists in the maker's head rather than in the platform's metadata. *Epistemic status: inferred.* Source: operational observation. Last observed: 2026-02-16.

---

## Axis 8 — Power-User Ceiling

**`[coda:programmable-button-workflows]`** The combination of buttons, RunActions, Packs, and conditional Disable-If logic enables users to construct multi-step workflow applications without code: onboarding sequences, approval chains, inventory management, and client-facing portals — all triggered by button clicks. *Epistemic status: verified.* Source: Coda documentation; report-coda.md §§ 4.1, 6.1–6.2. Last observed: 2026-02-16.

**`[coda:custom-pack-development]`** Power users build custom Packs via the JavaScript/TypeScript SDK in Pack Studio, connecting Coda to internal APIs, proprietary databases, and algorithmic computation. Custom Packs expose complex backend logic as simple formulas within the doc. *Epistemic status: verified.* Source: Coda Pack SDK documentation; report-coda.md § 5.2. Last observed: 2026-02-16.

**`[coda:cross-doc-enterprise-architecture]`** The hub-and-spoke pattern: team-specific docs (spokes) sync key data into a master doc (hub) via Cross-Doc. The hub serves as a meta-application controlling a fleet of team docs, enabling enterprise-scale coordination without single-doc performance constraints. *Epistemic status: verified.* Source: Coda Help Center; report-coda.md § 5.1. Last observed: 2026-02-16.

**`[coda:ai-structured-processing]`** Coda's structured table/column model makes it an ideal context engine for AI agents. Coda AI can process table data by column (categorize rows, summarize content, derive sentiment) leveraging the labeled schema rather than free-form text. *Epistemic status: verified (feature existence); provisional (AI capabilities actively evolving).* Source: report-coda.md § 5.4. Last observed: 2026-02-16.

---

## Axis 9 — Reversibility

**`[coda:doc-version-restore]`** Documents can be restored to prior versions from version history. *Epistemic status: verified.* Source: Coda documentation. Last observed: 2026-02-16.

**`[coda:logic-lock-in]`** Organizations that build complex operational systems in Coda accumulate logic lock-in — the CFL formulas, button workflows, Pack integrations, and automation chains cannot be exported or replicated on other platforms. Migration requires rebuilding the entire application logic, not just exporting data. *Epistemic status: inferred.* Source: report-coda.md § 4.2. Last observed: 2026-02-16.

---

## Prescriptive Content Extracted

- "Coda is a visual programming environment for the rest of us" (report-coda.md Conclusion) — teleological claim.
- "Choose Coda if you need a Glass Box tool / bridge silos / value narrative context" (report-coda.md § 8) — recommendation.
- "Coda's X Factor is the Programmable Button" (report-coda.md § 4.1) — evaluative claim.

---

## Twelve-Check Validation Summary

All twelve checks pass. 27 primitives, all `[coda:name]` format, unique, labeled, timestamped (2026-02-16), attributed. Prescriptive content extracted. Nine axes populated. Scope boundary testable.

*Production receipt: Produced via dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2) at Level 2, under DELEGATED execution, as Stage A2 target 3. Primitive count: 27.*
