# DECISIONS — dotfiles (chezmoi)

> Append-only log of decisions a future agent could otherwise undo.
> Newest entry at the top. Capture the *why*, not just the *what*.

---

## 2026-06-10 — effortLevel resolved to a single "high" on cross-machine merge

**Decision:** When merging the Ubuntu sync, `settings.json.tmpl` had two `effortLevel` values (this Mac
`xhigh`, Ubuntu `high`). Resolved to one shared `"high"`.

**Why:** `settings.json.tmpl` is shared across machines, so it needs one value; user chose `high`. A naive
auto-merge silently produced duplicate JSON keys (no conflict marker because the edits were in different hunks) —
caught and deduped before committing.

**Affects:** `home/private_dot_claude/settings.json.tmpl`. Rejected (deferred): per-hostname templating of
`effortLevel` to keep both values — kept the file simple; revisit if the difference becomes intentional.

---

## 2026-06-10 — /init-project-state carries its templates inline

**Decision:** The `/init-project-state` command embeds the full `STATE.md`/`DECISIONS.md` templates in its body
and skips files that already exist.

**Why:** Self-contained → portable to any machine without depending on the downloaded `claude-workflow-kit`
(which can be deleted). Embedded copies verified byte-identical to the kit. Skip-if-exists prevents clobbering a
project's accumulated state. Rejected: referencing on-disk template files (extra tracked files + path coupling).

**Affects:** `home/private_dot_claude/commands/init-project-state.md`.

---

## 2026-06-10 — Custom skills live in a private repo, not in chezmoi

**Decision:** Authored skills go in a separate **private** GitHub repo `tom1484/claude-skills`, listed in
`skills.txt` like any upstream repo. The installer gained a `gh repo clone` fallback for private repos.

**Why:** Splits by *authorship* while keeping one install mechanism: `~/.claude/skills/` stays untracked
(too large), and both upstream and personal skills are just manifest entries. Anonymous HTTPS can't clone a
private repo, so fall back to authenticated `gh` (HTTPS-first keeps public upstream repos auth-free on fresh
machines). Rejected: tracking skill folders directly in chezmoi (mixes large content into dotfiles); a public
repo (chose private for personal/work skills); switching all clones to SSH or making `gh` a hard dependency.

**Affects:** `home/dot_local/bin/executable_install-claude-skills`, `home/private_dot_claude/skills.txt`,
the external `tom1484/claude-skills` repo. Needs `gh auth login` / SSH on each machine.

---

## 2026-06-10 — Track CLAUDE.md, commands/, agents/; capture live-only settings keys

**Decision:** Added the global `CLAUDE.md` to the chezmoi source, pre-created `commands/` and `agents/` via
`empty_dot_gitkeep` placeholders, and captured `effortLevel` + the `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` env
var into `settings.json.tmpl`. Also added a repo-root `CLAUDE.md` as the agent guide.

**Why:** Those config surfaces were untracked and would be lost on a fresh machine; the two settings keys lived
only in the live file and would have been deleted by `chezmoi apply`. `commands/`/`agents/` need a placeholder
because chezmoi/git drop empty dirs, and the `empty_` attribute is required because chezmoi deletes empty files
otherwise.

**Affects:** `home/private_dot_claude/{CLAUDE.md, commands/, agents/, settings.json.tmpl}`, repo-root `CLAUDE.md`.

---
