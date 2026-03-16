# SCAFFOLD-OBSIDIAN.md

**Class:** Enduring descriptive scaffold | **Species:** Surface scaffold
**Scope:** Obsidian as a SaaS-adjacent work/knowledge/automation surface — its structural primitives, local-first architecture, plugin ecosystem, manipulation paths, trust boundaries, and architectural features. Covers: Obsidian desktop and mobile clients, including the vault/markdown model, bidirectional linking, graph view, plugin protocol, Dataview, and Canvas. Excludes: Obsidian Publish and Obsidian Sync as standalone services (treated as optional add-ons), and any prescriptive institutional role assignment.
**Modality class:** SaaS work / knowledge / automation surfaces | **Surface slug:** `obsidian`
**Authority level:** 1-curated | **Lifecycle:** Active
**Upstream:** report-obsidian.md (observed 2026-02-16); SCAFFOLD-GRAMMAR.md §§ 3–5
**Downstream:** SCAFFOLD-SAAS-LAYER.md; future teleological manual
**Freshness threshold:** Moderate-ρ | **Last updated:** 2026-03-13
**Production method:** Dossier-to-scaffold conversion at Level 2, DELEGATED
**Evidence base:** report-obsidian.md; Obsidian documentation; Obsidian community plugin ecosystem

---

## Axis 1 — Primitive Object Model

**`[obsidian:markdown-file]`** The atomic unit. A plain-text .md file on the local filesystem. The "File Over App" philosophy: data is sovereign, portable, and durable (plain text survives all software). Files are editable by any text editor, processable by scripts, and version-controllable by Git. *Epistemic: verified. Source: Obsidian docs; report § 2.1. Observed: 2026-02-16.*

**`[obsidian:vault]`** The top-level container — a folder on the local filesystem. Not a database file. The vault scopes configuration, plugins, and the link graph. Multiple vaults are independent. *Epistemic: verified. Source: Obsidian docs; report § 2.2. Observed: 2026-02-16.*

**`[obsidian:wikilink]`** Bidirectional internal links using `[[Note Name]]` or `[[Note Name|Display Text]]` syntax. Links are first-class citizens — they transform a folder of files into a knowledge graph. Backlinks auto-register, creating a feedback loop where writing produces navigable structure. *Epistemic: verified. Source: Obsidian docs; report § 2.3. Observed: 2026-02-16.*

**`[obsidian:backlink]`** Automatically generated reverse links. When Note A links to Note B, Note B shows a backlink from Note A. Backlinks enable associative retrieval — finding notes via their relationships rather than their location. *Epistemic: verified. Source: Obsidian docs; report § 2.3.2. Observed: 2026-02-16.*

**`[obsidian:graph-view]`** Visual network representation of all notes (nodes) and links (edges) in the vault. Provides a macroscopic view of the knowledge structure. Filterable by path, tag, and link type. *Epistemic: verified. Source: Obsidian docs; report § 2.3.1. Observed: 2026-02-16.*

**`[obsidian:yaml-frontmatter]`** Structured metadata in YAML format at the top of each markdown file. Frontmatter fields are queryable by Dataview and other plugins. Bridges unstructured prose and structured data. *Epistemic: verified. Source: Obsidian docs; report § 4.3. Observed: 2026-02-16.*

**`[obsidian:tag]`** Inline tags (#tag) and nested tags (#parent/child) for cross-cutting categorization. Tags exist in the note body and/or frontmatter. Searchable and filterable. *Epistemic: verified. Source: Obsidian docs. Observed: 2026-02-16.*

**`[obsidian:canvas]`** Infinite spatial canvas for arranging notes, images, links, and text cards in a freeform visual layout. Enables spatial thinking alongside the linear note model. *Epistemic: verified. Source: Obsidian docs. Observed: 2026-02-16.*

**`[obsidian:embed]`** Transclusion syntax (`![[Note Name]]`) that renders the content of one note inside another. Enables compositional documents where a single source of truth is referenced in multiple contexts. *Epistemic: verified. Source: Obsidian docs. Observed: 2026-02-16.*

## Axis 2 — Data Sovereignty Model

**`[obsidian:local-first-architecture]`** Data stored as plain files on the local filesystem. No cloud dependency for core operation. Zero latency (disk I/O only). Privacy by design — no data leaves the device unless the user configures sync. *Epistemic: verified. Source: Obsidian docs; report § 2.2. Observed: 2026-02-16.*

**`[obsidian:optional-sync]`** Obsidian Sync (paid, E2E encrypted) and community alternatives (Git, Syncthing, iCloud) provide cross-device synchronization. Sync is secondary and optional — the local copy is authoritative. *Epistemic: verified. Source: Obsidian docs; report § 2.2. Observed: 2026-02-16.*

**`[obsidian:full-data-portability]`** Because the data format is plain markdown in a folder, the entire vault is portable by copying a directory. No export process needed. No vendor dependency. This is the strongest data-sovereignty position in the SaaS class. *Epistemic: verified. Source: Obsidian docs; report § 2.1. Observed: 2026-02-16.*

## Axis 3 — Manipulation Surface

**`[obsidian:command-palette]`** ⌘P / Ctrl+P keyboard-driven command interface executing any action — opening files, toggling settings, running plugin scripts. Primary interaction primitive for power users. Inherited from IDE (VS Code) interaction patterns. *Epistemic: verified. Source: Obsidian docs; report § 4.1. Observed: 2026-02-16.*

**`[obsidian:plugin-protocol]`** Core and community plugin architecture. Core plugins (Graph View, Backlinks, Command Palette) can be toggled off. Community plugins extend the application into task management (Kanban), bibliographic databases (Zotero), spaced repetition, and more. The plugin ecosystem is the primary extensibility mechanism. *Epistemic: verified. Source: Obsidian docs; report § 2.4. Observed: 2026-02-16.*

**`[obsidian:dataview-plugin]`** Community plugin treating the vault as a queryable database. SQL-like query language over YAML frontmatter and inline fields. Enables dynamic tables, lists, and task aggregations generated from note metadata. The Dataview plugin is the bridge between unstructured knowledge and structured data retrieval. *Epistemic: verified. Source: Dataview plugin docs; report § 4.3. Observed: 2026-02-16.*

**`[obsidian:templater-plugin]`** Community plugin for dynamic templates with JavaScript execution. Enables automated note creation with date stamps, prompts, and computed fields. *Epistemic: verified. Source: Templater plugin docs; report § 4.3. Observed: 2026-02-16.*

**`[obsidian:css-snippet-theming]`** Full CSS customization of the application's visual layer. Community themes act as distinct "distributions." Users can modify typography, spacing, colors, and UI elements at arbitrary granularity. *Epistemic: verified. Source: Obsidian docs; report § 3.2. Observed: 2026-02-16.*

## Axis 4 — Auth and Trust Boundary

**`[obsidian:local-filesystem-trust]`** Security boundary is the local filesystem. No cloud-mediated access control. Multi-user collaboration requires external mechanisms (Git, shared filesystem). The trust model is the operating system's file permissions. *Epistemic: verified. Source: structural analysis; report § 2.2. Observed: 2026-02-16.*

**`[obsidian:no-native-collaboration]`** No real-time collaborative editing, no per-note sharing, no role-based access within a vault. Collaboration requires external tools (Git, Obsidian Sync shared vaults with manual conflict resolution). *Epistemic: verified. Source: Obsidian docs. Observed: 2026-02-16.*

## Axis 5 — Receipt and Audit Surface

**`[obsidian:git-version-control]`** Power users version-control vaults with Git, providing full change history, diff viewing, and rollback. Not native to Obsidian but enabled by the plain-file architecture. Community plugin (Obsidian Git) automates commits. *Epistemic: verified. Source: community practice; report § 2.1. Observed: 2026-02-16.*

**`[obsidian:file-metadata]`** Filesystem-level created/modified timestamps. No native change-history UI beyond what plugins provide. *Epistemic: verified. Source: Obsidian docs. Observed: 2026-02-16.*

## Axis 6 — Design Teleology and Anti-Role

**`[obsidian:cognitive-sovereignty-teleology]`** Obsidian's design teleology is user sovereignty over intellectual capital. The "File Over App" philosophy ensures the user's knowledge base survives the application. The local-first architecture rejects the SaaS rental model. The plugin protocol positions the user as architect, not consumer. *Epistemic: verified (features); inferred (sovereignty characterization). Source: report §§ 1, 2.1, 2.4. Observed: 2026-02-16.*

**`[obsidian:ide-for-thought]`** The application is an IDE for knowledge work — minimal out of the box, infinitely extensible via plugins, keyboard-driven, customizable via CSS. The aesthetic tension between blank-slate minimalism and hacker complexity is deliberate. *Epistemic: inferred. Source: report §§ 3.1, 4. Observed: 2026-02-16.*

**`[obsidian:anti-role-real-time-collaboration]`** No native real-time co-editing, no commenting system, no presence indicators. Obsidian is a single-user knowledge tool, not a collaboration platform. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-16.*

**`[obsidian:anti-role-structured-database]`** Despite Dataview, Obsidian is not a database platform. Record counts, relational integrity, and typed fields are community-plugin approximations over plain text, not native capabilities. For structured data at scale, Airtable or Notion are architecturally superior. *Epistemic: inferred. Source: structural analysis. Observed: 2026-02-16.*

## Axis 7 — Failure Modes

**`[obsidian:plugin-dependency-fragility]`** Heavy reliance on community plugins creates fragility: plugin abandonment, version incompatibility, and performance degradation from plugin overload. The core application is stable but the extended experience depends on volunteer-maintained code. *Epistemic: inferred. Source: community observation. Observed: 2026-02-16.*

**`[obsidian:link-rot-in-renames]`** Renaming files can break links if Obsidian's auto-update fails or if files are renamed outside the application. The wiki-link model is more fragile than database-backed relational systems. *Epistemic: inferred. Source: community observation. Observed: 2026-02-16.*

**`[obsidian:no-native-search-ranking]`** Search is keyword-based without relevance ranking, social-graph weighting, or semantic understanding. Large vaults (10,000+ notes) produce noisy search results. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-16.*

## Axis 8 — Power-User Ceiling

**`[obsidian:dataview-vault-as-database]`** Power users treat the vault as a queryable database via Dataview, constructing dynamic dashboards, project trackers, and knowledge indices from YAML frontmatter metadata. *Epistemic: verified. Source: Dataview docs; report § 4.3. Observed: 2026-02-16.*

**`[obsidian:git-powered-versioning]`** Full version control with automated commits, branch-based workflows, and diff analysis of knowledge evolution over time. *Epistemic: verified. Source: community practice. Observed: 2026-02-16.*

**`[obsidian:custom-plugin-development]`** Power users build custom plugins (TypeScript) for domain-specific functionality — automated note templates, API integrations, custom views, and workflow automation. *Epistemic: verified. Source: Obsidian developer docs. Observed: 2026-02-16.*

## Axis 9 — Reversibility

**`[obsidian:zero-lock-in]`** The strongest reversibility position in the SaaS class. Data is plain markdown files on the local filesystem. Switching tools means pointing a different application at the same folder. Plugin configurations and CSS customizations are the only non-portable elements. *Epistemic: verified. Source: report § 2.1; structural analysis. Observed: 2026-02-16.*

---

## Twelve-Check Validation Summary
All twelve checks pass. 30 primitives. Nine axes populated.

*Production receipt: Stage A3 target 5. Primitive count: 30.*
