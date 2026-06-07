return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    keys = require("core.keymaps").lazy("lazygit"),
    otps = {},
}
