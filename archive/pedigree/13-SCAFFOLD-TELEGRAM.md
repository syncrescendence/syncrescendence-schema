# SCAFFOLD-TELEGRAM.md

**Class:** Enduring descriptive scaffold | **Species:** Surface scaffold
**Scope:** Telegram as a SaaS work/knowledge/automation surface — its structural primitives, cloud-native architecture, broadcast/community model, manipulation paths, trust boundaries, and architectural features. Covers: Telegram across all clients including MTProto, channels, supergroups, bots, Saved Messages, Bot API, and the TON/Fragment ecosystem. Excludes: TON blockchain internals beyond their user-facing Telegram integration, and any prescriptive institutional role assignment.
**Modality class:** SaaS work / knowledge / automation surfaces | **Surface slug:** `telegram`
**Authority level:** 1-curated | **Lifecycle:** Active
**Upstream:** report-telegram.md (observed 2026-02-16); SCAFFOLD-GRAMMAR.md §§ 3–5
**Downstream:** SCAFFOLD-SAAS-LAYER.md; future teleological manual
**Freshness threshold:** Moderate-ρ | **Last updated:** 2026-03-13
**Production method:** Dossier-to-scaffold conversion at Level 2, DELEGATED
**Evidence base:** report-telegram.md; Telegram API documentation; Telegram engineering blog

---

## Axis 1 — Primitive Object Model

**`[telegram:message]`** The atomic content unit. Messages support text (Markdown/HTML formatting), media (photos, videos, documents up to 2/4GB), stickers (.TGS vector animations at 60 FPS), voice/video messages, polls, quizzes, location sharing, and contacts. Messages carry metadata: timestamps, sender, forward attribution, edit history, and reply threading. *Epistemic: verified. Source: Telegram docs; report § 2.1. Observed: 2026-02-16.*

**`[telegram:chat]`** The fundamental container: private chat (1-to-1), group (up to 200k members), supergroup (200k+ with admin tools), or channel (one-to-many broadcast). Chat type determines available features, permission models, and interaction dynamics. *Epistemic: verified. Source: Telegram docs; report §§ 2.1–2.2. Observed: 2026-02-16.*

**`[telegram:channel]`** One-to-many broadcast primitive. Only admins post; subscribers consume. Channels carry a public/private URL, subscriber counts, and per-post view counts. Channels enable media ecosystems, "alpha" networks, and alternative publishing infrastructure. Comments on channel posts are delegated to linked discussion groups. *Epistemic: verified. Source: Telegram docs; report § 2.2. Observed: 2026-02-16.*

**`[telegram:supergroup]`** High-capacity group chat (up to 200k members) with administrative tools: topics/threads, slow mode, member restrictions, admin hierarchies, and anti-spam. Supergroups function as community spaces with moderation infrastructure. *Epistemic: verified. Source: Telegram docs; report § 2.2. Observed: 2026-02-16.*

**`[telegram:bot]`** Programmatic user account created via BotFather. Bots interact via the Bot API: receiving messages, sending responses, presenting inline keyboards (interactive buttons), processing callbacks, and accepting payments. Bots are the primary extensibility mechanism — they can serve as storefronts, customer support agents, moderation tools, games, and application frontends. *Epistemic: verified. Source: Telegram Bot API docs; report § 3. Observed: 2026-02-16.*

**`[telegram:saved-messages]`** A personal cloud file system disguised as a self-chat. Unlimited storage (2GB/4GB per file, no aggregate cap). Supports tagging for categorization. Power users treat Saved Messages as a searchable personal knowledge base and cloud drive. *Epistemic: verified. Source: Telegram docs; report § 2.1. Observed: 2026-02-16.*

**`[telegram:sticker-tgs-format]`** Proprietary vector animation format based on Lottie, rendered by RLottie at 60 FPS. File size ~20-30KB (6× smaller than comparable photos). Creates a "high-fidelity" visual experience that functions as both expression primitive and platform identity marker. *Epistemic: verified. Source: Telegram docs; report § 1.2. Observed: 2026-02-16.*

**`[telegram:topic-thread]`** Forum-style topic organization within supergroups. Topics create parallel conversation channels within a single group, reducing noise without requiring multiple groups. *Epistemic: verified. Source: Telegram docs. Observed: 2026-02-16.*

**`[telegram:inline-keyboard]`** Interactive button grid attached to messages. Buttons can trigger URL opens, callback queries to bots, or inline queries. The inline keyboard turns messages into interactive application interfaces. *Epistemic: verified. Source: Telegram Bot API docs; report § 3. Observed: 2026-02-16.*

## Axis 2 — Data Sovereignty Model

**`[telegram:cloud-native-multi-session]`** All data stored in Telegram's cloud. User identity is cloud-based (not device-linked like WhatsApp). Unlimited concurrent sessions across devices with instant access to full message history. MTProto 2.0 protocol manages persistent session synchronization. *Epistemic: verified. Source: Telegram docs; report § 2.1. Observed: 2026-02-16.*

**`[telegram:no-aggregate-storage-limit]`** No total storage cap. Each file up to 2GB (4GB Premium). Effectively unlimited cloud storage for messages, files, and media. *Epistemic: verified. Source: Telegram docs; report § 2.1. Observed: 2026-02-16.*

**`[telegram:partial-encryption-model]`** Standard chats use client-server encryption (MTProto). End-to-end encryption available only in "Secret Chats" (device-linked, no cloud access). Secret Chats support self-destructing messages. The dual model trades universal E2E for cloud-native multi-device convenience. Voice calls moving to mandatory E2EE (DAVE protocol, March 2026). *Epistemic: verified. Source: Telegram docs; report § 2.1. Observed: 2026-02-16.*

## Axis 3 — Manipulation Surface

**`[telegram:bot-api]`** HTTP-based API for building bots: message handling, inline queries, callback handling, payments, games, web apps. Bots can be added to any chat and serve as automated participants. *Epistemic: verified. Source: Telegram Bot API docs; report § 3. Observed: 2026-02-16.*

**`[telegram:tdlib]`** Cross-platform C++ library (Telegram Database Library) providing the data layer for custom clients. TDLib handles storage, encryption, and network protocol. Enables building entirely custom Telegram clients and "userbot" automation. *Epistemic: verified. Source: TDLib docs; report § 1.1. Observed: 2026-02-16.*

**`[telegram:userbot-automation]`** Using TDLib or libraries like Telethon/Pyrogram to automate a regular user account: bulk message management, auto-forwarding, data extraction, and custom workflows. Userbots occupy a gray area between official API and terms-of-service boundaries. *Epistemic: verified (capability); inferred (gray-area characterization). Source: report § 3. Observed: 2026-02-16.*

**`[telegram:web-app-platform]`** Mini-applications running inside Telegram via embedded webviews. Web Apps can access Telegram user identity, accept payments, and interact with bot backends. Extends Telegram from messaging into an application platform. *Epistemic: verified. Source: Telegram docs. Observed: 2026-02-16.*

**`[telegram:optimistic-ui]`** Interface renders actions as complete instantly, handling network confirmation asynchronously via TDLib. Creates a perception of zero latency. Non-blocking interaction even on low-end devices. *Epistemic: verified. Source: report § 1.1. Observed: 2026-02-16.*

## Axis 4 — Auth and Trust Boundary

**`[telegram:admin-permission-system]`** Granular admin permissions in groups/supergroups: manage messages, manage users, pin messages, add admins, change info, post in channels. Permission granularity is moderate — between Slack's simple model and Discord's bitwise system. *Epistemic: verified. Source: Telegram docs. Observed: 2026-02-16.*

**`[telegram:phone-number-identity]`** Account identity tied to phone number. Phone number visibility is controllable (hidden from other users). Username system provides an alternative public identifier. *Epistemic: verified. Source: Telegram docs. Observed: 2026-02-16.*

## Axis 5 — Receipt and Audit Surface

**`[telegram:message-read-receipts]`** Double-check marks indicate message delivery and read status in private chats. Groups show view counts on channel posts. *Epistemic: verified. Source: Telegram docs. Observed: 2026-02-16.*

**`[telegram:edit-delete-history]`** Messages can be edited (edit marker shown) and deleted (for both parties in recent messages). Deletion removes content from all devices. No native audit trail for deleted messages — this is a privacy feature, not a governance feature. *Epistemic: verified. Source: Telegram docs. Observed: 2026-02-16.*

## Axis 6 — Design Teleology and Anti-Role

**`[telegram:speed-as-identity]`** Telegram's design teleology is speed and fluidity. Every architectural decision (MTProto, TDLib local database, optimistic UI, vector stickers, "Liquid Glass" aesthetic) optimizes for the perception of instantaneous interaction. Speed is not a feature — it is the platform's identity. *Epistemic: verified (architecture); inferred (identity characterization). Source: report §§ 1.1–1.4. Observed: 2026-02-16.*

**`[telegram:cloud-native-os-paradigm]`** Telegram functions as a cloud-native operating environment: Saved Messages as file system, channels as publishing platform, bots as applications, Web Apps as embedded programs. The chat interface is the shell. *Epistemic: inferred. Source: report §§ 2.1, 3. Observed: 2026-02-16.*

**`[telegram:anti-role-structured-work-management]`** No task tracking, project management, workflow automation, or database capabilities. Telegram is a communication and distribution platform, not a work management tool. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-16.*

**`[telegram:anti-role-enterprise-governance]`** No compliance certifications, no data residency controls, no administrative audit logs comparable to enterprise platforms. The cloud-native model with limited E2EE and admin-deletable messages is incompatible with regulated-enterprise governance requirements. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-16.*

## Axis 7 — Failure Modes

**`[telegram:moderation-at-scale]`** Large supergroups (100k+ members) require significant bot-based moderation infrastructure. Native admin tools are functional but insufficient for community-scale governance without automation. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-16.*

**`[telegram:content-discoverability]`** No native content recommendation, no cross-channel search, no algorithmic discovery. Finding relevant channels/groups requires external directories or word-of-mouth. *Epistemic: inferred. Source: operational observation. Observed: 2026-02-16.*

**`[telegram:secret-chat-limitation]`** End-to-end encrypted Secret Chats are device-linked, do not support groups, and are not searchable — functionally separate from the cloud-native experience. The E2EE story is fragmented. *Epistemic: verified. Source: Telegram docs; report § 2.1. Observed: 2026-02-16.*

## Axis 8 — Power-User Ceiling

**`[telegram:bot-application-development]`** Full-featured bots serving as storefronts, games, customer support agents, and automated workflows. Combined with Web Apps, bots can provide complete application experiences within Telegram. *Epistemic: verified. Source: Telegram Bot API docs; report § 3. Observed: 2026-02-16.*

**`[telegram:userbot-scripting]`** TDLib/Telethon/Pyrogram enable automation of user accounts for bulk operations, data extraction, cross-channel management, and custom notification pipelines. *Epistemic: verified. Source: report § 3. Observed: 2026-02-16.*

**`[telegram:saved-messages-as-pkm]`** Power users treat Saved Messages as a personal knowledge management system with tag-based categorization and full-text search across years of accumulated content. *Epistemic: inferred. Source: report § 2.1. Observed: 2026-02-16.*

## Axis 9 — Reversibility

**`[telegram:cloud-data-portability]`** GDPR data export available. Chat history exportable per-chat. Full account data downloadable. However, channel subscriber networks, bot configurations, and community structures are not portable. *Epistemic: verified. Source: Telegram docs. Observed: 2026-02-16.*

**`[telegram:network-effect-lock-in]`** Channel subscriber bases, community membership, and the platform's role as communication infrastructure in specific regions create significant switching costs. The network effect is geographic and demographic. *Epistemic: inferred. Source: report § 7. Observed: 2026-02-16.*

---

## Prescriptive Content Extracted
- "Telegram's true moat lies in its synthesis of cloud-native utility, speed, and decentralized property rights" (report Executive Abstract).

## Twelve-Check Validation Summary
All twelve checks pass. 33 primitives. Nine axes populated.

*Production receipt: Stage A3 target 6. Primitive count: 33.*
