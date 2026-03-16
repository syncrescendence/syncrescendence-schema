<!-- Superseded-by: scaffolds/saas/SCAFFOLD-SLACK.md -->
# SCAFFOLD-SLACK.md

**Class:** Enduring descriptive scaffold  
**Species:** Surface scaffold  
**Scope:** The Slack platform as a SaaS work/knowledge/automation surface — its structural primitives, object model, manipulation paths, trust boundaries, and architectural features. Covers: the Slack application as accessed by workspace members through desktop, web, and mobile clients, including its API surface and integration framework. Excludes: Slack's internal infrastructure implementation (backend scaling, data-center topology), the Salesforce parent-company organizational structure, and any prescriptive institutional role assignment (which belongs in a teleological manual, not a scaffold).  
**Modality class:** SaaS work / knowledge / automation surfaces  
**Surface slug:** `slack`  
**Authority level:** 1-curated  
**Lifecycle:** Active  
**Upstream:** report-slack.md (dossier-class exegesis, evidence base); LAYER-LAW.md § 5 (modality-class axis set); SCAFFOLD-GRAMMAR.md §§ 3–5 (validation schema and production procedure)  
**Downstream:** Future teleological manual for Slack; future SaaS layer scaffold (cross-entity synthesis); future Tier 5 coordination scaffold (Slack in its coordination role)  
**Freshness threshold:** Moderate-ρ regime for structural primitives (FRESH < 14 days, CURRENT < 45 days, AGING < 120 days, STALE ≥ 120 days). Slack's structural object model changes slowly; feature additions and API changes arrive at moderate cadence. Capability-level changes (pricing, feature flags, AI integrations) are tracked in the temporal domain, not in this scaffold.  
**Last updated:** 2026-03-13  
**Production method:** Dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2)  
**Evidence base:** report-slack.md (observed 2026-02-16); Slack developer documentation (docs.slack.dev); Slack blog and design publications  

---

## Decomposition Axes

This scaffold decomposes Slack along the nine axes declared for the SaaS work/knowledge/automation modality class in LAYER-LAW.md § 5:

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

The structural entities that compose Slack's information architecture, their relationships, and their compositional rules.

**`[slack:workspace]`** The top-level organizational container. A workspace is a single Slack instance with its own member roster, channel set, app installation scope, and billing identity. All other objects exist within exactly one workspace (with the exception of Slack Connect channels, which bridge two workspaces). Workspaces are the ACL root — permissions, search indices, and data-retention policies are workspace-scoped. *Epistemic status: verified.* Source: Slack developer documentation; report-slack.md §§ 1, 4.1. Last observed: 2026-02-16.

**`[slack:channel]`** The primary organizational unit for conversation. Channels are named, persistent containers that hold messages in chronological order. Three structural variants exist: public channels (discoverable and joinable by any workspace member without invitation), private channels (visible and joinable only by invitation), and Slack Connect channels (shared across organizational boundaries while maintaining per-workspace compliance). The channel primitive includes metadata: topic, purpose, member count, pinned items, and bookmarked items. The default-public posture is an architectural commitment — it shapes organizational information flow toward transparency. *Epistemic status: verified.* Source: Slack documentation; report-slack.md §§ 1.2, 6.1. Last observed: 2026-02-16.

**`[slack:message]`** The atomic unit of communication. A message is a timestamped, author-attributed object within a channel or direct message. Messages are composed of Block Kit components (see `[slack:block-kit-framework]`), not raw text — even plain-text messages are internally represented as block structures. Messages are the anchoring point for threads, reactions, and file attachments. Each message carries a unique `ts` (timestamp) identifier that serves as both temporal marker and primary key within its channel. *Epistemic status: verified.* Source: Slack developer documentation (Block Kit reference); report-slack.md § 1.1. Last observed: 2026-02-16.

**`[slack:block-kit-framework]`** The composable UI component system that structures message content. Block Kit defines a vocabulary of typed visual blocks (section, actions, context, input, header, divider, image, file, rich-text) that are stacked vertically to compose a message. Each block type constrains what elements it can contain: section blocks hold text and optional accessory elements; action blocks hold interactive components (buttons, menus, date pickers); context blocks hold small-format metadata text and images. The framework enforces cross-platform rendering consistency — a Block Kit message renders identically on desktop, web, and mobile. The design philosophy is constrained flexibility: applications construct messages via typed JSON objects rather than arbitrary HTML, ensuring visual coherence across the platform. *Epistemic status: verified.* Source: docs.slack.dev/block-kit; report-slack.md § 1.1. Last observed: 2026-02-16.

**`[slack:thread]`** A containment structure that sequesters detailed discussion from the main channel timeline. A thread attaches to a parent message and renders in a side-panel drawer, preserving the main channel's scannability while allowing depth expansion. This creates a two-dimensional information architecture: vertical (chronological channel timeline) and horizontal (depth expansion into threaded discussion). Threads can optionally broadcast their replies to the parent channel, collapsing the containment for high-signal replies. Thread replies carry their own `ts` identifiers and are independently searchable. *Epistemic status: verified.* Source: Slack documentation; report-slack.md § 1.3. Last observed: 2026-02-16.

**`[slack:reacji]`** Emoji reactions attached to messages. Functionally, reacjis serve as low-friction signal carriers: acknowledgment (eyes, checkmark), voting (plus-one), sentiment (custom emoji), and workflow triggering (via the Reacji Channeler). Each reacji on a message records which users applied it and is visible to all channel members. Reacjis occupy a distinct structural role from replies — they communicate without generating conversation noise, providing what the dossier characterizes as "affective bandwidth" in a text-first medium. Custom workspace emoji extend the vocabulary beyond the Unicode set. *Epistemic status: verified (structural function); inferred (affective-bandwidth characterization).* Source: Slack documentation; report-slack.md §§ 1.4, 7.2. Last observed: 2026-02-16.

**`[slack:huddle]`** A lightweight audio-first communication channel that operates within a channel or direct message. Huddles are toggle-activated (no scheduling, no calendar invitation, no link generation), default to audio-only with opt-in video and screen sharing, and radiate a presence signal (headphone icon) in the sidebar to invite ambient participation. Structurally distinct from scheduled meetings — huddles are ephemeral, drop-in/drop-out, and do not generate calendar artifacts. They represent Slack's synchronous communication layer, complementing the default asynchronous text layer. *Epistemic status: verified.* Source: Slack Huddles documentation; report-slack.md § 3.1. Last observed: 2026-02-16.

**`[slack:direct-message]`** One-to-one or small-group conversation containers outside the channel structure. DMs share the message object model with channels (Block Kit composition, threading, reactions) but are scoped to a fixed participant set. Multi-party DMs (group DMs) are structurally distinct from private channels — they cannot be named, cannot have topics, and cannot be converted to channels. *Epistemic status: verified.* Source: Slack documentation. Last observed: 2026-02-16.

**`[slack:sidebar-navigation]`** The primary navigational structure. The sidebar organizes channels, DMs, and apps by recency, priority, and user-defined custom sections. Custom sections allow users to group channels by function (e.g., "Critical Projects," "Social," "Triage"), providing cognitive-load management at the individual level. The sidebar distinguishes between activity types: bold channel name indicates unread activity, a red numeric badge indicates direct mentions or DMs. This granular distinction between ambient awareness and directed attention is a structural feature of the notification architecture. *Epistemic status: verified.* Source: Slack documentation; report-slack.md §§ 3.2, 2.1. Last observed: 2026-02-16.

**`[slack:presence-status]`** A signaling layer for availability and context. Extends beyond the binary Available/Away dot to include custom text statuses with associated emoji, automatic status updates from calendar integrations, and Huddle activity indicators. The presence system provides contextual cues that inform interruption decisions — simulating the visual signals of physical co-location. *Epistemic status: verified (feature description); inferred (co-location simulation characterization).* Source: Slack documentation; report-slack.md § 3.3. Last observed: 2026-02-16.

**`[slack:app-object]`** Third-party and internal applications installed into a workspace. Apps interact with Slack through the API surface (see Axis 3), can post messages, respond to events, create interactive Block Kit messages, register slash commands, and participate in Workflow Builder steps. Apps are the extensibility primitive — they transform Slack from a messaging platform into an integration hub. The App Directory catalogs over 2,400 available integrations. *Epistemic status: verified (structural role); inferred (2,400+ count from dossier, not independently reverified).* Source: Slack documentation; report-slack.md §§ 6.2, 1.1. Last observed: 2026-02-16.

**`[slack:file-object]`** Files uploaded to or shared within channels and DMs. Files carry metadata (uploader, timestamp, channel context), are searchable, and can be commented on. File handling in Slack is secondary to the message stream — files are attached to messages rather than existing in an independent file hierarchy. Slack does not provide a filesystem metaphor; file management is conversation-anchored. *Epistemic status: verified.* Source: Slack documentation. Last observed: 2026-02-16.

**`[slack:canvas]`** A persistent document surface within channels, introduced as an evolution beyond pinned messages and channel topics for longer-form reference content. Canvases exist alongside the message stream but are not messages — they are editable, collaborative documents anchored to a channel or shared independently. *Epistemic status: verified (existence); provisional (structural maturity — canvas is a relatively recent addition and its role in the object model is still stabilizing).* Source: Slack product announcements. Last observed: 2026-02-16.

---

## Axis 2 — Data Sovereignty Model

How Slack governs data ownership, storage, access, and retention.

**`[slack:workspace-scoped-data]`** All message content, files, and metadata exist within a workspace's data boundary. Each workspace maintains its own index, its own ACL, and its own retention policies. There is no cross-workspace data sharing outside of Slack Connect channels. Search results are confined to the user's workspace and further filtered by the user's channel-membership ACL — a user cannot search content from channels they have not joined. *Epistemic status: verified.* Source: report-slack.md §§ 4.1, 4.3; Slack security documentation. Last observed: 2026-02-16.

**`[slack:enterprise-key-management]`** EKM allows enterprise customers to hold their own encryption keys in AWS KMS, providing organizational control over data encryption and revocation power. With EKM, an organization can revoke access to its data stored in Slack's infrastructure by revoking the key — a capability that transforms Slack from a vendor-controlled data store into an organizationally controlled one for enterprise deployments. *Epistemic status: verified.* Source: Slack enterprise documentation; report-slack.md § 4.3. Last observed: 2026-02-16.

**`[slack:message-retention-policy]`** Workspace administrators can configure message and file retention policies (e.g., auto-delete messages older than N days, retain all messages indefinitely). Retention policies are workspace-global or per-channel. This primitive governs the lifespan of the "Searchable Log" — whether the log is truly "all" conversation depends on retention configuration. *Epistemic status: verified (feature existence); inferred (per-channel granularity from admin documentation review).* Source: Slack admin documentation. Last observed: 2026-02-16.

**`[slack:data-export-capability]`** Workspace owners can export message history and file metadata. Export scope varies by plan tier: free and Pro plans allow export of public channel data only; Business+ and Enterprise Grid allow export of all data including private channels and DMs (with compliance oversight). The export format is JSON. *Epistemic status: verified.* Source: Slack documentation. Last observed: 2026-02-16.

**`[slack:slack-connect-data-boundary]`** When two organizations share a Slack Connect channel, messages exist simultaneously under both organizations' compliance and retention regimes. Each organization's administrators can apply their own retention and export policies to their side of the shared channel. Data sovereignty is maintained per-organization even in the shared context. *Epistemic status: inferred (from architectural description in Slack Connect documentation; per-organization retention independence not independently tested).* Source: report-slack.md § 6.1; Slack Connect documentation. Last observed: 2026-02-16.

---

## Axis 3 — Manipulation Surface

The paths through which users and systems interact with, modify, and automate Slack.

**`[slack:block-kit-api]`** The programmatic interface for constructing rich, interactive messages. Applications compose messages by assembling Block Kit JSON payloads and posting them via the Web API. The API surface includes message creation, update, deletion, ephemeral message posting, and interactive payload handling (button clicks, menu selections, modal submissions). Block Kit is the primary manipulation path for application-grade Slack interaction. *Epistemic status: verified.* Source: docs.slack.dev/block-kit; report-slack.md § 1.1. Last observed: 2026-02-16.

**`[slack:bolt-framework]`** The official application framework (available in JavaScript, Python, and Java) that abstracts the Events API (see `[slack:events-api]`), interactive components, and Socket Mode (see `[slack:socket-mode]`) into a structured development model. Bolt provides event listeners, middleware patterns, and connection management. Socket Mode operation (see `[slack:socket-mode]`) allows Bolt apps to operate behind firewalls without exposing public endpoints. *Epistemic status: verified.* Source: Slack developer documentation; report-slack.md § 7.4. Last observed: 2026-02-16.

**`[slack:socket-mode]`** A WebSocket-based connection mode that allows apps to receive events and interactive payloads without a public HTTP endpoint. Socket Mode enables internal enterprise bots that operate entirely behind the corporate firewall — a significant architectural feature for security-sensitive deployments. *Epistemic status: verified.* Source: Slack developer documentation; report-slack.md § 7.4. Last observed: 2026-02-16.

**`[slack:events-api]`** The subscription system through which apps declare which workspace events they receive in real time — message posted, channel created, member joined, reaction added, file shared, and others. Apps specify their event subscriptions in their manifest; Slack delivers matching events as structured JSON payloads. The Events API is the reactive manipulation layer: it determines *what apps can respond to*, while Socket Mode determines *how events are delivered* and the Bolt Framework determines *how events are processed*. Apps can consume the Events API directly over HTTP (request URL mode) or through Socket Mode (WebSocket mode). The Events API is structurally distinct from webhooks (which are point-to-point HTTP hooks without a subscription model) and from slash commands (which are user-initiated, not event-driven). *Epistemic status: verified.* Source: Slack developer documentation (Events API reference). Last observed: 2026-02-16.

**`[slack:workflow-builder]`** A no-code automation tool that allows non-developer users to create multi-step workflows triggered by events (channel messages, emoji reactions, scheduled times, webhooks). Workflow steps can include sending messages, collecting form input, creating channel invitations, and invoking third-party app actions. Workflow Builder democratizes the manipulation surface — it extends automation capability beyond the developer API to the general user population. *Epistemic status: verified.* Source: Slack Workflow Builder documentation; report-slack.md § 7.2. Last observed: 2026-02-16.

**`[slack:slash-commands]`** User-invoked commands entered in the message input field (e.g., `/remind`, `/invite`, `/topic`). Slash commands can be built-in (Slack-provided) or custom (registered by installed apps). Custom slash commands translate user text input into HTTP requests to application backends, making the message input field function as a command-line interface. *Epistemic status: verified.* Source: docs.slack.dev/interactivity; report-slack.md § 7.3. Last observed: 2026-02-16.

**`[slack:reacji-channeler]`** A workflow mechanism that copies messages to designated channels when specific emoji reactions are applied. The Reacji Channeler transforms emoji from passive signals into active workflow triggers — a bug emoji on a support message can automatically route it to an engineering triage channel. *Epistemic status: verified.* Source: Slack documentation; report-slack.md § 7.2. Last observed: 2026-02-16.

**`[slack:search-modifiers]`** A structured query syntax for the search interface: `from:@user`, `in:#channel`, `has:star`, `has:reaction`, `before:date`, `after:date`, `during:month`, `is:thread`. Search modifiers transform Slack's search bar from a keyword tool into a database query interface for the message log. *Epistemic status: verified.* Source: Slack help documentation; report-slack.md § 7.1. Last observed: 2026-02-16.

**`[slack:quick-switcher]`** The keyboard-invoked navigation shortcut (`⌘+K` / `Ctrl+K`) that provides instant context-switching between channels, DMs, and apps via fuzzy-match search. The Quick Switcher is the primary keyboard-driven navigation path, bypassing the sidebar for users who prefer terminal-style interaction. *Epistemic status: verified.* Source: Slack documentation; report-slack.md § 7.3. Last observed: 2026-02-16.

**`[slack:webhooks]`** Inbound and outbound HTTP hooks that connect external systems to Slack channels. Inbound webhooks allow external systems to post messages to Slack; outbound webhooks allow Slack events to trigger external HTTP endpoints. Webhooks are the simplest integration path — lower complexity than Bolt/Socket Mode but also lower capability (no interactivity, no state management). *Epistemic status: verified.* Source: Slack developer documentation; report-slack.md § 5.3. Last observed: 2026-02-16.

---

## Axis 4 — Auth and Trust Boundary

The permission model, identity framework, and access control architecture.

**`[slack:workspace-membership]`** The foundational access control unit. Users are members of a workspace, and workspace membership grants access to public channels and the ability to be invited to private channels. Membership is managed by workspace administrators. *Epistemic status: verified.* Source: Slack admin documentation. Last observed: 2026-02-16.

**`[slack:channel-permission-model]`** Channels carry three access regimes. Public channels are open to all workspace members (join/leave at will). Private channels restrict membership to invited users only. Slack Connect channels extend access across organizational boundaries under negotiated permission. Channel creators and workspace admins can modify channel settings (archive, rename, convert between public and private with restrictions). *Epistemic status: verified.* Source: Slack documentation; report-slack.md § 1.2. Last observed: 2026-02-16.

**`[slack:app-permission-scopes]`** Installed apps request granular OAuth scopes that define what data and actions they can access: reading messages, posting messages, accessing user profiles, managing channels, accessing files. The scope model provides per-app access control — each app's capabilities are bounded by its approved scopes. Workspace administrators control which apps can be installed. *Epistemic status: verified.* Source: Slack developer documentation. Last observed: 2026-02-16.

**`[slack:bot-user-tokens]`** Apps operating as bots receive bot-scoped tokens that authorize API calls on behalf of the app rather than a human user. Bot tokens carry a distinct identity (the bot's name and avatar appear as the message author), creating accountability separation between human and automated actions. *Epistemic status: verified.* Source: Slack developer documentation. Last observed: 2026-02-16.

**`[slack:enterprise-grid-org]`** For large organizations, Enterprise Grid provides a parent organization layer above individual workspaces. The org layer manages cross-workspace policies, IdP integration (SAML SSO), user provisioning (SCIM), and compliance controls. Enterprise Grid is the trust boundary for organization-wide governance. *Epistemic status: verified.* Source: Slack enterprise documentation. Last observed: 2026-02-16.

**`[slack:slack-connect-trust-boundary]`** Cross-organizational channels establish a bidirectional trust boundary. Each organization retains control over its own compliance, retention, and DLP policies within the shared channel. The trust model is symmetric: neither organization has administrative access to the other's workspace. Connection requires mutual acceptance. *Epistemic status: inferred (bidirectional trust model described in Slack Connect documentation; not independently tested at the enforcement layer).* Source: report-slack.md § 6.1; Slack Connect security documentation. Last observed: 2026-02-16.

---

## Axis 5 — Receipt and Audit Surface

The mechanisms by which Slack records, surfaces, and makes auditable the history of actions and information flow.

**`[slack:message-log-persistence]`** The core audit substrate — Slack is architecturally defined as a "Searchable Log of All Conversation and Knowledge." Every message is timestamped, author-attributed, and persistently indexed (subject to retention policy). Edit history is preserved — edited messages display an "(edited)" marker, and the original content is accessible. Deleted messages are removed from the user-visible log but may be retained in compliance exports depending on plan tier. *Epistemic status: verified (persistence and edit markers); inferred (compliance export retention of deleted messages from enterprise documentation).* Source: Slack documentation; report-slack.md §§ 1, 4. Last observed: 2026-02-16.

**`[slack:search-index]`** The real-time ingestion pipeline that indexes messages, files, and metadata for search retrieval. Built on a distributed Solr-based architecture with per-workspace ACL-scoped indices. Messages become searchable at near-zero latency after posting. The search index is the audit surface's query layer — it transforms the raw message log into a retrievable evidence store. *Epistemic status: verified (architecture and near-zero latency); inferred (Solr-specific details from engineering blog, not independently verified in current implementation).* Source: Slack engineering blog (search-at-slack); report-slack.md § 4.1. Last observed: 2026-02-16.

**`[slack:work-graph-ranking]`** A proprietary relevance algorithm that ranks search results by social and interaction graph signals: user affinity (who the searcher communicates with most), recency (recently visited channels), and interaction history (clicked files, participated threads). The Work Graph personalizes the audit surface — two users searching the same term see different priority-ranked results based on their organizational position and interaction patterns. *Epistemic status: verified (algorithm existence and signal types); inferred (specific signal weighting from engineering blog descriptions).* Source: report-slack.md § 4.2; Slack engineering blog. Last observed: 2026-02-16.

**`[slack:compliance-export]`** Enterprise-tier functionality that provides full data export including private channels and DMs for legal, compliance, and e-discovery purposes. Export format is JSON with metadata. Compliance export is the formal audit trail for regulated industries. *Epistemic status: verified.* Source: Slack enterprise documentation. Last observed: 2026-02-16.

---

## Axis 6 — Design Teleology and Anti-Role

The architectural intentions that govern what Slack is designed to be, and the roles it structurally resists.

**`[slack:digital-commons-metaphor]`** Slack's architectural orientation is transparency by default. Public channels are the default organizational unit. Information flows through open, discoverable spaces rather than permission-locked containers. This orientation creates what the dossier characterizes as a "Digital Commons" — a shared information space where observation and participation carry low friction. The design teleology prioritizes information accessibility over information control. *Epistemic status: inferred (the "Digital Commons" characterization is an analytical frame from the dossier, not a vendor-stated architectural principle; the transparency-by-default posture is verified from product design).* Source: report-slack.md §§ 1.2, 5.1. Last observed: 2026-02-16.

**`[slack:text-first-async-paradigm]`** Slack is structurally a text-first, asynchronous communication platform. The message stream is the primary object; voice (Huddles) and video are secondary, opt-in layers. This contrasts with voice-first platforms (Discord) and meeting-first platforms (Teams). The text-first paradigm means Slack generates a persistent, searchable record as a byproduct of normal operation — the "Searchable Log" is not an add-on feature but a consequence of the primary modality being text. *Epistemic status: verified (text-first architecture); inferred (contrast positioning as analytical observation).* Source: report-slack.md §§ 3.1, 5.2. Last observed: 2026-02-16.

**`[slack:middleware-hub-philosophy]`** Slack positions itself as connective tissue between best-of-breed tools rather than as a replacement for them. The integration architecture (2,400+ apps, Block Kit API, Workflow Builder) is designed to make Slack the surface where work from other tools is discussed, triaged, and dispatched — not where the work itself is produced. Slack does not try to be a document editor, a project management tool, or a code repository. It tries to be the terminal where those tools' outputs converge. *Epistemic status: inferred (integration-hub characterization is analytical; the breadth of the App Directory and API surface are verified).* Source: report-slack.md §§ 5.3, 6.2. Last observed: 2026-02-16.

**`[slack:anti-role-document-system]`** Slack structurally resists being a document management system. Files are attached to messages, not organized in a filesystem hierarchy. There is no folder structure, no versioning system, no collaborative editing surface for documents (Canvas is a partial exception at early maturity). Slack's anti-role relative to document management is architectural, not incidental — the design prioritizes the conversation stream over the document store. *Epistemic status: inferred (anti-role characterization is analytical; Canvas partially complicates the claim).* Source: report-slack.md § 5.1 (contrast with Teams/SharePoint). Last observed: 2026-02-16.

**`[slack:anti-role-scheduling-system]`** Slack does not provide native calendar, scheduling, or formal meeting management. Huddles are spontaneous, not scheduled. Meeting coordination in Slack requires integration with external calendar systems (Google Calendar, Outlook). This is a structural boundary, not a gap — Slack defers to external scheduling tools by design. *Epistemic status: inferred.* Source: operational observation; report-slack.md § 3.1. Last observed: 2026-02-16.

**`[slack:humanist-aesthetic]`** Slack's visual and tonal design prioritizes warmth, personality, and cognitive-load reduction. Typographic choices (Lato typeface, generous whitespace in Clean mode), color architecture (aubergine sidebar contrasting white content area), micro-copy tone (conversational, witty loading screens), and sound design (distinctive "knock-brush" notification) compose a design language intended to counter enterprise sterility. Compact mode provides an alternative for density-preferring users. This is a structural design commitment, not decoration — it affects user retention, adoption psychology, and platform identity. *Epistemic status: verified (visual and tonal features); inferred (psychological and retention effects).* Source: report-slack.md §§ 2.1–2.4. Last observed: 2026-02-16.

---

## Axis 7 — Failure Modes

Structural vulnerabilities and degradation patterns inherent to Slack's architecture.

**`[slack:channel-proliferation]`** The low friction of channel creation combined with the default-public posture leads to workspace-level channel sprawl. As channel count grows, discoverability degrades, the sidebar becomes unmanageable, and information fragments across partially-overlapping channels. Organizational governance (naming conventions, archival policies) is the primary mitigation, but Slack provides no native channel-lifecycle management beyond manual archival. *Epistemic status: inferred (well-documented pattern in enterprise Slack deployments; no vendor-published failure-mode analysis).* Source: operational observation; enterprise administration literature. Last observed: 2026-02-16.

**`[slack:notification-overload]`** In high-volume workspaces, the notification system can generate sufficient interruption to degrade focused work. The granular notification controls (per-channel mute, keyword alerts, do-not-disturb scheduling, bold-vs-badge distinction) provide user-level mitigation, but the platform's real-time delivery orientation creates a structural tension between awareness and focus. *Epistemic status: inferred.* Source: report-slack.md §§ 3.2, 2.4; operational observation. Last observed: 2026-02-16.

**`[slack:thread-orphaning]`** Threaded discussions can become disconnected from their channel context when the parent message scrolls far enough up the timeline that users lose awareness the thread exists. Long-running threads may accumulate substantive decisions that are effectively invisible to channel participants who do not expand the thread. Thread broadcast partially mitigates this but introduces noise into the main channel. *Epistemic status: inferred.* Source: operational observation; report-slack.md § 1.3. Last observed: 2026-02-16.

**`[slack:search-degradation-at-scale]`** As workspace message volume grows over years, search result quality depends increasingly on the Work Graph's personalization signals rather than simple keyword relevance. Users outside the social graph of a conversation's participants may struggle to find relevant messages. The "Searchable Log" promise degrades when the log's scale exceeds the ranking algorithm's ability to surface relevant results for peripheral users. *Epistemic status: provisional (extrapolated from architectural analysis; no empirical evidence of failure threshold).* Source: architectural inference from report-slack.md §§ 4.1–4.2. Last observed: 2026-02-16.

**`[slack:context-collapse-in-large-workspaces]`** In very large workspaces (thousands of members), the public channel's transparency-by-default posture can create context collapse — messages intended for a team-level audience are visible to the entire organization, altering communication register and potentially chilling candid discussion. The member-count signal (report-slack.md § 1.2) partially mitigates this by making audience size visible, but does not resolve the structural tension. *Epistemic status: inferred.* Source: report-slack.md § 1.2; social-computing literature. Last observed: 2026-02-16.

---

## Axis 8 — Power-User Ceiling

The maximum leverage available to skilled users through advanced features and automation.

**`[slack:search-as-query-language]`** Search modifiers (`from:`, `in:`, `has:`, `before:`, `after:`, `during:`, `is:thread`) compose into structured queries that enable precision retrieval from the message log. A power user can audit decisions (`has:reaction in:#approvals`), trace information flow (`from:@person during:march`), and surface buried context (`is:thread in:#engineering has:link`). The search bar functions as a read-only query interface to the organizational knowledge base. *Epistemic status: verified.* Source: Slack help documentation; report-slack.md § 7.1. Last observed: 2026-02-16.

**`[slack:no-code-workflow-automation]`** Workflow Builder enables multi-step automation without programming: form creation, conditional message routing, channel management, third-party app integration, scheduled triggers. The ceiling extends to complex operational workflows (incident response, onboarding sequences, approval chains) built entirely through the visual workflow interface. *Epistemic status: verified.* Source: Slack Workflow Builder documentation; report-slack.md § 7.2. Last observed: 2026-02-16.

**`[slack:custom-slash-command-dispatch]`** Developers register custom slash commands that translate user input into HTTP requests to backend systems, enabling Slack to function as a CLI for infrastructure operations (deployment triggers, database queries, monitoring lookups). The slash command interface is the highest-leverage keyboard-driven manipulation path. *Epistemic status: verified.* Source: docs.slack.dev; report-slack.md § 7.3. Last observed: 2026-02-16.

**`[slack:agentic-bot-architecture]`** The combination of Socket Mode, the Bolt framework, and Block Kit enables the construction of autonomous agents that listen to channel events, reason over context (including LLM-backed RAG pipelines), and respond with interactive messages. An agentic bot represents the maximum leverage point: one developer builds a bot that serves an entire organization. The Socket Mode architecture allows these agents to operate entirely behind the corporate firewall. *Epistemic status: verified (architectural capability); inferred (maximum-leverage characterization).* Source: Slack developer documentation; report-slack.md § 7.4. Last observed: 2026-02-16.

**`[slack:keyboard-supremacy-model]`** The full keyboard-driven interaction model: Quick Switcher (`⌘+K`) for navigation, slash commands for actions, Markdown shortcuts for formatting, keyboard-navigable thread expansion. A power user can operate Slack without mouse interaction for all primary workflows. *Epistemic status: verified.* Source: Slack documentation; report-slack.md § 7.3. Last observed: 2026-02-16.

---

## Axis 9 — Reversibility

The degree to which actions within Slack can be undone, and the structural constraints on data portability.

**`[slack:message-edit-delete]`** Messages can be edited and deleted by their authors (and by workspace administrators). Edits are marked with an "(edited)" indicator; the original text is accessible through edit history. Deletion removes the message from the visible stream but may be retained in compliance exports. Reversibility is high for individual message operations. *Epistemic status: verified.* Source: Slack documentation. Last observed: 2026-02-16.

**`[slack:channel-archival]`** Channels can be archived (removing them from active use while preserving their content in a read-only state) and unarchived (restoring them to active status). Archival is reversible. Channel deletion is irreversible — content is permanently removed. The archive primitive provides a non-destructive decommissioning path. *Epistemic status: verified.* Source: Slack documentation. Last observed: 2026-02-16.

**`[slack:data-export-portability]`** Workspace data can be exported in JSON format (scope varies by plan tier — see `[slack:data-export-capability]` under Axis 2). Export provides an off-platform copy of the message log, but the exported data does not carry Slack's interactive features (Block Kit rendering, threaded structure, reaction context). Portability is structural (the data can leave) but lossy (the interactive and relational context does not travel with it). *Epistemic status: verified (export existence); inferred (lossiness characterization).* Source: Slack documentation; report-slack.md § 4.3. Last observed: 2026-02-16.

**`[slack:network-effect-lock-in]`** Slack Connect channels create inter-organizational dependencies that increase switching cost. When a vendor ecosystem (agencies, partners, service providers) communicates through shared Slack channels, migrating away from Slack requires either severing those real-time links or coordinating a multi-organization migration. This network effect structurally reduces reversibility at the platform-adoption level even though individual data operations remain reversible. *Epistemic status: inferred (lock-in analysis from dossier and network-effect literature; magnitude not empirically measured).* Source: report-slack.md §§ 6.1–6.2. Last observed: 2026-02-16.

**`[slack:app-dependency-migration-cost]`** Organizations that build custom Slack integrations (bots, workflows, slash commands) accumulate migration cost proportional to the number and complexity of integrations. Workflow Builder automations, custom Bolt applications, and webhook integrations must be rebuilt on any alternative platform. The more deeply Slack is used as a manipulation surface (Axis 3), the higher the migration cost. *Epistemic status: inferred.* Source: report-slack.md § 6.2; operational observation. Last observed: 2026-02-16.

---

## Prescriptive Content Extracted

The following evaluative and prescriptive content from report-slack.md has been removed from this scaffold and noted here for future specification-class artifacts (teleological manual, institutional role assignment):

- "Choose Slack if..." / "Choose Teams if..." recommendation framework (report-slack.md § 8) — belongs in a teleological manual or decision specification, not a descriptive scaffold.
- "Unequivocally the Best At" claims (report-slack.md § 5.3) — evaluative comparison, not structural description.
- Comparative cultural judgments ("culture over compliance," "studio vs. office") — analytical framing useful for institutional role assignment, not for structural decomposition.
- Institutional role suggestion ("operating system for the agile enterprise") — a teleological claim, not a structural observation.

---

## Twelve-Check Validation Summary

| Check | Status | Notes |
|---|---|---|
| 1 — Header compliance | PASS | All required fields present |
| 2 — Axis declaration | PASS | Nine axes from LAYER-LAW.md § 5, closed list, each defined |
| 3 — Primitive granularity | PASS | Primitives at structural floor; no further decomposition yields distinct elements |
| 4 — Primitive identifiers | PASS | All primitives carry `[slack:name]` format, unique within scope |
| 5 — Epistemic status labeling | PASS | Every substantive claim labeled verified/inferred/provisional |
| 6 — Staleness markers | PASS | All primitives carry last-observed date (2026-02-16); freshness threshold declared (moderate-ρ) |
| 7 — Source attribution | PASS | Per-primitive source attribution |
| 8 — Descriptive purity | PASS | Prescriptive content extracted to separate section |
| 9 — Cross-reference integrity | PASS | Internal cross-references use `[slack:name]` identifiers; external references use artifact identifiers |
| 10 — Species-specific completeness | PASS | Per-axis decomposition present for all nine declared axes |
| 11 — Downstream traceability | PASS | Every primitive has addressable identifier in navigable section structure |
| 12 — Scope boundary testability | PASS | Scope declaration resolves in/out questions: Slack platform features = in; Slack infrastructure implementation = out; institutional role = out |

---

*Production receipt: This scaffold was produced via dossier-to-scaffold conversion (METHOD-ENGINE.md § 3.2) from report-slack.md evidence, under REVIEW governance, as the first Stage A1 invocation. The dossier-to-scaffold conversion method's authority remains at Level 1 (curated); this invocation contributes toward but does not complete the Level 1→2 validation gate (which requires successful invocation across at least three diverse surfaces). Review revision 2026-03-13: `[slack:events-api]` added to Axis 3 (identified as a structural gap during operator-commissioned review). Primitive count: 59.*
