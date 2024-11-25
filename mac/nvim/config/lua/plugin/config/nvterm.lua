local style = require("def.style")

local utils = require("utils")

require("nvterm").setup({
    terminals = {
        type_opts = {
            float = {
                relative = "editor",
                row = 0.08,
                col = 0.1,
                width = 0.8,
                height = 0.8,
                border = style.border,
            },
        },
    },
})

local terminal = require("nvterm.terminal")

local toggle_modes = { "n", "t" }
local mappings = {
    {
        toggle_modes,
        "<C-T>",
        function()
            terminal.toggle("float")
        end,
        { noremap = true, silent = true, desc = "Toggle terminal" },
    },
}
utils.set_keymaps(mappings)
