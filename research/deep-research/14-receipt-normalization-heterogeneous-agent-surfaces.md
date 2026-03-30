# Receipt Normalization Across Heterogeneous AI Agent Surfaces

## Executive Summary

No universally adopted normal form for receipts exists that works natively across Claude Code, Codex CLI, Gemini CLI, Grok CLI, and Hermes Agent as of March 2026. Each surface emits structurally distinct output envelopes, and the three dominant inter-agent protocols — MCP, A2A, and ACP — define incompatible receipt shapes. What does exist is a layered set of *emerging convergences*: a JSON-RPC 2.0 wire substrate shared by MCP and A2A, a growing OpenTelemetry GenAI semantic convention for observability receipts, and two active early-2026 proposals (AIP and DRS) that explicitly target cross-protocol, cryptographically signed completion records. The practical answer for a constitutional multi-agent system is: **each surface needs a thin adapter, and those adapters should normalize into a single canonical receipt envelope that embeds MCP-style content, OTel-style trace context, and an optional AIP-style completion block**.

***

## Part I: The Protocol Layer

### 1.1 MCP Tool Results (Claude Code's Native Receipt)

The Model Context Protocol, launched by Anthropic in November 2024, defines tool completion through `CallToolResult` objects carried over JSON-RPC 2.0. The authoritative schema has four fields:[^1][^2][^3][^4]

```json
{
  "content": [{ "type": "text|image|audio|embedded_resource", "..." }],
  "isError": false,
  "structuredContent": { "...": "arbitrary JSON" },
  "_meta": {}
}
```

The `content` array is the **model-visible** channel — what the LLM sees and reasons over. `structuredContent` is the **machine-visible** channel, intended for downstream programmatic processing, and is explicitly *not* forwarded to the model. Errors originating from the tool itself must be reported inside the result object with `isError: true`, not as protocol-level errors; protocol-level errors are reserved for failures in *finding* the tool or capability negotiation. The `_meta` field is reserved for protocol-level metadata and supports extensions.[^5][^6][^3]

A critical implementation caveat confirmed by the Microsoft Agent Framework issue tracker: the `structuredContent` field is inconsistently parsed by multiple adapters, including LangChain's MCP adapter, which silently ignores it in some versions. This means a receipt that relies on `structuredContent` may be invisible to agents consuming MCP results through popular middleware layers — a genuine cross-surface hazard.[^7][^8]

### 1.2 A2A Task Completion Artifacts (Google's Inter-Agent Receipt)

Google's Agent-to-Agent Protocol, launched April 2025, formalizes task outputs as **Artifacts** — a distinct concept from messages, which are conversational exchanges. Every A2A task runs through a state machine (submitted → working → input-required → completed → failed → canceled), and the terminal response includes an artifacts array. The canonical Artifact schema from Google's Vertex AI documentation:[^9][^10][^11][^12][^13]

```json
{
  "artifactId": "uuid",
  "name": "FlightItinerary.json",
  "description": "optional",
  "parts": [
    { "kind": "text", "text": "..." },
    { "kind": "data", "data": { "...": "JSON payload" } },
    { "kind": "file", "file": { "mimeType": "...", "uri": "..." } }
  ],
  "metadata": {},
  "extensions": []
}
```

The full task completion envelope wraps this in a JSON-RPC 2.0 response:[^14]

```json
{
  "jsonrpc": "2.0", "id": "req-004",
  "result": {
    "id": "task-uuid", "contextId": "session-uuid",
    "status": { "state": "completed", "message": { "role": "agent", "parts": [...] } },
    "artifacts": [ { "artifactId": "...", "name": "...", "parts": [...] } ],
    "history": [...],
    "kind": "task", "metadata": {}
  }
}
```

An important gap: A2A v0.2.0 does not formally standardize schema negotiation for artifact content types. The `metadata` field can carry MIME type hints and schema references by convention between agents, but there is no normative contract. This means A2A artifact receipts are structurally defined but semantically open — the orchestrator must negotiate artifact schemas out-of-band.[^14]

### 1.3 ACP Messages (IBM's REST-Based Agent Receipt)

The Agent Communication Protocol, launched by IBM under the Linux Foundation in March 2025, diverges from MCP and A2A by using REST/HTTP rather than JSON-RPC. The message schema uses MIME types for content identification, making it extensible to arbitrary data formats:[^15][^16][^1]

```json
{
  "role": "agent/report-generator",
  "parts": [
    { "content_type": "text/plain", "content": "Here's the report:" },
    { "name": "/report.pdf", "content_type": "application/pdf", "content_url": "https://..." }
  ]
}
```

A `MessagePart` with a `name` field becomes an **Artifact** in ACP's nomenclature. The run completion response adds execution metadata:[^17][^15]

```json
{
  "run_id": "...", "agent_name": "echo", "session_id": "...",
  "status": "completed", "output": [{ "parts": [...] }], "error": null
}
```

Hermes Agent (Nous Research) explicitly advertises ACP integration as a first-class callback surface alongside its internal tool execution modes. This means Hermes's learning runtime outputs can be surfaced as ACP messages, making ACP a natural normalization target for that surface.[^18]

### 1.4 Protocol Comparison Matrix

| Dimension | MCP | A2A | ACP |
|---|---|---|---|
| Wire format | JSON-RPC 2.0 | JSON-RPC 2.0 over HTTP+SSE | REST/HTTP, MIME multipart |
| Output primitive | `CallToolResult` | `Artifact` (in `Task`) | `Message` (with named `Part` → Artifact) |
| Machine-readable field | `structuredContent` | `parts[].data` | MIME-typed `content` |
| Model-visible field | `content[]` | `parts[].text` | text-typed parts |
| Error signaling | `isError` boolean + error in `content` | `status.state = failed` | `error` field in run response |
| Streaming | SSE optional | SSE via `tasks/sendSubscribe` | Async-first with SSE |
| Schema negotiation | `outputSchema` on tool definition | By convention in `metadata` | MIME type negotiation |
| Discovery | Tool list via `tools/list` | Agent Card at `/.well-known/agent-card.json` | Runtime API + offline manifests |
| Launched | Nov 2024 | Apr 2025 | Mar 2025 |
| Source | [^1] | [^19] | [^1] |

***

## Part II: Per-Surface Output Envelopes

### 2.1 Claude Code

Claude Code is itself an MCP client-orchestrator. Its Agent SDK produces a `result` message with a `structured_output` field when an `outputFormat` is specified:[^20][^21]

```typescript
// From @anthropic-ai/claude-agent-sdk
if (message.type === "result" && message.structured_output) {
  // validated JSON matching the schema
}
```

In CLI mode (`claude --output-format json`), the envelope is `{ "result": "...", ... }`, and `--json-schema` places data in `.structured_output`. The underlying API supports `output_config.format = { type: "json_schema", schema: {...} }` with constrained decoding. Strict tool use adds `strict: true` to tool definitions to guarantee schema adherence on tool call parameters.[^22][^23]

### 2.2 Codex CLI (OpenAI)

Codex CLI exposes `--output-schema <path>` for a JSON Schema file against which the final response is validated. The `--json` flag produces newline-delimited JSON events (one per state change), not a single terminal receipt. Internal `function_call_output` items include an `ExecOutputMetadata` object with `exit_code` and `duration_seconds` — this is the closest Codex CLI comes to a native receipt with execution provenance. The `--output-last-message` flag writes the assistant's final message to a file.[^24][^25]

**Confirmed gap**: Codex CLI does not emit a unified envelope that includes both the result content and execution metadata in one parseable JSON document. The two channels (content vs. metadata) are split across different event types.

### 2.3 Gemini CLI

Gemini CLI's headless mode (`--output-format json`) produces a documented schema:[^26]

```json
{
  "response": "string",
  "stats": {
    "models": { "[model-name]": { "api": { "totalRequests", "totalErrors", "totalLatencyMs" }, "tokens": { "prompt", "candidates", "cached", "total" } } },
    "tools": { "totalCalls", "totalSuccess", "totalFail", "totalDurationMs", "byName": { ... } },
    "files": { "totalLinesAdded", "totalLinesRemoved" }
  },
  "error": { "type", "message", "code" }
}
```

This is notable because it is the only CLI surface that bundles response content, tool execution statistics, token usage, and error status in a single top-level JSON object. However, it is **not** MCP-compatible — there is no `content` array, `isError` field, or `structuredContent` field. It is also not schema-validated output; `response` is a plain string. Full structured JSON output with user-provided schemas remains a GitHub feature request as of mid-2025.[^27][^28][^26]

### 2.4 Grok CLI (superagent-ai/grok-cli)

The TypeScript type system for Grok CLI's tool execution results:[^29]

```typescript
interface ToolResult {
  success: boolean;
  output?: string;
  error?: string;
  data?: any;
}
```

XAI's Grok API supports structured outputs via Pydantic schemas or JSON Schema through `client.beta.chat.completions.parse()` with a `response_format` argument. Grok 3 introduced structured output support; Grok 4 refined it. However, the CLI surface emits `success/output/error/data` — a minimal envelope with no execution metadata, no trace context, and no delegation provenance.[^30]

### 2.5 Hermes Agent (Nous Research)

Hermes is explicitly designed as a learning runtime rather than a stateless execution agent. Its `AIAgent` maintains session history, iteration budgets, and compression/fallback state across turns. The callback system exposes progress at multiple granularities: `tool_progress_callback`, `step_callback`, `stream_delta_callback`, `status_callback`, and others. Hermes has built-in ACP integration as a first-class output surface, meaning its results can be surfaced via ACP's REST-based message format.[^18]

**Key inference** (not confirmed in documentation): Hermes does not publish a separate normalized receipt schema. Its receipts are whatever the ACP message format carries for the specific run. The learning runtime aspects (skill acquisition, session recall, persistent memory) generate internal state that does not appear in the external output envelope.

### 2.6 Surface Comparison Matrix

| Surface | Native output format | Machine-readable? | Execution metadata? | Schema validation? | OTel-compatible? |
|---|---|---|---|---|---|
| Claude Code | `{ structured_output: {}, type: "result" }` | Yes (`outputFormat`) | Partial (token usage in API) | Yes (JSON Schema constrained) | Via instrumentation |
| Codex CLI | NDJSON events + final message | Partial (`--json`) | `exit_code`, `duration_seconds` | `--output-schema` flag | Via instrumentation |
| Gemini CLI | `{ response, stats, error }` | No (response = string) | Yes (`stats.tools`, `stats.models`) | No (feature request) | Via instrumentation |
| Grok CLI | `{ success, output, error, data }` | Partial (`data: any`) | No | Via Pydantic/JSON Schema | Via instrumentation |
| Hermes Agent | ACP messages (via callbacks) | Yes (MIME-typed parts) | No (internal state only) | Via ACP MIME negotiation | Via instrumentation |

Sources:[^25][^20][^29][^26][^18]

***

## Part III: Emerging Convergence Points

### 3.1 OpenTelemetry GenAI Semantic Conventions (Observability Receipts)

The most broadly adopted convergence point is OpenTelemetry's GenAI semantic conventions, which the OpenTelemetry GenAI Observability SIG began formalizing in April 2024. The conventions define standardized span attributes for LLM calls, agent invocations, and tool executions. As of early 2026, major vendors including Datadog, Honeycomb, and New Relic support them, and frameworks such as LangChain, CrewAI, and AutoGen emit compliant spans natively.[^31]

Key attributes relevant to receipts:[^32][^31]

| Attribute | Description |
|---|---|
| `gen_ai.agent.name` | Human-readable agent name |
| `gen_ai.agent.id` | Stable agent instance identifier |
| `gen_ai.operation.name` | `invoke_agent`, `execute_tool`, `chat`, `embeddings` |
| `gen_ai.usage.input_tokens` | Prompt token count |
| `gen_ai.usage.output_tokens` | Completion token count |
| `gen_ai.response.finish_reasons` | Array of finish reasons |
| `gen_ai.tool.definitions` | Tool schemas available to the agent |

An `invoke_agent` span can contain child spans for tool usage, retrieval steps, and nested agent calls, creating a traceable execution tree. An RFC in the OpenLLMetry project explicitly proposes extending conventions to cover tasks, artifacts, memory, and multi-agent coordination.[^33][^34][^35]

**Critical distinction**: OTel spans are *observability receipts* — they record what happened for monitoring and debugging. They are not *task completion receipts* that propagate between agents as authorization or provenance evidence. The two are complementary, not equivalent.

### 3.2 AIP Completion Blocks (Provenance Receipts)

A March 2026 arXiv paper by Sunil Prakash introduces the Agent Identity Protocol (AIP) and its Invocation-Bound Capability Tokens (IBCTs), which are the most technically complete cross-protocol receipt proposal found in this research. AIP explicitly states that it searched eleven categories of prior work and found no implemented protocol that jointly combines "provenance-aware completion records, and transport bindings across MCP, A2A, and HTTP".[^36]

IBCTs use an append-only block structure where the final block is a **completion block**:[^36]

```
Block 3 (Completion) -- signed by ephemeral agent
status: completed
result_hash: sha256:e3b0c4...
cost_usd: 0.03
tokens_used: 1200
verification_status: self_reported
```

Three trust escalation levels are defined: (1) **self-reported** — the executing agent signs its own result; (2) **counter-signed** — the delegator independently verifies and appends an attestation block; (3) **third-party attested** — an external verifier signs. Completion blocks are optional and self-reported by default, meaning they are tamper-evident and attribution-bound but not independently verified unless explicitly counter-signed.[^36]

Protocol bindings are defined for all three relevant transports:[^36]
- **MCP**: `X-AIP-Token` HTTP header on every tool call
- **A2A**: `aip_token` field in task metadata; `aip_identity` field in Agent Card
- **HTTP**: `Authorization: AIP <token>` header

Wire formats: compact mode (signed JWT, EdDSA, ~356 bytes, sub-millisecond verification) for single-hop cases; chained mode (Biscuit token with Datalog policies, 340–380 bytes per delegation block) for multi-hop. In a real multi-agent deployment with Gemini 2.5 Flash, AIP adds 2.35 ms overhead against ~2,749 ms total latency (0.086%).[^36]

**Status**: Research paper with reference implementations in Python and Rust; not yet adopted by MCP or A2A specifications.

### 3.3 DRS: Delegation Receipt System

An active March 2026 thread on the Rust Users Forum describes DRS — a UCAN v1 Profile for portable, verifiable delegation receipts. DRS is characterized as "cryptographic proof of who delegated what to whom, with clear bounds and room for consent and compliance metadata". It explicitly positions itself as a UCAN Profile rather than a competing authorization scheme, targeting the agent tool-call audit trail use case. Status: active RFC, no implementation yet confirmed.[^37]

### 3.4 ACK Receipts (Payment-Oriented)

The Agent Commerce Kit (ACK) defines receipts as W3C Verifiable Credentials:[^38]

```json
{
  "@context": ["https://www.w3.org/2018/credentials/v1", "https://agentcommercekit.org/contexts/payment/v1"],
  "type": ["VerifiableCredential", "ACKPaymentReceipt"],
  "issuer": "did:web:receipts.example.com",
  "credentialSubject": {
    "id": "did:key:z6Mk...",
    "paymentOptionId": "...",
    "metadata": { "amount": 1000, "currency": "USD", "timestamp": "..." }
  }
}
```

ACK receipts are designed for agent commerce and payment verification, not general task completion. They demonstrate that W3C VCs are a viable receipt format for high-trust agent interactions, but they are not applicable to general-purpose tool execution receipts.[^38]

### 3.5 MCP Usage Receipts (Provenance Proposals)

A LinkedIn proposal from the MCP community advocates for per-source metering and signed outputs on every artifact using C2PA/Content Credentials and SPDX/CC/ODC license tags. The proposal frames this as "usage receipts: per-source metering for audits, royalties, and vendor SLAs." This is directionally aligned with AIP completion blocks but has no implementation or specification status.[^39]

***

## Part IV: The Adapter Gap

### 4.1 Why Each Surface Requires an Adapter (Confirmed)

The AIP paper's explicit conclusion — that no single prior solution addresses all seven properties required for agent delegation (public-key verification, holder attenuation, expressive policy, cross-protocol binding, provenance binding, no blockchain dependency, lifecycle awareness) — confirms the adapter pattern is not a workaround but a structural necessity as of March 2026. Each surface emits receipts in its native idiom:[^36]

- Claude Code emits `structured_output` in a result message — no execution metadata, no trace context
- Codex CLI splits result content and execution metadata across different NDJSON event types
- Gemini CLI bundles rich execution stats but loses schema-validated content structure
- Grok CLI emits a minimal `{success, output, error, data}` with no provenance
- Hermes emits ACP messages whose internal learning state is not externalized

No surface currently emits a receipt that includes all of: structured output, execution metadata, trace context, and delegation provenance.

### 4.2 The Normalization Gap Is Structural, Not Accidental

The McKinsey figure cited in adjacent research — that 70% of enterprise datasets require normalization before use by models — and the W3C finding that less than 40% of commercial websites maintain machine-readable structures — bracket the broader normalization problem. For agent receipts specifically, the gap is structural because each surface optimizes for a different primary consumer: Claude Code for agent SDK users, Gemini CLI for shell scripting and automation, Hermes for learning loop feedback. None was designed to be a cross-surface receipt producer.[^40]

### 4.3 Adapter Architecture Pattern

The practical pattern — documented in production at Netflix and described in adapter pattern literature — is a thin adapter layer that normalizes each surface's native output into a common event structure. Applied to agent receipts, this means:[^41][^42]

1. **Surface collector**: Per-agent adapter captures native output (Gemini JSON, Codex NDJSON, Hermes ACP, etc.)
2. **Content normalizer**: Maps `response`/`output`/`parts[]` → `content: ContentBlock[]` (MCP-style)
3. **Metadata extractor**: Maps `stats.tools`/`exit_code`/`duration` → `execution_metadata`
4. **OTel emitter**: Attaches trace context (`trace_id`, `span_id`) to every receipt
5. **Completion signer**: Optionally appends AIP-style completion block for trust escalation

***

## Part V: Proposed Canonical Receipt Envelope

Given the above analysis, a practical canonical receipt normal form for a constitutional multi-agent system can be synthesized by compositing the overlapping fields across MCP, A2A, ACP, OTel, and AIP:

```json
{
  "receipt_schema": "1.0",
  "receipt_id": "uuid",
  "agent_surface": "claude_code | codex_cli | gemini_cli | grok_cli | hermes",
  "agent_id": "aip:web:domain/agent | aip:key:ed25519:...",
  "task_id": "uuid",
  "session_id": "uuid",
  "timestamp_iso": "2026-03-30T00:17:00Z",

  "status": "completed | failed | canceled",
  "isError": false,

  "content": [
    { "type": "text", "text": "..." },
    { "type": "image", "data": "base64..." }
  ],

  "structured_output": { "...": "arbitrary JSON, schema-validated" },

  "execution_metadata": {
    "duration_ms": 1881,
    "tokens_in": 24939,
    "tokens_out": 20,
    "model": "gemini-2.5-pro",
    "tool_calls": 1,
    "cost_usd_cents": 3
  },

  "trace": {
    "trace_id": "otel-trace-id",
    "span_id": "otel-span-id",
    "parent_span_id": "orchestrator-span-id"
  },

  "error": null,

  "completion_block": {
    "result_hash": "sha256:...",
    "verification_status": "self_reported | counter_signed | third_party_attested",
    "signed_by": "aip:key:ed25519:...",
    "signature": "base64-Ed25519"
  },

  "metadata": {}
}
```

**Field sourcing**:
- `content[]` + `isError` → MCP `CallToolResult`[^3]
- `structured_output` → MCP `structuredContent` / Claude SDK `structured_output`[^6][^20]
- `status` → A2A task state machine / ACP run status[^11][^17]
- `execution_metadata` → Gemini CLI `stats` / Codex CLI `function_call_output` metadata[^24][^26]
- `trace` → OTel `TRACEPARENT` / GenAI span attributes[^43][^31]
- `completion_block` → AIP IBCT completion block[^36]

### Surface-to-Canonical Adapter Map

| Surface | `content` source | `structured_output` source | `execution_metadata` source |
|---|---|---|---|
| Claude Code | `result.content` | `result.structured_output` | API usage tokens |
| Codex CLI | final `message` event content | schema-validated final message | `exit_code`, `duration_seconds` from `function_call_output` |
| Gemini CLI | `response` (wrap in TextContent) | N/A (feature request) | `stats.tools`, `stats.models` |
| Grok CLI | `output` (wrap in TextContent) | `data` | N/A |
| Hermes | ACP parts[].content | ACP named parts (Artifacts) | session budget, iteration count |

Sources:[^20][^29][^25][^26][^18]

***

## Part VI: Trust Boundaries and Constitutional Integration

### 6.1 Receipts as Contract Enforcement Points

In a constitutional grammar layer, receipts serve as the evidence base for contract verification. Every delegation hop in an agent orchestration chain should produce a receipt that answers: who executed, under what authority, with what constraints, and with what outcome. The current protocol landscape answers these questions incompletely:[^36]

- **Who executed**: Agent surface identity is implicit (you know which CLI you called). AIP provides explicit `agent_id` via `aip:web` or `aip:key` schemes.[^36]
- **Under what authority**: Not captured in any current surface receipt. Requires AIP delegation chain or UCAN token attached to the receipt.[^44][^37]
- **With what constraints**: Budget/scope constraints appear only if AIP completion blocks are used.[^36]
- **With what outcome**: MCP provides `isError`; A2A provides task state; Gemini provides tool stats; AIP provides `result_hash`.[^13][^26][^3][^36]

### 6.2 Trust Escalation Levels for Receipts

The three-tier trust model from AIP maps naturally onto a constitutional governance layer:[^36]

| Level | Mechanism | Use case in constitutional orchestration |
|---|---|---|
| Self-reported | Agent signs its own completion block | Default for all execution agents (Codex, Gemini, Grok) |
| Counter-signed | Orchestrator verifies + appends attestation | Required for Claude Code orchestrator to confirm execution agent results before writing to shared repo |
| Third-party attested | External audit agent or human verifier signs | Required for receipts that trigger irreversible actions (deployments, payments) |

### 6.3 Zero-Trust Multi-Agent Architecture

The Delegation Capability Token (DCT) pattern, proposed by DeepMind's "Intelligent AI Delegation" paper (Tomašev et al., 2026) and cited in the AIP paper, provides a complementary trust delegation model. In this pattern, the orchestrator (Claude Code) mints a capability token for each execution agent with attenuated scope, budget ceiling, and expiry. The execution agent's receipt is then cryptographically bound to that token, proving the action was authorized. The `contractId` and `delegationId` fields shown in DCT examples mirror the `context` field required in AIP delegation blocks.[^45][^36]

***

## Part VII: Honest Assessment of Current State

### 7.1 What Is Confirmed

- MCP `CallToolResult` schema is fully specified and stable[^46][^3]
- A2A Artifact schema is fully specified[^12][^13]
- ACP `Message` and `MessagePart` schema is fully specified[^15]
- Gemini CLI `--output-format json` schema is documented[^26]
- OTel GenAI semantic conventions are in active development and partially adopted[^32][^31]
- AIP completion blocks provide cross-protocol receipt primitives with reference implementations[^36]
- No single standard covers all surfaces simultaneously (confirmed by AIP paper survey)[^36]

### 7.2 What Is Inferred (Not Confirmed)

- Hermes Agent's ACP integration is documented at the architecture level but the exact ACP message schema it emits is not publicly specified — inferred from ACP documentation[^18]
- The canonical receipt envelope proposed in Part V is a synthesis, not a published standard
- Codex CLI's NDJSON event format is documented in source code and CLI reference but not in a formal receipt specification[^25][^24]

### 7.3 Contradictions to Preserve

**Contradiction 1**: The MCP specification's `structuredContent` field is designed to be the machine-readable receipt channel, but the Microsoft Agent Framework's MCP adapter ignores it silently, and the TypeScript SDK has an open issue where `structuredContent` validation blocks tools from correctly reporting errors. *The field exists in spec; its reliable propagation across the ecosystem does not.*[^8][^7][^46]

**Contradiction 2**: Gemini CLI's `--output-format json` bundles rich execution metadata that MCP receipts do not include (per-model token counts, tool call statistics, file modification counts), yet Gemini CLI does not support user-defined output schemas — the feature is an open GitHub request. *Gemini is the most observability-rich surface but the least schema-controlled.*[^28][^27][^26]

**Contradiction 3**: ACP is designed specifically to interoperate with heterogeneous agent frameworks and explicitly supports Hermes Agent, making it a natural normalization target. But ACP uses REST, not JSON-RPC, while MCP and A2A use JSON-RPC 2.0 — bridging them requires an HTTP translation layer, not just schema mapping.[^16][^1][^18]

***

## Conclusion

The landscape as of March 2026 has protocol-layer receipts (MCP `CallToolResult`, A2A `Artifact`, ACP `Message`) that are well-specified but incompatible, surface-layer receipts (Gemini CLI JSON, Codex CLI NDJSON, Claude SDK result message) that diverge further, and an emerging cryptographic receipt layer (AIP completion blocks, DRS, ACK VCs) that adds provenance and trust but lacks adoption. For a multi-agent system entering operational constitution, the practical path is **one canonical receipt schema + five thin adapters**, with OTel trace context embedded for observability, and optional AIP completion blocks for trust escalation on high-stakes tasks. The gap between a normalized canonical form and what the protocols actually specify today is real and confirmed — but it is bridgeable with well-defined adapter contracts, which is precisely what a constitutional grammar layer is designed to enforce.

---

## References

1. [A Survey of Agent Interoperability Protocols: Model Context ... - arXiv](https://arxiv.org/html/2505.02279v2) - This survey examines four emerging agent communication protocols: Model Context Protocol (MCP), Agen...

2. [Step 3: Capability...](https://pradeepl.com/blog/model-context-protocol/mcp-protocol-mechanics-and-architecture/) - Dive deep into the technical architecture and mechanics of the Model Context Protocol (MCP), an open...

3. [CallToolResult in rust_mcp_schema - Rust - Docs.rs](https://docs.rs/rust-mcp-schema/latest/rust_mcp_schema/struct.CallToolResult.html) - The server’s response to a tool call.

4. [CallToolResult in mcp_attr::schema - Rust - Docs.rs](https://docs.rs/mcp-attr/latest/mcp_attr/schema/struct.CallToolResult.html) - The server’s response to a tool call.

5. [Tools – Model Context Protocol （MCP）](https://modelcontextprotocol.info/docs/concepts/tools/) - Set isError to true in the result; Include error details in the content array. Here's an example of ...

6. [Why can the model see the structured content returned by the MCP ...](https://forum.langchain.com/t/why-can-the-model-see-the-structured-content-returned-by-the-mcp-tool/3076) - @mcp.tool(description=“Add two numbers”) def add(a: int, b: int) → CallToolResult: “”“Add two number...

7. [Python: MCP CallToolResult.structuredContent field is not parsed ...](https://github.com/microsoft/agent-framework/issues/3313) - The structured_content field is specifically designed for returning structured JSON data from tool c...

8. [Missing or wrong structuredContent blocks tools from ...](https://github.com/modelcontextprotocol/typescript-sdk/issues/654) - Describe the bug When a tool with outputSchema is called, the server sdk checks the result to see if...

9. [How the Agent2Agent Protocol (A2A) Actually Works: A Technical ...](https://www.blott.com/blog/post/how-the-agent2agent-protocol-a2a-actually-works-a-technical-breakdown) - A2A protocol formalizes task outputs as "artifacts". Each artifact delivers structured content back ...

10. [A2A Protocol Explained - Hugging Face](https://huggingface.co/blog/1bo/a2a-protocol-explained) - It can be completed immediately, or for long-running tasks, agents can synchronize updates. The outp...

11. [A2A Protocol: Scope, Core Components, Security, and Best Practices](https://zbrain.ai/understanding-the-a2a-protocol/) - Artifacts are returned to the client, often as a message at task completion, and may be multimodal –...

12. [projects.locations.collections.engines.assistants.agents.a2a.v1.tasks](https://docs.cloud.google.com/generative-ai-app-builder/docs/reference/rest/v1/projects.locations.collections.engines.assistants.agents.a2a.v1.tasks)

13. [Package a2a.v1 | Vertex AI Search](https://docs.cloud.google.com/generative-ai-app-builder/docs/reference/rpc/a2a.v1)

14. [A2A Sample Methods and JSON Responses](https://a2aprotocol.ai/blog/a2a-sample-methods-and-json-responses) - This section provides illustrative JSON examples of common A2A interactions. Timestamps, context IDs...

15. [Message Structure - Agent Communication Protocol](https://agentcommunicationprotocol.dev/core-concepts/message-structure) - Message Role. Each message must specify a role that identifies the sender. Valid role formats are: u...

16. [ACP - Agent Communication Protocol](https://agentcommunicationprotocol.dev/introduction/welcome) - Get to know the Agent Communication Protocol

17. [MCP, A2A, ACP: What does it all mean? - Akka](https://akka.io/blog/mcp-a2a-acp-what-does-it-all-mean) - Learn how MCP, A2A, and ACP enable scalable, secure communication for interoperable agentic AI syste...

18. [Agent Loop Internals | Hermes Agent - Nous Research](https://hermes-agent.nousresearch.com/docs/developer-guide/agent-loop/) - Detailed walkthrough of AIAgent execution, API modes, tools, callbacks, and fallback behavior.

19. [Developer's Guide to AI Agent Protocols](https://developers.googleblog.com/developers-guide-to-ai-agent-protocols/) - Each A2A agent publishes an Agent Card at a well-known URL ( /.well-known/agent-card.json ) that des...

20. [Get structured output from agents - Claude API Docs](https://platform.claude.com/docs/en/agent-sdk/structured-outputs) - Return validated JSON from agent workflows using JSON Schema, Zod, or Pydantic. Get type-safe, struc...

21. [Structured Outputs — ClaudeCode v0.26.0 - Hexdocs](https://hexdocs.pm/claude_code/structured-outputs.html)

22. [Structured outputs - Claude API Docs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs) - Get validated JSON results from agent workflows

23. [Claude CLI Automation | CodeSignal Learn](https://codesignal.com/learn/courses/skills-plugins-cli-automation/lessons/claude-cli-automation)

24. [codex/codex-cli/src/cli.tsx at main · openai/codex](https://github.com/openai/codex/blob/main/codex-cli/src/cli.tsx) - Lightweight coding agent that runs in your terminal - openai/codex

25. [Command line options – Codex CLI](https://developers.openai.com/codex/cli/reference) - Options and flags for the Codex terminal client

26. [Examples](https://google-gemini.github.io/gemini-cli/docs/cli/headless.html) - An open-source AI agent that brings the power of Gemini directly into your terminal.

27. [Structured JSON Output · Issue #8022 · google-gemini/ ...](https://github.com/google-gemini/gemini-cli/issues/8022) - Motivation Gemini CLI is a powerful tool for interactive use. However, its current plain-text output...

28. [Introduce structured JSON output with a defined schema](https://github.com/google-gemini/gemini-cli/issues/5021) - What would you like to be added? I propose adding a new feature that allows the user to request a re...

29. [Type System | superagent-ai/grok-cli | DeepWiki](https://deepwiki.com/superagent-ai/grok-cli/8.3-type-system) - The TypeScript type system provides compile-time safety and contracts for tool execution, state mana...

30. [Grok 4 API: A Step-by-Step Guide With Examples - DataCamp](https://www.datacamp.com/tutorial/grok-4-api) - Learn how to use Grok 4’s API through practical examples featuring image recognition, reasoning, fun...

31. [OpenTelemetry for AI Agents: Observability, Tracing, and the GenAI ...](https://zylos.ai/research/2026-02-28-opentelemetry-ai-agent-observability) - How to instrument AI agent systems with OpenTelemetry's emerging GenAI semantic conventions to gain ...

32. [Semantic Conventions for GenAI agent and framework spans](https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/) - Status: Development Important Existing GenAI instrumentations that are using v1.36.0 of this documen...

33. [AI Agent Observability Guide: Telemetry, Traces, Metrics, and Evals](https://www.groundcover.com/learn/observability/ai-agent-observability) - Instead of inventing custom formats, agent frameworks emit OpenTelemetry spans and metrics with GenA...

34. [[RFC] Semantic Conventions for AI Agent Observability #3460 - GitHub](https://github.com/traceloop/openllmetry/issues/3460) - This is the top-level span encompassing all agent activities. Span Kind: INTERNAL. Required Attribut...

35. [Semantic Conventions for Generative AI Agentic Systems ...](https://github.com/open-telemetry/semantic-conventions/issues/2664) - Area(s) area:gen-ai Propose new conventions Summary This proposal introduces semantic conventions fo...

36. [AIP: Agent Identity Protocol for Verifiable Delegation Across MCP and A2A](https://arxiv.org/pdf/2603.24775.pdf)

37. [Building DRS: verifiable delegation receipts for AI agents (UCAN v1 ...](https://users.rust-lang.org/t/building-drs-verifiable-delegation-receipts-for-ai-agents-ucan-v1-dag-cbor-drowning-in-spec-edges-and-could-use-sane-eyes/139173) - DRS is a portable, verifiable "receipt" for delegation - not "trust our logs," but cryptographic pro...

38. [Receipt Verification & Presentation - Agent Commerce Kit](https://www.agentcommercekit.com/ack-pay/receipt-verification) - The ACK Receipt system provides cryptographically secure proof using W3C Verifiable Credentials (VCs...

39. [Provenance for AI Agents: Ensuring Compliance with SPDX and C2PA](https://www.linkedin.com/posts/mcp-revolution_modelcontextprotocol-ai-agents-activity-7435693522080456704-hVtP) - Legal reality check: if you can't prove where your agent's answers came from—and what you're allowed...

40. [The normalization gap: why AI agents discard so much site data](https://www.reddit.com/r/analytics/comments/1pcxmbx/the_normalization_gap_why_ai_agents_discard_so/) - Agents don't care about any of that. They pull structured inputs, normalize them into internal catal...

41. [How to Implement the Adapter Pattern with Docker - OneUptime](https://oneuptime.com/blog/post/2026-02-08-how-to-implement-the-adapter-pattern-with-docker/view) - Implement the Adapter container pattern in Docker to transform, normalize, and standardize interface...

42. [Day 20: Building a Compatibility Layer for Common Logging Formats](https://sdcourse.substack.com/p/day-20-building-a-compatibility-layer) - Netflix's pattern uses a thin adapter layer that normalizes to a common event structure, then routes...

43. [Building a Multi-Agent AI System with Claude Code - Mae Capozzi](https://maecapozzi.com/blog/building-a-multi-agent-orchestrator) - Learn how I built a Claude Code multi-agent orchestrator that coordinates specialized AI coding agen...

44. [UCAN: User controlled authorization networks - Storacha Docs](https://docs.storacha.network/concepts/ucan/) - Delegation allows you to share your access to a resource with another user (or service, or device), ...

45. [How to add trust boundaries to your multi-agent system](https://dev.to/jnycode/how-to-add-trust-boundaries-to-your-multi-agent-system-gic) - How to add trust boundaries to your multi-agent system. #ai #typescript #opensource #security. You h...

46. [Tools](https://modelcontextprotocol.io/specification/2025-06-18/server/tools)

