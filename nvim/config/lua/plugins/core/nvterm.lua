local style = require("def.style")

return {
    "NvChad/nvterm",
    event = "VeryLazy",
    opts = {
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
    },
    config = function(_, opts)
        require("nvterm").setup(opts)

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
        require("utils").set_keymaps(mappings)
    end,
}
