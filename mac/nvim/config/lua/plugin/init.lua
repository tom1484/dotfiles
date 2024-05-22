local M = {

    -- #############################
    -- Theme Plugins
    -- #############################

    -- alpha-nvim
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope.nvim",
            "rmagatti/auto-session",
        },
        lazy = false,
        config = function()
            require("plugin.config.alpha")
        end,
    },
    -- vscode.nvim
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        config = function()
            require("plugin.config.colors")
        end,
    },
    -- kanagawa
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            require("plugin.config.kanagawa")
        end,
    },
    -- lualine.nvim
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function()
            require("plugin.config.lualine")
        end,
    },
    -- luatab.nvim
    {
        "alvarosevilla95/luatab.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        lazy = false,
        config = function()
            require("plugin.config.luatab")
        end,
    },
    -- nvim-transparent
    {
        "xiyaowong/nvim-transparent",
        lazy = false,
        config = function()
            require("plugin.config.transparent")
        end,
    },

    -- #############################
    -- Highlights Plugins
    -- #############################

    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        -- event = "VeryLazy",
        lazy = false,
        config = function()
            require("plugin.config.treesitter")
        end,
    },
    -- nvim-treesitter-context
    -- {
    --     "nvim-treesitter/nvim-treesitter-context",
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.treesitter-context")
    --     end,
    -- },
    -- todo-comments.nvim
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
            require("plugin.config.todo-comments")
        end,
    },
    -- trouble.nvim
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin.config.Trouble")
        end,
    },

    -- #############################
    -- UI Plugins
    -- #############################

    -- telescope.nvim
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "tom1484/telescope-ui-select.nvim",
        },
        lazy = false,
        config = function()
            require("plugin.config.telescope")
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        -- event = "VeryLazy",
    },
    -- nvim-dap-ui
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        event = "VeryLazy",
        config = function()
            require("plugin.config.dapui")
        end,
    },
    -- nvim-tree.lua
    {
        "nvim-tree/nvim-tree.lua",
        event = "VeryLazy",
        config = function()
            require("plugin.config.nvim-tree")
        end,
    },
    -- ChatGPT.nvim
    {
        "jackMort/ChatGPT.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("plugin.config.chatgpt")
        end,
    },
    -- nvim-notify
    -- {
    --   "rcarriga/nvim-notify",
    --   lazy = false,
    --   config = function()
    --     require("plugin.config.notify")
    --   end,
    -- },
    -- noice.nvim
    -- {
    --   "folke/noice.nvim",
    --   dependencies = {
    --     "MunifTanjim/nui.nvim",
    --     "rcarriga/nvim-notify",
    --   },
    --   lazy = false,
    --   config = function()
    --     require("plugin.config.noice")
    --   end,
    -- },
    -- JABS.nvim
    {
        "matbme/JABS.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin.config.JABS")
        end,
    },
    -- undoTree
    {
        "mbbill/undotree",
        event = "VeryLazy",
        config = function()
            require("plugin.config.undotree")
        end,
    },
    -- nvterm
    {
        "NvChad/nvterm",
        event = "VeryLazy",
        config = function()
            require("plugin.config.nvterm")
        end,
    },
    -- auto-session
    {
        "rmagatti/auto-session",
        -- dependencies = {
        --   "folke/noice.nvim",
        -- },
        lazy = false,
        config = function()
            require("plugin.config.auto-session")
        end,
    },
    -- indent-blakline.nvim
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        lazy = false,
        config = function()
            require("plugin.config.indent-blankline")
        end,
    },
    -- nvim-ufo
    {
        "kevinhwang91/nvim-ufo",
        lazy = false,
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            require("plugin.config.ufo")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("plugin.config.which-key")
        end,
    },
    -- {
    --     "declancm/cinnamon.nvim",
    --     lazy = false,
    --     config = function()
    --         require("plugin.config.cinnamon")
    --     end,
    -- },
    -- Preview
    {
        "henriklovhaug/Preview.nvim",
        cmd = { "Preview" },
        event = "VeryLazy",
        config = function()
            require("plugin.config.Preview")
        end,
    },

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
    -- nvim-autopairs
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            require("plugin.config.autopairs")
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
    {
        "chrisgrieser/nvim-recorder",
        dependencies = {
            -- "rcarriga/nvim-notify", -- optional
            "nvim-lualine/lualine.nvim",
        },
        opts = {}, -- required even with default settings, since it calls `setup()`
        event = "VeryLazy",
        config = function()
            require("plugin.config.nvim-recorder")
        end,
    },
    -- conform
    -- {
    --     'stevearc/conform.nvim',
    --     opts = {},
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.conform")
    --     end,
    -- },

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
    -- marks.nvim
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin.config.marks")
        end,
    },

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
        },
        event = "VeryLazy",
        config = function()
            require("plugin.config.dap")
            require("plugin.config.mason-dap")
        end,
    },
    -- cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "rcarriga/cmp-dap",
        },
        event = "VeryLazy",
        config = function()
            require("plugin.config.cmp")
        end,
    },
    -- null-ls.nvim
    {
        "jose-elias-alvarez/null-ls.nvim",
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
    -- {
    --     "nvimdev/guard.nvim",
    --     -- Builtin configuration, optional
    --     dependencies = {
    --         "nvimdev/guard-collection",
    --     },
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.guard")
    --     end,
    -- },
    -- copilot.vim
    {
        "github/copilot.vim",
        event = "VeryLazy",
        config = function()
            require("plugin.config.copilot")
        end,
    },
    -- lsp_lines.nvim
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        event = "LspAttach",
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
    -- Git Plugins
    -- #############################

    -- Neogit
    -- {
    --     "NeogitOrg/neogit",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim", -- required
    --         "sindrets/diffview.nvim", -- optional - Diff integration
    --
    --         -- Only one of these is needed, not both.
    --         "nvim-telescope/telescope.nvim", -- optional
    --         "ibhagwan/fzf-lua", -- optional
    --     },
    --     event = "VeryLazy",
    --     config = function()
    --         require("plugin.config.neogit")
    --     end,
    -- },
    -- lazygit.nvim
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
}

return M
