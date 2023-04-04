return {
    -- Alpha
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        init = require("lazy_plugin.alpha").init,
        config = require("lazy_plugin.alpha").setup,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- lsp
    {
        "VonHeikemen/lsp-zero.nvim",
        lazy = true,
        event = "VimEnter",
        init = require("lazy_plugin.lsp").init,
        config = function()
            local timer = vim.loop.new_timer()
            timer:start(100, 0, vim.schedule_wrap(require("lazy_plugin.lsp").setup))
        end,
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            -- "hrsh7th/cmp-nvim-lsp-signature-help",
            "ray-x/lsp_signature.nvim",
            "onsails/lspkind.nvim",
            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
    },
    -- null-ls
    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = true,
        event = "VimEnter",
        init = require("lazy_plugin.null-ls").init,
        config = function()
            local timer = vim.loop.new_timer()
            timer:start(100, 0, vim.schedule_wrap(require("lazy_plugin.null-ls").setup))
        end,
        dependencies = {
            "jay-babu/mason-null-ls.nvim",
        },
    },
    -- nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        init = require("lazy_plugin.nvim-tree").init,
        config = require("lazy_plugin.nvim-tree").setup,
    },
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
    },
    -- vscode colorscheme
    {
        "Mofiqul/vscode.nvim",
    },
    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    },
    -- undotree
    {
        "mbbill/undotree",
        lazy = false,
    },
    -- vim-fugitive
    {
        "tpope/vim-fugitive",
        lazy = false,
    },
    -- Comment
    {
        "numToStr/Comment.nvim",
    },
    -- lualine
    {
        "nvim-lualine/lualine.nvim",
    },
    -- copilot
    -- {
    -- 	"github/copilot.vim",
    -- 	lazy = false,
    -- },
    -- nvim-tmux-navigation
    {
        "alexghergh/nvim-tmux-navigation",
    },
    -- JABS
    {
        "matbme/JABS.nvim",
    },
    -- auto-pair
    {
        "windwp/nvim-autopairs",
    },
    -- transparent
    {
        "xiyaowong/nvim-transparent",
    },
    -- TODO highlight
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Trouble
    {
        "folke/trouble.nvim",
    },
}
