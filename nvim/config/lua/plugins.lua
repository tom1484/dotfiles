return {
  -- Alpha
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("plugin.alpha")
    end,
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("plugin.telescope")
    end,
  },
  -- cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Autocompletion
      "hrsh7th/nvim-cmp",
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
  -- lsp-zero
  -- {
  --     "VonHeikemen/lsp-zero.nvim",
  --     dependencies = {
  --         -- LSP Support
  --         "neovim/nvim-lspconfig",
  --         "williamboman/mason.nvim",
  --         "williamboman/mason-lspconfig.nvim",
  --         -- "hrsh7th/cmp-nvim-lsp-signature-help",
  --         "ray-x/lsp_signature.nvim",
  --         "onsails/lspkind.nvim",
  --         -- Snippets
  --         "L3MON4D3/LuaSnip",
  --         -- Support
  --         "nvim-telescope/telescope.nvim",
  --     },
  --     event = { "BufReadPost", "VeryLazy" },
  --     config = function()
  --         require("plugin.lsp")
  --     end,
  -- },
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
  -- Mason
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    config = function()
      require("plugin.mason")
    end,
  },
  -- DAP
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
  -- DAP UI
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
  -- null-ls
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
  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    config = function()
      require("plugin.nvim-tree")
    end,
  },
  {
    "Shatur/neovim-session-manager",
    event = "VeryLazy",
    config = function()
      -- require("plugin.")
    end,
    dependencies = {
      "plenary.nvim",
    },
  },
  -- chatgpt
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
  -- vscode colorscheme
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    config = function()
      require("plugin.colors")
    end,
  },
  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("plugin.treesitter")
    end,
  },
  -- Comment
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("plugin.Comment")
    end,
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require("plugin.lualine")
    end,
  },
  -- copilot
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      require("plugin.copilot")
    end,
  },
  -- nvim-tmux-navigation
  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    config = function()
      require("plugin.tmux-navigation")
    end,
  },
  -- JABS
  {
    "matbme/JABS.nvim",
    event = "VeryLazy",
    config = function()
      require("plugin.JABS")
    end,
  },
  -- auto-pair
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("plugin.autopairs")
    end,
  },
  -- transparent
  {
    "xiyaowong/nvim-transparent",
    lazy = false,
    config = function()
      require("plugin.transparent")
    end,
  },
  -- TODO highlight
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("plugin.todo-comments")
    end,
  },
  -- Trouble
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    config = function()
      require("plugin.Trouble")
    end,
  },
  -- notify
  -- {
  --     "rcarriga/nvim-notify",
  -- },
  -- fine-cmdline
  -- {
  --     "VonHeikemen/fine-cmdline.nvim",
  --     dependencies = { "MunifTanjim/nui.nvim" },
  -- },
  -- tabline
  {
    "alvarosevilla95/luatab.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("plugin.luatab")
    end,
  },
  -- expand region
  {
    "terryma/vim-expand-region",
    event = "VeryLazy",
    config = function()
      require("plugin.vim-expand-region")
    end,
  },
  -- undotree
  {
    "mbbill/undotree",
    event = "VeryLazy",
    config = function()
      require("plugin.undotree")
    end,
  },
  -- vim-fugitive
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      -- require("plugin.")
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
  -- flash.nvim
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require("plugin.flash")
    end,
  },
  -- -- FineCmdline
  -- {
  --     "VonHeikemen/fine-cmdline.nvim",
  --     dependencies = { "MunifTanjim/nui.nvim" },
  --     event = "VeryLazy",
  -- },
}
