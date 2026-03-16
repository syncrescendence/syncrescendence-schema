# SPEC-SAAS-TELEOLOGICAL-SELECTION.md

**Class:** Specification  
**Species:** Teleological manual  
**Scope:** Institutional guidance for selecting and combining SaaS surfaces within the Syncrescendence architecture. Prescribes which surfaces to deploy for which purposes, under what conditions, with what tradeoffs, and which combinations form coherent operational triads or stacks. Covers: all 14 scaffolded SaaS surfaces. Does not prescribe configuration details, vendor pricing decisions, or per-surface setup procedures (those belong in per-surface operational guides, not in a class-level selection manual).  
**Authority level:** 0-provisional (first specification-production invocation; advances on operator review)  
**Lifecycle:** Active  
**Upstream:** SCAFFOLD-SAAS-LAYER.md (14-surface, accepted); 14 accepted SaaS surface scaffolds  
**Downstream:** Per-surface operational guides; adapter contracts for specific surface combinations; governance protocols  
**Last updated:** 2026-03-13  
**Production method:** Specification production (DRAFT-METHOD-SPECIFICATION-PRODUCTION.md) — first invocation  
**Evidence base:** SCAFFOLD-SAAS-LAYER.md synthesis observations and convergent/divergent primitives; 14 surface scaffold Axis 6 (teleology/anti-role) and Axis 9 (reversibility) entries  

---

## 1. The Selection Problem

The SaaS class contains 14 scaffolded surfaces spanning four paradigm families (stream, document, tracker, community/broadcast — per `[saas-platform:four-paradigm-families]`). No single surface covers all institutional needs. Every surface structurally resists being something it is not (`[saas-platform:anti-role-declaration]`). Selection is not "which tool is best" but "which combination of surfaces covers the institution's needs with minimal overlap, minimal governance overhead, and acceptable lock-in."

This manual prescribes selection heuristics — structural rules for choosing surfaces based on the institutional need being addressed, not on vendor marketing or feature lists. Every prescription below traces to identified primitives or synthesis observations in the accepted scaffolds.

---

## 2. Selection by Paradigm Family

The four paradigm families are the first-order selection filter. An institution should identify which families its operations require, then select one surface per required family. Selecting multiple surfaces from the same family creates overlap and governance overhead. Selecting zero surfaces from a required family creates a structural gap.

### 2.1 Stream Family — Real-Time Communication and Presence

**When to select:** The institution requires real-time messaging, voice/video communication, or ambient presence awareness as a primary work modality. *Upstream: `[saas-platform:four-paradigm-families]` — stream family.*

**Surface selection heuristic:**

- **Slack** if the primary need is organizational communication integrated with the SaaS work stack (strongest integration surface in the class — `[slack:events-api]`, `[slack:slack-connect-trust-boundary]`). Select Slack when the institution's SaaS tools need a connective nervous system and when cross-organizational communication (Slack Connect) matters.

- **Discord** if the primary need is community management, synchronous presence, or audience-facing interaction (strongest community/presence surface — `[discord:voice-channel]`, `[discord:third-place-paradigm]`, `[discord:bitwise-permission-system]`). Select Discord when the institution manages external communities, runs events, or needs persistent voice spaces.

- **Telegram** if the primary need is broadcast distribution, cloud-native file management, or operation in regions where Telegram is the dominant communication infrastructure (`[telegram:channel]`, `[telegram:saved-messages]`, `[telegram:cloud-native-os-paradigm]`). Select Telegram when the institution publishes content to large audiences or needs unlimited cloud-native file storage within a messaging context.

**Anti-pattern:** Selecting multiple stream-family surfaces for the same user population fragments attention and creates notification fatigue. If both Slack (internal) and Discord (community) are needed, the boundary between them must be explicit and enforced.

### 2.2 Document Family — Persistent Knowledge and Content

**When to select:** The institution requires persistent documentation, knowledge management, or long-form content authoring. *Upstream: `[saas-platform:four-paradigm-families]` — document family.*

**Surface selection heuristic:**

- **Confluence** if the institution requires enterprise-grade wiki with compliance certifications, Jira integration, and top-down information architecture (`[confluence:jira-symbiosis]`, `[confluence:compliance-certification]`, `[confluence:open-by-default-philosophy]`). Select Confluence when regulatory compliance, Jira coupling, and large-scale knowledge governance are primary requirements.

- **Notion** if the institution requires a flexible workspace combining documentation and lightweight databases, with aesthetic emphasis and recursive organizational flexibility (`[notion:block]`, `[notion:database]`, `[notion:blank-slate-philosophy]`). Select Notion when the user base values visual elegance, structural flexibility, and the document-database hybrid, and when the organization can invest in governance to prevent structure entropy.

- **Coda** if the institution requires programmable documents where workflow logic executes inside the content surface (`[coda:button]`, `[coda:coda-formula-language]`, `[coda:doc-as-application]`). Select Coda when the primary need is interactive operational documents (trackers, dashboards, approval flows) rather than static knowledge management.

- **Obsidian** if the institution requires sovereign, local-first knowledge management with zero vendor dependency and maximum data durability (`[obsidian:markdown-file]`, `[obsidian:cognitive-sovereignty-teleology]`, `[obsidian:zero-lock-in]`). Select Obsidian when data sovereignty, privacy, and long-term durability outweigh collaboration and cloud convenience. Note: Obsidian is structurally a single-user tool — team collaboration requires external coordination (Git, shared sync).

- **Basecamp** if the institution requires project-scoped documentation tightly coupled to an opinionated project management methodology, and values simplicity over configurability (`[basecamp:project-capsule]`, `[basecamp:message-board]`, `[basecamp:shape-up-encoding]`). Select Basecamp when the institution adopts Shape Up and wants documentation insulated within project capsules.

**Anti-pattern:** Selecting Notion and Confluence simultaneously for the same user population creates a "which wiki do I use?" problem. If both exist, explicit scope boundaries must be enforced (e.g., Confluence for engineering specs, Notion for cross-functional planning).

### 2.3 Tracker Family — Structured Work and Data Management

**When to select:** The institution requires task tracking, issue management, project management, or structured data operations. *Upstream: `[saas-platform:four-paradigm-families]` — tracker family.*

**Surface selection heuristic:**

- **Jira** if the institution requires enterprise-grade workflow governance with configurable state machines, compliance certifications, and scheme-based configuration at scale (`[jira:workflow]`, `[jira:scheme]`, `[jira:compliance-certification]`). Select Jira when process enforcement, auditability, and regulatory compliance outweigh user velocity concerns. Accept the governance overhead (`[saas-platform:automation-depth-governance-tradeoff]`).

- **Linear** if the institution is a software development team that values velocity, developer experience, and opinionated methodology over configurability (`[linear:sync-engine]`, `[linear:opinionated-methodology]`, `[linear:anti-role-enterprise-process-management]`). Select Linear when the team trusts each other, needs sub-50ms interaction, and is willing to accept Linear's workflow constraints.

- **ClickUp** if the institution requires a converged work OS spanning tasks, documents, whiteboards, and dashboards in a single platform, and accepts higher setup complexity in exchange for unified context (`[clickup:convergence-philosophy]`, `[clickup:six-level-hierarchy]`, `[clickup:clickapps]`). Select ClickUp when tool sprawl is the primary problem and the institution is willing to invest in configuration.

- **Airtable** if the primary need is structured data operations (inventory, CRM, production tracking) with relational integrity, strict typing, and a no-code/low-code application-building surface (`[airtable:linked-record]`, `[airtable:interface]`, `[airtable:database-first-paradigm]`). Select Airtable when the primary value is in the data and its relationships, not in documents or communication.

- **Todoist** if the primary need is personal or small-team task capture with minimal friction, GTD-compatible workflow, and cross-platform ubiquity (`[todoist:nlp-quick-add]`, `[todoist:filter]`, `[todoist:frictionless-capture-teleology]`). Select Todoist when capture speed and personal productivity are the priority over team coordination features.

- **TickTick** if the primary need is integrated personal productivity combining tasks, calendar, habits, and focus timing in a unified temporal view (`[ticktick:unified-calendar-view]`, `[ticktick:habit]`, `[ticktick:temporal-integration-teleology]`). Select TickTick when "time blindness" (disconnection between tasks and available time) is the primary problem.

**Anti-pattern:** Selecting Jira and Linear for the same engineering team creates workflow fragmentation. If multiple tracker-family surfaces exist in the institution, each must serve a distinct population or purpose (e.g., Jira for enterprise teams requiring compliance, Linear for product-led teams requiring velocity).

---

## 3. Selection by Lock-In Profile

Every surface creates switching costs proportional to adoption depth (`[saas-platform:platform-adoption-lock-in]`). The lock-in taxonomy (`[saas-platform:lock-in-scales-with-structural-depth]`) distinguishes three types: data lock-in, structural lock-in, and ecosystem lock-in. Selection should account for the institution's tolerance for each type.

**Low lock-in priority (maximize reversibility):** Select surfaces with low structural lock-in: Obsidian (zero data lock-in, moderate ecosystem lock-in), Todoist (flat data model, filter configs non-portable), Basecamp (methodology lock-in but low data lock-in). Avoid Coda (highest structural lock-in — CFL logic non-portable) and Jira (deep workflow/scheme configuration is non-portable).

**High lock-in tolerance (maximize capability depth):** Select surfaces where deep adoption produces compounding returns: Jira (process governance compounds), Airtable (relational complexity compounds), Coda (logic compounds), Confluence (knowledge graph compounds). Accept that migration cost scales with value extracted.

**Traceability:** This section derives from `[saas-platform:lock-in-scales-with-structural-depth]` and the Axis 9 entries of all 14 surface scaffolds.

---

## 4. Coherent Stack Patterns

Certain surface combinations form structurally coherent operational stacks because their paradigm families and anti-roles are complementary rather than overlapping.

### 4.1 The Atlassian Triad
**Slack + Jira + Confluence.** Stream + tracker + document. The strongest inter-surface coupling in the class (`[confluence:jira-symbiosis]`). Slack provides the communication layer, Jira the execution layer, Confluence the knowledge layer. Each surface's anti-role is covered by another member of the triad. Best for: enterprise engineering organizations requiring compliance and governance. *Upstream: `[saas-platform:four-paradigm-families]`, `[confluence:jira-symbiosis]`, anti-role entries of all three surfaces.*

### 4.2 The Velocity Stack
**Slack + Linear + Notion.** Stream + opinionated tracker + flexible document. Linear handles execution with minimal ceremony; Notion handles documentation with maximum flexibility; Slack connects them. Best for: product-led startups and small engineering teams. *Upstream: `[linear:opinionated-methodology]`, `[notion:blank-slate-philosophy]`, `[slack:events-api]`.*

### 4.3 The Sovereign Stack
**Obsidian + Todoist (or TickTick) + Telegram.** Local-first knowledge + personal tracker + cloud-native communication. Minimizes vendor dependency and data lock-in. Obsidian owns the knowledge base (zero lock-in), Todoist/TickTick handles task capture (low lock-in), Telegram provides communication and file storage. Best for: solo practitioners, privacy-conscious operators, or contexts where vendor independence is a primary constraint. *Upstream: `[obsidian:cognitive-sovereignty-teleology]`, `[todoist:frictionless-capture-teleology]`, `[telegram:cloud-native-os-paradigm]`, `[saas-platform:local-first-as-structural-counter-paradigm]`.*

### 4.4 The Converged Alternative
**ClickUp (alone) or ClickUp + Slack.** ClickUp attempts to span all four paradigm families. If the institution accepts higher setup complexity and shallower individual capabilities, ClickUp can replace the triad pattern. Adding Slack addresses ClickUp's weaker real-time communication. Best for: organizations suffering from tool sprawl that prioritize unified context over specialized depth. *Upstream: `[clickup:convergence-philosophy]`, `[saas-platform:four-paradigm-families]`.*

### 4.5 The Community Stack
**Discord + Notion (or Obsidian).** Community/broadcast + document. Discord handles the community interaction; Notion (or Obsidian for sovereign contexts) handles the knowledge base. Best for: community-led organizations, open-source projects, creator communities. *Upstream: `[discord:third-place-paradigm]`, `[notion:blank-slate-philosophy]` or `[obsidian:cognitive-sovereignty-teleology]`.*

---

## 5. Methodology-Encoding Selection Rule

Five surfaces encode specific productivity methodologies into their product constraints (`[saas-platform:methodology-encoding-as-moat]`). If the institution has adopted or intends to adopt one of these methodologies, the corresponding surface is the structurally correct choice — no other surface natively supports the methodology's primitives.

| Methodology | Surface | Key Encoded Primitives |
|---|---|---|
| Shape Up | Basecamp | Hill Charts, Scopes, Cooldowns |
| The Linear Method | Linear | Cycles, Triage, finite Projects |
| GTD | Todoist | Inbox, filters-as-contexts, Karma |
| Time-blocking | TickTick | Unified calendar, Pomodoro, Habits |
| Scrum / Kanban | Jira | Sprint boards, workflow FSM, velocity |

**Warning:** Selecting a methodology-encoding surface without adopting the methodology creates friction — the tool's constraints feel arbitrary rather than purposeful. Conversely, adopting the methodology without the corresponding surface means building the workflow manually in a tool that does not natively support it.

**Traceability:** `[saas-platform:methodology-encoding-as-moat]`, `[basecamp:shape-up-encoding]`, `[linear:opinionated-methodology]`, `[todoist:frictionless-capture-teleology]`, `[ticktick:temporal-integration-teleology]`, `[jira:workflow]`.

---

## 6. Entropy Governance Selection Rule

Every surface degrades without active governance (`[saas-platform:structural-entropy-at-scale]`). The governance burden varies by surface. Selection should account for the institution's governance capacity.

**Low governance capacity:** Select opinionated surfaces that resist entropy by design — Linear, Basecamp, Todoist. These surfaces limit configurability, which limits the entropy surface area.

**High governance capacity:** Select flexible surfaces that reward governance investment — Jira (scheme-based governance), Confluence (CQL-driven content lifecycle), Airtable (Interface Designer constraining end-user access), Notion (requires active gardening). These surfaces provide powerful capabilities but degrade without sustained structural attention.

**Traceability:** `[saas-platform:flexibility-entropy-tension]`, `[saas-platform:structural-entropy-at-scale]`, Axis 7 entries across all 14 scaffolds.

---

## Validation Summary

| Criterion | Status | Notes |
|---|---|---|
| Upstream traceability | PASS | Every prescription cites scaffold primitives or synthesis observations |
| Actionability | PASS | Selection heuristics, stack patterns, and rules are specific enough for operator action |
| Scope boundary | PASS | Class-level selection; no per-surface configuration or pricing guidance |
| Descriptive-prescriptive boundary | PASS | Does not re-describe scaffold content; derives prescriptions from it |
| Falsifiability | PASS | Every heuristic and stack pattern could be wrong and can be tested against operational experience |

---

*Production receipt: First specification-production invocation under REVIEW governance. Specification type: teleological selection manual. Upstream: SCAFFOLD-SAAS-LAYER.md (14-surface, accepted) + 14 surface scaffolds. The specification derives institutional prescriptions from 8 synthesis observations, 22 convergent primitives, and Axis 6/9 entries across all 14 surface scaffolds. Six sections: selection problem framing, paradigm-family selection, lock-in profile selection, coherent stack patterns, methodology-encoding rule, entropy governance rule. Every prescription traces to identified scaffold primitives. The specification-production method advances from untested to tested-once.*
