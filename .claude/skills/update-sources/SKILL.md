---
name: update-sources
description: Capture/re-import live changes from the home directory back into this chezmoi source tree. Use when a deployed file changed on the machine (or you changed a live file) and you want that reflected in the tracked source under `home/`.
---

# Update sources (re-import live → source)

chezmoi flows source → target. To pull a change that exists in `$HOME` back into the
tracked source, you re-import it. This is the reverse of `apply-to-machine`.

## Decide direction first
Run `chezmoi diff <target>` / `chezmoi status` and decide which side wins:
- **Source wins** → `chezmoi apply <target>` (don't re-import). See `apply-to-machine`.
- **Live wins** → re-import into source (below), then commit.

## Re-import
- New, untracked file: `chezmoi add <target>` (adds it to the source state, applying the
  filename attributes for its location).
- Already-managed file that changed live: `chezmoi re-add <target>` updates the source from
  the current target.
- After either, **verify the source actually changed**: `git status` / `git diff` under
  `home/`, then `chezmoi status` should be clean. Commit at the task boundary.

## Gotchas / do-NOT for this repo
- **Never `chezmoi add` / `re-add` a templated or `modify_` target.** It would replace the
  template/script with the concrete rendered file and you'd lose the logic:
  - `settings.json` → edit `home/private_dot_claude/modify_settings.json` (the jq overlay), not
    the live file. Re-adding it reintroduces the key-order churn this repo deliberately removed.
  - Any `.tmpl` → edit the `.tmpl` source and `chezmoi cat` to render-check.
- `known_marketplaces.json` is `.chezmoiignore`d — re-adding it won't track it (intentional).
- Don't import secrets (`~/.secrets/*`, `~/.claude/.credentials.json`).
- Empty dirs need a placeholder file; empty files need the `empty_` attribute — git and chezmoi
  both drop bare empties.
- `plugins/known_marketplaces.json` aside, if a file shows perpetual drift, suspect an app is
  rewriting it — prefer a `modify_` script or `.chezmoiignore` over fighting it by re-adding.
