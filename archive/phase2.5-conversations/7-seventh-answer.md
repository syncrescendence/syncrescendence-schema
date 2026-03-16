Now I have definitive ground truth on every question. Let me give you the honest picture before drafting.

**The hard constraints on subscription-only CLI access:**

The xAI API is a separate developer service from consumer offerings. The SuperGrok subscription enhances consumer access to Grok features but does not include API access or free API tokens/credits. Worse: Grok 4.20 Beta is currently only available to SuperGrok and X Premium+ users on grok.com. For developers, the API isn't open yet. There is no path from SuperGrok to Grok 4.20 via CLI right now. The community grok-cli uses the xAI API at separate per-token rates, and even that only accesses Grok 4 and 4.1, not 4.20 Beta.

For Perplexity: Buying a Perplexity Pro subscription does not grant unlimited or even substantial API access. Pro subscribers receive a recurring monthly credit of only $5 for API calls. Heavy testing can burn through $5 in hours. API access is available to all users as a separate service — the Pro subscription is essentially irrelevant to CLI usage beyond that $5 credit. However, the student angle helps: Students and educators can get Education Pro free with a valid .edu email, and Perplexity for Startups offers 6 months of Enterprise Pro plus $5K in API credits.

So the honest subscription-metered picture is: Claude Code and Codex are fully subscription-metered via OAuth. Grok 4.20 and Perplexity deep research are not accessible from CLI via subscription alone. This shapes the proposal fundamentally — Grok and Perplexity remain chat-app surfaces for now, while Claude Code and Codex are the CLI workhorses.

Now drafting the proposal.Given the scope and the need for iterative refinement, I'll produce this as a markdown artifact directly.The proposal is drafted. Here's what it does and what the honest constraints forced.

The hardest finding is on Grok and Perplexity. SuperGrok's $30/month gives you Grok 4.20 on grok.com and nowhere else — the API is a separate billing system and 4.20 isn't even available through it yet. Perplexity Pro's unlimited searches are web-app-only; the CLI gets $5/month in API credits, which burns through in hours under heavy use. This means the CLI pivot's workhorse pair is Claude Code + Codex (both fully subscription-metered), while Grok and Perplexity remain chat-app surfaces where the operator runs sessions manually and saves results as files for the CLI agents to consume. The relay model doesn't fully die — it shrinks to the research-intake boundary.

The proposal covers the full configuration hierarchy for both agents (precise precedence chains, where User Preferences go, what's shared vs separate), the operational model (who does what based on cognitive signature), the directory restructuring (from your current ad-hoc tree.txt to a governed layout), the bootstrap sequence (starting from Cowork as the bridge to build the configs), governance encoded as hooks rather than advisory instructions, production methods encoded as skills, and the nine open questions that need your determination before execution.

The section on what the grammar absorbs without amendment should give you confidence that the constitutional frame holds across everything you mentioned — hardware, macOS, iOS, IoT, XR, robotics, the full student subscription universe, public APIs, the skills/MCP ecosystem. The grammar was built to absorb dimensions. It needs activation of declared slots, not structural revision.

Tear it apart. Tell me what's missing, what's wrong, what needs sharpening.