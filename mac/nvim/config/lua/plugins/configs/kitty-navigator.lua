vim.g.kitty_navigator_no_mappings = 1

local modes = { "n", "c", "t" }
local opts = { remap = false, silent = true }

vim.keymap.set(modes, "<C-h>", vim.cmd.KittyNavigateLeft, opts)
vim.keymap.set(modes, "<C-j>", vim.cmd.KittyNavigateDown, opts)
vim.keymap.set(modes, "<C-k>", vim.cmd.KittyNavigateUp, opts)
vim.keymap.set(modes, "<C-l>", vim.cmd.KittyNavigateRight, opts)
