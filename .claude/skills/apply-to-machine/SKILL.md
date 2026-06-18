---
name: apply-to-machine
description: Deploy pending chezmoi source changes from this repo to the live home directory. Use when you've edited files under `home/` and need to render-check templates / modify_ scripts and apply them safely (scoped, verified) to the machine.
---

# Apply to machine

Push source changes from this repo into `$HOME`. chezmoi is one-directional:
`chezmoi apply` renders `home/` → live files and **overwrites** whatever is there.

## The one rule
Edit the source under `home/`, never the live file. A live edit is untracked and the
next apply clobbers it. (`chezmoi edit <target>` opens the source for you.)

## Steps
1. **Preview**: `chezmoi diff [target...]` — see exactly what would change.
2. **Render-check before applying** (a template / `modify_` error is invisible until apply):
   - `chezmoi cat <target>` renders the final content.
   - For JSON, also validate: `chezmoi cat <target> | jq -e . >/dev/null && echo OK`.
3. **Apply scoped, not bare**: `chezmoi apply ~/.claude/settings.json`. Prefer a scoped
   target over a bare `chezmoi apply` whenever other paths show expected drift you don't
   want to touch.
4. **Verify**: `chezmoi status` (empty output = source and home in sync).

## Gotchas specific to this repo
- `~/.claude/settings.json` is a **`modify_` script** (`home/private_dot_claude/modify_settings.json`),
  not a static file — it deep-merges managed keys onto the live file and needs `jq`. `chezmoi cat`
  runs the script; if `jq` is missing it fails loud (by design).
- `~/.claude/skills.txt` only lists skills — applying it does **not** install them. See the
  `sync-skills` skill for the install step.
- `~/.claude/plugins/known_marketplaces.json` is `.chezmoiignore`d; apply won't touch it.
- Secrets are never in the source tree — apply never manages `~/.claude/.credentials.json`,
  `~/.secrets/*`, etc.
