# DISPATCH: File Artifact Templates and Remediate ChatGPT GitHub Indexing

**Type:** Dispatch  
**Turn:** 32  
**Salon:** vizier-sovereign / schema-3  
**Sovereign verbatim:** "produce the other two bespoke versions, as well as a dispatch to commander to file all four documents. Commission Commander to also remediate the Github indexing."

**To:** Commander (Claude Code / Opus 4.6)  
**From:** Vizier (Claude.ai / Opus 4.6)  
**Via:** Sovereign  

---

## Context

The Sovereign has dropped two artifact template files into the repo already (the Vizier-Sovereign templates). Two additional bespoke variants have been produced for the Vanguard (ChatGPT) and Oracle (Grok) surfaces. All four documents need to be filed in the repo.

Additionally, the ChatGPT GitHub connector is connected but the `syncrescendence-schema` repo under the `syncrescendence` user is not indexed by GitHub's search infrastructure, which means ChatGPT's connector cannot find or access the repo. This requires a remediation step.

## Commission

### Task 1: File artifact templates

File the following four documents into the repo at `methods/artifact-templates/`:

1. `ARTIFACT-TEMPLATES-VIZIER.md` — The Vizier-Sovereign artifact template (the master version that the Sovereign already dropped into the repo; find it in the recent additions — it is the `turn-31-SPEC-artifact-templates.md` content).
2. `ARTIFACT-TEMPLATES-VANGUARD.md` — Bespoke for ChatGPT/Vanguard. The Sovereign will provide this file or it exists in a recent handoff artifact.
3. `ARTIFACT-TEMPLATES-ORACLE.md` — Bespoke for Grok/Oracle. Same delivery path.
4. `ARTIFACT-TEMPLATES-VIZIER.md` should be the canonical reference. Vanguard and Oracle variants are platform-specific adaptations.

Create the `methods/artifact-templates/` directory if it does not exist. Add a brief `README.md` in that directory explaining that these templates govern artifact format across all salons, and that the Vizier template is canonical while Vanguard and Oracle variants are platform-adapted.

### Task 2: Create interaction directory structure

Create the salon and atrium directories as specified in the calibration cycle architecture synthesis:

```
interactions/
├── vizier-sovereign/
├── commander/
├── adjudicator/
├── cartographer/
├── oracle-grok-com/
├── oracle-api/
├── vanguard/
└── ajna/

atrium/
```

Each directory should contain a `.gitkeep` file. The `atrium/` directory should contain a `README.md` explaining that it holds symlinks to institutionally significant artifacts from salons, and that nothing is authored here.

### Task 3: Remediate ChatGPT GitHub indexing

The ChatGPT GitHub connector uses GitHub's code search index to discover repositories. Repos under the `syncrescendence` user have not been indexed yet. The remediation procedure per OpenAI's documentation:

**Step 1:** Go to GitHub.com and run this exact search query in the GitHub search bar:

```
repo:syncrescendence/syncrescendence-schema import
```

This triggers GitHub's search indexing for the repository. The keyword `import` is arbitrary — it just needs to be a search query against the repo to trigger the indexer.

**Step 2:** Wait 5-10 minutes for the index to build.

**Step 3:** Verify by running the search again. If results appear (even zero code results is fine — the absence of the "not indexed yet" error is the success condition), the repo is indexed.

**If Commander cannot perform this step** (because it requires a browser-based GitHub search, not an API call), produce a sub-dispatch for Ajna (OpenClaw) or Cowork to execute it. Ajna has Vivaldi CDP browser access and can navigate to `github.com/search?q=repo%3Asyncrescendence%2Fsyncrescendence-schema+import&type=code` directly. The sub-dispatch should be:

```markdown
# SUB-DISPATCH: Trigger GitHub Search Indexing for syncrescendence-schema

**To:** Ajna (OpenClaw / Sonnet 4.6) or Cowork  
**From:** Commander (Claude Code / Opus 4.6)

Navigate to GitHub and execute this search:
  URL: https://github.com/search?q=repo%3Asyncrescendence%2Fsyncrescendence-schema+import&type=code

This triggers GitHub's search indexer for the repository, which is required for the ChatGPT GitHub connector to find it. Wait for the search results page to load fully. Screenshot the result for confirmation. Report success or failure.
```

Alternatively, Commander can attempt the indexing trigger via the GitHub API's code search endpoint: `gh api search/code -q 'q=repo:syncrescendence/syncrescendence-schema+import'`. If this returns results (even empty results), the indexer has been triggered. Try this first before dispatching to Ajna.

### Task 4: Commit and report

Commit all new files with message: `feat: add artifact templates and interaction directories`

Report:
- Files created and their paths
- Whether the `methods/artifact-templates/` directory was created
- Whether the `interactions/` and `atrium/` directory structures were created  
- Whether the GitHub indexing remediation succeeded (and which method was used)
- If remediation was delegated to Ajna/Cowork, include the sub-dispatch that was produced

## Scope boundary

- Do not modify any existing files. This is additive only.
- Do not modify the grammar layer. It is read-only.
- Do not create custom instructions for any surface. That work is deferred until orchestrational logic is fully ironed out.
- Do not create the SKILL.md or research prompt variants. That is a separate commission.

## Expected outputs

| Output | Location |
|---|---|
| `ARTIFACT-TEMPLATES-VIZIER.md` | `methods/artifact-templates/` |
| `ARTIFACT-TEMPLATES-VANGUARD.md` | `methods/artifact-templates/` |
| `ARTIFACT-TEMPLATES-ORACLE.md` | `methods/artifact-templates/` |
| `README.md` | `methods/artifact-templates/` |
| `interactions/` directory tree | repo root |
| `atrium/README.md` | `atrium/` |
| Commander report | stdout / salon artifact |

---

*This dispatch files the interactional infrastructure and unblocks the ChatGPT connector — two prerequisites for the calibration cycle.*
