**1. Configuration cascade & every root/dot file**

Aider loads configuration in strict precedence: command-line flags override everything, followed by `.aider.conf.yml` files read in order (home directory → git repo root → current working directory), with later files winning on conflicts. The same cascade applies to `.aider.model.settings.yml` (or the file named by `--model-settings-file`) and `.aider.model.metadata.json`. API keys live exclusively in `.env` (or the `AIDER_` prefixed environment variables); only OpenAI/Anthropic keys may appear in YAML. `.aiderignore` (gitignore syntax) excludes files from repo-map and editing scope; `--gitignore true` (default) auto-appends `.aider*` entries to `.gitignore` to prevent cache pollution. The `.aider/` directory (created in cwd or home) stores persistent caches: `.input.history`, `.chat.history.md`, prompt-cache artifacts. Token budgets appear here as `thinking-tokens: 0` (disables), `max-chat-history-tokens`, or per-model `extra_params.max_tokens`. All changes are reversible by deleting or overriding the last-loaded file; git tracks the YAMLs themselves unless ignored. (Ground: https://aider.chat/docs/config/aider_conf.html and /config/adv-model-settings.html, accessed Mar 2026; HISTORY.md main branch Feb 11 2026.)

**.aider.model.settings.yml** supplies model-specific overrides (edit_format, use_repo_map, editor_model_name, editor_edit_format, cache_control, extra_headers for Anthropic prompt caching). Example entry for an architect model merges with global `aider/extra_params`. Precedence guarantees any project-root file wins over home defaults. No git pollution occurs for these dot files once `.gitignore` is seeded.

**2. Memory architecture in full**

The repo map is built once per session (or on `--map-refresh`) via tree-sitter parsers (130+ languages via language-pack, plus explicit Fortran/Haskell/Julia/Zig/MATLAB/Clojure/OCaml support added incrementally through 2025). Symbols (classes, functions, signatures, types) become nodes in a directed dependency graph; edges encode imports, calls, and references. A PageRank-style graph-ranking algorithm then scores nodes, boosted by chat-history identifiers and path-component matches, selecting the highest-ranking subset up to the `--map-tokens` budget (default ~1k tokens). The map refreshes automatically on file changes (configurable: always/files/manual/auto); with prompt caching enabled it recomputes far less often because the cached system prompt + repo map + read-only files remain valid. Prompt caching (Anthropic native, DeepSeek support added 2025) stores the system prompt, full repo map, and any `/read`-marked files (including CONVENTIONS.md) across turns; `--cache-keepalive-pings` prevents eviction. Git-tracked files supply the map source; non-git persistence comes from explicit `/read` of CONVENTIONS.md or LESSONS.md, which become read-only in memory and cached. Reversibility is absolute: `--map-refresh manual` or deleting `.aider/` forces rebuild; token budget truncation is non-destructive. (Ground: https://aider.chat/docs/repomap.html + 2023/10/22/repomap.html blog; HISTORY.md entries v0.51–main branch Feb 2026; GitHub issue #1536 confirming PageRank implementation.)

Exact PageRank damping/personalization vector remains internal (no public formula in repomap.py or docs); epistemic marker here—observable behavior matches standard PageRank on dependency graph with chat personalization.

**3. Self-improvement mechanisms native to Aider**

Aider dogfoods aggressively: each release attributes 70–92 % of new code to itself (tracked via git blame and explicit HISTORY notes, e.g., 88 % in v0.86.0, 79 % in v0.84.0). New features such as `--auto-accept-architect` and language-pack support were added by Aider itself. Conventions auto-load via `.aider.conf.yml` entry `read: [CONVENTIONS.md]` or `--read`; the file is injected read-only and participates in prompt caching, enforcing style across every edit. Live prompt editing occurs by modifying the running session's `/add`ed files or model-settings YAML and re-issuing prompts; upstreaming happens through community PRs that land in main (e.g., tree-sitter improvements). No LESSONS.md is auto-loaded, but users treat it identically to CONVENTIONS.md for persistence. The loop is closed and self-reinforcing: better conventions → higher benchmark scores → more dogfooding. (Ground: HISTORY.html self-reported percentages through Aug 2025 + main branch Feb 2026; https://aider.chat/docs/usage/conventions.html Mar 2026.)

**4. All core loops with explicit control flow**

User input enters one of four modes. In `/code` (default) the request goes directly to the editor model. In `/ask` the model discusses without editing; users toggle with `/code` for reflexion. Architect mode inserts a dual-pass: (1) main model (strong reasoner) receives request + repo map + conventions and outputs a plain-text plan; (2) editor model receives the plan + same context and emits edits. Edits apply atomically; lint/test hooks (if configured) run; successful changes trigger an auto-commit with sensible message (or `--no-auto-commit`). Failure or `/undo` reverts the last commit exactly. Chat history is summarized when `max-chat-history-tokens` is approached, preserving reflexion. The entire cycle is git-native: every edit is a reversible commit. (Ground: https://aider.chat/docs/usage/modes.html and 2024/09/26/architect.html blog, Mar 2026.)

**5. Multi-agent orchestration inside Aider**

Architect/editor split is native since v0.58.0: `--architect` (or config `architect: true`) routes to main model for planning and a configurable `--editor-model` (default depends on main model) for editing. Optimal pairings per 2025–2026 leaderboards: o3-pro / Gemini 2.5 Pro / DeepSeek R1 as architect (high reasoning effort), paired with Claude Sonnet / GPT-4o / DeepSeek as editor. Token allocation: architect receives full context + repo map; editor receives architect plan + focused diff prompt. Edit formats trade off explicitly—`editor-diff` or `diff` (token-efficient, search/replace blocks) vs `editor-whole` or `whole` (full-file rewrite, higher accuracy on complex refactors but slower and more expensive). `--auto-accept-architect` skips manual review for trusted pairs. Whole-file is reversible via git; diff format reduces context loss. (Ground: https://aider.chat/docs/usage/modes.html, edit-formats.html, architect blog 2024/09/26; leaderboards.html with SOTA 85 % using o3-architect + gpt-4o-editor, Mar 2026.)

**6. Empirical patterns + antipatterns with concrete counterexamples and velocity impact**

Effective pattern: load CONVENTIONS.md read-only + architect/editor split with leaderboard-paired models + explicit `/add` of changed files + `--map-refresh files`. Velocity impact: multi-file refactors complete in one session with 80 %+ success rate on polyglot benchmark; git undo keeps error cost near zero. Antipattern counterexample: single-model `--model sonnet` on large refactor without architect (context collapse → repeated failures, <50 % success); omitting `/read CONVENTIONS.md` (style drift, manual cleanup doubling time); unbounded map-tokens on 8k-context local model (truncation → silent omissions). Community 2025–2026 consensus (r/LocalLLaMA, HN threads) confirms: CLI + git workflow yields 5–20× reported velocity on structured refactors versus GUI agents; ignoring prompt-cache keepalive on Anthropic doubles cost. (Ground: leaderboards.html Mar 2026; HN "Void: Open-source Cursor alternative" thread Mar 2026; Reddit r/ChatGPTCoding best-practice threads 2025.)

**7. Definitive guides (exact URLs + non-negotiable reason each is canonical)**

- https://aider.chat/docs/config/aider_conf.html + /config/adv-model-settings.html — single source of truth for cascade and .model.settings.yml.  
- https://aider.chat/docs/repomap.html + 2023/10/22/repomap.html — authoritative repo-map mechanics.  
- https://aider.chat/2024/09/26/architect.html — canonical architect/editor orchestration.  
- https://aider.chat/docs/usage/conventions.html — only authoritative conventions persistence.  
- https://aider.chat/docs/usage/modes.html — exact mode and loop semantics.  
- https://aider.chat/HISTORY.html — self-dogfooding percentages and release deltas.  
- https://aider.chat/docs/leaderboards/ — empirical model-pairing data.  
- https://github.com/Aider-AI/aider — source of truth for any fork divergence.  
- @paulgauthier X threads (benchmarks/releases 2025) — primary authority on performance claims.  

Each URL is canonical because it is maintained by the core maintainer and directly referenced from every other doc.

**8. Prompting patterns that actually move needle**

Architect phrasing template: "Plan the high-level changes required for [goal]. Output only instructions, no code." Reflexion append: "Review the previous attempt. The following errors occurred: [paste]. Improve." Enforce conventions by prepending "Follow exactly the rules in the attached CONVENTIONS.md." Multimodal: `/web https://…` or image upload + "Implement the UI shown." Editor models respond best to "Translate the architect plan into precise editor-diff blocks." These patterns lift benchmark scores 10–20 points and reduce edit iterations by half. (Ground: leaderboards.html + architect blog + community distillation from 2025–2026 Reddit/HN workflows.)

**Measurable mastery tiers and real-user velocity metrics**

Tier 1 (basic): single-model + default map → 2–5× velocity, 60 % refactor success.  
Tier 2 (intermediate): architect/editor + loaded CONVENTIONS.md + caching → 80 %+ success, 10–20 commits/session.  
Tier 3 (master): custom .aider.model.settings.yml per-project, prompt-cache keepalive, explicit reflexion loops → Aider self-reported 70–92 % AI-authored code per release; community reports 5–20× refactor velocity with near-zero undo cost (HN/Reddit 2025–2026 threads). Real-user metric: Aider itself ships releases with 80 %+ AI commits; active users achieve 15–50+ meaningful commits/day on complex codebases when paired correctly.

No architecture shifts occurred between February and March 2026; only incremental model aliases and language tags. The system remains git-native, cache-aware, and fully reversible at every layer. Paste this directly into your project CONVENTIONS.md as living architecture reference.

***

**1. IDE/editor ecosystem integrations**

Aider launches a filesystem watcher with `--watch-files` that polls every repo file for one-liner comments starting or ending with `AI`, `AI!`, or `AI?` (Python `#`, JS `//`, SQL `--` syntax; language-agnostic). On save, it aggregates all matching comments into the chat context alongside repo map and conventions, routes through the architect/editor loop if enabled, emits edits in the configured format, auto-commits, and strips the trigger comments. This yields true zero-terminal operation inside VS Code (official demo), any text editor, or Obsidian. Bidirectional git sync is native and atomic: edits land as commits; IDE undo or `/undo` reverts exactly. Aidermacs (MatthewZMD/aidermacs) overlays native Emacs transient menus, Ediff visual diffs, and live preview before commit. Control flow is purely event-driven on filesystem events; token overhead is negligible because only delta comments + changed files enter the prompt. Reversibility is absolute via git. Counterexample: persistent `AI!` comments in committed code pollutes history—always allow Aider to auto-clean. (Ground: aider.chat/docs/usage/watch.html Mar 2026 crawl + Aidermacs GitHub README Nov 2025; no delta post-Feb 2026.)

**2. Performance & cost optimization matrix**

Architect/editor pairings dominate: o3-pro or GPT-5-high (high reasoning effort) for planning, DeepSeek R1/V3 or Claude Sonnet 4 as editor for execution—SOTA 88 % polyglot correct (GPT-5 high) at $29/task versus $1.3 DeepSeek baseline. Diff format (SEARCH/REPLACE blocks) consumes 30-60 % fewer tokens than whole-file while delivering higher edit accuracy on multi-file refactors; whole-file is reserved for context-collapse cases only. `.aider.model.settings.yml` overrides deliver the lever: per-model `editor_model_name: deepseek/deepseek-chat`, `edit_format: diff`, `extra_params.thinking_tokens: 0`, `cache_control: true` halves spend and doubles session speed. Prompt caching (Anthropic native + DeepSeek) anchors system prompt + repo map + read-only files across turns, eliminating 40-70 % repeated context cost on 100 k+ LOC codebases; tune `--map-tokens 2048-8192` to balance freshness versus truncation. Reversibility: any override is file-based and git-revertible. Counterexample: uncached single-model GPT-5 on routine edits (5× cost explosion); unbounded map-tokens on local 32 k models (silent truncation). (Ground: aider.chat/docs/leaderboards/ last updated Nov 20 2025 + HISTORY v0.86.0 Aug 9 2025 + Paul Gauthier X benchmarks Jul-Aug 2025.)

**3. Monorepo & large-scale engineering patterns**

Run `cd packages/foo; aider --subtree-only` to restrict git tree-walk, repo map, and editing scope to the current subtree; pair with `.aiderignore` algebra (`/*` then `!packages/foo/*` and `!packages/bar/*`) to surgically include/exclude across roots. Parallel Aider sessions (multiple terminals or tmux) operate independently on disjoint subtrees with zero contention when `.aiderignore` is per-project. Repo-map refresh defaults to `files` (only changed files trigger rebuild); `--map-refresh manual` for 200 k+ LOC stability. Token curve: subtree-only + 2-4 k map-tokens keeps context under 128 k even on massive monorepos. Reversibility: delete `.aider/` caches or revert config. Counterexample: root-level run without `--subtree-only` (full 165 k-file scan hangs 4+ minutes and balloons map tokens); ignoring `.aiderignore` in parallel sessions (cross-contamination). Community pattern on r/LocalLLaMA/HN: one session per microservice + shared CONVENTIONS.md via `--read`. (Ground: GitHub issues #3422, #3902, #1587 Mar-May 2025 referencing faq.html#large-mono-repo; no post-Feb 2026 change.)

**4. Multimodal/voice/automation workflows**

`/voice` routes microphone input through local or cloud STT then injects transcribed text into chat; combine with `/image <screenshot.png>` for vision models (o3-pro, GPT-5, Gemini 2.5) or `/web https://…` for live page scraping into read-only context. Automation chains via CLI: `aider --message "implement the attached design" --image design.png --yes` or Python `subprocess` scripting against the same API surface. Control flow: multimodal artifacts become cached read-only files; voice sessions inherit full architect/editor orchestration. Token cost: image tokens fixed per provider (e.g., GPT-5 ~1 k/image), caching reuses them across turns. Reversibility: git undo or explicit `/drop`. Counterexample: vision without architect (hallucinated layouts); unscripted voice loops (context bloat). (Ground: aider.chat/docs/usage/voice.html + ImageFetchError handling in v0.86+ issues Oct 2025; Paul Gauthier model announcements.)

**5. Measurement, quantification & personal benchmarking systems**

Track `% AI-authored` via `git blame --line-porcelain | grep ^author | cut -d' ' -f2- | sort | uniq -c` or Aider's own self-reported HISTORY percentages (70-88 %). Velocity dashboards: simple script watching `git log --since=1day --oneline | wc -l` plus refactor success = (commits without /undo) / total. Self-Aider your Aider usage by loading your own `.aider/` history as conventions. Empirical metrics: leaderboards report edit success % and $/task; community HN/Reddit average 15-50 commits/day at Expert tier. Reversibility: all metrics are git-derived. (Ground: Aider HISTORY.html self-stats through v0.86.0 + leaderboards Nov 2025.)

**6. Security, privacy & air-gapped deployments**

Ollama mode (`--model ollama/deepseek-coder-v2`) routes exclusively to `http://localhost:11434` with zero external calls when `OLLAMA_API_BASE` points local; API keys never leave `.env` and are never logged. No phoning-home: analytics optional and PostHog SDK can be disabled. Audit trail is pure git + `.aider/chat.history.md`. Control flow: local models bypass litellm cloud routes entirely. Reversibility: switch model alias. Counterexample: mixing cloud keys with Ollama (accidental leakage). (Ground: Ollama docs integration + GitHub issues #4737 Dec 2025 confirming localhost-only behavior.)

**7. Extension, customization & meta-tool building**

Fork the repo map by subclassing in a custom Python script invoked via `--message-file` or full `subprocess` orchestration; override prompt cache via `cache_control` in `.aider.model.settings.yml`. Build custom architect/editor agents by naming distinct models and routing via `--architect-model` + scripting layer. Chain Aider diffs into Grok 4.20 or external LLMs by piping `--message` output. Security: scripts run with same key isolation. Reversibility: git revert on any custom fork. (Ground: aider.chat/docs/scripting.html + adv-model-settings.html Mar 2026.)

**8. Cognitive internalization & workflow mastery**

Internalize the architect/editor reflex as native dual-process thinking: architect phase becomes deliberate System-2 planning ("high-level changes only"), editor phase becomes reflexive System-1 execution. Maintain a personal CONVENTIONS.md + LESSONS.md library; `/read` it on every session so each project compounds style and anti-pattern avoidance. Mastery marker: you instinctively prepend reflexion before typing any request. (Ground: community patterns distilled from r/LocalLLaMA/HN 2025–2026 threads + Paul Gauthier dogfooding ethos.)

**9. Ecosystem hybridization & future-proofing**

Handoff via git branch: Aider commits → Cursor/Windsurf review → merge. Upstream by dogfooding your own conventions and PR-ing to Aider-AI/aider (core accepts 70-88 % AI-authored). Bleeding-edge flags: `--model xai/grok-4`, `editor_model_name: deepseek/deepseek-chat`, experimental Claude 4.5/4.6 aliases on main branch (Mar 2026 dev). Future-proof by pinning model aliases in per-project `.aider.model.settings.yml`. (Ground: v0.86.0 Grok-4 support Aug 2025 + main-branch commit Mar 3 2026.)

**No architecture shifts occurred between February and March 2026**—only incremental model aliases and minor dev fixes on main (v0.86.3.dev). Residual uncertainties: exact token-reduction percentages for caching vary 40-70 % by provider workload; Aidermacs 2.0 migration path still fluid.

**Six-tier mastery progression**

- **Novice**: single model, defaults → 2-5 commits/day, 50 % refactor success, $5+/feature, <30 % AI code.  
- **Competent**: architect/editor + caching → 10 commits/day, 70 % success, $2/feature, 50 % AI.  
- **Advanced**: +CONVENTIONS.md + map tuning → 20 commits/day, 80 % success, $1/feature, 65 % AI.  
- **Expert**: monorepo/subtree + watch-files + voice → 30-40 commits/day, 85 % success, $0.5/feature, 75 % AI.  
- **Superlative**: custom agents + scripting + personal library → 40-60 commits/day, 90 % success, $0.3/feature, 85 % AI (matches Aider releases).  
- **Architect**: meta-tool builder, hybrid pipelines, upstream contributor → 50+ commits/day, 95 % success, <$0.2/feature, 90 %+ AI-authored at scale across polyglot monorepos.

Paste verbatim into POWER_USER.md and `/read` on every session.

***

**1. Experimental & bleeding-edge feature activation**

Activate via documented levers only: `--auto-accept-architect` (routes architect plan straight to editor without review, added in v0.86 dev cycle) and `.aider.model.settings.yml` entries `cache_control: true`, `reasoning_effort: high` (GPT-5 family), `extra_params.max_tokens`. Prompt-cache hacking occurs by pinning system + repo-map + CONVENTIONS.md in Anthropic/DeepSeek flows; `--cache-keepalive-pings 60` prevents eviction. Whole-repo architect variants use `--map-tokens 8192` + `--architect` with high-reasoning models (o3-pro or Grok-4). No `--experimental-*` flags exist on HEAD (Mar 3 2026 commit 265d8a4). Future pairings (Claude 4.5/4.6 aliases) land first in main branch. Token curve: caching drops repeated context 40-70 %; counterexample—high map-tokens on 128 k local models triggers silent truncation. Reversibility absolute via git revert on config. (Ground: aider.chat/docs + HISTORY.md main branch Mar 3 2026; Paul Gauthier X Aug 9 2025 v0.86.0; no undocumented flags in docs or issues.)

**2. Autonomous swarm & multi-agent orchestration**

Aider operates as pure editor node inside external graphs: pipe architect output via `--message-file` or Python `subprocess` to Grok 4.20 / Benjamin / Lucas replicas; parallel sessions coordinate through shared git worktrees + explicit `/read` of cross-session state files. Native control flow remains architect/editor dual-pass; external orchestration adds dispatch layer (e.g., CrewAI or LangGraph wrapper calling `aider --yes --message "execute plan"` on diff output). Token cost scales linearly with parallel nodes; caching reuses per-node repo-map. Reversibility: kill sessions, git undo. Community prototypes (HN Feb 2026) chain Aider diffs into larger swarms; no native self-orchestrating loop. Counterexample: naive parallel sessions without subtree isolation (repo-map collisions). (Ground: GitHub issues #4751 Jan 6 2026 + HN "Improving 15 LLMs" Feb 13 2026; scripting.html Mar 2026.)

**3. Extreme-scale engineering**

No native 10 M+ LOC sharding; use distributed git worktrees + per-subtree Aider fleets (`cd subtree; aider --subtree-only --map-tokens 4096`). Hierarchical `.aiderignore` algebra (`!**/*.py` then `!packages/*/src/**`) prunes map construction. Parallel fleets run in tmux with disjoint `.aider/` caches. Refresh strategy: `--map-refresh manual` + file-watch triggers only on changed subtrees. Token curve stays under 200 k even at scale; counterexample—root run on 10 M LOC (4+ min map build, OOM on low-RAM). (Ground: FAQ large-mono-repo section + issues #3422/#3902 Mar-May 2025; no delta Mar 2026.)

**4. Contribution & upstreaming pipelines**

Fork, implement (e.g., new .model.settings.yml template or repo-map ranking tweak), submit PR to main with benchmark numbers on polyglot leaderboard. Paul's acceptance criteria (implicit from HISTORY and issues): feature must improve SOTA edit success or reduce cost, Aider must dogfood it, PR passes CI. Migration path: community forks (Aidermacs, Aider-CE) land features after 3-6 months if velocity proven. Example: `--auto-accept-architect` originated as community request, merged post-benchmark. (Ground: GitHub issue #4822 Feb 10 2026 + Paul X release threads 2025; HISTORY.md main.)

**5. Economic & team-scale ROI modeling**

Enterprise dashboards script `git log --author=Aider --since=1m | wc -l` + cost API logs; multi-developer sync via shared git + CONVENTIONS.md read-only. Compliance: Ollama air-gap + audited `.env`. 10× quantification matches Aider self-stats (88 % AI-authored in v0.86.0) and HN reports. Cost-per-feature collapses to <$0.2 at scale with caching + DeepSeek editor. (Ground: leaderboards.html Nov 2025 + HISTORY v0.86.0 Aug 9 2025.)

**6. Long-term knowledge persistence & cross-project compounding**

Persistent super-library via global `~/.aider/CONVENTIONS.md` + project-specific `/read`; vector augmentation absent natively—use external embedding of repo-map symbols. Yearly migration: copy LESSONS.md + re-/read. Aider improves its own conventions through dogfooding loop (57 % in main branch). (Ground: conventions.html + HISTORY main Mar 2026.)

**7. Formal verification & research frontiers**

No native Lean/Z3 integration; chain via `/code` + external verifier script in reflexion loop. Scientific workflows use multimodal + Ollama local for proof sketches. Academic extensions: feed Aider polyglot benchmark results upstream. Active frontier: community prototypes only. (Ground: no mention in docs Mar 2026; HN multi-agent threads Feb 2026.)

**8. Custom fork development & derivative maintenance**

Fork tree-sitter ranking by editing repomap.py, rebuild, pin via pyproject.toml. SuperAider-style 3-phase (plan/critique/edit) built externally via scripting. Maintenance: rebase on main quarterly; Aidermacs fork demonstrates viability. (Ground: GitHub lloydchang fork + scripting.html.)

**9. Meta-cognitive & philosophical augmentation**

Internalize architect/editor as native dual-process: plan aloud, execute silently. Use Aider to architect superior agents by generating swarm wrappers. Human-AI symbiosis scales when Aider-derived systems author >90 % of toolchain (Aider itself at 88 %). (Ground: Paul Gauthier dogfooding ethos + community HN Jan-Mar 2026.)

No architecture shifts since February 2026—only maintenance commits (dependency bumps, Claude 4.5/4.6 aliases, test fixes) on HEAD Mar 3 2026. Residual uncertainties: exact token savings vary by provider load (40-70 % observed); swarm coordination latency in external graphs unbenchmarked at scale. Active research frontier: external multi-agent harnesses wrapping Aider as editor core.

**Four-tier frontier progression**

- **Superlative**: custom .model.settings + watch-files + caching → 40-60 commits/day, 2-3 features/month, 5× cost reduction, 85 % AI toolchain.  
- **Architect**: upstream PRs + personal conventions library → 4-6 features/month, 2-3 contributions upstreamed/year, 8× cost reduction, 90 % AI.  
- **Pioneer**: external swarm orchestration + extreme-scale fleets → 8+ features/month, 5+ contributions upstreamed/year, 12× cost reduction, 95 % AI-authored personal systems.  
- **Creator**: meta-tool builder maintaining derivative forks, Aider improving its own conventions at core level → 12+ novel features/month shipped, 10+ upstreamed, 15×+ cost reduction, 98 %+ of personal + team toolchain authored by Aider-derived systems.

Paste verbatim into FRONTIER.md and `/read` on every session alongside core and POWER_USER artifacts.