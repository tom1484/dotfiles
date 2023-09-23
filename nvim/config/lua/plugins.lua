return {

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
            require("plugin.alpha")
        end,
    },
    -- vscode.nvim
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        config = function()
            require("plugin.colors")
        end,
    },
    -- lualine.nvim
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function()
            require("plugin.lualine")
        end,
    },
    -- luatab.nvim
    {
        "alvarosevilla95/luatab.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        lazy = false,
        config = function()
            require("plugin.luatab")
        end,
    },
    -- nvim-transparent
    {
        "xiyaowong/nvim-transparent",
        lazy = false,
        config = function()
            require("plugin.transparent")
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
            require("plugin.treesitter")
        end,
    },
    -- nvim-treesitter-context
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        config = function()
            require("plugin.treesitter-context")
        end,
    },
    -- todo-comments.nvim
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
            require("plugin.todo-comments")
        end,
    },
    -- trouble.nvim
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin.Trouble")
        end,
    },

    -- #############################
    -- UI Plugins
    -- #############################

    -- telescope.nvim
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "tom1484/telescope-ui-select.nvim",
        },
        lazy = false,
        config = function()
            require("plugin.telescope")
        end,
    },
    -- nvim-dap-ui
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        event = "VeryLazy",
        config = function()
            require("plugin.dapui")
        end,
    },
    -- nvim-tree.lua
    {
        "nvim-tree/nvim-tree.lua",
        event = "VeryLazy",
        config = function()
            require("plugin.nvim-tree")
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
            require("plugin.chatgpt")
        end,
    },
    -- nvim-notify
    -- {
    --   "rcarriga/nvim-notify",
    --   lazy = false,
    --   config = function()
    --     require("plugin.notify")
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
    --     require("plugin.noice")
    --   end,
    -- },
    -- lazygit.nvim
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("plugin.lazygit")
        end,
    },
    -- JABS.nvim
    {
        "matbme/JABS.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin.JABS")
        end,
    },
    -- undoTree
    {
        "mbbill/undotree",
        event = "VeryLazy",
        config = function()
            require("plugin.undotree")
        end,
    },
    -- nvterm
    {
        "NvChad/nvterm",
        event = "VeryLazy",
        config = function()
            require("plugin.nvterm")
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
            require("plugin.auto-session")
        end,
    },
    -- indent-blakline.nvim
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = false,
        config = function()
            require("plugin.indent-blankline")
        end,
    },
    -- statuscol.nvim
    -- {
    --     "luukvbaal/statuscol.nvim",
    --     lazy = false,
    --     config = function()
    --         require("plugin.statuscol")
    --     end,
    -- },
    -- nvim-ufo
    {
        "kevinhwang91/nvim-ufo",
        lazy = false,
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            require("plugin.ufo")
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
            require("plugin.Comment")
        end,
    },
    -- nvim-autopairs
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            require("plugin.autopairs")
        end,
    },
    -- vim-expand-region
    {
        "terryma/vim-expand-region",
        event = "VeryLazy",
        config = function()
            require("plugin.vim-expand-region")
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
            require("plugin.nvim-recorder")
        end,
    },

    -- #############################
    -- Navigation Plugins
    -- #############################

    -- flash.nvim
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin.flash")
        end,
    },
    -- Kitty Navigation
    {
        "knubie/vim-kitty-navigator",
        run = "cp ./*.py ~/.config/kitty/",
        event = "VeryLazy",
        config = function()
            require("plugin.kitty-navigator")
        end,
    },
    -- marks.nvim
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin.marks")
        end,
    },

    -- #############################
    -- LSP Plugins
    -- #############################

    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
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
            require("plugin.lspconfig")
            require("plugin.mason-lspconfig")
        end,
    },
    -- mason.nvim
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin.mason")
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
            require("plugin.dap")
            require("plugin.mason-dap")
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
            require("plugin.cmp")
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
            require("plugin.null-ls")
            require("plugin.mason-null-ls")
        end,
    },
    -- copilot.vim
    {
        "github/copilot.vim",
        event = "VeryLazy",
        config = function()
            require("plugin.copilot")
        end,
    },
    -- lsp_lines.nvim
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        event = "LspAttach",
        config = function()
            require("plugin.lsp_lines")
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
    --     require("plugin.Arduino")
    --   end,
    -- },
}
