return {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    keys = require("core.keymaps").lazy("diffview"),
    opts = {
        keymaps = {
            disable_defaults = true,
        },
    },
    config = function(_, opts)
        require("diffview").setup(opts)
    end,
}
