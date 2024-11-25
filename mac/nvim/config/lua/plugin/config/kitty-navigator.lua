local utils = require("utils")

vim.g.kitty_navigator_no_mappings = 1

local modes = { "n", "c", "t" }
local opts = utils.opts_with_desc({
    silent = true,
})
local mappings = {
    { modes, "<C-h>", vim.cmd.KittyNavigateLeft, opts("Navigate left") },
    { modes, "<C-j>", vim.cmd.KittyNavigateDown, opts("Navigate down") },
    { modes, "<C-k>", vim.cmd.KittyNavigateUp, opts("Navigate up") },
    { modes, "<C-l>", vim.cmd.KittyNavigateRight, opts("Navigate right") },
}
utils.set_keymaps(mappings)
