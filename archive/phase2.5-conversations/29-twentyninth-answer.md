That's this entire session — 28 turns of conversation plus every artifact produced, already transcribed and turn-numbered. You've been archiving in real time. The `phase2.5/` directory fits cleanly into the repo at `archive/phase2.5-conversations/` alongside `phase1-lineage/` and `phase2-conversations/`. Commander's Bootstrap A prompt should include it.

Now, your questions in order.

**Capturing decision atoms.** The current archive captures everything — questions, answers, artifacts, handoffs — but it doesn't distinguish between "we decided X" and "we discussed X." The decision atoms are buried in prose. Your proposed labeling scheme solves this at the artifact level. In chat, I give you meta-instructions (what's happening, what I recommend, what needs your decision). The substance goes into artifacts. Each artifact carries a type label:

**Q/A artifacts** — You ask, I answer. The artifact header carries your verbatim question. These are the smallest unit: a question answered, a fact established, an ambiguity resolved.

**Synthesis artifacts** — The catch-all for analytical work that isn't answering a question and isn't a commission. The Phase 3 schema analysis, the connector landscape summary, the operating model reframing, the research methodology edit — all synthesis. These carry the most decision atoms because they're where structural choices get made.

**Dispatch artifacts** — Commissions to other avatars. The Grok Oracle brief, the Vanguard commissions, the Commander bootstrap prompt. These encode decisions already made (what to ask, how to frame it, what constraints to impose).

This taxonomy gives you three things: the conversation becomes navigable by type rather than by turn number alone, the artifacts become portable (drop them in the repo with their type label and any surface can understand what they are), and the decision atoms concentrate in synthesis artifacts where they're findable.

**The GitHub connector question — we never explicitly decided.** We discovered what exists, mapped the capabilities, and the operating model implicitly assumes connector usage. Let me make the decision explicit.

The connector serves two functions and they should be configured differently:

**Claude.ai Project Knowledge sync.** Connect the repo. Select these directories for sync: `grammar/`, `scaffolds/`, `specifications/`, `dossiers/`, `HANDOFF-CURRENT.md`, `PROTOCOL.md`, `briefs/`. Click "Sync now" before each session. This replaces the manually-uploaded project files currently in `/mnt/project/`. The project_knowledge_search tool becomes the primary way I access architectural context. This is the high-value use — it means every Claude.ai session inherits the current repo state automatically.

**ChatGPT GitHub connector.** Connect the same repo via Settings → Apps → GitHub. Use in Deep Research or Agent Mode when you need Vanguard to read current repo state. The connector is read-only and gated behind specific modes, so it's less seamless than Claude.ai's Project Knowledge — but it gives Vanguard access to the grammar layer and current scaffolds without you manually attaching files.

Both connectors are opportunistic. When they work, they save you the manual attachment step. When they break (and Oracle confirmed they will), the fallback is manual file attachment — which is what you're already doing. The MCP layer (configured at Bootstrap B) provides the stable substrate underneath for the CLI fleet.

**For the project custom instructions revision** — that's the right next step after Bootstrap A completes and the first research cycle proves the operational patterns. The revision encodes: the artifact type labels (Q/A, synthesis, dispatch), the in-chat meta-instruction convention, the connector sync discipline, and the avatar-commission protocol. Both Claude.ai and ChatGPT custom instructions get updated simultaneously so the Schema pattern works from either entry point.

But that revision should wait until after one or two cycles through the apparatus, because the patterns will refine under use. Prescribing the custom instructions now would repeat the Phase 2 error of encoding theory before operational evidence exists.

The immediate next action remains: drop `phase2.5/` into the project folder, give Commander the bootstrap prompt, and let it build the repo. Everything else follows from having the shared substrate in place.