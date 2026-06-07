return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    keys = require("core.keymaps").lazy("gitsigns"),
    opts = {},
    config = function(_, opts)
        require("gitsigns").setup(opts)
    end,
}
