# SCAFFOLD-CONFLUENCE.md

**Class:** Enduring descriptive scaffold  
**Species:** Surface scaffold  
**Scope:** Atlassian Confluence as a SaaS work/knowledge/automation surface — its structural primitives, object model, manipulation paths, trust boundaries, and architectural features. Covers: Confluence Cloud and Data Center as accessed through web clients, including the ADF storage format, macro engine, CQL, automation engine, and Rovo AI layer. Excludes: Jira (separate scaffold), Bitbucket, Trello, Confluence's internal infrastructure implementation, and any prescriptive institutional role assignment.  
**Modality class:** SaaS work / knowledge / automation surfaces  
**Surface slug:** `confluence`  
**Authority level:** 1-curated  
**Lifecycle:** Active  
**Upstream:** report-confluence.md (dossier-class exegesis, evidence base); LAYER-LAW.md § 5; SCAFFOLD-GRAMMAR.md §§ 3–5  
**Downstream:** Future teleological manual for Confluence; future SaaS layer scaffold; future cross-cutting scaffold for auth/trust concerns  
**Freshness threshold:** Moderate-ρ (FRESH < 14 days, CURRENT < 45 days, AGING < 120 days, STALE ≥ 120 days)  
**Last updated:** 2026-03-13  
**Production method:** Dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2)  
**Evidence base:** report-confluence.md (observed 2026-02-14); Atlassian documentation; Atlassian Design System documentation  

---

## Decomposition Axes

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

**`[confluence:space]`** The highest-level organizational container. A space is a sub-wiki that functions as a cognitive domain, permission boundary, and navigational root. Spaces scope the page tree, permissions, templates/blueprints, and sidebar customization. Space keys provide namespace scoping — a page titled "Onboarding" can exist in both Marketing and DevOps spaces without collision. Spaces typically map to persistent organizational entities (teams, projects, products). *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 2.1. Last observed: 2026-02-14.

**`[confluence:page]`** The atomic content unit. A page is a rich-media canvas that hosts text, embedded macros, attachments, and inline comments. Pages are organized in a hierarchical page tree (parent-child relationships) within a space. The underlying storage format has evolved from wiki markup to XHTML-based storage (Server/Data Center) to the Atlassian Document Format (ADF, JSON-based, Cloud). Pages carry labels for cross-cutting categorization, version history, and restriction overrides. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md §§ 2.2, 2.2.1. Last observed: 2026-02-14.

**`[confluence:atlassian-document-format]`** The modern storage representation (Cloud). ADF is a JSON-based schema where a page is a hierarchical tree of typed nodes (doc, paragraph, heading, bulletList, table, mediaGroup), inline marks (strong, em, link, textColor), and node-level attributes (heading level, code language). ADF replaces the older XHTML-based storage format and enables robust API manipulation, "headless" content generation, and structured programmatic analysis. *Epistemic status: verified.* Source: Atlassian developer documentation (ADF specification); report-confluence.md § 2.2.1. Last observed: 2026-02-14.

**`[confluence:macro]`** A dynamic viewport or functional script embedded in the page flow. Macros execute logic at render time, ensuring content is current when viewed. Categories: formatting macros (Code Block, Expand, Panel, Status), aggregation macros (Page Properties Report, Content Report Table, Task Report — these query the knowledge graph via CQL), integration macros (Jira Issues, Trello Board — rendering live data from external systems), and legacy macros (Space List). Macros are the primary vector for the Atlassian App ecosystem (see `[confluence:connect-forge-extensibility]`). *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md §§ 2.3, 2.3.1. Last observed: 2026-02-14.

**`[confluence:blueprint]`** An advanced template that includes generation logic. When instantiated, a blueprint prompts for metadata via a wizard dialog, injects variables into the page body and macros, and optionally creates an index page that aggregates all instances of that blueprint type. Blueprints enforce structural governance — every "Post-Incident Review" follows the same schema, making content programmatically accessible. *Epistemic status: verified.* Source: Atlassian developer documentation (blueprints); report-confluence.md § 2.4. Last observed: 2026-02-14.

**`[confluence:label]`** A flat-namespace tagging primitive applied to pages. Labels enable cross-cutting categorization independent of the page tree hierarchy. Labels drive CQL queries, Content Report macros, and automation conditions. *Epistemic status: verified.* Source: Atlassian documentation. Last observed: 2026-02-14.

**`[confluence:page-tree]`** The hierarchical parent-child organization of pages within a space. The page tree enforces a strict tree structure (each page has exactly one parent within its space) and provides the navigational spine of the space's sidebar. The tree structure favors top-down architecture over Notion's fluid nesting. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 2.1. Last observed: 2026-02-14.

**`[confluence:inline-comment]`** A discussion primitive anchored to specific text within a page. Inline comments carry state (Open → Resolved), turning documents into workflow tools where specifications are "processed" until all comments are resolved. The sidebar interaction preserves the main text while hosting the meta-discussion. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 4.2. Last observed: 2026-02-14.

**`[confluence:smart-link]`** An intelligent rendering primitive for pasted URLs. Pasting a Jira, Confluence, or other Atlassian URL renders a live card showing the target's current status, assignee, and metadata rather than a plain hyperlink. Smart Links are the presentation layer of the Teamwork Graph within Confluence. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 6.1. Last observed: 2026-02-14.

**`[confluence:whiteboard]`** A freeform visual canvas for diagramming, brainstorming, and spatial organization, integrated alongside pages within a space. Whiteboards complement the structured page format with unstructured visual collaboration. *Epistemic status: verified.* Source: Atlassian documentation. Last observed: 2026-02-14.

---

## Axis 2 — Data Sovereignty Model

**`[confluence:dual-deployment-model]`** Available as Cloud (Atlassian-hosted) and Data Center (self-hosted). Data Center provides full organizational control over storage, encryption, and backup. Cloud supports regional data residency (pinning data to US, EU, Australia). *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 6.2. Last observed: 2026-02-14.

**`[confluence:space-scoped-content]`** All pages, attachments, and configuration exist within a space scope. Cross-space content access is governed by space-level and page-level permissions. Global search crosses space boundaries subject to the viewer's permission set. *Epistemic status: verified.* Source: Atlassian documentation. Last observed: 2026-02-14.

**`[confluence:compliance-certification]`** Confluence Cloud Enterprise supports FedRAMP Moderate, HIPAA, SOC 2, ISO 27001, and GDPR compliance. Data residency controls allow geographic pinning. Comprehensive audit logs satisfy SOX requirements. *Epistemic status: verified.* Source: Atlassian Trust Center; report-confluence.md § 6.2. Last observed: 2026-02-14.

**`[confluence:data-export]`** Spaces and pages can be exported as XML (Data Center), PDF, Word, or via the REST API (JSON/ADF). Full-instance backup available on Data Center. Cloud provides Atlassian's data portability tools. Export captures content and structure but macro-rendered dynamic content may not survive export. *Epistemic status: verified.* Source: Atlassian documentation. Last observed: 2026-02-14.

---

## Axis 3 — Manipulation Surface

**`[confluence:web-editor]`** The primary content creation interface. Cloud uses a modern block-style editor with slash commands for inserting elements, real-time collaborative editing via Synchrony (OT-based), and inline formatting. The editor renders ADF nodes into an interactive editing surface. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md §§ 3.2, 4.1. Last observed: 2026-02-14.

**`[confluence:cql]`** Confluence Query Language — a structured query language for searching and filtering content across spaces. CQL supports field-based predicates (label, space, type, creator, lastModified), boolean logic (AND/OR/NOT), temporal functions (startOfWeek, endOfDay), and content-relationship functions (parent = currentContent). CQL powers search, Content Report macros, automation conditions, and API queries. *Epistemic status: verified.* Source: Atlassian developer documentation; report-confluence.md § 7.1. Last observed: 2026-02-14.

**`[confluence:automation-engine]`** A no-code automation engine (shared architecture with Jira Automation) using trigger → condition → action rules. Triggers include page events (published, updated, commented), scheduled intervals, and label changes. Smart Values provide dynamic data injection using Mustache-style syntax. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 7.2. Last observed: 2026-02-14.

**`[confluence:rest-api]`** Comprehensive REST API providing CRUD operations on pages, spaces, labels, content properties, and search (via CQL). The API operates on ADF (Cloud) or XHTML storage format (Data Center). Enables headless content generation, bulk operations, and CI/CD pipeline integration. *Epistemic status: verified.* Source: Atlassian developer documentation; report-confluence.md § 7.3. Last observed: 2026-02-14.

**`[confluence:connect-forge-extensibility]`** Two architectures for extending Confluence via custom macros and apps. Atlassian Connect (legacy): apps run on vendor infrastructure, served via iFrames, communicating via JWT-signed REST. Atlassian Forge (modern): serverless apps running inside Atlassian's infrastructure (AWS Lambda), using native UI components (Atlaskit), providing zero-latency and data-residency compliance. *Epistemic status: verified.* Source: Atlassian developer documentation; report-confluence.md § 2.3.2. Last observed: 2026-02-14.

**`[confluence:scriptrunner]`** Third-party Groovy scripting layer (available on Data Center, limited on Cloud) enabling complex programmatic operations: bulk labeling, content manipulation via regex, page-tree traversal, and custom REST endpoints. ScriptRunner extends the manipulation surface beyond what native automation and the API offer. *Epistemic status: verified.* Source: ScriptRunner documentation; report-confluence.md § 7.3. Last observed: 2026-02-14.

---

## Axis 4 — Auth and Trust Boundary

**`[confluence:space-permissions]`** The primary access control mechanism. Space-level permissions govern who can view, edit, administer, and export content within a space. Permissions are assigned to users, groups, or anonymous access. Space permissions are the first-order trust boundary. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 2.1.2. Last observed: 2026-02-14.

**`[confluence:page-restrictions]`** Page-level access override. Individual pages can be restricted to specific users or groups for viewing and/or editing, overriding the space-level defaults. Page restrictions provide fine-grained content protection within an otherwise open space. *Epistemic status: verified.* Source: Atlassian documentation. Last observed: 2026-02-14.

**`[confluence:admin-hierarchy]`** Three administrative tiers: site administrators (instance-level settings, user management, global permissions), space administrators (space-level configuration, permissions, templates), and page-level restriction setters. *Epistemic status: verified.* Source: Atlassian documentation. Last observed: 2026-02-14.

---

## Axis 5 — Receipt and Audit Surface

**`[confluence:page-version-history]`** Every edit creates a new version. Version history records the editor, timestamp, and change diff. Any version can be restored or compared. Version history is the primary audit trail for content evolution. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 2.2. Last observed: 2026-02-14.

**`[confluence:audit-log]`** Enterprise-tier administrative audit log recording permission changes, space creation/deletion, user management events, and content access patterns. Satisfies SOX, GDPR, and compliance audit requirements. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 6.2. Last observed: 2026-02-14.

**`[confluence:watch-notification-system]`** Users can "watch" pages or spaces to receive notifications on updates. Mentions (@user) create explicit notification events. The system batches notifications to prevent fatigue. The notification system is the awareness layer for content evolution. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 4.3. Last observed: 2026-02-14.

---

## Axis 6 — Design Teleology and Anti-Role

**`[confluence:open-by-default-philosophy]`** Confluence's default posture is transparency. New spaces and pages are visible to all authenticated users unless explicitly restricted. This inverted default (compared to SharePoint's closed-by-default model) drives network effects: knowledge becomes discoverable, enabling serendipitous cross-team discovery. *Epistemic status: verified (default posture); inferred (network-effect characterization).* Source: Atlassian documentation; report-confluence.md § 1.1. Last observed: 2026-02-14.

**`[confluence:enterprise-wiki-paradigm]`** Confluence is architecturally a structured enterprise wiki, not a flexible workspace. The Space → Page Tree → Page hierarchy imposes top-down information architecture. The aesthetic (Atlassian Design System) favors density and utility over minimalism. The macro engine transforms pages from static documents into live dashboards. *Epistemic status: verified (architecture); inferred (paradigm characterization).* Source: report-confluence.md §§ 3.1, 5.1. Last observed: 2026-02-14.

**`[confluence:jira-symbiosis]`** Confluence is architecturally coupled to Jira through bidirectional integration: Jira Issues macro renders live ticket data in pages, Smart Links display Jira metadata, and issues can be created from highlighted Confluence text. This coupling is the strongest integration in the SaaS modality class. Confluence's design teleology assumes Jira is the execution layer. *Epistemic status: verified (integration features); inferred (symbiosis characterization).* Source: Atlassian documentation; report-confluence.md § 6.1. Last observed: 2026-02-14.

**`[confluence:anti-role-lightweight-task-management]`** Confluence provides task lists via checkboxes and Task Report macros, but does not provide native sprint management, Kanban boards, workflow state machines, or project timeline views. Task management is delegated to Jira by design. *Epistemic status: inferred.* Source: report-confluence.md § 5.1; operational observation. Last observed: 2026-02-14.

**`[confluence:anti-role-real-time-messaging]`** Confluence provides comments and mentions but no channel-based messaging, presence indicators, or voice/video communication. Real-time collaboration in Confluence is document-centric (co-editing), not conversation-centric. *Epistemic status: inferred.* Source: operational observation. Last observed: 2026-02-14.

---

## Axis 7 — Failure Modes

**`[confluence:content-sprawl]`** Without active governance (archival policies, labeling standards, page-tree pruning), Confluence workspaces accumulate stale, orphaned, and duplicative pages. The open-by-default posture amplifies sprawl — anyone can create content anywhere. The platform provides no native content-lifecycle management beyond manual archival and automation-driven pruning. *Epistemic status: inferred.* Source: report-confluence.md § 7.2; operational observation. Last observed: 2026-02-14.

**`[confluence:macro-rendering-latency]`** Pages with many dynamic macros (especially Jira Issues macros querying large result sets) can exhibit rendering delays. The macro engine executes queries at view time, creating a load proportional to macro complexity. *Epistemic status: inferred.* Source: report-confluence.md § 3.2; operational observation. Last observed: 2026-02-14.

**`[confluence:collaborative-editing-latency]`** The OT-based Synchrony engine introduces micro-latency when merging complex edits (tables, macros). This is more noticeable than Google Docs because the ADF tree is structurally richer than flat text. *Epistemic status: inferred.* Source: report-confluence.md § 4.1. Last observed: 2026-02-14.

**`[confluence:search-quality-at-scale]`** In instances with 100,000+ pages, search result relevance depends heavily on labeling discipline and CQL precision. Keyword search alone produces noisy results across open spaces. *Epistemic status: inferred.* Source: operational observation. Last observed: 2026-02-14.

---

## Axis 8 — Power-User Ceiling

**`[confluence:cql-driven-dashboards]`** Power users build self-maintaining dashboards using Content Report macros powered by CQL queries. A rolling-window dashboard of incident reports from the last 4 weeks updates automatically as new pages are created and labeled. CQL's temporal functions and label predicates enable sophisticated automated reporting. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 7.1. Last observed: 2026-02-14.

**`[confluence:automation-workflow-construction]`** Advanced automation patterns: scheduled stale-content reapers (CQL-filtered pages not modified in 365 days trigger review emails), label-based archival workflows, cross-product automation (Confluence page published → Jira issue created). Smart Values enable dynamic data injection. *Epistemic status: verified.* Source: Atlassian documentation; report-confluence.md § 7.2. Last observed: 2026-02-14.

**`[confluence:api-bulk-operations]`** The REST API enables headless bulk operations: extracting the entire knowledge base for NLP analysis, CI/CD-integrated content injection (appending build logs to release pages), and programmatic page-tree restructuring. *Epistemic status: verified.* Source: Atlassian developer documentation; report-confluence.md § 7.3. Last observed: 2026-02-14.

**`[confluence:rovo-ai-agents]`** Atlassian Rovo agents are context-aware AI workers that can be triggered by automation or invoked via Smart Buttons. Rovo can read page content, summarize sentiment, extract structured data, post comments, and traverse the cross-space knowledge graph to answer questions spanning multiple spaces and products. *Epistemic status: verified (feature existence); provisional (Rovo is an actively evolving feature with unstable API surface).* Source: Atlassian Rovo documentation; report-confluence.md § 7.4. Last observed: 2026-02-14.

---

## Axis 9 — Reversibility

**`[confluence:page-version-restore]`** Any prior version of a page can be restored from version history. Restoration is a first-class operation. The restored state becomes a new version, preserving the full history. *Epistemic status: verified.* Source: Atlassian documentation. Last observed: 2026-02-14.

**`[confluence:trash-recovery]`** Deleted pages are moved to a space-scoped trash, recoverable by space administrators. Permanent deletion from trash is irreversible. *Epistemic status: verified.* Source: Atlassian documentation. Last observed: 2026-02-14.

**`[confluence:jira-integration-lock-in]`** The bidirectional Jira integration creates coupling that increases migration cost. Pages containing Jira Issues macros, Smart Links, and two-way issue-creation workflows lose their dynamic content on migration to non-Atlassian platforms. *Epistemic status: inferred.* Source: report-confluence.md § 6.1. Last observed: 2026-02-14.

**`[confluence:knowledge-graph-lock-in]`** Organizations that encode their operational knowledge into Confluence's space/page/label/macro structure accumulate switching costs proportional to the depth of the knowledge graph. Cross-references, CQL-driven dashboards, blueprint-standardized content, and macro-embedded live data do not survive platform migration. *Epistemic status: inferred.* Source: report-confluence.md §§ 1.1, 6.3. Last observed: 2026-02-14.

---

## Prescriptive Content Extracted

- "Confluence is unequivocally the best Operating System for Technical Teams" (report-confluence.md § 8) — teleological claim.
- "Choose Confluence if your organization views knowledge as a living, networked asset" (report-confluence.md § 8) — recommendation framework.
- "Notion appeals to the creator; Confluence appeals to the curator" (report-confluence.md § 5.1) — evaluative comparison.

---

## Twelve-Check Validation Summary

| Check | Status | Notes |
|---|---|---|
| 1 — Header compliance | PASS | All required fields present |
| 2 — Axis declaration | PASS | Nine axes, closed list |
| 3 — Primitive granularity | PASS | Structural floor reached |
| 4 — Primitive identifiers | PASS | All `[confluence:name]` format, unique |
| 5 — Epistemic status labeling | PASS | Every claim labeled |
| 6 — Staleness markers | PASS | All primitives carry 2026-02-14; moderate-ρ threshold declared |
| 7 — Source attribution | PASS | Per-primitive |
| 8 — Descriptive purity | PASS | Prescriptive content extracted |
| 9 — Cross-reference integrity | PASS | References resolve |
| 10 — Species-specific completeness | PASS | All nine axes populated |
| 11 — Downstream traceability | PASS | All primitives addressable |
| 12 — Scope boundary testability | PASS | Confluence features = in; Jira = separate scaffold; infrastructure = out |

*Production receipt: Produced via dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2) at Level 2, under DELEGATED execution, as Stage A2 target 1. Primitive count: 35.*
