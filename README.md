# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io). One repo provisions a
machine (macOS or Ubuntu) with a single `chezmoi apply`, templating per-machine differences.

## What's managed

| Tool | Target | Source |
|------|--------|--------|
| Neovim | `~/.config/nvim` | `home/dot_config/nvim/` |
| Fish | `~/.config/fish` | `home/dot_config/private_fish/` |
| Kitty | `~/.config/kitty` | `home/dot_config/kitty/` |
| Alacritty | `~/.config/alacritty` | `home/dot_config/alacritty/` |
| Starship | `~/.config/starship.toml` | `home/dot_config/starship.toml` |
| tmux | `~/.tmux.conf` | `home/dot_tmux.conf` |
| Claude Code | `~/.claude` | `home/private_dot_claude/` |
| Claude Code skill **list** | `~/.claude/skills.txt` | `home/private_dot_claude/skills.txt` |
| Claude Code skill installer | `~/.local/bin/install-claude-skills` | `home/dot_local/bin/` |
| Alacritty dropdown launcher | `~/.local/bin/alacritty-dropdown` | `home/dot_local/bin/` |

### Intentionally **not** managed
- **Claude Code skill folders** (`~/.claude/skills/`) — the skill contents (~130 MB, fetched from
  upstream GitHub repos) are not committed. Instead, `~/.claude/skills.txt` tracks the **list of
  source repos** every skill came from, and `install-claude-skills` clones them into
  `~/.claude/skills/` on a new machine. Add/remove a repo in `skills.txt`, then re-run the installer.
  The plugin **manifests** (`plugins/config.json`, `plugins/known_marketplaces.json`) are tracked
  separately for the marketplace plugin set.
- **Secrets** — never committed. Fish loads them from `~/.secrets/*` at runtime via the `load_env`
  helper (e.g. `home/dot_config/private_fish/config/envs/llm.fish` → `~/.secrets/llm`). Create those
  files by hand on each machine.
- **Fish plugin-generated state** — `completions/`, `conf.d/`, `functions/`, `fish_plugins`,
  `fish_variables` are excluded via `home/.chezmoiignore` (regenerated locally by the plugin manager).
- **`.scripts/`** at the repo root — a loose helper script, not part of the chezmoi tree.

## Layout

```
.chezmoiroot                 → "home"   (tells chezmoi the source state lives in home/)
home/                        ← chezmoi source state
├── .chezmoiignore           machine-generated / runtime paths to skip
├── dot_config/              → ~/.config/
│   ├── nvim/  private_fish/  kitty/  alacritty/  starship.toml
├── dot_local/bin/           → ~/.local/bin/   (incl. install-claude-skills)
├── dot_tmux.conf            → ~/.tmux.conf
└── private_dot_claude/      → ~/.claude/   (0700)
    ├── settings.json.tmpl            statusline path templated; full permission allowlist
    ├── keybindings.json
    ├── skills.txt                    source-repo list for ~/.claude/skills/ (see installer)
    ├── executable_statusline-command.sh
    └── plugins/{config.json, known_marketplaces.json.tmpl}
README.md                    (this file — repo root, not applied)
```

**Naming conventions** (chezmoi source attributes): `dot_` → leading `.` · `private_` → `0700`/`0600`
· `executable_` → `+x` · `.tmpl` → rendered through the template engine.

## Setup on a new machine

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply tom1484/dotfiles
```

This installs chezmoi, clones this repo to `~/.local/share/chezmoi`, and applies everything.
Afterwards:

1. **Secrets** — create the files referenced by `load_env` (e.g. `~/.secrets/llm`).
2. **Neovim** — launch `nvim`; lazy.nvim self-bootstraps and installs plugins from `lazy-lock.json`.
3. **Fish plugins** — the configs for `fifc`, `fzf`, `sponge` load automatically; install the plugin
   binaries with your plugin manager if missing.
4. **tmux** — install `tpm` (`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`),
   then `prefix + I` inside tmux to fetch plugins.
5. **Alacritty themes** (optional) — `git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes`.
6. **Claude Code skills** — run `install-claude-skills` to clone the repos listed in
   `~/.claude/skills.txt` into `~/.claude/skills/` (~130 MB; needs `git`). Idempotent — existing skill
   folders are skipped; pass `--force` to refresh them all from fresh clones.

## Daily usage & maintenance

The source of truth is `~/.local/share/chezmoi` (run `chezmoi cd` to jump there).

| Task | Command |
|------|---------|
| Edit a managed file | `chezmoi edit ~/.config/nvim/init.lua` (edits the source, not the live file) |
| Preview pending changes | `chezmoi diff` |
| Apply source → home | `chezmoi apply` |
| Pull latest + apply (sync across machines) | `chezmoi update` |
| Start tracking a new file | `chezmoi add ~/.config/foo` |
| Stop tracking a file | `chezmoi forget ~/.config/foo` |
| See what's drifted | `chezmoi status` (empty = in sync) |
| Commit & push edits | `chezmoi cd` then `git add -A && git commit && git push` |

> **Note:** files some apps rewrite themselves (e.g. Claude Code's `known_marketplaces.json`
> `lastUpdated`) may show as drift in `chezmoi diff`. Re-import with `chezmoi add` when you care.

### Adding a per-machine difference (templating)

Rename the source file with a `.tmpl` suffix and branch on chezmoi variables:

```
{{ if eq .chezmoi.os "darwin" }}
# macOS-only lines
{{ else }}
# Linux-only lines
{{ end }}
```

Useful variables: `.chezmoi.os`, `.chezmoi.arch`, `.chezmoi.hostname`, `.chezmoi.homeDir`.
Render-check with `chezmoi cat ~/.path/to/file`.

**Worked example — `dot_tmux.conf.tmpl`:** the clipboard copy command is OS-specific, so it's set once
via a variable and reused:

```
{{ $clip := ternary "pbcopy" "xclip -selection clipboard -i" (eq .chezmoi.os "darwin") }}
...
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "{{ $clip }}"
```

→ `pbcopy` on macOS, `xclip` on Linux. Same pattern works for any per-OS command.

### Including a file on only some OSes

`.chezmoiignore` is itself a template, so an OS-only file is dropped by guarding it there.
The macOS-only fish env files are handled this way in `home/.chezmoiignore`:

```
{{ if ne .chezmoi.os "darwin" }}
.config/fish/config/envs/iterm2.fish
.config/fish/config/envs/xcode.fish
.config/fish/config/envs/interactive/orbstack.fish
{{ end }}
```

On non-macOS those files simply aren't created, so fish's `source_directory` never loads them.

## Rollback

- chezmoi never deletes unmanaged files. To undo a single file, restore it and `chezmoi forget` it.
- Pre-migration backups of the previously standalone repos (if still present):
  `~/.config/nvim.pre-chezmoi`, `~/.config/fish.pre-chezmoi`.
- History before the chezmoi migration is preserved; the former `dotfiles-nvim` and `dotfiles-fish`
  repos remain on GitHub (archived) as fallbacks.
