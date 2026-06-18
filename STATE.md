# STATE — dotfiles (chezmoi)

> Living snapshot for the next agent — what's true *now*, in the fewest words that let you act.
> Overwrite it; don't append. git is the changelog. If a line is stale, fix or delete it.
>
> Last updated: 2026-06-18

## Current state
chezmoi source tree (`.chezmoiroot=home`) that renders `home/` into `$HOME`. Fully in sync and
pushed: `chezmoi status` is empty and `main` == `origin/main`. The most-active surface is Claude
Code config (`home/private_dot_claude/` → `~/.claude/`, 0700): global `CLAUDE.md`, `keybindings.json`,
`statusline-command.sh`, `commands/`, `agents/`, `plugins/config.json`, the `skills.txt` manifest, and
`modify_settings.json`. `settings.json` is a `modify_` script (jq deep-merge of managed keys onto the
live file; `effortLevel` pinned `high`); `known_marketplaces.json` is `.chezmoiignore`d — so the two
app-rewritten files no longer churn in `chezmoi status`. Skills are manifest-driven (not committed);
custom skills come from the private `tom1484/claude-skills` repo. This repo's own chezmoi workflows are
project-local skills in the repo-root `.claude/skills/` (`apply-to-machine`, `update-sources`,
`sync-skills`).

## In progress
- **LSP-plugins gap** (not blocking): `settings.json`'s `enabledPlugins` enables
  `lua-lsp`/`pyright-lsp`/`clangd-lsp`, but this Mac's `home/private_dot_claude/plugins/config.json` is
  still `{"repositories": {}}` — so they're *enabled* but not *installed* here. Stalled awaiting a decision
  (install vs drop). Nothing else is mid-flight.

## Next
1. Resolve the LSP-plugins gap: either install the three via `/plugin` (which populates
   `plugins/config.json` — then re-import with `chezmoi add ~/.claude/plugins/config.json`), or drop
   `enabledPlugins` from the `modify_settings.json` overlay if unwanted.

## Known traps
- **Edit the source under `home/`, never the live file** — `chezmoi apply` overwrites live. The
  repo-root project skills (`apply-to-machine`, `update-sources`, `sync-skills`) encode the safe flows.
- **`settings.json` is a `modify_` script** (`home/private_dot_claude/modify_settings.json`), NOT a static
  file. Change a managed key by editing the jq overlay there — do NOT `chezmoi add` the live file (that
  reintroduces a static file + key-order churn). `permissions.allow` is wholesale-replaced (source-
  authoritative → runtime "always allow" approvals don't survive `apply`). Needs `jq` (fails loud if absent).
- **Skills install order**: the installer reads the *deployed* `~/.claude/skills.txt`, so always
  `chezmoi apply ~/.claude/skills.txt` BEFORE `install-claude-skills`. The installer only *adds* folders —
  to uninstall, delete `~/.claude/skills/<name>/` by hand. Custom-skill round-trip: `publish-claude-skills`
  before any `install-claude-skills --force`. Private repo clone needs `gh auth login`.
- **App-rewritten configs don't fit chezmoi's one-way model** — reach for a `modify_` script or
  `.chezmoiignore`, never a static `.tmpl` (the lesson behind the `settings.json` / `known_marketplaces.json`
  handling). `known_marketplaces.json` is intentionally ignored.
- **`commands/`**: every `*.md` there becomes a global slash command (`README.md` → `/README`). Keep
  non-command markdown out.
- **Repo-root `.claude/` is project config, never deployed** (it's outside `.chezmoiroot=home`) — git-tracked
  but invisible to chezmoi. Don't confuse it with the deployed `home/private_dot_claude/` (→ `~/.claude/`).
- Secrets are never in the source tree (`~/.secrets/*`, `.credentials.json` live only in `$HOME`). Empty
  dirs need a placeholder file; empty files need the `empty_` attribute.
