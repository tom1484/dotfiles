local M = {
    -- #############################
    -- Editting Plugins
    -- #############################

    -- Comment.nvim
    {
        "numToStr/Comment.nvim",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("plugin.config.Comment")
        end,
    },
    -- vim-expand-region
    {
        "terryma/vim-expand-region",
        event = "VeryLazy",
        config = function()
            require("plugin.config.vim-expand-region")
        end,
    },
    -- nvim-recorder
    -- {
    --     "chrisgrieser/nvim-recorder",
    --     dependencies = {
    --         -- "rcarriga/nvim-notify", -- optional
    --         "nvim-lualine/lualine.nvim",
    --     },
    --     opts = {}, -- required even with default settings, since it calls `setup()`
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.nvim-recorder")
    --     end,
    -- },
    {
        "vscode-neovim/vscode-multi-cursor.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- #############################
    -- Navigation Plugins
    -- #############################

    -- flash.nvim
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin.config.flash")
        end,
    },
    -- marks.nvim
    -- {
    --     "chentoast/marks.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.marks")
    --     end,
    -- },
}

return M
