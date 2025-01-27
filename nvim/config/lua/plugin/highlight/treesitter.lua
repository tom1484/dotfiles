return {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = false,
    run = ":TSUpdate",
    event = "VeryLazy",
    lazy = false,
    opts = {
        -- A list of parser names, or "all" (the four listed parsers should always be installed)
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "css",
            "diff",
            "dockerfile",
            "fish",
            "gitignore",
            "go",
            "graphql",
            "html",
            "javascript",
            "json",
            "json5",
            "jsonc",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "requirements",
            "rust",
            "scss",
            "tmux",
            "toml",
            "vim",
            "vimdoc",
            "yaml",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        -- auto_install = true,
        auto_install = true,

        highlight = {
            -- `false` will disable the whole extension
            enable = true,
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
            use_languagetree = false,
            -- disable = function(_, bufnr)
            --     local buf_name = vim.api.nvim_buf_get_name(bufnr)
            --     local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
            --     return file_size > 80 * 1024
            -- end,
            disable = { "markdown", "text" },
        },

        -- incremental_selection = {
        --   enable = true,
        --   keymaps = {
        --     node_incremental = "=",
        --     node_decremental = "-",
        --   },
        -- },

        ignore_install = { "help", "text" },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevel = 99
