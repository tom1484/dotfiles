local style = require("config").style

return {
    "NvChad/nvterm",
    event = "VeryLazy",
    keys = require("core.keymaps").lazy("nvterm"),
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
    end,
}
