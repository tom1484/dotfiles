---@diagnostic disable: undefined-global

return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    optional = true,
    keys = require("core.keymaps").lazy("todo_comments"),
}
