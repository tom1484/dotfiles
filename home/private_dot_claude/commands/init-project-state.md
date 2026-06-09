---
description: Scaffold STATE.md and DECISIONS.md (the per-project handoff docs /orient reads and /handoff updates) into the current repo root
argument-hint: "[project name]"
---

Scaffold the two per-project handoff documents that `/orient` reads and `/handoff`
updates, into the **root of the current repository**.

## Steps

1. Find the repo root: `git rev-parse --show-toplevel`. If this isn't a git repo,
   use the current working directory and say so.
2. Decide the project name: if `$ARGUMENTS` is non-empty, use it verbatim;
   otherwise infer it from the git remote name, falling back to the repo-root
   directory name.
3. For **each** of `STATE.md` and `DECISIONS.md` at the repo root:
   - If the file **already exists, do NOT overwrite it.** Leave it untouched and
     note that it was kept. (These files accumulate real state — clobbering one
     loses work.)
   - If it's missing, create it with **exactly** the content in the matching
     block below — do not reword, summarize, reorder, or drop sections. Only
     substitute the placeholders: `<project name>` → the project name (every
     occurrence), and in STATE.md `<date>` → today's date. Leave all other
     placeholder text (`<session / agent>`, the `YYYY-MM-DD` sample entry, the
     `<!-- ... -->` hints) intact for later use.
4. Report which files were created and which were kept as-is, then remind in one
   line that `/orient` reads these at session start and `/handoff` updates them.

## `STATE.md` (verbatim, minus the noted substitutions)

```markdown
# STATE — <project name>

> Living handoff for the next agent. Keep it short and current.
> If a line is stale, fix it or delete it — stale state is worse than none.
>
> Last updated: <date> · by <session / agent>

## Done & verified
<!-- Only things confirmed by tests or a manual check. -->
-

## In progress
<!-- What is half-built, and the exact point it stalled: file / function / failing test / error. -->
-

## Next
<!-- The immediate next actions, most important first. -->
1.
2.
3.

## Known traps
<!-- Gotchas, intentional weirdness, workarounds in place, things NOT to touch. -->
-

## Map
<!-- Where the code/config for the current work lives. Paths with a one-line note each. -->
-
```

## `DECISIONS.md` (verbatim, minus the noted substitutions)

```markdown
# DECISIONS — <project name>

> Append-only log of decisions a future agent could otherwise undo.
> Newest entry at the top. Capture the *why*, not just the *what*.

---

## YYYY-MM-DD — <short decision title>

**Decision:** what we chose.

**Why:** the reasoning and constraints behind it, and what we considered and rejected.

**Affects:** the files or areas this touches.

---

<!--
Copy the block above for each new entry. Keep entries terse but include the
rationale and the rejected alternatives — that is the part that stops the next
agent from re-litigating or reversing the choice.
-->
```
