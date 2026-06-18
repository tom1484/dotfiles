---
name: sync-skills
description: Manage the Claude Code skill set tracked by this repo — add/remove skills in skills.txt, install them onto the machine, and round-trip edits to custom skills. Use when changing which skills are installed or updating the private claude-skills repo.
---

# Sync skills

The skill *folders* under `~/.claude/skills/` (~130 MB) are intentionally **untracked**. The
reproducible record is `home/private_dot_claude/skills.txt` (a manifest of source GitHub repos,
with optional `: ` allowlists). The installer is `home/dot_local/bin/executable_install-claude-skills`
→ `~/.local/bin/install-claude-skills`; it clones into `~/.cache/claude-skills/` and copies skill
folders into `~/.claude/skills/`.

## Change which skills are installed
1. Edit the **source** manifest `home/private_dot_claude/skills.txt` — add a `owner/repo` line or
   extend a `: skill1 skill2 …` allowlist. Allowlisted names must match the upstream folder name
   exactly, or the installer prints a warning (renamed/removed upstream).
2. **Deploy the manifest first**: `chezmoi apply ~/.claude/skills.txt`. ⚠️ The installer reads the
   *deployed* `~/.claude/skills.txt`, NOT the source — skip this and it uses the old list.
3. Install: `install-claude-skills` (idempotent; copies from the clone cache). Add `--force` to
   refetch fresh clones and overwrite existing folders.
4. Verify: `ls ~/.claude/skills/<name>/SKILL.md` for each one you added.

## Custom (authored-by-me) skills
Live in the **private** repo `tom1484/claude-skills`, listed in `skills.txt` like any upstream
repo. The installer clones private repos via authenticated `gh` (needs `gh auth login` / SSH).
To change one: edit + push there, then `install-claude-skills --force`.

## Reverse sync — edited a DEPLOYED skill in place
Run `publish-claude-skills` **before** any `install-claude-skills --force` (force overwrites
in-place edits from upstream). It copies each edited `~/.claude/skills/<skill>/` into the cached
clone of a repo you *own* (owner == your `gh` login, so it can never push to upstream), commits,
and prints the `git push` — stopping before pushing so you review first.

## Commit
`skills.txt` is the tracked artifact — commit changes to it. The installed folders are not tracked.
