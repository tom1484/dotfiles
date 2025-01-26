return {
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
    opts = function()
        local languages = require("utils.languages")

        return {
            configs = languages.filter_languages({
                lua = {
                    "lua_ls",
                },
                c = {
                    "clangd",
                    "cmake",
                },
                python = {
                    "pyright",
                    -- "pylsp",
                    -- "ruff",
                    -- "pylyzer",
                },
                -- dart = {
                --     "dartls",
                -- },
                go = {
                    "gopls",
                },
                rust = {
                    "rust_analyzer",
                },
                web = {
                    "ts_ls",
                    "tailwindcss",
                    "html",
                },
                -- julia = {
                --     "julials",
                -- },
                misc = {
                    "taplo",
                    "jsonls",
                },
            }),
        }
    end,
    config = function(_, opts)
        require("mason-lspconfig").setup({
            ensure_installed = opts.configs,
        })

        for _, lsp_config in ipairs(opts.configs) do
            require("plugin.lsp.nvim-lspconfig.config." .. lsp_config)
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = require("plugin.lsp.nvim-lspconfig.util.attach_callback"),
        })

        local style = require("def.style")
        vim.diagnostic.config({
            virtual_text = true,
            float = {
                border = style.border,
            },
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = style.border,
        })
        require("lspconfig.ui.windows").default_options.border = style.border
    end,
}
