return {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = require("env.vscode.keymaps").lazy("flash"),
    opts = {
        modes = {
            char = {
                keys = {},
            },
        },
    },
    config = function(_, opts)
        local flash = require("flash")
        flash.setup(opts)
    end,
}
