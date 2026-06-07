return {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    keys = require("core.keymaps").lazy("marks"),
    opts = {},
    config = function(_, opts)
        require("marks").setup(opts)
    end,
}
