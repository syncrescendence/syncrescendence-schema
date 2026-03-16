This changes everything about the Grok budget calculation. The xAI release notes confirm: "You can now use Grok 4.20 Beta in the xAI Enterprise API. Grok 4.20 Multi-agent Beta can be accessed through the xAI Enterprise API." And Grok 4.20 Beta 0309 (Reasoning) is available through xAI at $2.00 per million input tokens and $6.00 per million output tokens.

So Grok 4.20 *is* available via API — it's just more expensive than the older models. Let me calculate what $19.83 actually buys across the model range:

**Grok 4.1 Fast** ($0.20/M input, $0.50/M output): At a typical 3:1 input:output ratio, blended cost is ~$0.35/M tokens. $19.83 buys approximately **56 million tokens**. This is functionally unlimited for research — hundreds of comprehensive research sessions.

**Grok 4.20 Beta Reasoning** ($2.00/M input, $6.00/M output): Blended ~$3.00/M tokens. $19.83 buys approximately **6.6 million tokens**. Still substantial — roughly 15-20 detailed research sessions with heavy context injection.

**Grok 4 (full)** ($3.00/M input, $15.00/M output): Blended ~$6.00/M tokens. $19.83 buys ~3.3M tokens. Less justified now that 4.20 is available at lower per-token rates.

And critically: xAI offers an additional $150 per month in API credits through their data sharing program. To enable it, go to Settings > Data Sharing in the xAI console and enable "Share API Inputs for Model Training." If you're comfortable with xAI using your API interactions for model improvement (for non-sensitive research queries, this is a reasonable tradeoff), that $150/month makes the budget effectively unlimited.

The strategic tokenomics play: use **Grok 4.1 Fast as the bulk research workhorse** — at $0.20/M input tokens with a 2M context window, you can inject the entire grammar layer, the full axis decomposition, and the research brief into a single prompt and still have budget for hundreds of sessions. Reserve **Grok 4.20 Beta for the high-stakes council-architecture reasoning** where the four-agent internal debate matters — triangulated intelligence, adversarial synthesis, ground-truth verification. The 4.1 Fast model handles 95% of the research; 4.20 Beta handles the 5% where the council's adversarial quality matters.

Now let me update the proposal with the expanded Section 3 and the corrected Grok picture.Now expanding Section 3 with per-surface configuration specifics.Now updating Section 6 to reflect the corrected Grok status.Now updating Section 4's division of labor to reflect Grok as CLI participant.The big correction in this revision: **Grok 4.20 Beta is available via API.** The xAI release notes confirm it. The earlier finding that "Grok 4.20 is not available via API" was wrong — it was based on a source from before the March 2026 API release. The Artificial Analysis benchmark data confirms it's live at $2.00/M input, $6.00/M output.

This fundamentally changes the architecture. Grok is no longer a chat-only surface requiring manual relay. It's a full CLI participant. Here's the tokenomics that matters for your $19.83:

With **Grok 4.1 Fast** at $0.20/M input tokens, your $19.83 buys roughly 56 million tokens of input — enough for hundreds of comprehensive grammar-aligned research sessions, each injecting the full grammar layer (all nine documents fit comfortably in the 2M context window) plus axis decomposition targets plus the specific research question. At these rates, the budget constraint is effectively gone for bulk research.

With **Grok 4.20 Beta** at $2.00/M input, your $19.83 buys roughly 6.6 million tokens — enough for 15-20 high-stakes adversarial synthesis sessions. This is where you'd use the council architecture's quality for triangulation and cross-surface comparison.

And if you enable the **data-sharing program** ($150/month free credits for allowing xAI to train on your API interactions), the budget becomes functionally unlimited for both models. The tradeoff is that your grammar-aligned research prompts would be shared with xAI — which for structural research queries about tool ecosystems and surface decomposition (not proprietary institutional strategy) seems acceptable.

Section 3 is now fully expanded with specific configuration recommendations for every surface: what files to create, what to put in them, example JSON for settings and hooks, which skills to build, which subagents to define, how to configure MCP servers, and the strategic model allocation for the Grok budget. Each subsection answers "how exactly do we configure this" rather than just "what's the hierarchy."

The open questions in Section 9 are updated to reflect the new Grok reality — the question is no longer "can we access Grok from CLI" but "should we enable data sharing" and "how do we allocate between 4.1 Fast and 4.20 Beta."