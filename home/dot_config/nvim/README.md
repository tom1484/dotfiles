# Neovim Config

This config is organized around three ideas:

- shared implementation lives in `lua/common`, `lua/core`, `lua/plugins`, `lua/languages`, `lua/settings`, and `lua/utils`
- environment-specific behavior lives in `lua/env/nvim` and `lua/env/vscode`
- user-facing tweaks should usually happen in `lua/settings` instead of scattered plugin files

## Structure

Top-level entrypoints:

- [init.lua](/Users/tomchen/.config/nvim/init.lua): dispatches to `env.nvim` or `env.vscode`
- [lua/env/nvim/init.lua](/Users/tomchen/.config/nvim/lua/env/nvim/init.lua): normal Neovim startup
- [lua/env/vscode/init.lua](/Users/tomchen/.config/nvim/lua/env/vscode/init.lua): `vscode-neovim` startup

Shared layers:

- [lua/core](/Users/tomchen/.config/nvim/lua/core): startup/bootstrap, plugin loading, keymap loader
- [lua/common](/Users/tomchen/.config/nvim/lua/common): always-on editor behavior
- [lua/plugins](/Users/tomchen/.config/nvim/lua/plugins): main Neovim plugin specs for `lazy.nvim`
- [lua/languages](/Users/tomchen/.config/nvim/lua/languages): LSP, DAP, and formatter definitions
- [lua/settings](/Users/tomchen/.config/nvim/lua/settings): tweakable config data, keymap registries, validation
- [lua/utils](/Users/tomchen/.config/nvim/lua/utils): small reusable helpers

VSCode-specific layer:

- [lua/env/vscode/plugins](/Users/tomchen/.config/nvim/lua/env/vscode/plugins): VSCode-only or VSCode-adapted plugin specs
- [lua/env/vscode/resources](/Users/tomchen/.config/nvim/lua/env/vscode/resources): extra VSCode resources such as keybinding JSON

## Startup Flow

Normal Neovim:

1. [init.lua](/Users/tomchen/.config/nvim/init.lua) calls [lua/env/nvim/init.lua](/Users/tomchen/.config/nvim/lua/env/nvim/init.lua)
2. [lua/core/init.lua](/Users/tomchen/.config/nvim/lua/core/init.lua) runs bootstrap, plugin setup, and common setup
3. [lua/core/plugins.lua](/Users/tomchen/.config/nvim/lua/core/plugins.lua) discovers plugin specs in [lua/plugins](/Users/tomchen/.config/nvim/lua/plugins)
4. [lua/common/init.lua](/Users/tomchen/.config/nvim/lua/common/init.lua) applies common behavior

VSCode:

1. [init.lua](/Users/tomchen/.config/nvim/init.lua) calls [lua/env/vscode/init.lua](/Users/tomchen/.config/nvim/lua/env/vscode/init.lua)
2. [lua/env/vscode/plugins.lua](/Users/tomchen/.config/nvim/lua/env/vscode/plugins.lua) discovers specs in [lua/env/vscode/plugins](/Users/tomchen/.config/nvim/lua/env/vscode/plugins)
3. shared `common` and `settings` modules are reused where possible
4. VSCode-only keymaps are registered from the centralized settings path

## Settings

Settings are loaded through [lua/settings/init.lua](/Users/tomchen/.config/nvim/lua/settings/init.lua).

Sources:

- defaults: [lua/settings/defaults.lua](/Users/tomchen/.config/nvim/lua/settings/defaults.lua)
- optional local override: `lua/.settings.lua`
- validation: [lua/settings/validators.lua](/Users/tomchen/.config/nvim/lua/settings/validators.lua)

`lua/config.lua` is only a compatibility facade:

```lua
return require("settings")
```

That means old modules can still `require("config")`, but new user-facing config should go into `lua/settings`.

### Add or Change Settings

For a shared setting:

1. Edit [lua/settings/defaults.lua](/Users/tomchen/.config/nvim/lua/settings/defaults.lua)
2. If the shape is new, update [lua/settings/validators.lua](/Users/tomchen/.config/nvim/lua/settings/validators.lua)
3. Consume the setting from the relevant module

For a machine-local override:

1. Create `lua/.settings.lua`
2. Return only the override fields you want to change

Example:

```lua
return {
    style = {
        border = "single",
    },
}
```

## Keymaps

Keymaps are centralized.

Files:

- shared common keymaps: [lua/settings/keymaps/common.lua](/Users/tomchen/.config/nvim/lua/settings/keymaps/common.lua)
- lazy/plugin keymaps: [lua/settings/keymaps/lazy.lua](/Users/tomchen/.config/nvim/lua/settings/keymaps/lazy.lua)
- VSCode keymaps: [lua/settings/keymaps/vscode.lua](/Users/tomchen/.config/nvim/lua/settings/keymaps/vscode.lua)
- VSCode lazy keymaps: [lua/settings/keymaps/vscode_lazy.lua](/Users/tomchen/.config/nvim/lua/settings/keymaps/vscode_lazy.lua)
- which-key groups: [lua/settings/keymaps/groups.lua](/Users/tomchen/.config/nvim/lua/settings/keymaps/groups.lua)
- loader/validation: [lua/core/keymaps.lua](/Users/tomchen/.config/nvim/lua/core/keymaps.lua)

### Common Keymap Entry Format

Use structured entries:

```lua
{
    mode = "n",
    lhs = "<leader>x",
    rhs = "<cmd>SomeCommand<CR>",
    desc = "Do something",
    silent = true,
}
```

Supported fields commonly used here:

- `mode`
- `lhs`
- `rhs`
- `desc`
- `silent`
- `remap`
- `noremap`
- `enabled`
- `condition`
- `allow_duplicate`

### Add a New Common Keymap

1. Add it to [lua/settings/keymaps/common.lua](/Users/tomchen/.config/nvim/lua/settings/keymaps/common.lua)
2. Restart Neovim or reload settings

### Add a Plugin Keymap

If the keymap belongs to a normal Neovim plugin:

1. Add the keymap entry under the appropriate section in [lua/settings/keymaps/lazy.lua](/Users/tomchen/.config/nvim/lua/settings/keymaps/lazy.lua)
2. In the plugin spec, set `keys = require("core.keymaps").lazy("your_section_name")`

Example:

```lua
return {
    "author/plugin",
    keys = require("core.keymaps").lazy("my_plugin"),
}
```

If the keymap belongs to VSCode-only plugin behavior:

1. Add it to [lua/settings/keymaps/vscode_lazy.lua](/Users/tomchen/.config/nvim/lua/settings/keymaps/vscode_lazy.lua)
2. In the VSCode plugin spec, set `keys = require("env.vscode.keymaps").lazy("your_section_name")`

### Check Keymap Conflicts

Use:

```vim
:KeymapConflicts
```

This reports overlaps found by [lua/core/keymaps.lua](/Users/tomchen/.config/nvim/lua/core/keymaps.lua).

## Plugins

### Add a New Main Neovim Plugin

1. Create a spec file under [lua/plugins](/Users/tomchen/.config/nvim/lua/plugins)
2. Keep the file in the correct category if possible:
   - `plugins/edit`
   - `plugins/lsp`
   - `plugins/ui`
   - `plugins/git`
   - etc.
3. If it needs centralized keys, use the keymap registry instead of defining ad hoc `vim.keymap.set()` calls in `config()`

Minimal example:

```lua
return {
    "author/plugin",
    event = "VeryLazy",
    opts = {},
}
```

Plugin discovery is handled by [lua/core/plugins.lua](/Users/tomchen/.config/nvim/lua/core/plugins.lua), which scans `lua/plugins`.

### Add a New VSCode Plugin

1. Create a spec under [lua/env/vscode/plugins](/Users/tomchen/.config/nvim/lua/env/vscode/plugins)
2. Reuse a shared plugin spec if possible
3. Only keep a separate VSCode spec if behavior or options actually differ

If you can reuse a shared spec directly:

```lua
return require("plugins.edit.some-plugin")
```

If you need to override a shared spec:

```lua
return require("env.vscode.spec").extend("plugins.some.category", {
    opts = {
        -- vscode-specific overrides
    },
})
```

### Disable a Plugin or Language Group

Use `lua/.disable.lua`.

The loader reads it through [lua/core/plugins.lua](/Users/tomchen/.config/nvim/lua/core/plugins.lua) and [lua/utils/config_loader.lua](/Users/tomchen/.config/nvim/lua/utils/config_loader.lua).

## Languages

Language feature enablement is controlled by [lua/languages/group.lua](/Users/tomchen/.config/nvim/lua/languages/group.lua).

Related files:

- LSP definitions: [lua/languages/lsp](/Users/tomchen/.config/nvim/lua/languages/lsp)
- DAP definitions: [lua/languages/dap](/Users/tomchen/.config/nvim/lua/languages/dap)
- Formatter / linter definitions: [lua/languages/tools](/Users/tomchen/.config/nvim/lua/languages/tools)

### Add a New LSP / DAP / Formatter

1. Add the implementation file under the appropriate directory
2. Register it in [lua/languages/group.lua](/Users/tomchen/.config/nvim/lua/languages/group.lua)
3. If the file is intentionally inactive, prefix it with `_` so the loader skips it

## Common Rules For Future Changes

- Put tweakable data in `lua/settings` first
- Prefer shared modules over environment-specific duplication
- Prefer centralized keymaps over per-plugin ad hoc mappings
- Put VSCode-specific behavior in `lua/env/vscode`, not in shared layers
- Reuse shared plugin specs whenever the behavior is the same
- Keep `lua/utils` small and focused

## Useful Checks

Normal startup:

```sh
nvim --headless '+lua dofile("init.lua")' +qa
```

Simulated VSCode startup:

```sh
nvim --headless '+lua vim.g.vscode = true; dofile("init.lua")' +qa
```
