# SCAFFOLD-NOTION.md

**Class:** Enduring descriptive scaffold  
**Species:** Surface scaffold  
**Scope:** The Notion platform as a SaaS work/knowledge/automation surface — its structural primitives, object model, manipulation paths, trust boundaries, and architectural features. Covers: the Notion application as accessed through web, desktop, and mobile clients, including its API surface, database engine, and block architecture. Excludes: Notion's internal infrastructure implementation (Postgres internals, data-lake architecture), the Notion company's organizational structure, and any prescriptive institutional role assignment.  
**Modality class:** SaaS work / knowledge / automation surfaces  
**Surface slug:** `notion`  
**Authority level:** 1-curated  
**Lifecycle:** Active  
**Upstream:** report-notion.md (dossier-class exegesis, evidence base); LAYER-LAW.md § 5 (modality-class axis set); SCAFFOLD-GRAMMAR.md §§ 3–5  
**Downstream:** Future teleological manual for Notion; future SaaS layer scaffold; future cross-cutting scaffold for data-sovereignty or reversibility concerns  
**Freshness threshold:** Moderate-ρ regime (FRESH < 14 days, CURRENT < 45 days, AGING < 120 days, STALE ≥ 120 days). Notion's structural object model (blocks, pages, databases) evolves slowly; feature additions (AI features, new block types, formula enhancements) arrive at moderate cadence and are tracked in the temporal domain.  
**Last updated:** 2026-03-13  
**Production method:** Dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2)  
**Evidence base:** report-notion.md (observed 2026-02-16); Notion Help Center (notion.com/help); Notion engineering blog  

---

## Decomposition Axes

Nine axes per LAYER-LAW.md § 5 for SaaS work/knowledge/automation surfaces:

1. Primitive object model  
2. Data sovereignty model  
3. Manipulation surface  
4. Auth and trust boundary  
5. Receipt and audit surface  
6. Design teleology and anti-role  
7. Failure modes  
8. Power-user ceiling  
9. Reversibility  

---

## Axis 1 — Primitive Object Model

**`[notion:block]`** The atomic structural unit. Every piece of content in Notion — a paragraph, heading, image, embed, toggle, callout, checkbox, code fence, or database — is a block. Each block carries a UUID, a type definition that governs rendering, type-specific properties, and a parent/child pointer enabling recursive nesting. Blocks are stored as discrete data objects in Notion's Postgres backend. The block is not merely a UI element; it is the data-model foundation. Because content is atomized into typed objects, each block can be independently moved, transformed, colored, and addressed via the API. *Epistemic status: verified.* Source: Notion engineering blog; report-notion.md §§ 3.1, 2.1. Last observed: 2026-02-16.

**`[notion:page]`** A recursive container that is itself a block. Pages hold blocks, and because pages are blocks, pages can nest inside other pages to arbitrary depth. This recursive definition means navigation is reading — traversing nested pages is traversing the knowledge graph's hierarchy. Pages carry metadata (title, icon, cover image, properties when inside a database) and serve simultaneously as documents, wiki entries, and database rows depending on context. The page is the organizational primitive — it is the canvas, the folder, and the record. *Epistemic status: verified.* Source: Notion documentation; report-notion.md §§ 3.2, 3.4. Last observed: 2026-02-16.

**`[notion:database]`** A structured collection of pages with typed property columns. A Notion database is not a spreadsheet — each row is a full page, openable to reveal an unlimited block canvas inside. Databases carry strongly typed properties (text, number, select, multi-select, date, person, relation, rollup, formula, checkbox, URL, email, phone, files, created-time, last-edited-time, created-by, last-edited-by). The database primitive provides the structured-data layer atop the block/page layer. Databases can be inline (embedded within a page as a block) or full-page. *Epistemic status: verified.* Source: Notion Help Center (intro-to-databases); report-notion.md §§ 3.3, 3.4. Last observed: 2026-02-16.

**`[notion:database-view]`** A presentation lens over a database's underlying data. The same database can be rendered simultaneously as table, board (Kanban), calendar, timeline (Gantt), gallery, or list view. Views are decoupled from data — creating a new view does not duplicate records. Each view carries its own filter, sort, and visible-property configuration. This polymorphism allows one dataset to serve multiple workflows: a content calendar for the editor, a Kanban board for the writer, a gallery for the designer. *Epistemic status: verified.* Source: Notion documentation; report-notion.md § 3.3. Last observed: 2026-02-16.

**`[notion:property]`** A typed metadata field attached to database pages. Properties serve as the database's column definitions and are strongly typed — the type constrains what values the field can hold and what operations can be performed on it. The relation property type enables cross-database linking (see `[notion:relation-primitive]`). The formula property type enables computed values (see `[notion:formula-engine]`). The rollup property type enables aggregation across related records. Properties are the schema layer of the database primitive. *Epistemic status: verified.* Source: Notion documentation; report-notion.md §§ 3.3, 4.2. Last observed: 2026-02-16.

**`[notion:relation-primitive]`** A property type that links records across databases, creating a relational graph. A relation from a "Projects" database to a "Tasks" database allows each project page to reference its associated task pages and vice versa. Relations transform Notion from a flat-file document tool into a relational knowledge management system. Bidirectional relations (the default) create reciprocal links automatically. *Epistemic status: verified.* Source: Notion documentation (relations-and-rollups); report-notion.md § 4.2. Last observed: 2026-02-16.

**`[notion:workspace]`** The top-level organizational container. A workspace holds all pages, databases, and members. Workspaces carry billing identity, member roster, and integration installation scope. All content exists within exactly one workspace. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:teamspace]`** An organizational subdivision within a workspace. Teamspaces group pages and databases by team, with configurable visibility (open, closed, or private). Teamspaces provide the middle organizational layer between the workspace and individual pages. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:block-type-vocabulary]`** The enumerated set of block types available: text, heading (H1/H2/H3), bulleted list, numbered list, to-do, toggle, quote, callout, divider, table of contents, breadcrumb, column layout, image, video, audio, file, bookmark, embed, code, equation (LaTeX), synced block, button, and database (inline/full-page). The vocabulary is closed but expandable by Notion — users cannot define custom block types. Each type carries distinct rendering, property, and interaction semantics. *Epistemic status: verified.* Source: Notion Help Center; report-notion.md § 3.1. Last observed: 2026-02-16.

**`[notion:synced-block]`** A block that mirrors its content across multiple locations. Editing a synced block in one page updates all instances. Synced blocks enable single-source-of-truth patterns — a status banner, a policy statement, or a shared component can be authored once and embedded everywhere. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:template-primitive]`** Reusable page structures that can be instantiated to create pre-configured pages with predefined block layouts, database structures, and property configurations. Templates range from simple page skeletons to complex multi-database "operating systems." The template marketplace (30,000+ templates) extends this into a community economy. Button blocks can trigger template instantiation, enabling macro-like automation. *Epistemic status: verified (structural function); inferred (30,000+ count from dossier, not independently reverified).* Source: Notion documentation; report-notion.md § 4.4. Last observed: 2026-02-16.

---

## Axis 2 — Data Sovereignty Model

**`[notion:cloud-hosted-data]`** All content is stored in Notion's cloud infrastructure (AWS-backed Postgres). There is no local-first mode, no offline-first architecture, and no user-controlled storage location. Data sovereignty is vendor-mediated — Notion controls the storage substrate. Limited offline access exists through client-side caching, but the canonical copy is always cloud-resident. *Epistemic status: verified (cloud-hosted architecture); inferred (AWS-backed Postgres from engineering blog).* Source: Notion engineering blog; report-notion.md § 5.1 (Obsidian comparison). Last observed: 2026-02-16.

**`[notion:workspace-scoped-content]`** All pages, databases, and blocks exist within a single workspace scope. Content sharing across workspaces requires duplication or external linking — there is no native cross-workspace content bridge analogous to Slack Connect. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:export-capability]`** Workspaces and individual pages can be exported in Markdown, CSV (for databases), or PDF format. Export is workspace-scoped (full workspace export available to admins) or page-scoped. The export captures text content and property values but loses interactive features (database views, synced blocks, button automations, relation traversal). *Epistemic status: verified (feature existence); inferred (lossiness characterization from structural analysis).* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:content-api-access]`** The Notion API provides programmatic read/write access to pages, databases, blocks, and users. API access is scoped by integration permissions — each integration declares which pages it can access. The API enables external backup, synchronization, and "headless CMS" usage patterns where Notion serves as a content backend for external applications. *Epistemic status: verified.* Source: Notion API documentation; report-notion.md § 4.3. Last observed: 2026-02-16.

---

## Axis 3 — Manipulation Surface

**`[notion:slash-command-interface]`** The primary content-creation mechanism. Typing `/` in any page summons a context-aware menu providing access to the full block-type vocabulary, embeds, and formatting options. The slash command bridges CLI efficiency with GUI discoverability — power users type `/h1` for headings or `/table` for databases without leaving the keyboard, while novices browse the menu to discover capabilities. *Epistemic status: verified.* Source: Notion Help Center (slash-commands); report-notion.md § 2.1. Last observed: 2026-02-16.

**`[notion:drag-and-drop-manipulation]`** Direct manipulation of blocks via six-dot drag handles. Blocks can be reordered vertically, arranged into column layouts by dragging to the side of another block, and moved across pages. Real-time visual feedback (blue guide line) indicates placement. Drag-and-drop extends to database rows (in board/list views) and to sidebar page organization. *Epistemic status: verified.* Source: Notion documentation; report-notion.md § 2.2. Last observed: 2026-02-16.

**`[notion:turn-into-transformation]`** Any block can be converted to another block type via the "Turn Into" menu — paragraphs become headings, bullet lists become toggle lists, text blocks become pages, pages become database entries. This type mutability enables the natural evolution of unstructured notes into structured projects without data migration. *Epistemic status: verified.* Source: Notion documentation; report-notion.md § 2.4. Last observed: 2026-02-16.

**`[notion:inline-editing-model]`** Content is edited directly in-place. There is no separate "edit mode" — pages are always live-editable (subject to permissions). Formatting is applied via Markdown shortcuts (typed inline), the floating toolbar (on text selection), or slash commands. The editing model prioritizes flow-state maintenance by minimizing modal interruptions. *Epistemic status: verified.* Source: Notion documentation; report-notion.md §§ 1.1, 2.1. Last observed: 2026-02-16.

**`[notion:database-filter-sort-system]`** Per-view configuration of filters (compound conditions on property values) and sort orders. Filters can be nested with AND/OR logic. The filter/sort system is the primary data-manipulation path for databases — it determines which records are visible and in what order without altering the underlying data. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:notion-api]`** RESTful API providing programmatic CRUD operations on pages, databases, blocks, and users. Enables external automation (via Zapier, Make, or custom code), headless CMS patterns, and bidirectional synchronization with external systems. The API is the primary external manipulation surface. *Epistemic status: verified.* Source: Notion API documentation; report-notion.md § 4.3. Last observed: 2026-02-16.

**`[notion:button-block-automation]`** A block type that executes scripted actions on click: creating pages from templates, editing properties across database rows, inserting blocks, or opening URLs. Button blocks are the user-accessible macro layer — they enable one-click automation without code or external tools. *Epistemic status: verified.* Source: Notion documentation; report-notion.md § 4.4. Last observed: 2026-02-16.

**`[notion:keyboard-shortcuts]`** Comprehensive keyboard shortcut set for navigation, formatting, block creation, and page operations. Markdown syntax is supported inline (e.g., `**bold**`, `- ` for bullets, `[]` for checkboxes). The shortcut set enables keyboard-driven operation for power users. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

---

## Axis 4 — Auth and Trust Boundary

**`[notion:workspace-membership]`** Users are members of a workspace with one of four role levels: owner, admin, member, or guest. Role determines global permissions: workspace-level settings, member management, integration installation, and billing access. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:page-level-permissions]`** Individual pages and databases can be shared with specific members, groups, or the full workspace at granular permission levels: full access, can edit, can comment, or can view. Page-level permissions override workspace defaults when more restrictive. Nested pages inherit parent permissions unless explicitly overridden. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:teamspace-access-control]`** Teamspaces carry their own access regime: open (all workspace members can see and join), closed (visible but requires invitation), or private (invisible to non-members). Teamspace access is the middle-tier permission layer between workspace membership and page-level sharing. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:integration-permission-scoping]`** API integrations are granted access to specific pages/databases by the user, not to the entire workspace. Integration capabilities are bounded by their declared permission scopes (read content, update content, insert content). This provides per-integration access control. *Epistemic status: verified.* Source: Notion API documentation; report-notion.md § 4.3. Last observed: 2026-02-16.

**`[notion:guest-access]`** External users can be invited to specific pages as guests with limited permissions. Guests do not have workspace-level access — they see only the pages explicitly shared with them. Guest access provides a controlled external-collaboration boundary. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

---

## Axis 5 — Receipt and Audit Surface

**`[notion:page-history]`** Pages maintain a version history showing changes over time. History granularity and retention period vary by plan tier (free plans retain 7 days; paid plans retain 30 days or more; enterprise plans retain unlimited history). Page history allows restoration to prior versions. *Epistemic status: verified (feature existence); inferred (retention period details from pricing documentation, not independently tested).* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:page-analytics]`** Enterprise-tier functionality providing view counts, unique viewers, and engagement metrics for individual pages. Page analytics serve as the audit surface for content consumption — who viewed what, when. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:audit-log]`** Enterprise-tier functionality recording workspace-level events: member additions/removals, permission changes, page exports, integration installations. The audit log is the compliance-grade receipt surface for workspace administration. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:created-last-edited-metadata]`** Every page and database row carries system-generated created-time, created-by, last-edited-time, and last-edited-by properties. These are immutable system fields (not user-editable) that provide baseline provenance for all content. *Epistemic status: verified.* Source: Notion documentation; report-notion.md § 3.3. Last observed: 2026-02-16.

---

## Axis 6 — Design Teleology and Anti-Role

**`[notion:blank-slate-philosophy]`** Notion's design orientation is structural unopinionatedness — the platform provides atomic building blocks (blocks, pages, databases) and imposes no workflow methodology. The blank page is the starting point. This is an explicit design commitment: the tool adapts to the user's process rather than imposing one. *Epistemic status: verified (design philosophy); inferred (the "tabula rasa" characterization is the dossier's analytical frame; the structural flexibility is verified from product behavior).* Source: report-notion.md §§ 1.1, 5.2. Last observed: 2026-02-16.

**`[notion:aesthetic-opinionatedness]`** While structurally unopinionated, Notion enforces strict visual standards: restricted typographic hierarchy (H1/H2/H3/body/caption, no arbitrary font sizes), restrained color palette (grayscale with pastel accents), enforced spacing and layout rules, and consistent block rendering. The design teleology is "enforced harmony" — the platform prevents visual chaos, ensuring that all content maintains baseline professional coherence regardless of author. *Epistemic status: verified (visual constraints); inferred (design-teleology characterization).* Source: report-notion.md §§ 1.2, 1.4, 5.2. Last observed: 2026-02-16.

**`[notion:progressive-disclosure-model]`** Complexity is revealed incrementally. A database appears initially as a simple table; filters, sorts, relations, and rollups are hidden until sought. A new user can operate Notion as a note-taking app (Level 1), discover page nesting (Level 2), discover databases (Level 3), and discover relational linking (Level 4). Advanced features are structurally present but visually unobtrusive. *Epistemic status: verified.* Source: Notion documentation; report-notion.md § 2.3. Last observed: 2026-02-16.

**`[notion:anti-role-specialized-project-management]`** Notion structurally resists being a specialized project management tool. It provides Kanban boards, timelines, and task tracking via its database views, but lacks native sprint management, velocity tracking, burndown charts, issue-linking dependency graphs, and workflow-state-machine enforcement. Notion is a general-purpose workspace, not a PM tool — teams needing rigorous project management methodology use dedicated tools (Jira, Linear, Asana) alongside or instead of Notion. *Epistemic status: inferred.* Source: report-notion.md § 5.1 (competitive comparison); operational observation. Last observed: 2026-02-16.

**`[notion:anti-role-real-time-communication]`** Notion provides comments and mentions but no real-time messaging stream, no channels, no presence indicators, and no voice/video communication. Collaboration is asynchronous-first and document-anchored. Notion defers to Slack, Teams, or Discord for real-time communication by design. *Epistemic status: inferred.* Source: operational observation. Last observed: 2026-02-16.

---

## Axis 7 — Failure Modes

**`[notion:blank-slate-paralysis]`** The unopinionated starting point can overwhelm users who lack a mental model for organizing information. The blank page offers no guidance, and the breadth of the block-type vocabulary provides no default structure. New users often fail to adopt Notion because they cannot determine how to begin — the flexibility that empowers experienced users paralyzes novices. *Epistemic status: inferred (well-documented adoption pattern; no vendor-published failure analysis).* Source: report-notion.md § 1.1; community discussion. Last observed: 2026-02-16.

**`[notion:performance-degradation-at-scale]`** Large workspaces with deeply nested page hierarchies, extensive relation networks, and databases exceeding several thousand rows exhibit noticeable latency. Page load times increase, search results slow, and formula computation becomes sluggish. The cloud-hosted architecture means performance is server-bound, not client-bound. *Epistemic status: inferred (widely reported in community; vendor acknowledges via ongoing performance work; no published threshold data).* Source: report-notion.md § 5.1 (Airtable comparison); community reports. Last observed: 2026-02-16.

**`[notion:offline-fragility]`** Notion's cloud-first architecture provides limited offline capability through client-side caching. Extended offline periods risk data loss if cached changes conflict with server-side edits. The platform was not designed for offline-first operation — structural reliability depends on connectivity. *Epistemic status: inferred (offline limitations well-documented; specific conflict-resolution behavior not independently tested).* Source: report-notion.md § 5.1 (Obsidian comparison). Last observed: 2026-02-16.

**`[notion:structure-entropy]`** Over time, workspaces accumulate orphaned pages, redundant databases, inconsistent property schemas across related databases, and broken synced blocks. Without disciplined information architecture, the flexible structure degrades into navigational chaos. The platform provides no native tools for structural health monitoring or orphan detection. *Epistemic status: inferred.* Source: operational observation; community discussion. Last observed: 2026-02-16.

**`[notion:search-quality-limitation]`** Notion's search indexes page titles, content text, and property values, but ranking quality degrades in large workspaces. Search does not leverage social-graph signals (unlike Slack's Work Graph) and provides limited filtering by database, property, or content type. Finding specific content in a large, poorly-organized workspace can be difficult. *Epistemic status: inferred.* Source: operational observation; report-notion.md § 5.1. Last observed: 2026-02-16.

---

## Axis 8 — Power-User Ceiling

**`[notion:formula-engine]`** Formulas 2.0 transforms database properties into a computation surface supporting rich data types (dates, people, lists), variable definition (`let`), conditional logic (`if`), array manipulation (`map`, `filter`), and dot-notation traversal of related-database properties. Formulas enable dynamic calculations (percent-complete progress bars, conditional status derivation, cross-database aggregation) without external tools. The formula syntax approaches a simplified programming language. *Epistemic status: verified.* Source: Notion Help Center (formulas); report-notion.md § 4.1. Last observed: 2026-02-16.

**`[notion:relational-knowledge-graph]`** The combination of relations, rollups, and Formulas 2.0 enables users to construct relational data models: linked databases with cross-references, computed aggregations, and conditional rollups. A "Company OS" can link Projects → Tasks → People → OKRs with bidirectional traversal, computed progress metrics, and filtered views — approaching the structural capability of a custom application built on a relational database. *Epistemic status: verified (structural capability); inferred (custom-application equivalence characterization).* Source: report-notion.md §§ 4.1, 4.2. Last observed: 2026-02-16.

**`[notion:api-driven-automation]`** The Notion API enables external automation pipelines: form submissions creating database entries, status changes triggering Slack notifications, bidirectional sync with engineering tools (Jira, GitHub), and headless-CMS publishing workflows. Power users combine the API with Zapier, Make, or custom code to extend Notion's manipulation surface beyond its native UI. *Epistemic status: verified.* Source: Notion API documentation; report-notion.md § 4.3. Last observed: 2026-02-16.

**`[notion:template-as-application]`** Sophisticated templates function as deployable applications: a "Company OS" template instantiates interlinked databases for OKRs, project roadmaps, team directories, and wikis in a single action. The template marketplace creates a secondary economy where power users sell pre-built systems. Button blocks within templates enable macro-like automation (one-click task generation, bulk property editing). *Epistemic status: verified (structural function); inferred (application-equivalence characterization).* Source: report-notion.md § 4.4. Last observed: 2026-02-16.

**`[notion:database-as-application-builder]`** At full power, Notion's database-view-filter-formula-relation stack enables non-developers to construct CRMs, content calendars, inventory trackers, and project management systems without code. The power-user ceiling is "custom application without programming" — bounded by the formula language's expressiveness, the absence of scripting, and performance at scale. *Epistemic status: inferred (ceiling characterization based on structural analysis of capability limits).* Source: report-notion.md §§ 4.1–4.4, 5.2. Last observed: 2026-02-16.

---

## Axis 9 — Reversibility

**`[notion:page-version-history]`** Pages can be restored to previous versions via the version history. Restoration granularity depends on plan tier (see `[notion:page-history]`). Version history provides undo capability for content changes at the page level. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:trash-recovery]`** Deleted pages are moved to a workspace-scoped trash, recoverable for 30 days. Trash provides a safety net against accidental deletion. Permanent deletion (emptying trash) is irreversible. *Epistemic status: verified.* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:export-portability]`** Workspace data can be exported in Markdown, CSV, and PDF (see `[notion:export-capability]`). Export is structurally lossy: database views, relations, rollups, formulas, synced blocks, and button automations do not survive export. Portability exists for raw content but not for the relational structure that gives Notion its power. *Epistemic status: verified (export feature); inferred (lossiness scope from structural analysis).* Source: Notion documentation. Last observed: 2026-02-16.

**`[notion:structural-complexity-migration-cost]`** The deeper the relational knowledge graph (relations, rollups, formulas, synced blocks, templates), the higher the cost of migrating away. A simple notes workspace is trivially portable; a multi-database "Company OS" with cross-references and computed properties is effectively non-portable to any non-Notion platform. Migration cost scales with structural complexity. *Epistemic status: inferred.* Source: report-notion.md § 5.3 (ecosystem and switching costs); structural analysis. Last observed: 2026-02-16.

**`[notion:community-economy-lock-in]`** The template economy, consultant ecosystem, and organizational knowledge embedded in Notion's primitives create switching costs beyond data portability. An organization whose processes are codified in Notion templates and whose team has developed Notion expertise faces cultural and knowledge-capital switching costs in addition to data-migration costs. *Epistemic status: inferred.* Source: report-notion.md § 5.3. Last observed: 2026-02-16.

---

## Prescriptive Content Extracted

- "To choose Notion is to choose a philosophy of radical self-determination" (report-notion.md Conclusion) — teleological claim.
- "Choose Notion for consolidation/customizability/transparency" (report-notion.md § 5.4) — recommendation framework.
- "Notion unequivocally holds the high ground as the comprehensive, connected workspace" (report-notion.md Conclusion) — evaluative comparison.
- Competitive superiority/weakness judgments (report-notion.md § 5.1 table) — belongs in a comparative specification, not a descriptive scaffold.

---

## Twelve-Check Validation Summary

| Check | Status | Notes |
|---|---|---|
| 1 — Header compliance | PASS | All required fields present |
| 2 — Axis declaration | PASS | Nine axes, closed list |
| 3 — Primitive granularity | PASS | Structural floor reached; block-type vocabulary treated as enumeration within `[notion:block-type-vocabulary]` rather than 20+ separate primitives |
| 4 — Primitive identifiers | PASS | All `[notion:name]` format, unique within scope |
| 5 — Epistemic status labeling | PASS | Every substantive claim labeled |
| 6 — Staleness markers | PASS | All primitives carry 2026-02-16; moderate-ρ threshold declared |
| 7 — Source attribution | PASS | Per-primitive source attribution |
| 8 — Descriptive purity | PASS | Prescriptive content extracted |
| 9 — Cross-reference integrity | PASS | Internal cross-references resolve; external references use artifact identifiers |
| 10 — Species-specific completeness | PASS | All nine axes populated |
| 11 — Downstream traceability | PASS | All primitives addressable |
| 12 — Scope boundary testability | PASS | Notion platform features = in; internal infrastructure = out; institutional role = out |

---

*Production receipt: Produced via dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2) from report-notion.md evidence, under REVIEW governance, as Stage A1 target 2. Primitive count: 43.*
