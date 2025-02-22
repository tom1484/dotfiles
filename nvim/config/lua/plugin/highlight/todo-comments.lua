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
    keys = {
        {
            "<leader>st",
            function()
                Snacks.picker.todo_comments()
            end,
            desc = "Todo",
        },
        {
            "<leader>sT",
            function()
                Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
            end,
            desc = "Todo/Fix/Fixme",
        },
    },
}
