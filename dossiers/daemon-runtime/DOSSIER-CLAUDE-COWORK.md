# DOSSIER-CLAUDE-COWORK.md

**Class:** Dossier (research-grade evidence synthesis)
**Scope:** Claude Cowork as a daemon/runtime surface — structural characterization, primitive inventory along daemon/runtime axes, variant analysis (Anthropic standalone vs Microsoft Copilot Cowork), and scaffold-readiness verdict. This dossier synthesizes all available evidence into the strongest lawful primitive inventory presently supportable.
**Authority level:** 0-provisional
**Lifecycle:** Active
**Last updated:** 2026-03-14
**Evidence sources:** Anthropic official blog (2026-01-12); VentureBeat (2026-01-13, 2026-03-10); DataCamp tutorial (2026-01-16); Simon Willison analysis (2026-01-12); GeekWire (2026-03-10); Fortune (2026-03-09); Medium/Data and Beyond (2026-02); PRE-BUILD-MEMO-4-RUNTIME-MODALITY.md; DAEMON-RUNTIME-CLASS-OPENING.md

---

## 1. Architectural Overview

Claude Cowork is a supervised persistent agent shipped January 2026 as a research preview. It extends Claude Code's agentic capabilities to non-technical users through the Claude desktop app (macOS initially, Windows subsequently). The architectural design: Claude Code's agent engine (Claude Agent SDK) wrapped in a non-terminal interface with automatic filesystem sandboxing via Apple Virtualization Framework.

The agent operates within a user-designated folder, reading, editing, and creating files. It formulates a plan, executes steps (potentially in parallel), checks its own work, and asks for human confirmation before significant actions. Users can queue multiple tasks for parallel processing.

---

## 2. Primitive Inventory by Daemon/Runtime Axes

### Axis 1 — Persistence and Session Architecture

**`[claude-cowork:folder-scoped-sandbox]`** User explicitly grants Claude access to a specific folder. Claude can read, edit, and create files within that folder only. The sandbox is implemented via Apple Virtualization Framework (VZVirtualMachine) — a full Linux VM is booted, and the designated folder is mounted into it. This provides hardware-level isolation, not just process-level sandboxing. *Epistemic: verified. Sources: Anthropic blog; Simon Willison reverse-engineering (VZVirtualMachine discovery); DataCamp tutorial. Observed: 2026-01.*

**`[claude-cowork:session-task-persistence]`** Tasks persist within a Cowork session. Multiple tasks can be queued and processed in parallel. The agent maintains task context across multi-step execution within a session. Cross-session persistence relies on the Claude platform memory system (same as Claude Chat). No equivalent to OpenClaw's HEARTBEAT.md or MEMORY.md. *Epistemic: verified (within-session); inferred (cross-session — limited to platform memory). Sources: Anthropic blog; VentureBeat. Observed: 2026-01.*

### Axis 2 — Autonomy Model

**`[claude-cowork:supervised-task-autonomy]`** Task-level autonomy with human oversight at significant actions. Claude formulates plans and executes steps, but asks before taking consequential actions (file deletion, significant modifications). The autonomy model is "leaving messages for a coworker" — the user assigns work and checks back, but the agent confirms before destructive operations. *Epistemic: verified. Sources: Anthropic blog; DataCamp tutorial. Observed: 2026-01.*

**`[claude-cowork:no-campaign-autonomy]`** No multi-day autonomous operation. No unsupervised campaign execution. No economic self-sustainability. No self-directed goal decomposition beyond the scope of assigned tasks. This is the structural boundary between Cowork and OpenClaw — Cowork is supervised task dispatch, not unsupervised autonomous agency. *Epistemic: verified. Sources: PRE-BUILD-MEMO-4; Anthropic blog (research preview scope). Observed: 2026-01.*

### Axis 3 — Dispatch and Task Architecture

**`[claude-cowork:parallel-task-queuing]`** Users can queue multiple tasks for simultaneous processing. The agent works through the queue, potentially executing steps from different tasks in parallel. *Epistemic: verified. Sources: Anthropic blog; VentureBeat. Observed: 2026-01.*

**`[claude-cowork:plan-execute-check-loop]`** The agent formulates a plan, executes steps, checks its own work, and asks for clarification if it hits a roadblock. This is the same agentic loop as Claude Code (Plan → Execute → Verify), adapted for non-coding tasks. *Epistemic: verified. Sources: Anthropic blog; DataCamp tutorial. Observed: 2026-01.*

### Axis 4 — Execution Environment

**`[claude-cowork:apple-virtualization-framework]`** macOS implementation uses VZVirtualMachine (Apple Virtualization Framework). A custom Linux root filesystem is downloaded and booted. The designated folder is mounted into the VM. This provides stronger isolation than process-level sandboxing — Claude executes inside a full virtual machine. *Epistemic: verified. Sources: Simon Willison (reverse-engineered from Claude app internals). Observed: 2026-01.*

**`[claude-cowork:claude-agent-sdk-foundation]`** Built on the same Claude Agent SDK as Claude Code. Shares the underlying agent architecture, tool capabilities, and execution primitives. The difference is the interface (desktop app vs terminal) and the scoping (folder vs repo). *Epistemic: verified. Sources: Anthropic blog ("built on the very same foundations"); DataCamp tutorial. Observed: 2026-01.*

### Axis 5 — Identity and Accountability

**`[claude-cowork:no-persistent-identity]`** Cowork does not carry a persistent identity document (no SOUL.md equivalent). The agent's behavioral constraints come from Claude's constitutional AI training and the user's Claude preferences, not from an agent-specific identity file. The agent does not maintain accountability for past sessions beyond what platform memory provides. *Epistemic: inferred. Sources: absence from Anthropic documentation; PRE-BUILD-MEMO-4 ("No HEARTBEAT equivalent"). Observed: 2026-01.*

**`[claude-cowork:anthropic-safety-constraints]`** Claude's constitutional AI training defines the outer behavioral boundary. Prompt-injection defenses are built in but acknowledged as "an active area of development." The safety model is vendor-mediated, not operator-authored (unlike OpenClaw's SOUL.md). *Epistemic: verified. Sources: Anthropic blog (safety section). Observed: 2026-01.*

### Axis 6 — Economic Model

**`[claude-cowork:subscription-funded]`** Cowork is funded by the user's Claude subscription (initially Max at $100–200/month, later Pro at $20/month, Team, and Enterprise). No economic self-sustainability. No autonomous earning capability. The economic model is entirely operator-funded consumption. *Epistemic: verified. Sources: Anthropic blog; VentureBeat; DataCamp tutorial. Observed: 2026-01/03.*

### Axis 7 — Self-Reporting and Observability

**`[claude-cowork:inline-task-progress]`** The agent reports progress inline during task execution — showing what it's doing, what files it's reading/writing, what tools it's using. Progress is visible in the Cowork interface in real time. *Epistemic: verified. Sources: DataCamp tutorial; Anthropic blog. Observed: 2026-01.*

**`[claude-cowork:no-persistent-status-file]`** No HEARTBEAT.md equivalent. No self-authored status document that persists across sessions. Observability is limited to the active Cowork session's UI and the resulting files in the designated folder. *Epistemic: inferred. Sources: absence from documentation; PRE-BUILD-MEMO-4. Observed: 2026-01.*

### Axis 8 — Trust Boundary and Sandboxing

**`[claude-cowork:explicit-folder-grant]`** The user explicitly designates which folder Claude can access. Claude cannot read or edit anything outside the granted scope. This is the primary trust boundary — the user controls the attack surface. *Epistemic: verified. Sources: Anthropic blog; DataCamp tutorial. Observed: 2026-01.*

**`[claude-cowork:vm-isolation]`** Apple Virtualization Framework provides hardware-level isolation. The agent runs inside a Linux VM, not directly on the host filesystem. This is stronger than Docker-based sandboxing (no shared kernel) but weaker than air-gapped execution (the VM has network access for connectors). *Epistemic: verified. Sources: Simon Willison. Observed: 2026-01.*

**`[claude-cowork:human-confirmation-gate]`** Claude asks before taking significant actions — the human-in-the-loop confirmation is the trust mechanism for consequential operations. However, "significant" is Claude's judgment call, and destructive actions (file deletion) can occur if the user's instructions are sufficiently clear. *Epistemic: verified. Sources: Anthropic blog (safety section). Observed: 2026-01.*

**`[claude-cowork:prompt-injection-risk]`** Acknowledged risk: content encountered on the internet (via Chrome integration) or in files could contain prompt injections. Anthropic has built defenses but acknowledges this is "an active area of development." *Epistemic: verified. Sources: Anthropic blog (safety section). Observed: 2026-01.*

### Axis 9 — Extensibility and Connector Architecture

**`[claude-cowork:mcp-connector-ecosystem]`** Connectors link Claude to external services and data sources. In Cowork, connectors gain filesystem access — they can save external data locally or use local files as input for external actions. Hundreds of connectors available (Google Drive, Slack, DocuSign, Salesforce, n8n, Honeycomb, etc.). Both web connectors and desktop extensions supported. *Epistemic: verified. Sources: DataCamp tutorial; Anthropic documentation. Observed: 2026-01.*

**`[claude-cowork:skills-document-creation]`** Built-in skills improve Claude's ability to create documents, presentations, and other files. Skills are the same mechanism as Claude Code skills, adapted for non-coding outputs. *Epistemic: verified. Sources: Anthropic blog; DataCamp tutorial. Observed: 2026-01.*

**`[claude-cowork:chrome-browser-integration]`** Pairing Cowork with Claude in Chrome enables browser-mediated task execution — the agent can navigate websites, fill forms, and extract information. This extends the execution environment from the local filesystem to the web. *Epistemic: verified. Sources: Anthropic blog; DataCamp tutorial. Observed: 2026-01.*

---

## 3. Variant Analysis: Anthropic Cowork vs Microsoft Copilot Cowork

### The Fork

Microsoft launched Copilot Cowork (March 2026) built on the same "agentic harness" as Anthropic's Claude Cowork but deployed in a fundamentally different architecture. The two products share the Claude model and the agentic execution framework but diverge on deployment model, data access, and governance.

### Structural Comparison

| Dimension | Anthropic Claude Cowork | Microsoft Copilot Cowork |
|---|---|---|
| **Deployment** | Local device (macOS/Windows desktop app) | Cloud (Microsoft 365 tenant) |
| **Data access** | Folder-scoped local filesystem | Full M365 data graph (Outlook, Teams, SharePoint, Excel) |
| **Isolation** | Apple Virtualization Framework (local VM) | M365 enterprise security boundary |
| **Governance** | User-controlled folder grants + constitutional AI | Enterprise data protection + Work IQ + admin controls |
| **Pricing** | $20/month (Pro) to $200/month (Max) per user | $30/month (Copilot license) or $99/month (E7 bundle) |
| **Target** | Individual users, small teams | Enterprise organizations |
| **Status** | Research Preview (Pro/Team/Enterprise) | Research Preview (Frontier program, late March 2026) |

### Classification Verdict

**These are distinct surfaces that should not be collapsed.** They share an underlying model and agentic framework but differ structurally on every daemon/runtime axis that matters: deployment (local vs cloud), data access (folder vs enterprise graph), trust boundary (VM isolation vs enterprise governance), and target operator (individual vs enterprise). The architectural distinction is comparable to Confluence Cloud vs Confluence Data Center — same core but structurally different deployment models with different governance characteristics.

**For scaffold purposes:** Anthropic Claude Cowork is the surface being scaffolded in this class. Microsoft Copilot Cowork should be tracked as a potential future surface (it may belong in daemon/runtime or may warrant its own classification as an enterprise-integrated agent variant). It should not be silently absorbed into the Cowork scaffold.

---

## 4. Scaffold-Readiness Verdict

**Previous verdict (class-opening dossier): MARGINAL.**

**Updated verdict: SCAFFOLD-READY with documented limitations.**

The research pass has produced a structured primitive inventory with 19 identified primitives organized across all 9 daemon/runtime axes, each carrying epistemic labels and source attribution. This clears the scaffold-grammar threshold for per-primitive decomposition.

**What has improved:** Primitives are now identified and labeled. Axes are populated. Source attribution is per-primitive. The variant analysis provides clear boundary between Anthropic and Microsoft versions.

**What remains limited:**
- **Zero operational experience in the corpus.** All evidence is journalistic and architectural — no first-party operational testing has been documented.
- **High staleness risk.** Cowork is a research preview in active development. Feature additions, capability changes, and architectural evolution are expected on a biweekly cadence.
- **Thin Axis 5 (Identity/Accountability) and Axis 7 (Self-Reporting).** Cowork's structural absence of persistent identity and persistent self-reporting mechanisms means these axes carry primarily "absence" primitives rather than positive structural description.

**Recommendation:** Scaffold production is warranted. The resulting scaffold will be thinner than the OpenClaw scaffold (19 vs 30 primitives) and will carry more "inferred" labels than typical, reflecting the evidence character. This is honest — it represents a genuine young surface with strong architectural evidence but limited operational depth.

---

*Production receipt: Dedicated research pass for Claude Cowork. Evidence synthesized from 8 web sources + 2 corpus documents into 19 identified primitives across 9 daemon/runtime axes. Variant analysis produced (Anthropic vs Microsoft: distinct surfaces, should not collapse). Scaffold-readiness verdict upgraded from MARGINAL to SCAFFOLD-READY with documented limitations. First research/sensing pathway invocation.*
