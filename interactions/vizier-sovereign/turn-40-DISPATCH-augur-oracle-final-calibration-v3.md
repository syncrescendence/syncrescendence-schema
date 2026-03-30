# DISPATCH: Augur Calibration Missions + Oracle Adversarial Brief (Final)

**Type:** Dispatch  
**Turn:** 40 (final revision)  
**Salon:** vizier-sovereign / schema-3  
**Calibration:** Departing Perplexity Pro account expires April 1. Resources: 4,000 Computer credits (bonus, use-or-lose), ~15 Deep Research queries (~5/day × 3 days), unlimited Pro Search. Retained Perplexity account (separate) inherits full capability post-transition. Oracle on grok.com/SuperGrok unaffected.

---

## Strategic Allocation

The departing account has two distinct resource pools with different strengths:

**Computer (4,000 credits):** Multi-step orchestration with 19-model council and parallel sub-agents. Best for massive, complex meta-tasks that benefit from simultaneous search across heterogeneous sources. Not for answering individual questions — that's Deep Research's job. Allocated to **two battering-ram calibration missions** that improve everything downstream.

**Deep Research (~15 queries):** Focused, citation-grounded web search with synthesis. Best for individual research questions targeting specific ecosystem patterns. Allocated to **the 15 highest-priority search questions from the 20-question program**, sharpened by Computer's calibration output if it returns in time.

**Oracle (grok.com, SuperGrok):** Adversarial challenge of the strategic consensus. Independent of Perplexity. Fires whenever convenient.

**Vizier (this surface):** Wave Zero — five institutional baseline questions requiring grammar-layer reasoning, not web search.

---

## Part I — Computer Battering-Ram Missions (4,000 credits)

### Mission 1: Research Program Audit (~2,000 credits)

**Purpose:** Calibrate the 20-question research program before execution. Don't answer the questions — audit them. The output sharpens every subsequent Deep Research query.

**Context to attach:** KNOWLEDGE-ARCHITECTURE-ROOT.md, LAYER-LAW.md, SCAFFOLD-GRAMMAR.md, turn-38-SYNTHESIS (the 32 Qs), turn-40-vanguard-long-horizon (Vanguard's corrections), EXEGESIS-MULTI-AGENT-ORCHESTRATION.md

**Prompt:** See Section VI below (copy-paste ready).

**Expected output:** For each of the 20 questions: the three most authoritative primary sources (specific repos, specs, practitioner reports with URLs), corrected search terminology matching ecosystem usage, what the question as formulated will miss, and a sharpened reformulation.

### Mission 2: Grammar Layer Blind Spot Detection (~2,000 credits)

**Purpose:** Identify what the multi-agent orchestration ecosystem knows that the Syncrescendence grammar layer doesn't yet capture. This is the highest-leverage strategic question in the entire program — the one that reveals unknown unknowns.

**Context to attach:** KNOWLEDGE-ARCHITECTURE-ROOT.md, LAYER-LAW.md, EXEGESIS-MULTI-AGENT-ORCHESTRATION.md, turn-37-SYNTHESIS-orchestration-exegesis-validation.md

**Prompt:** See Section VI below (copy-paste ready).

**Expected output:** A structured blind-spot report: patterns the ecosystem has converged on that the grammar layer doesn't name, primitives production systems use that the grammar layer doesn't define, failure modes production systems have discovered that the grammar layer doesn't anticipate, and standards (AAIF, A2A, ACP) that the grammar layer should incorporate but currently ignores.

---

## Part II — Deep Research Execution (15 queries across 3 days)

Each query gets a context preamble (see Section VI). If Computer's Mission 1 returns sharpened formulations before a query fires, use the sharpened version. Otherwise fire the original.

### Day 1 — March 29 (5 queries)

| # | Question ID | Topic |
|---|---|---|
| 1 | Q1.1 | Typed commission contract formats (Symphony, A2A, ACP, CrewAI, LangGraph) |
| 2 | Q1.3 | Dispatch and concurrency patterns (MCO, gstack, Agent Teams) |
| 3 | Q2.1 | Trust and auth models (OpenClaw security, Agentgateway, A2A cards) |
| 4 | Q2.3 | Negative routing laws (what must stay human-only) |
| 5 | Q3.1 | Minimal viable observability stack (OpenTelemetry, Langfuse, Helicone) |

### Day 2 — March 30 (5 queries)

| # | Question ID | Topic |
|---|---|---|
| 6 | Q4.1 | Promotion ladders for learned behaviors (Hermes, DeerFlow, AutoMemory) |
| 7 | Q1.2 | Receipt and acknowledgment patterns |
| 8 | Q2.2 | Write-scope governance patterns |
| 9 | Q1.5 | Contract violation handling and escalation |
| 10 | Q3.2 | Drift detection in agent systems |

### Day 3 — March 31 (5 queries)

| # | Question ID | Topic |
|---|---|---|
| 11 | Q3.3 | Intervention models and kill switches |
| 12 | Q2.4 | Rollback and reversibility patterns |
| 13 | Q1.4 | Single-writer and present-state update patterns |
| 14 | Q4.2 | Cross-surface receipt normal forms |
| 15 | Spare | Re-fire thinnest result OR transition failure modes (Q-spare) |

---

## Part III — Wave Zero: Vizier Produces Locally

These five questions require grammar-layer reasoning, not web search. Vizier produces them as part of the calibration cycle's construction brief.

- **Q0.1** Atomic unit of commissioned work (derived from artifact grammar + method engine)
- **Q0.2** Minimal receipt shape (derived from authority lattice + naming/addressing)
- **Q0.3** Success/failure/abort/retry criteria for calibration cycle
- **Q0.4** Minimum degraded mode for first cycle
- **Q0.5** Calibration delta visibility method (pre-grammar scaffold vs grammar-aligned evidence)

---

## Part IV — Oracle Adversarial Sensing Brief

**Surface:** grok.com (DeepSearch + Think mode)  
**Model:** Grok 4.20 via SuperGrok  
**Timing:** Fire anytime during the three-day window

**Prompt:** See Section VI below (copy-paste ready).

**Five targets:** Hermes shadow-mode (too conservative?), Phase 4 deferral of memory questions (safe?), four-phase arc (is Phase 4 distinct from Phase 3?), Commander-centrism risk (single orchestrator bottlenecks?), subscription-OAuth durability (vendor policy signals?).

---

## Part V — Post-Sprint Integration

| When | Surface | What |
|---|---|---|
| After all returns | Retained Perplexity | Q5.1 integration synthesis (attach all evidence) |
| After all returns | Vizier | Synthesize into calibration cycle construction brief |
| After synthesis | Commander | Execute calibration cycle |
| Concurrent | Hermes (if installed) | Shadow mode observation |
| Post-cycle | Retained Perplexity | Deferred Phase 4 questions (original 23-28) |

---

## Part VI — Copy-Paste-Ready Prompts

### Computer Mission 1: Research Program Audit

```
I am building a distributed cognition system called Syncrescendence that 
orchestrates eleven AI avatars through a shared GitHub repository governed 
by a constitutional grammar layer. The system is entering Phase 3: 
operational constitution — formalizing typed contracts, coordination rules, 
receipts, observability, and trust boundaries.

I have a 20-question research program (attached) designed to gather 
ecosystem evidence for this phase. A strategic review (attached) has 
already restructured it from an original 32 questions.

YOUR TASK IS NOT TO ANSWER THESE QUESTIONS. Your task is to AUDIT them 
so they land harder when I execute them via targeted research queries.

For each of the 20 questions below, produce:

1. THE THREE MOST AUTHORITATIVE PRIMARY SOURCES available as of March 
   2026 — specific GitHub repos (with URLs), specific protocol specs, 
   specific practitioner reports or blog posts. Not aggregator sites. 
   Primary sources that a researcher should target.

2. CORRECTED SEARCH TERMINOLOGY — what does the ecosystem actually call 
   these patterns? If my question uses "typed commission contract" but 
   the ecosystem calls it "task schema" or "work order spec," tell me 
   the right terms.

3. WHAT THE QUESTION WILL MISS as currently formulated — blind spots, 
   adjacent patterns I'm not asking about, sources I won't find with 
   this framing.

4. A SHARPENED REFORMULATION of the question that would produce 
   higher-quality evidence.

Here are the 20 questions organized in five waves:

WAVE ZERO — Institutional Baseline (reasoning, not search):
Q0.1: What is the atomic unit of commissioned work in a multi-agent 
  knowledge architecture? What fields must a commission carry?
Q0.2: What is the minimal receipt shape for file-mediated orchestration 
  across heterogeneous surfaces (CLI, web, desktop, protocol)?
Q0.3: For a calibration cycle dispatching to 2-3 CLI agents: what 
  constitutes success, failure, abort, retry?
Q0.4: What is the minimum degraded mode a first calibration cycle 
  must survive?
Q0.5: What comparison frame makes the delta between pre-grammar and 
  grammar-aligned evidence maximally visible?

WAVE 1 — Coordination and Contracts:
Q1.1: Typed contract formats for inter-agent work commissioning 
  (Symphony, A2A, ACP, CrewAI, LangGraph)
Q1.2: Receipt/acknowledgment patterns in production orchestration
Q1.3: Dispatch and concurrency patterns for heterogeneous CLI fan-out 
  (MCO, gstack, Agent Teams)
Q1.4: Single-writer and present-state update patterns for singular 
  source-of-truth artifacts
Q1.5: Contract violation handling — error, retry, escalation

WAVE 2 — Trust and Write-Scope:
Q2.1: Trust/auth models for multi-agent systems with different 
  permission levels
Q2.2: Write-scope governance — which agents can modify which parts 
  of a shared repo
Q2.3: Negative routing laws — what must NOT be automated despite 
  feasibility
Q2.4: Rollback/reversibility for agent-produced artifacts

WAVE 3 — Observability:
Q3.1: Minimal viable observability stack for multi-agent systems
Q3.2: Drift detection — behavioral divergence from configured intent
Q3.3: Intervention models and kill switches

WAVE 4 — Selective Scouting:
Q4.1: Promotion ladders for learned behaviors in self-improving agents
Q4.2: Cross-surface receipt normal forms across heterogeneous agents

WAVE 5 — Integration:
Q5.1: Minimal viable operational constitution for transitioning from 
  human-mediated to protocol-mediated orchestration

Search comprehensively. Be specific about URLs and sources. The value 
of this audit is in the source identification and terminology correction, 
not in answering the questions themselves.
```

### Computer Mission 2: Grammar Layer Blind Spot Detection

```
I am building a constitutional knowledge architecture called 
Syncrescendence. Its grammar layer consists of nine ratified documents 
(attached) that define the structural physics of the system: a seven-tier 
institutional model, a nine-class artifact taxonomy, a scaffold grammar, 
a naming system, a method engine, a readiness matrix, and an authority 
lattice.

This grammar layer was designed to govern a distributed cognition system 
with eleven AI avatars coordinated through a shared repository. It was 
independently derived — not based on any existing multi-agent framework.

Since the grammar was ratified, the multi-agent orchestration ecosystem 
has converged rapidly. An exegesis of that ecosystem (attached) maps 
eight coalescing paradigms with 249+ orchestration-adjacent repos. The 
AAIF under the Linux Foundation (MCP, AGENTS.md, ACP) provides 
institutional standards. Production systems have shipped typed contracts, 
coordination protocols, trust models, and self-improving learning loops.

YOUR TASK: Identify what the ecosystem knows that this grammar layer 
does NOT yet capture.

Search comprehensively across GitHub, vendor documentation, practitioner 
communities, academic sources, and protocol specifications. Produce a 
structured blind-spot report:

1. PATTERNS the ecosystem has converged on that the grammar layer 
   doesn't name or define. What concepts are standard in production 
   multi-agent systems that have no corresponding primitive in the 
   grammar layer?

2. PRIMITIVES production systems use that the grammar layer should 
   define but doesn't. What building blocks are missing?

3. FAILURE MODES production systems have discovered that the grammar 
   layer doesn't anticipate. What breaks in real multi-agent 
   orchestration that the grammar layer has no mechanism to handle?

4. STANDARDS (AAIF, A2A, ACP, AGENTS.md, MCP) that the grammar layer 
   should incorporate but currently ignores. Where should the grammar 
   layer explicitly reference or align with institutional standards?

5. CONTRADICTIONS between the grammar layer's assumptions and what 
   production evidence reveals. Where does the grammar layer assume 
   something that evidence contradicts?

Cite specific sources at claim level. Distinguish confirmed ecosystem 
consensus from emerging patterns from speculative projections. Preserve 
contradictions rather than smoothing them.
```

### Deep Research Preamble (paste before each query)

```
Context: I'm researching operational patterns for a multi-agent AI 
orchestration system. It uses eleven AI avatars (Claude Code as 
orchestrator, Codex/Gemini CLI/Grok CLI as execution agents, Hermes 
Agent as learning runtime, plus web chat surfaces) coordinated through 
a shared GitHub repository governed by a constitutional grammar layer. 
The system is entering "operational constitution" — formalizing typed 
contracts, coordination rules, receipts, observability, and trust 
boundaries so agents can operate without implicit human arbitration.

Search comprehensively. Cite sources at claim level. Distinguish 
confirmed facts from inferences. Preserve contradictions.
```

### Deep Research Day 1 Queries (fire after preamble)

**Query 1:**
```
What typed contract formats exist in production multi-agent AI systems 
for commissioning work between agents? Examine: OpenAI Agents SDK 
Turn/Item/Thread primitives, Google A2A protocol task negotiation 
(v0.3), Agent Communication Protocol (ACP) message format, CrewAI task 
assignment schema, LangGraph state-passing conventions, and Symphony's 
WORKFLOW.md. What are the minimal required fields for a 
machine-parseable, auditable research commission? Compare the schemas.
```

**Query 2:**
```
What dispatch and concurrency patterns are used when one orchestrator 
agent fans out to multiple heterogeneous CLI agents and synthesizes 
their returns? Examine: MCO (mco-org/mco) multi-CLI dispatch, gstack 
(garrytan/gstack) multi-agent routing, Claude Code Agent Teams 
coordination (shipped Feb 5 2026), Symphony's parallel dispatch, and 
DeerFlow's subagent spawning. How does each handle two agents editing 
near the same state? What concurrency primitives exist (worktrees, 
mailboxes, merge queues)?
```

**Query 3:**
```
What trust and authorization models exist for multi-agent AI systems 
where agents have different permission levels? Examine: OpenClaw's 
permission manifests and exec-approval system (288 security advisories), 
Claude Code's hooks (PreToolUse for write filtering), Hermes Agent's 
skill permission model, the AAIF Agentgateway (enterprise MCP security 
under Linux Foundation), and Google A2A security cards (v0.3). How do 
these prevent unauthorized escalation?
```

**Query 4:**
```
In production multi-agent AI systems, what explicit rules exist about 
what must NOT be automated despite technical feasibility? What do 
production orchestrators keep human-only? What escalation thresholds 
exist? How do systems distinguish "technically possible but 
constitutionally forbidden" from "technically possible and authorized"? 
Examine any agent framework with permission deny lists, approval gates, 
or human-in-the-loop requirements.
```

**Query 5:**
```
What is the minimal viable observability stack for a multi-agent AI 
system as of March 2026? Examine: OpenTelemetry extensions for 
LLM/agent workloads, Langfuse trace model, Braintrust evaluation 
framework, Helicone monitoring, and Phoenix observability. What must 
be logged for governance/audit vs debugging? What is the difference 
between logging too much and logging enough?
```

### Deep Research Day 2 Queries

**Query 6:**
```
What promotion ladders exist for learned behaviors in self-improving AI 
agent systems? How do Hermes Agent (NousResearch/hermes-agent), DeerFlow 
(bytedance/deer-flow), Claude Code AutoMemory, and OpenViking 
(volcengine/OpenViking) distinguish between: observed pattern, candidate 
skill, validated skill, and authorized/active skill? What gates exist 
between levels? How are learned behaviors versioned, reviewed, rolled 
back, and prevented from becoming shadow governance?
```

**Query 7:**
```
What receipt and acknowledgment patterns exist in production AI agent 
orchestration? How does each system confirm task completion, report 
failure, and enable post-hoc audit? Examine OpenAI Agents SDK, Google 
A2A, ACP adapters, Symphony, and Claude Code Agent Teams. What must a 
receipt contain to answer: who ran, what authority, what input, what 
output, pass/fail, where it landed?
```

**Query 8:**
```
What write-scope governance patterns control which AI agents can modify 
which parts of a shared repository or filesystem? Examine Git branch 
protection, Claude Code hooks (PreToolUse write filtering), Hermes 
Agent skill boundaries, OpenClaw workspace permissions, and any 
multi-agent system that partitions a filesystem into write-authority 
zones. How do these interact with AGENTS.md?
```

**Query 9:**
```
How do production multi-agent AI systems handle contract violations — 
when an agent produces output that doesn't match the commissioned format 
or fails quality checks? What error-handling, retry, and escalation 
patterns exist? How do systems distinguish "agent failed" from 
"commission was underspecified"?
```

**Query 10:**
```
How do production AI agent systems detect drift — when an agent's 
behavior gradually diverges from configured intent over time or across 
sessions? What drift-detection patterns exist? How do they distinguish 
genuine improvement from unauthorized adaptation? Examine Claude Code 
/insights, Hermes Agent memory evolution, and any observability tool 
monitoring behavioral consistency.
```

### Deep Research Day 3 Queries

**Query 11:**
```
What intervention models exist in production multi-agent AI systems for 
anomalous behavior? How do orchestrators surface anomalies, trigger 
human review, and halt operations? What does a kill switch look like? 
Examine Perplexity Computer's audit trail + kill switch, OpenClaw 
gateway health checks, Claude Code Ctrl+C interrupt, and any framework 
with explicit anomaly detection and graceful shutdown.
```

**Query 12:**
```
What rollback and reversibility patterns exist for AI agent-produced 
artifacts? Beyond git revert — what about state rollback, memory 
rollback, and cross-surface consistency after partial rollback when 
multiple agents have built on each other's outputs?
```

**Query 13:**
```
What patterns exist for maintaining a singular source-of-truth state 
file in multi-agent systems? Examine etcd leader election, Kubernetes 
API server reconciliation, and any agent orchestration with a "current 
state" artifact that multiple agents read but only one writes. How is 
the single-writer constraint enforced? What happens during writer 
failure?
```

**Query 14:**
```
Is there any emerging standard or normal form for receipts that works 
across heterogeneous AI agent surfaces — Claude Code, Codex CLI, 
Gemini CLI, Grok CLI, Hermes Agent? Or does each require its own 
adapter? Examine ACP messages, A2A task completion, MCP tool results, 
and any cross-platform agent communication standard.
```

**Query 15 (spare):**
```
What do production multi-agent AI systems report as the most common 
failure modes when transitioning from human-mediated to 
automated/protocol-mediated orchestration? What broke that teams didn't 
expect? What lessons exist from this transition?
```

### Oracle Adversarial Brief (grok.com DeepSearch + Think)

```
You are Oracle — adversarial sensing surface for the Syncrescendence 
distributed cognition system. Your function: triangulated intelligence, 
contradiction detection, pressure-testing of consensus positions.

A strategic review cycle just completed. Vizier (Claude/Opus 4.6) 
produced a 32-question research program. Vanguard (ChatGPT/GPT-5.4) 
restructured it to 20 questions with five corrections: added baseline 
wave, merged coordination+contracts, reordered waves, deferred Phase 4 
questions, recommended Hermes shadow mode. The Sovereign ratified all.

Commission: adversarial challenge. Five targets:

1. HERMES SHADOW-MODE RECOMMENDATION.
Vanguard: Hermes enters first cycle as shadow learner only — observe, 
index, suggest. No write authority, no routing, no skill promotion. 
Path: witness → adviser → bounded operator.
CHALLENGE: Too conservative? The learning loop's value is compound 
returns. Shadow-only means zero compounding during the most 
information-rich period. Search X, Nous Research community, 
practitioner reports. Does the loop degrade in observation-only mode? 
Middle ground Vanguard missed?

2. PHASE 4 DEFERRAL OF MEMORY/LEARNING QUESTIONS.
Vanguard deferred memory taxonomies, cross-agent memory, 
self-improvement, backend substrate as "Phase 4 wearing Phase 3 
clothing."
CHALLENGE: Safe? The cycle generates evidence needing storage and 
cross-session retrieval. No memory architecture when evidence arrives = 
where does it go? Search for systems that launched without memory 
strategy and retrofitted. Cost?

3. FOUR-PHASE ARC (Phase 3 → Phase 4 → steady state → federation).
CHALLENGE: Is Phase 4 (governed metabolism) distinct from Phase 3 done 
correctly? If seven milestones met, does metabolism emerge automatically? 
Systems theory evidence on distinction between having governance and 
having functioning governance?

4. COMMANDER-CENTRISM RISK.
Both Vizier and Vanguard endorse Commander as meta-harness center. 
Overcentralization identified as failure mode but architecture endorsed.
CHALLENGE: Production multi-agent systems where single orchestrator 
became bottleneck, SPOF, or implicit sovereign? Evidence on centralized 
vs distributed orchestration at 5-10 agent scale?

5. SUBSCRIPTION-OAUTH ASSUMPTION.
Fleet economics rest on CLI harnesses authenticating via consumer 
subscription OAuth at zero marginal cost.
CHALLENGE: Vendor signals of rate-limit, usage-cap, or ToS changes 
affecting CLI tool usage under consumer subscriptions? Check Anthropic, 
OpenAI, Google, xAI. Durability over 6-12 months?

For each: search X, web, GitHub, changelogs, practitioner communities. 
Flag contradictions. Confidence ratings. Confirmation is also signal.
```

---

## Part VII — Sequencing Summary

| When | Surface | Credits/Queries | What |
|---|---|---|---|
| **3/29 ASAP** | Computer | ~2,000 cr | Mission 1: Research Program Audit |
| **3/29 ASAP** | Computer | ~2,000 cr | Mission 2: Blind Spot Detection |
| **3/29** | Deep Research | 5 queries | Day 1: Q1.1, Q1.3, Q2.1, Q2.3, Q3.1 |
| **3/29–3/31** | grok.com | 1 session | Oracle adversarial brief |
| **3/30** | Deep Research | 5 queries | Day 2: Q4.1, Q1.2, Q2.2, Q1.5, Q3.2 |
| **3/31** | Deep Research | 5 queries | Day 3: Q3.3, Q2.4, Q1.4, Q4.2, Q-spare |
| **3/29–3/31** | Vizier | — | Wave Zero: Q0.1–Q0.5 (local reasoning) |
| **Post-sprint** | Retained Perplexity | 1 query | Q5.1 integration synthesis |
| **Post-sprint** | Vizier | — | Synthesize all returns → construction brief |
| **Post-synthesis** | Commander | — | Execute calibration cycle |
| **Concurrent** | Hermes (if installed) | — | Shadow mode observation |

Computer fires first — its output improves everything downstream. Deep Research fires in parallel because the three-day window doesn't wait. Oracle fires independently. Vizier produces Wave Zero concurrently.

---

*4,000 credits. 15 queries. One Oracle brief. Five Vizier answers. The departing account becomes a battering ram. The retained account inherits the campaign. The constraint sharpens the move.*
