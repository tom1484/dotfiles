return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "VonHeikemen/lsp-zero.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "ray-x/lsp_signature.nvim",
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",
        "saghen/blink.cmp",
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
                },
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
                misc = {
                    "taplo",
                    "jsonls",
                },
            }),
        }
    end,
    config = function(_, opts)
        local lspconfig = require("lspconfig")
        local blink = require("blink.cmp")

        require("mason-lspconfig").setup({
            ensure_installed = opts.configs,
        })

        for _, entry in ipairs(opts.configs) do
            local content = require("plugin.lsp.nvim-lspconfig.config." .. entry)
            local server = content.server
            local config = content.config
            -- config.capabilities = blink.get_lsp_capabilities()
            lspconfig[server].setup(config)
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

        -- Keymaps
        local utils = require("utils")
        local keymap_opts = utils.opts_with_desc({ remap = false })

        local mappings = {
            {
                "n",
                "gr",
                function()
                    vim.lsp.buf.rename()
                end,
                keymap_opts("Rename"),
            },
            {
                "n",
                "gh",
                function()
                    vim.lsp.buf.hover()
                end,
                keymap_opts("Hover doc"),
            },
            {
                "n",
                "gW",
                function()
                    vim.diagnostic.open_float()
                end,
                keymap_opts("Show diagnostics"),
            },
            {
                "n",
                "gwn",
                function()
                    vim.diagnostic.goto_next()
                end,
                keymap_opts("Next diagnostic"),
            },
        }

        utils.set_keymaps(mappings)
    end,
}
