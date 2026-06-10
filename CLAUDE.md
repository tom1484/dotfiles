# Agent guide — dotfiles (chezmoi)

This repo is a **[chezmoi](https://chezmoi.io) source tree**, not a pile of live dotfiles.
Files here are *source state*; `chezmoi apply` renders them into the home directory.
Read `README.md` for the full human-facing tables — this file is the agent fast-path
and the gotchas that bite if you treat it like a normal repo.

## The one rule that matters
**Edit the source under `home/`, never the live file.** Changing `~/.claude/settings.json`
or `~/.config/nvim/init.lua` directly is wrong — it's untracked and the next `chezmoi apply`
can clobber it. To change a deployed file, edit its source counterpart, then `chezmoi apply`.
(`chezmoi edit <target>` opens the source for you.)

## Layout & where things live
- `.chezmoiroot` = `home` → **the source state is `home/`**, not the repo root.
  Root-level files (`README.md`, this `CLAUDE.md`, `.scripts/`) are *not* applied anywhere.
- Target mapping is encoded in **filenames**, not a config. These prefixes are semantic —
  renaming a file silently changes how it deploys:
  - `dot_` → leading `.`  (`dot_config` → `.config`)
  - `private_` → `0700`/`0600`
  - `executable_` → `+x`
  - `empty_` → keep a zero-byte file (chezmoi deletes empty files otherwise)
  - `.tmpl` → rendered through Go templates before writing
  - `literal_` → escape a name that contains a real prefix word
- `home/.chezmoiignore` is itself a template; it drops machine-generated / OS-specific paths.

## Templating
`.tmpl` files use Go templates with chezmoi vars: `.chezmoi.os`, `.chezmoi.arch`,
`.chezmoi.hostname`, `.chezmoi.homeDir`. After editing a `.tmpl`, **render-check** with
`chezmoi cat <target>` before applying — a template error is invisible until apply.

## Claude Code config (the most-touched area) — `home/private_dot_claude/` → `~/.claude/` (0700)
- `settings.json.tmpl` — statusline path (`{{ .chezmoi.homeDir }}`) + a large **read-only**
  `permissions.allow` allowlist. Adding a permission here is the right place to do it.
- `CLAUDE.md` — global working principles, deploys to `~/.claude/CLAUDE.md` (applies to ALL
  projects). **Do not confuse it with this repo-root `CLAUDE.md`** (project memory, never deployed).
- `keybindings.json`, `executable_statusline-command.sh`
- `commands/` and `agents/` — slash commands and subagents, one `*.md` each
  (`commands/init-project-state.md` → `/init-project-state`; `agents/repo-explorer.md`).
  The `empty_dot_gitkeep` in each keeps the dir tracked even if emptied. **Never** put a
  non-command `.md` in `commands/` — every `*.md` there becomes a slash command
  (e.g. `README.md` → `/README`).
- `plugins/{config.json, known_marketplaces.json.tmpl}` — marketplace/plugin manifests.

### Skills are listed, not committed
`~/.claude/skills/` (~130 MB) is intentionally **untracked**. The reproducible record is
`home/private_dot_claude/skills.txt` (a manifest of source GitHub repos, with `:` allowlists),
installed by `home/dot_local/bin/executable_install-claude-skills` → `~/.local/bin/install-claude-skills`.
To change the skill set, edit `skills.txt` then re-run `install-claude-skills` (idempotent; `--force` refetches).
Don't try to `chezmoi add` skill folders.

**Custom (authored-by-me) skills** don't live here either — they're in a separate **private** repo,
`tom1484/claude-skills`, listed in `skills.txt` like any upstream repo (split by *authorship*:
upstream repos and my own repo are both just manifest entries). The installer clones private repos
via authenticated `gh repo clone`, falling back from anonymous HTTPS — so a machine needs `gh auth login`
(or an SSH key) before those pull. Edit a custom skill in that repo, push, then `install-claude-skills --force`
(or delete its folder and re-run) to refresh the deployed copy.

The reverse direction (edit the **deployed** copy in place, then sync it back) is what
`executable_publish-claude-skills` → `~/.local/bin/publish-claude-skills` is for: it copies each edited
`~/.claude/skills/<skill>/` into the cached clone of a repo you *own* (owner == your `gh` login, so it can
never push to upstream), commits, and prints the `git push` (it stops before pushing). Run it **before** any
`install-claude-skills --force`, which overwrites in-place edits from upstream.

## Verify, don't assume (matches the global working principles)
- `chezmoi diff [target...]` — preview pending changes
- `chezmoi status` — empty output = source and home are in sync
- `chezmoi cat <target>` — render a `.tmpl` to check the result
- `chezmoi managed | grep <x>` — confirm a path is actually tracked
- Prefer **scoped** applies (`chezmoi apply ~/.claude/CLAUDE.md`) over a bare `chezmoi apply`
  when other paths show expected drift you don't want to touch.

## Known traps
- **`plugins/known_marketplaces.json` drifts forever** — Claude rewrites its `lastUpdated`
  timestamp itself, so `chezmoi diff` always shows it. Re-`chezmoi add` only when you actually care.
- **Secrets are never committed.** Fish loads them from `~/.secrets/*` at runtime; `~/.claude/.credentials.json`
  lives only in the live dir. Don't add secret files to the source tree.
- Empty directories need a placeholder file; empty files need the `empty_` attribute — git and
  chezmoi both drop bare empties.

## Commit etiquette
Commit at task boundaries with a clear message; only push when asked. The source of truth is
this repo (`chezmoi cd` jumps here from anywhere).
