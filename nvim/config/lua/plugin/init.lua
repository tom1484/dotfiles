-- local alpha_config = require("plugin.config.alpha")
-- local kanagawa_config = require("plugin.config.kanagawa")

local M = {
    -- #############################
    -- UI Plugins
    -- #############################

    -- nvim-ufo
    -- {
    --     "kevinhwang91/nvim-ufo",
    --     lazy = false,
    --     dependencies = { "kevinhwang91/promise-async" },
    --     config = function()
    --         require("plugin.config.ufo")
    --     end,
    -- },
    -- {
    --     "declancm/cinnamon.nvim",
    --     enabled = false,
    --     lazy = false,
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.cinnamon")
    --     end,
    -- },
    -- Preview
    -- {
    --     "henriklovhaug/Preview.nvim",
    --     enabled = false,
    --     cmd = { "Preview" },
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.Preview")
    --     end,
    -- },
    -- Outline
    -- {
    --     "hedyhli/outline.nvim",
    --     enabled = false,
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.outline")
    --     end,
    -- },
    -- vim-illuminate
    -- {
    --     "RRethy/vim-illuminate",
    --     enabled = false,
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.illuminate")
    --     end,
    -- },
    -- {
    --     "j-hui/fidget.nvim",
    --     enabled = false,
    --     opts = {
    --         -- options
    --     },
    --     config = function()
    --         require("fidget").setup()
    --     end,
    -- },
    -- {
    --     "rasulomaroff/reactive.nvim",
    --     enabled = false,
    --     event = "VeryLazy",
    --     lazy = false,
    --     config = function()
    --         require("plugin.config.reactive")
    --     end,
    -- },

    -- #############################
    -- Editting Plugins
    -- #############################

    -- conform
    -- {
    --     "stevearc/conform.nvim",
    --     enabled = false,
    --     opts = {},
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.conform")
    --     end,
    -- },

    -- #############################
    -- Navigation Plugins
    -- #############################

    -- Kitty Navigation
    -- {
    --     "knubie/vim-kitty-navigator",
    --     run = "cp ./*.py ~/.config/kitty/",
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.kitty-navigator")
    --     end,
    -- },
    -- iTerm2 Navigation
    -- {
    --     "teajaymars/vim-iterm2-navigator",
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.iterm2-navigator")
    --     end,
    -- },

    -- #############################
    -- LSP Plugins
    -- #############################

    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = true },
        },
        dependencies = {
            "VonHeikemen/lsp-zero.nvim",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "ray-x/lsp_signature.nvim",
            "onsails/lspkind.nvim",
            "L3MON4D3/LuaSnip",
            "nvim-telescope/telescope.nvim",
        },
        event = { "BufReadPost", "VeryLazy" },
        config = function()
            require("plugin.config.lspconfig")
            require("plugin.config.mason-lspconfig")
        end,
    },
    -- mason.nvim
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin.config.mason")
        end,
    },
    -- nvim-dap
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mfussenegger/nvim-dap-python",
            "jay-babu/mason-nvim-dap.nvim",
            "Joakker/lua-json5",
        },
        event = "VeryLazy",
        config = function()
            require("plugin.config.dap")
            require("plugin.config.mason-dap")
        end,
    },
    {
        "Weissle/persistent-breakpoints.nvim",
        event = "VeryLazy",
        lazy = false,
        config = function()
            require("plugin.config.persistent-breakpoints")
        end,
    },
    -- null-ls.nvim
    {
        "jose-elias-alvarez/null-ls.nvim",
        -- "nvimtools/none-ls.nvim",
        dependencies = {
            "jay-babu/mason-null-ls.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("plugin.config.null-ls")
            require("plugin.config.mason-null-ls")
        end,
    },
    -- guard
    {
        "nvimdev/guard.nvim",
        enabled = false,
        -- Builtin configuration, optional
        dependencies = {
            "nvimdev/guard-collection",
        },
        event = "VeryLazy",
        config = function()
            require("plugin.config.guard")
        end,
    },
    -- copilot.vim
    {
        "github/copilot.vim",
        enabled = false,
        event = "VeryLazy",
        lazy = false,
        config = function()
            require("plugin.config.copilot")
        end,
    },
    -- lsp_lines.nvim
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        enabled = false,
        event = "LspAttach",
        lazy = false,
        config = function()
            require("plugin.config.lsp_lines")
        end,
    },
    -- Arduino.nvim
    -- {
    --   -- "edKotinsky/Arduino.nvim",
    --   "tom1484/Arduino.nvim",
    --   dependencies = {
    --     "neovim/nvim-lspconfig",
    --   },
    --   event = "VeryLazy",
    --   config = function()
    --     require("plugin.config.Arduino")
    --   end,
    -- },
    -- Lspsaga
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
        config = function()
            require("plugin.config.lspsaga")
        end,
    },

    -- #############################
    -- Core Plugins
    -- #############################

    {
        "amitds1997/remote-nvim.nvim",
        enabled = false,
        event = "VeryLazy",
        version = "*", -- Pin to GitHub releases
        dependencies = {
            "nvim-lua/plenary.nvim", -- For standard functions
            "MunifTanjim/nui.nvim", -- To build the plugin UI
            "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
        },
        config = function()
            require("plugin.config.remote-nvim")
        end,
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
            -- add any opts here
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1" -- for windows
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
        config = function()
            require("plugin.config.avante")
        end,
    },

    -- #############################
    -- Git Plugins
    -- #############################

    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("plugin.config.lazygit")
        end,
    },
    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        config = function()
            require("plugin.config.gitsigns")
        end,
    },
    -- diffview
    {
        "sindrets/diffview.nvim",
        enabled = false,
        lazy = false,
        event = "VeryLazy",
        config = function()
            require("plugin.config.diffview")
        end,
    },
}

return M
