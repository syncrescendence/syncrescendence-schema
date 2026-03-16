# PRE-BUILD MEMO 4: Runtime Modality Normalization

**Purpose:** Classify daemon/runtime surfaces and browser/operator bridges into correct Tier 4 modality classes. Resolve OpenClaw's dual classification. Consumed by LAYER-LAW.md and READINESS-MATRIX.md. Not a grammar document. Archived as pedigree after integration.

**Date:** 2026-03-12

**Sources:** harness-taxonomy.md (OpenClaw sections), ARCHITECTURE.md (Cowork epistemic status), SYNCRESCENDENCE_FEDERAL_STACK_AND_TELEOLOGY_v1.md (daemon/browser descriptions, Manus characterization), grok-live-sensing.md (OpenClaw ACP formalization).

---

## The Classification Problem

The current corpus treats OpenClaw inconsistently: harness-taxonomy.md includes it as one of six coding harnesses; the FEDERAL_STACK places it in Layer 6 ("exocortical action bus and overflow reach") alongside Manus and browser operators; the Teleology Registry assigns it the role "always-on action bus and gateway" with modality "agentified."

Claude Cowork shipped January 2026 but is not classified anywhere in the tier model. Manus is mentioned but not structurally classified. Browser extensions (Claude in Chrome, Perplexity Computer) are mentioned but not typed.

The problem: the coding-harness modality class (Aider, Claude Code, Gemini CLI, Codex, OpenHands) was defined by shared structural primitives (repo-map intelligence, git-centric execution, worktree isolation, instruction-file cascades). Not all execution surfaces share these primitives. Forcing structurally different surfaces into the coding-harness class would produce false convergences in the cross-entity taxonomy.

---

## Proposed Modality Classes Within Tier 4

### Class 1: Repo-Native Coding Harnesses (existing, mature)

**Defining primitives:** Git-centric execution, instruction-file cascade, repo-map or equivalent context-scoping, worktree isolation, commit/rollback atomicity, test-gate verification.

**Entities:** Aider, Claude Code, Gemini CLI, OpenAI Codex, OpenHands. (Five, not six.)

**Scaffold status:** harness-taxonomy.md is a complete layer scaffold. ARCHITECTURE.md is the derived specification. Mature.

**OpenClaw removal rationale:** OpenClaw shares MCP, skills, and some orchestration primitives with coding harnesses. But its defining primitives — ClawWork economic sovereignty, HEARTBEAT.md self-reporting, SOUL.md liability contracts, market-based swarm coordination, hardware embodiment, DAO agent economies — are not coding-harness primitives. Its primary function is autonomous operational agency, not code authorship. It can spawn coding sub-processes (via ACP) but this makes it a dispatcher of coding harnesses, not a coding harness itself. The harness-taxonomy correctly documents OpenClaw's idiosyncrasies as fundamentally different in kind from the other five. [Evidence: harness-taxonomy.md §6, which devotes its entire OpenClaw section to non-coding primitives.]

**Impact of removal on harness-taxonomy.md:** The unified primitives in Section 1 were defined as "present in five or more of six harnesses." Removing OpenClaw means the threshold shifts to "present in four or more of five." This needs to be checked: do any unified primitives lose their convergence status when OpenClaw exits the set? Inspection suggests no — OpenClaw was never the decisive fifth instance for any Cluster A–S primitive. It was usually the weakest or most divergent instantiation. The unified primitives survive intact.

### Class 2: Daemon/Runtime Surfaces (new, unmature)

**Defining primitives:** Persistent autonomous operation across sessions. Self-reporting operational status. Task dispatch and receipt emission. Variable autonomy levels. Identity and accountability frameworks. Potentially economic self-sustainability.

**Entities:**
- **OpenClaw** — fully autonomous daemon. Defining features: ClawWork economic sovereignty, HEARTBEAT.md, SOUL.md, market-based coordination, hardware embodiment potential. Highest autonomy in the class.
- **Claude Cowork** — supervised persistent agent. Desktop dispatch via Apple Virtualization Framework. VM-based, file-sandboxed. Visible to operator. Task-level autonomy, not campaign-level. No economic sovereignty. No HEARTBEAT equivalent. Shipped January 2026 as research preview, now on Pro/Team/Enterprise. [Verified: ARCHITECTURE.md epistemic status table.]
- **Future entries:** Any persistent agent surface that operates autonomously across session boundaries without being primarily a coding harness or a SaaS platform.

**Scaffold status:** No scaffold exists. OpenClaw's primitives are partially documented in harness-taxonomy.md §6 but under the wrong modality classification. Cowork has minimal documentation (epistemic status entry in ARCHITECTURE.md, feature descriptions in FEDERAL_STACK). This class needs Level 1 research.

**Internal differentiation:** The class contains a significant autonomy spectrum. OpenClaw is designed for unsupervised autonomous operation including economic self-sustainability. Cowork is designed for supervised task dispatch with human oversight. These are different operating regimes within the same modality class — comparable to how Aider (lightweight CLI) and OpenHands (fleet-scale Kubernetes deployment) are different operating regimes within the coding-harness class.

### Class 3: Autonomous Operator Surfaces (new, unmature)

**Defining primitives:** Browser-mediated or UI-mediated execution of multi-step tasks. Authenticated session management across external surfaces. Task-packet-in, evidence/artifact-out interaction pattern. The operator surface reaches UI-only and OAuth-bound external surfaces that have no API or where API coverage is incomplete.

**Entities:**
- **Manus** — autonomous browser operator. Multi-step, authenticated. Executes tasks that require navigating web UIs, filling forms, managing workflows across surfaces that lack APIs. High autonomy within task scope. Anti-role: unbounded credential root with unrestricted secrets retention. [Evidence: FEDERAL_STACK §7, Teleology Registry.]
- **Future entries:** Any surface whose primary function is autonomous UI/browser-mediated execution of multi-step operational tasks.

**Scaffold status:** No scaffold exists. Manus is characterized in the FEDERAL_STACK at headline level only. This class needs Level 1 research.

**Distinction from daemon/runtime:** Daemon/runtime surfaces (OpenClaw, Cowork) operate primarily on local machine state — files, repos, local services. Autonomous operator surfaces (Manus) operate primarily on remote web UIs through browser automation. The execution substrate is fundamentally different (local process vs remote browser session), which produces different failure modes, different trust boundaries, and different receipt-emission patterns.

### Browser Extensions: Not a Modality Class

**Assessment:** Claude in Chrome, Perplexity Computer, and similar browser extensions are not independent execution surfaces. They are **manipulation paths** that extend reasoning surfaces (Claude, Perplexity) or daemon/runtime surfaces (Cowork) into browser-mediated execution. They do not have their own identity, their own task queue, or their own execution environment independent of their parent surface.

**Classification:** Browser extensions should be documented as manipulation-path entries within their parent surface's scaffold (e.g., Claude in Chrome is a manipulation path in the Claude reasoning-surface scaffold). They do not warrant their own modality class or their own surface scaffolds.

---

## Revised Tier 4 Modality Class Inventory

| Modality Class | Entities | Scaffold Status | Defining Character |
|---|---|---|---|
| Repo-native coding harnesses | Aider, Claude Code, Gemini CLI, Codex, OpenHands | MATURE (harness-taxonomy.md + ARCHITECTURE.md) | Git-centric code authorship with worktree isolation |
| Reasoning/chat surfaces | Claude, ChatGPT, Gemini, Grok | PARTIAL (see Memo 3) | Consumer chat interface cognitive engines with steering surfaces |
| SaaS work/knowledge/automation | Slack, Notion, Airtable, Jira, etc. | PARTIAL (14 exegeses, no cross-entity taxonomy) | External data/workflow platforms with APIs |
| Daemon/runtime surfaces | OpenClaw, Claude Cowork | NONE | Persistent autonomous agents with variable autonomy |
| Autonomous operator surfaces | Manus | NONE | Browser-mediated multi-step execution |
| Recon/sensing surfaces | Perplexity | MATURE for this surface (teleological manual) | Research discovery and source routing |
| Cloud/backend substrates | Supabase, Cloudflare, etc. | NONE | Infrastructure services |
| Model-routing/memory | LiteLLM, Mem0, vector stores | NONE | Routing, brokerage, persistence layers |

**Open slot:** Solopreneur stack surfaces (finance, accounting, ecommerce, HR-for-agents) — not yet enumerated, no modality class defined.

---

## What This Changes in the Grammar Build

**For LAYER-LAW.md:** Tier 4 now has eight named modality classes (plus one open slot) instead of an undifferentiated list of execution surfaces. Each class has distinct decomposition axes. The tier's internal structure is a set of modality classes, each of which can contain any number of entities and each of which is covered (or not) by its own scaffold(s).

**For READINESS-MATRIX.md:** Each modality class gets its own readiness row, not each individual surface. The matrix tracks per-class scaffold maturity: MATURE, PARTIAL, NONE. Individual surface coverage within a class is a sub-row concern.

**For harness-taxonomy.md (no action now, future note):** When OpenClaw is formally reclassified into daemon/runtime, the harness taxonomy's scope declaration should be updated to "five repo-native coding harnesses" and OpenClaw's idiosyncratic section should be extracted to seed the daemon/runtime scaffold. This is a future editorial action, not a current pre-build task.

**For SCAFFOLD-GRAMMAR.md:** The method engine's research-packet grammar needs modality-class-specific axis sets. Coding harnesses use one set of axes, reasoning surfaces another (per Memo 3), SaaS platforms another (the ten exocortex axes defined earlier), and daemon/runtime surfaces will need a fourth set once Level 1 research begins.
