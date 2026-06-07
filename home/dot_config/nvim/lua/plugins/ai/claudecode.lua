return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    keys = require("core.keymaps").lazy("claudecode"),
    config = true,
}
