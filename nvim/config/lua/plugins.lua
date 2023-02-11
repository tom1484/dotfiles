return {
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	-- vscode colorscheme
	{
		"Mofiqul/vscode.nvim",
		lazy = true,
	},
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
	-- 'nvim-treesitter/playground',
	-- harpoon navigator
	-- 'theprimeagen/harpoon',
	-- undotree
	{
		"mbbill/undotree",
		lazy = false,
	},
	-- vim-fugitive
	"tpope/vim-fugitive",
	-- Comment
	"numToStr/Comment.nvim",
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},
	-- "crispgm/nvim-tabline",
	-- "kdheepak/tabline.nvim",
	-- "akinsho/bufferline.nvim",
	-- lsp
	{
		"VonHeikemen/lsp-zero.nvim",
		lazy = true,
		event = "UIEnter",
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

			-- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	},
	-- null-ls
	"jose-elias-alvarez/null-ls.nvim",
	-- nvim-tmux-navigation
	"alexghergh/nvim-tmux-navigation",
	-- JABS
	"matbme/JABS.nvim",
	-- auto-pair
	"windwp/nvim-autopairs",
	-- transparent
	"xiyaowong/nvim-transparent",
	-- tokyonight
	"folke/tokyonight.nvim",
	-- sad
	{
		"ray-x/sad.nvim",
		dependencies = {
			{
				"ray-x/guihua.lua",
				build = "cd lua/fzy && make",
			},
		},
	},
	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		-- cmd = "NvimTreeToggle",
		event = "UIEnter",
		init = require("lazy_plugin.nvim-tree").init,
		config = function()
			if vim.o.filetype == "" then
				require("lazy_plugin.nvim-tree").setup()
			else
				local timer = vim.loop.new_timer()
				timer:start(100, 0, vim.schedule_wrap(require("lazy_plugin.nvim-tree").setup))
			end
		end,
		-- config = require("lazy_plugin.nvim-tree").setup,
	},
	-- TODO highlight
	{
		"folke/todo-comments.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	-- Trouble
	"folke/trouble.nvim",
}
