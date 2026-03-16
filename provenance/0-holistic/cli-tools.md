# Definitive Taxonomy — Superlative macOS CLI Arsenal

**Legend:** S = shared, A = agent, H = human  
**SaaS clustering follows your CC90 exocortex contract: code/infra, model/intelligence, knowledge/work, automation/wiring, channel/incident, productivity, media/distribution, sandbox/file lanes; repo remains constitutional authority.** :contentReference[oaicite:0]{index=0}

---

## 1. Core shell / execution substrate

- `cmux` — native agent terminal harness; pane topology and orchestration. **A**
- `tmux` — remote-safe session persistence; universal fallback. **S**
- `fish` — primary interactive shell; fastest human ergonomics. **H**
- `zsh` — compatibility shell; ecosystem-safe fallback. **S**
- `starship` — fast cross-shell prompt; uniform context. **H**
- `mise` — runtime/version/task governor; kills manager sprawl. **S**
- `direnv` — per-project env activation; fewer context mistakes. **S**
- `nix` — declarative packages and environments; anti-drift. **S**
- `nix-darwin` — declarative macOS host state; reproducibility spine. **S**
- `home-manager` — declarative user config; machine convergence. **S**
- `brew` — broad package substrate; practical distribution. **S**
- `brew bundle` — export/import install state; portable baseline. **S**
- `topgrade` — upgrade orchestration across managers. **H**

## 2. Navigation / retrieval / command memory

- `fzf` — universal selector; fastest interactive narrowing. **S**
- `zoxide` — learned directory jumps; lower seek cost. **H**
- `fd` — sane file finder; better default than `find`. **S**
- `ripgrep` — recursive text search; primary corpus probe. **S**
- `mdfind` — Spotlight metadata retrieval; macOS-native search. **S**
- `yazi` — terminal file manager; spatial browsing without GUI. **H**
- `bat` — readable preview; faster file inspection. **H**
- `eza` — improved listings; better state legibility. **H**
- `atuin` — searchable shell memory; operator recall. **H**
- `tldr` / `tealdeer` — compressed docs; faster than manpages. **H**
- `navi` — executable cheat system; reusable command memory. **H**

## 3. Structured data / transformation / query

- `jq` — JSON calculus; essential for agent output shaping. **A**
- `yq` — YAML/TOML/XML shaping; config surgery. **A**
- `fx` — interactive JSON inspection; human audit speed. **H**
- `jc` — converts command output to JSON; agent normalization. **A**
- `sqlite3` — universal local relational query blade. **S**
- `duckdb` — ad hoc analytics on files/tables; local lakehouse tool. **S**
- `mlr` — tabular transformation; CSV/TSV surgery. **A**
- `qsv` — fast CSV operations; data wrangling at scale. **A**

## 4. Git / code / repo sovereignty

- `git` — constitutional source control. **S**
- `gh` — GitHub control plane; repos, PRs, actions, API. **S**
- `lazygit` — high-speed repo cockpit; human compression. **H**
- `git-delta` — readable diffs; review acceleration. **H**
- `jj` — next-gen VCS experimentation; future-facing lane. **A**
- `pre-commit` — local policy gates; catches garbage early. **S**
- `actionlint` — GitHub Actions linting; CI hygiene. **A**

## 5. macOS control plane

- `launchctl` / `launchd` — native daemons/session automation; persistent agents. **A**
- `osascript` — AppleScript/JXA bridge; app/system automation. **S**
- `shortcuts` — native workflow graph; OS-integrated automations. **H**
- `hammerspoon` — programmable desktop/event automation; serious control plane. **H**
- `bttcli` — BetterTouchTool automation bridge; input/window triggers. **H**
- `pbcopy` / `pbpaste` — clipboard primitives; glue layer. **S**
- `open` — app/file/URL launcher; handoff primitive. **S**
- `defaults` — preference mutation; OS tuning. **A**
- `plutil` — plist transformation; config surgery. **A**
- `networksetup` — network interface control; admin/ops. **A**
- `diskutil` — disk and volume control; storage ops. **A**
- `system_profiler` — hardware/software inventory; host introspection. **A**
- `log` — unified log access; debugging and forensics. **A**
- `scutil` — system/network identity control. **A**
- `mas` — Mac App Store CLI; app reproducibility. **H**

## 6. Observability / process / storage / benchmarking

- `btop` — best live resource dashboard; metabolic awareness. **H**
- `procs` — modern process search/tree; better than `ps` for humans. **H**
- `htop` — classic process monitor; universal familiarity. **H**
- `dust` — storage bloat locator; cleanup precision. **H**
- `duf` — disk overview; fast storage state. **H**
- `lsof` — open files/sockets; forensic debugging. **A**
- `hyperfine` — command benchmarking; evidence over vibes. **S**
- `watchman` — durable filesystem event service; agent triggers. **A**
- `watchexec` — execute-on-change loop; fast rebuild automation. **S**
- `fswatch` — macOS file watcher; event hooks. **A**

## 7. Networking / protocols / API combat

- `curl` — universal HTTP transport; hard fallback. **A**
- `httpie` — humane API client; faster human ops. **H**
- `xh` — fast modern HTTP CLI; cleaner everyday API work. **H**
- `grpcurl` — gRPC interrogation; backend necessity. **A**
- `websocat` — websocket testing; realtime protocol ops. **A**
- `dig` — DNS truth probe. **A**
- `mtr` — route/path diagnosis; network truth. **A**
- `nmap` — active discovery; topology and security. **A**
- `mitmproxy` — HTTP(S) interception/debugging; deep API forensics. **A**
- `cloudflared` — tunnels and edge control; ingress rail. **S**
- `tailscale` — secure overlay networking; fleet access. **S**

## 8. Security / secrets / supply chain

- `security` — native Keychain access; no-subscription local secret substrate. **A**
- `git credential-osxkeychain` — Git auth persistence via Keychain. **S**
- `ssh-add --apple-use-keychain` — SSH passphrase persistence in Keychain. **S**
- `sops` — encrypted secrets files; portable fleet bridge. **A**
- `age` — simple modern encryption backend; better than crypto folklore. **A**
- `gitleaks` — secret leak detection; commit hygiene. **A**
- `trivy` — vuln and misconfig scanner; broad security baseline. **A**
- `grype` — package vulnerability scanner; image/dependency audit. **A**
- `syft` — SBOM generation; artifact visibility. **A**
- `semgrep` — structural security/code scanning. **A**
- `cosign` — artifact signing/verification; supply-chain trust. **A**
- `oras` — OCI artifact push/pull; non-image artifact logistics. **A**
- `step` / `mkcert` — cert and local PKI workflows. **A**
- `oauth2l` — OAuth token tooling; Google/API auth flows. **A**

## 9. Containers / virtualization / backend substrate

- `docker` — standard container interface. **S**
- `docker compose` — multi-service local topology. **S**
- `colima` — lightweight macOS container backend; sane default. **S**
- `orbstack` — high-performance Docker/VM backend; premium ergonomics. **H**
- `lima` — explicit Linux VM substrate; lower-level control. **A**
- `podman` — daemonless containers; alternate trust model. **A**
- `devcontainer` — reproducible dev environments; agent portability. **S**

## 10. Databases / backend ops

- `psql` — PostgreSQL admin/query surface. **S**
- `pgcli` — ergonomic Postgres shell; human speed. **H**
- `redis-cli` — Redis inspection and ops. **A**
- `mongosh` — MongoDB shell. **A**
- `mycli` — ergonomic MySQL shell. **H**
- `usql` — polyglot DB shell; one interface across engines. **A**
- `prisma` — schema and migrations; app backend discipline. **S**
- `atlas` — database schema management; infra-grade migrations. **A**
- `litestream` — SQLite replication; lightweight resilience. **A**
- `pocketbase` — local backend/auth/realtime; rapid prototypes. **S**
- `supabase` — backend cloud control plane; DB/auth/storage/functions. **S**

## 11. Language / build / app dev

- `bun` — JS runtime/package/task runner; fast default. **S**
- `pnpm` — ecosystem-compatible JS package manager; monorepo strength. **S**
- `vite` — dev server/build pipeline; frontend speed. **S**
- `tailwindcss` — utility CSS engine; frontend throughput. **H**
- `uv` — Python package/runtime/tool manager; fastest sane default. **S**
- `ruff` — Python lint+format; single fast gate. **A**
- `biome` — JS/TS lint+format; low-friction standardization. **A**
- `shellcheck` — shell correctness; prevents dumb breakage. **A**
- `shfmt` — shell formatting; readable scripts. **H**
- `hadolint` — Dockerfile linting; container hygiene. **A**
- `yamllint` — YAML correctness; config sanity. **A**
- `markdownlint-cli` — doc hygiene; clean artifacts. **H**
- `just` — elegant task runner; human-friendly automation entrypoint. **H**
- `task` — structured task runner; portable workflows. **S**

## 12. Local models / agentic coding / model routing

- `codex` — repo-native coding agent; direct transformation lane. **A**
- `claude-code` — high-context coding/review agent. **A**
- `aider` — commit-aware coding loop; rapid edit/test cycle. **A**
- `ollama` — local model serving; privacy and zero-latency chains. **A**
- `llama.cpp` — lightweight local inference; maximal local control. **A**
- `openrouter` — multi-model broker; routing and fallback economics. **A**
- `llm` — general LLM CLI; scripting and provider abstraction. **A**
- `gemini` CLI — Google model surface; alternate reasoning lane. **A**
- `goose` / `opencode` / `cline` / `continue` — secondary agent surfaces; keep only if role-distinct. **A**

## 13. Knowledge / notes / exocortex

- `obsidian` CLI — vault automation, scripting, workflow integration; first-class knowledge ingress. **H** :contentReference[oaicite:1]{index=1}
- `zk` — plain-text note graph tooling; low-friction knowledge ops. **H**
- `nb` — CLI notes workflow; lightweight memory. **H**
- `glow` — terminal markdown renderer; artifact review. **H**

## 14. Human-in-the-loop surfaces

- `gum` — prompts, confirms, menus, spinners; clean approvals. **H**
- `fzf` — also the best interactive chooser. **H**
- `whiptail` / `dialog` — simple terminal forms; scriptable approvals. **H**

## 15. SaaS-facing CLI control plane — code + infra

- `gh` — GitHub repos/issues/PRs/actions/API; sovereignty rail. **S**
- `cloudflared` — Cloudflare edge/tunnels/DNS access; ingress rail. **S**
- `supabase` — backend substrate control; DB/auth/storage/functions. **S**
- `oci` — Oracle Cloud control plane; compute/network/storage ops. **A**

## 16. SaaS-facing CLI control plane — model + intelligence

- `openai` — OpenAI platform/API operations; model execution. **A**
- `anthropic` — Anthropic API and agent workflows. **A**
- `openrouter` — provider routing and failover. **A**
- `huggingface-cli` — model/dataset distribution and retrieval. **A**
- `pplx` / Perplexity wrappers — research and verification lane. **A**
- `grok` wrappers/API clients — alternate model surface. **A**
- `manus` wrappers/API clients — autonomous execution surface. **A**

## 17. SaaS-facing CLI control plane — knowledge + work scaffolds

- `gws` — unified Google Workspace CLI for Drive/Gmail/Calendar/Sheets/Docs/Chat/Admin; major exocortex ingress rail. **S** :contentReference[oaicite:2]{index=2}
- `notion` CLI/wrapper — pages/db mutation; structured workspace ops. **S**
- `coda` CLI/wrapper — docs/tables/automation interactions. **S**
- `confluence` / Atlassian CLI — documentation and workspace mutation. **S**
- `linear` CLI/API wrapper — issue and project execution. **S**
- `jira` / Atlassian CLI — enterprise execution plane. **S**
- `clickup` wrapper — task/project mutation. **H**
- `trello` wrapper — lightweight board ops. **H**
- `basecamp` wrapper — comms/project lane. **H**

## 18. SaaS-facing CLI control plane — automation + wiring

- `make` — cross-surface automation graph ops. **A**
- `zapier` wrappers/webhook tooling — app-to-app automation control. **A**
- `airtable` CLI/API wrapper — programmable tables as ops substrate. **S**
- `curl` + `jq` + `httpie` — generic fallback for SaaS without serious CLI. **A**

## 19. SaaS-facing CLI control plane — channel + incident bus

- `slack` CLI/wrapper — channel messaging, workflow, retrieval. **S**
- `discord` wrappers — bot/channel automation and signal sensing. **A**
- `incident.io` / incident wrappers — incident command and response ops. **A**
- `gws chat` — Google Chat actions via Workspace CLI. **S** :contentReference[oaicite:3]{index=3}

## 20. SaaS-facing CLI control plane — productivity rails

- `todoist` CLI/API wrapper — task execution loops. **H**
- `ticktick` wrappers — GTD and procedural control. **H**

## 21. SaaS-facing CLI control plane — media / distribution / design

- `yt-dlp` — YouTube ingestion and media retrieval; intelligence and distribution ops. **A**
- `youtube` API wrappers — channel/upload/reporting ops. **A**
- `x` / Twitter API wrappers — distribution and signal sensing. **A**
- `tiktok` wrappers — distribution automation and monitoring. **A**
- `twitch` CLI/API wrappers — streaming operations. **A**
- `canva` wrappers — design asset generation/export. **H**
- `miro` CLI/API wrappers — board/data ops. **H**
- `reddit` API wrappers — signal sensing and publishing. **A**
- `figma` CLI/API wrappers — design-system asset/code extraction. **S**

## 22. SaaS-facing CLI control plane — sandbox / file lanes

- `replit` CLI/API wrapper — remote experiments and app runs. **A**
- `dropbox` CLI/API wrapper — file exchange and sync ops. **S**
- `loveable` wrappers — app prototyping surface. **H**

## 23. Mandatory generic bridges

- `curl` — universal API fallback. **A**
- `httpie` — human API fallback. **H**
- `jq` — response shaping. **A**
- `yq` — config/request shaping. **A**
- `oauth2l` — token minting for Google-style OAuth flows. **A**
- `gh api` — GitHub REST/GraphQL fallback. **A**
- `openapi-generator` — generate clients from API specs. **A**
- `mcp` clients/servers — standard tool bridge for agent access. **A**

---

## Cull rules

- One primary per role.
- Human-pretty replacers stay only if they improve legibility without wrecking semantics.
- Agent tools must prefer stable output, JSON, low latency, and scriptability.
- SaaS without strong native CLI gets wrapped through API-first bridges, not ignored.
- Repo stays sovereign; SaaS CLIs execute and relay. :contentReference[oaicite:4]{index=4}