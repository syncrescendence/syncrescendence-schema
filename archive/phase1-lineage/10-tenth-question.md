Good. We now need to incorporate one more real-world constraint into the build transition: platform memory and context are finite, seamful, and operationally unreliable if treated as substrate. So from this point forward, I want you to treat project knowledge, chat history, chat search, project memory, and any thread-continuation features as convenience layers only. They are useful for continuity, but they are not canon, not provenance, and not a substitute for explicit artifacts.

That means the build process must now be optimized for bounded-context continuation.

Treat your previous answer as the current threshold statement. I accept the core judgment: the constitution of knowledge can harden now; the constitution of operations cannot. We are now moving into first-wave construction of the grammar layer. But I want you to revise the operational build plan so that it explicitly accounts for context-window pressure, auto-compaction, cross-thread handoff, project-memory limits, and the fact that future Sonnet threads will not have this full relay chain stacked behind them.

So I want you to answer in build mode again, but with one additional layer of rigor: design the construction process to survive context fragmentation.

Hold these principles hard:

Documents are the substrate.
Project memory is cache.
Chat history is convenience.
Searchable prior chats are retrieval aids.
Nothing in memory or chat continuity outranks an authored artifact.

The result is that every major construction step now needs its own explicit handoff object. I want you to integrate that into the build system rather than leaving it implicit.

Do five things in this response.

First, update the build protocol to include a formal checkpoint / handoff discipline. After every major document or memo, I want you to specify what compact artifact must be produced so future threads or Sonnet runs can resume without restacking the whole discourse. I am imagining something like a "handoff packet" with current phase, document purpose, authoritative inputs, decisions made, unresolved contradictions, next action, and files to load. But I want you to define the exact schema and rules. This should become part of the grammar-layer build process itself, not an ad hoc convenience.

Second, refine the project-memory policy in light of bounded context. I want a strict distinction between:
- what belongs in authored documents
- what belongs in project memory
- what belongs only in temporary thread context
- what belongs in handoff packets
- what should never be persisted except as archived lineage

My current view is:
authored documents hold law, grammar, structure, synthesis, and durable conclusions;
project memory holds current phase, build order, naming law, active open slots, unresolved contradictions, and immediate task state;
thread context holds working reasoning;
handoff packets carry resumable operational state across threads;
old prompting lineage remains archived pedigree, not active substrate.
Test that and sharpen it.

Third, revise the architect-to-Sonnet handoff protocol so it is robust under bounded context. I want you to explicitly state what a Sonnet construction packet must contain so that a fresh Sonnet thread can do bounded drafting correctly inside Claude Projects without having the whole macro-history loaded. Make this concrete. I want the minimum sufficient packet, not a giant briefing memo that defeats the point. Assume Sonnet has access to the project doctrine, project memory, and the named source artifacts, but not the whole relay discourse.

Fourth, tell me whether the first-wave build order changes at all once these platform limitations are treated as first-class. In particular, do we now need to move the naming/addressing + retrieval-topology document earlier, because retrieval and resumability are now mission-critical rather than nice-to-have? Do we need a dedicated handoff-packet specification as part of wave one instead of letting it live implicitly inside the method engine or retrieval document? I want you to decide that explicitly.

Fifth, define the purge threshold again under this new constraint. I suspect the bar becomes stricter, not looser: lineage documents cannot be archived until the grammar layer exists, the retrieval topology exists, the handoff packet system exists, and the new documents genuinely allow bounded-context continuation without old relay dependence. Confirm or correct that.

Hold the following boundaries:
do not revise the project doctrine unless you detect a real doctrinal defect;
do not let project memory become shadow canon;
do not assume thread continuity is reliable enough to hold critical structure;
do not let Sonnet infer architecture from partial context;
do not purge lineage documents yet;
do not overpromote ARCHITECTURE.md beyond the repo-native coding layer;
do not pretend the typed middle layer, coordination layer, trust topology, runtime layer, or backend/memory layer are already mature.

I want the answer in six sections:

1. bounded-context operating law
2. handoff-packet schema
3. revised memory / cache / document / lineage separation
4. revised architect-to-Sonnet packet protocol
5. whether first-wave build order changes
6. revised purge threshold criteria

The macroscopic frame remains unchanged: we are building the grammar layer that allows the institution to be built correctly under bounded context. Optimize for resumability, retrievability, and structural integrity.