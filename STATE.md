# STATE — dotfiles (chezmoi)

> Living handoff for the next agent. Keep it short and current.
> If a line is stale, fix it or delete it — stale state is worse than none.
>
> Last updated: 2026-06-18 · by Claude Code session (settings.json → modify_ script)

## Done & verified
<!-- Only things confirmed by chezmoi status / git / live file checks. -->
- Claude Code config fully tracked under `home/private_dot_claude/` → `~/.claude/`: `settings.json.tmpl`,
  global `CLAUDE.md`, `keybindings.json`, `statusline-command.sh`, `commands/`, `agents/`, `plugins/`, `skills.txt`.
- Custom skills co-managed via a **private** repo `tom1484/claude-skills` (listed in `skills.txt`, same
  mechanism as open-source repos). Installer falls back to `gh repo clone` for private repos — verified the
  private clone works while anonymous HTTPS fails.
- Installed `orient` + `handoff` skills and `repo-explorer` agent (live-checked). Added `/init-project-state`
  command (templates embedded inline, verified byte-identical to the source kit).
- Cross-machine merge from `tomchen-ubuntu-expertbook` integrated (`1272ab9`); `settings.json.tmpl` reconciled
  by union (my `env` + their `enabledPlugins`), `effortLevel` deduped to a single `"high"`. Valid JSON confirmed.
- Everything pushed; `main` == `origin/main`. Live synced (`settings.json` effortLevel=high + env + 3 LSP plugins;
  nvim `lazy-lock.json` at 48 plugins).
- `settings.json` converted from static `.tmpl` to **`modify_settings.json`** (jq deep-merge of managed keys
  onto the live file). `effortLevel` pinned to `"high"` (applied to this Mac). `known_marketplaces.json` moved to
  `.chezmoiignore`. Verified: `chezmoi status` is now **empty** (both files' cosmetic churn eliminated), and the
  `publish-claude-skills` flow (commits `f5d4692`/`b1ca1b8`) is in place. See DECISIONS 2026-06-18.

## In progress
<!-- What is half-built, and the exact point it stalled. -->
- LSP plugins gap (not blocking): `settings.json` `enabledPlugins` enables `lua-lsp`/`pyright-lsp`/`clangd-lsp`
  (from the Ubuntu merge), but this Mac's `home/private_dot_claude/plugins/config.json` is still `{"repositories": {}}`
  — so they're *enabled* but likely not *installed* here. User opened `/plugin` to look at this; outcome not yet captured.

## Next
<!-- Immediate next actions, most important first. -->
1. Decide on the LSP plugins on this Mac: either install them (via `/plugin` / marketplace, which will populate
   `plugins/config.json`) or drop `enabledPlugins` if unwanted. Whatever changes `plugins/config.json` live,
   re-import with `chezmoi add ~/.claude/plugins/config.json`.
2. (Resolved 2026-06-18) `effortLevel` is pinned to `"high"` in `modify_settings.json`. If it should ever differ
   per machine, branch on `$CHEZMOI_OS`/`$CHEZMOI_HOSTNAME` inside the script (those env vars are available there).
3. Local commits are ahead of `origin/main` until pushed (modify_ conversion + this handoff). Push when ready.

## Known traps
<!-- Gotchas, intentional weirdness, things NOT to touch. -->
- **Edit the source under `home/`, never live files** — `chezmoi apply` overwrites live.
- `settings.json` is a **`modify_` script** (`home/private_dot_claude/modify_settings.json`), NOT a plain file.
  To change a managed key, edit the jq overlay in that script — don't `chezmoi add` the live file (that would
  re-introduce a static file and the key-order churn). `permissions.allow` is wholesale-replaced from the script,
  so runtime "always allow" approvals don't survive `apply`. Needs `jq` installed (script fails loud otherwise).
- `~/.claude/plugins/known_marketplaces.json` is now in `.chezmoiignore` (Claude churns its `lastUpdated`); it no
  longer shows in `chezmoi status` and is unmanaged — fine to leave it to Claude.
- `commands/`: every `*.md` becomes a slash command (`README.md` → `/README`). Keep non-command markdown out.
- Custom skills live in the **private** `tom1484/claude-skills` repo, NOT in chezmoi. Private clone needs
  `gh auth login` / SSH. To change: edit+push there, then `install-claude-skills --force` (or delete the folder + re-run).
- Empty dirs need a placeholder; empty files need the chezmoi `empty_` attribute (e.g. `empty_dot_gitkeep`).

## Map
<!-- Where the relevant code/config lives. -->
- `home/private_dot_claude/` → `~/.claude/` — all Claude Code config (0700).
- `home/dot_local/bin/executable_install-claude-skills` — skills installer (manifest-driven; gh fallback for private).
- `home/private_dot_claude/skills.txt` — skill source-repo manifest (upstream + `tom1484/claude-skills`).
- `home/private_dot_claude/commands/init-project-state.md` — the `/init-project-state` command.
- `CLAUDE.md` (repo root) — agent guide for this repo (not deployed). `README.md` — human docs.
- `tom1484/claude-skills` (separate private GitHub repo) — custom skills source.
- `.chezmoiroot` = `home` → chezmoi source state is `home/`; root files (README, CLAUDE.md, STATE/DECISIONS) are not applied.
