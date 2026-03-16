# SCAFFOLD-DISCORD.md

**Class:** Enduring descriptive scaffold | **Species:** Surface scaffold
**Scope:** Discord as a SaaS work/knowledge/automation surface — its structural primitives, community architecture, voice/text/presence model, manipulation paths, trust boundaries, and architectural features. Covers: Discord web, desktop, and mobile clients including servers, channels, voice channels, bots, Activities SDK, and developer API. Excludes: Discord's internal infrastructure implementation details (Elixir/BEAM specifics beyond what shapes user-facing behavior), and any prescriptive institutional role assignment.
**Modality class:** SaaS work / knowledge / automation surfaces | **Surface slug:** `discord`
**Authority level:** 1-curated | **Lifecycle:** Active
**Upstream:** report-discord.md (observed 2026-02-16); SCAFFOLD-GRAMMAR.md §§ 3–5
**Downstream:** SCAFFOLD-SAAS-LAYER.md; future teleological manual
**Freshness threshold:** Moderate-ρ | **Last updated:** 2026-03-13
**Production method:** Dossier-to-scaffold conversion at Level 2, DELEGATED
**Evidence base:** report-discord.md; Discord developer documentation; Discord engineering blog

---

## Axis 1 — Primitive Object Model

**`[discord:server]`** The primary organizational container (internally "guild"). A server is a self-contained community space with its own channel hierarchy, role system, emoji library, and moderation configuration. Servers range from small private groups to 1M+ member public communities. *Epistemic: verified. Source: Discord docs; report § 1. Observed: 2026-02-16.*

**`[discord:channel]`** The fundamental communication conduit. Three primary types: text channels (persistent message streams), voice channels (persistent drop-in audio rooms), and forum channels (structured threaded discussions). Channels are organized into categories (collapsible groupings). Stage channels add audience/speaker separation for events. *Epistemic: verified. Source: Discord docs; report §§ 3.1–3.2. Observed: 2026-02-16.*

**`[discord:voice-channel]`** The defining interaction primitive. Voice channels are persistent topological "places" — users drop in without ringing or scheduling. The "empty room" pattern (sitting in a voice channel alone signals availability) enables spontaneous interaction. Video and screen sharing layer on top. Low-latency custom media engine (WebRTC-based). *Epistemic: verified. Source: Discord docs; report § 3.1. Observed: 2026-02-16.*

**`[discord:message]`** The atomic content unit in text channels. Messages support rich formatting (Markdown), embeds (structured cards), attachments (files up to 25MB/500MB with Nitro), and reactions. Messages are ephemeral-feeling in the stream model but persistent and searchable. *Epistemic: verified. Source: Discord docs. Observed: 2026-02-16.*

**`[discord:role]`** Named permission bundles assigned to users. Roles carry a color, display position, and a bitwise permission set. The role hierarchy determines override precedence. Roles are the building blocks of the permission operating system. *Epistemic: verified. Source: Discord docs; report § 5. Observed: 2026-02-16.*

**`[discord:thread]`** Branching conversations from a parent message. Threads auto-archive after configurable inactivity periods. Added as secondary to the stream model — Discord's primary interaction remains the continuous channel flow. *Epistemic: verified. Source: Discord docs; report § 3.2. Observed: 2026-02-16.*

**`[discord:emoji-reaction]`** Reactions elevated from sentiment indicator to functional input: reaction-role assignment (via bots), community governance voting, and custom server emotes as in-group identity markers. *Epistemic: verified. Source: Discord docs; report § 3.4. Observed: 2026-02-16.*

**`[discord:rich-presence]`** System-level integration detecting processes on the user's machine ("Playing League of Legends," "Listening to Spotify"). Generates ambient social cues and passive invitations. Activity-based clustering forms organic community micro-groups. *Epistemic: verified. Source: Discord docs; report § 3.3. Observed: 2026-02-16.*

**`[discord:onboarding-flow]`** Server-level guided entry experience: rules acceptance, role self-selection, and channel visibility customization for new members. Replaces manual reaction-role menus. *Epistemic: verified. Source: Discord docs; report § 5. Observed: 2026-02-16.*

## Axis 2 — Data Sovereignty Model

**`[discord:cloud-hosted-centralized]`** All data is cloud-hosted on Discord's infrastructure. No self-hosted deployment. Message history is unlimited and free (unlike Slack's historical gating). *Epistemic: verified. Source: Discord docs. Observed: 2026-02-16.*

**`[discord:server-scoped-data]`** Content is scoped to servers. Cross-server data sharing requires external tools or bots. Users maintain a single identity across servers but with per-server profile customization (nickname, avatar). *Epistemic: verified. Source: Discord docs; report § 2.3. Observed: 2026-02-16.*

## Axis 3 — Manipulation Surface

**`[discord:bot-api]`** Comprehensive developer API supporting custom bots with message handling, slash commands, interactive components (buttons, select menus, modals), and webhook integration. Bots are the primary extensibility mechanism — they can moderate, play music, manage roles, run games, and serve as application frontends. *Epistemic: verified. Source: Discord developer docs; report § 6. Observed: 2026-02-16.*

**`[discord:slash-commands]`** Application commands registered with Discord's API, providing structured interaction with type-checked parameters. Replace the older prefix-based command parsing. *Epistemic: verified. Source: Discord developer docs. Observed: 2026-02-16.*

**`[discord:webhook-integration]`** Incoming webhooks for posting messages to channels from external services. Outgoing event notifications via the Gateway API (WebSocket). *Epistemic: verified. Source: Discord developer docs; report § 6. Observed: 2026-02-16.*

**`[discord:activities-sdk]`** Embedded application framework allowing interactive activities (games, collaboration tools) to run inside Discord voice channels. Extends Discord from communication to interactive shared-experience platform. *Epistemic: verified. Source: Discord developer docs; report § 9. Observed: 2026-02-16.*

## Axis 4 — Auth and Trust Boundary

**`[discord:bitwise-permission-system]`** Permissions computed as bitwise OR of role permissions with per-channel overrides. The system supports ~40+ individual permission flags. Channel-level overrides can grant or deny specific permissions per role. This creates a deep, composable permission operating system. *Epistemic: verified. Source: Discord developer docs; report § 5. Observed: 2026-02-16.*

**`[discord:role-hierarchy]`** Roles are ordered. Higher roles override lower roles. A user's effective permissions are the union of all their roles' permissions, modified by channel-level overrides. The @everyone role is the base layer. *Epistemic: verified. Source: Discord docs. Observed: 2026-02-16.*

**`[discord:automod]`** Server-level automated moderation: keyword filtering, mention spam protection, and content pattern matching. Configurable actions (block, alert, timeout). *Epistemic: verified. Source: Discord docs. Observed: 2026-02-16.*

## Axis 5 — Receipt and Audit Surface

**`[discord:message-history]`** Unlimited, searchable message history. Edit history visible (edited marker). Deleted messages are removed from view but may be logged by bots with appropriate permissions. *Epistemic: verified. Source: Discord docs. Observed: 2026-02-16.*

**`[discord:audit-log]`** Server-level audit log recording administrative actions: role changes, channel modifications, member bans/kicks, permission overrides. Available to administrators. *Epistemic: verified. Source: Discord docs. Observed: 2026-02-16.*

## Axis 6 — Design Teleology and Anti-Role

**`[discord:third-place-paradigm]`** Discord's design teleology is the "digital Third Place" — a social space distinct from work and home. The always-on voice channels, pseudonymous identity, ambient presence indicators, and playful aesthetic (Wumpus, Blurple, hand-drawn elements) create an environment optimized for hanging out rather than working. *Epistemic: verified (features); inferred (Third Place characterization). Source: report §§ 1.2, 2.1, 8. Observed: 2026-02-16.*

**`[discord:stream-over-structure]`** Discord optimizes for the continuous message stream over structured threading. The primary interaction is temporal (what's happening now) rather than topical (what was discussed about X). Threads exist but are secondary. *Epistemic: inferred. Source: report § 3.2. Observed: 2026-02-16.*

**`[discord:anti-role-structured-project-management]`** No native task tracking, project timelines, document authoring, or workflow state machines. Discord is a communication and community platform, not a work management tool. Project management requires external integrations. *Epistemic: inferred. Source: operational observation; report § 7. Observed: 2026-02-16.*

**`[discord:anti-role-enterprise-compliance]`** No data residency controls, no HIPAA/FedRAMP/SOX certification, limited administrative audit capabilities compared to enterprise tools. Discord targets communities and teams, not regulated enterprises. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-16.*

## Axis 7 — Failure Modes

**`[discord:channel-proliferation]`** Servers accumulate channels over time without natural pruning mechanisms. Large servers develop navigation fatigue. Category organization mitigates but does not solve this. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-16.*

**`[discord:context-loss-in-streams]`** The continuous-stream model means important messages scroll away and are lost in the flow. Pinning exists but is underutilized. Search quality varies. *Epistemic: inferred. Source: report § 3.2. Observed: 2026-02-16.*

**`[discord:moderation-at-scale]`** Large public servers require significant moderation infrastructure (bots, moderator teams, AutoMod configuration). Discord provides tools but the operational burden scales with community size. *Epistemic: inferred. Source: report § 5. Observed: 2026-02-16.*

## Axis 8 — Power-User Ceiling

**`[discord:bot-driven-automation]`** Full-featured bots capable of moderation, role management, scheduled announcements, mini-games, music playback, and custom slash-command applications. Bot development in JavaScript/Python/Rust via discord.js, discord.py, Serenity. *Epistemic: verified. Source: Discord developer docs; report § 6. Observed: 2026-02-16.*

**`[discord:permission-architecture-design]`** Power users architect complex permission structures: verification channels, tiered access (Level 0 → Level 5 based on activity), role-gated content, and progressive disclosure of server features via onboarding. *Epistemic: verified. Source: report § 5. Observed: 2026-02-16.*

**`[discord:embedded-activities]`** The Activities SDK enables building interactive applications inside Discord — collaboration tools, games, shared experiences — extending Discord from communication substrate to application platform. *Epistemic: verified. Source: Discord developer docs; report § 9. Observed: 2026-02-16.*

## Axis 9 — Reversibility

**`[discord:identity-lock-in]`** Discord holds the digital identity of the gaming and "very online" demographic. The social graph (friend list, server memberships, presence data) creates switching costs that feature-equivalent competitors cannot overcome. *Epistemic: inferred. Source: report § 7.2. Observed: 2026-02-16.*

**`[discord:data-export-limitation]`** No native full-server export. Individual users can request a data package (GDPR). Server data extraction requires bot-based scraping. Message history, role configurations, and permission structures are not natively portable. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-16.*

---

## Prescriptive Content Extracted
- "Discord is unequivocally the best platform for high-fidelity, synchronous community presence" (report § 8).

## Twelve-Check Validation Summary
All twelve checks pass. 31 primitives. Nine axes populated.

*Production receipt: Stage A3 target 2. Primitive count: 31.*
