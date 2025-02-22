return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "VonHeikemen/lsp-zero.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "ray-x/lsp_signature.nvim",
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",
        -- "nvim-telescope/telescope.nvim",
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
            -- {
            --     "n",
            --     "gwp",
            --     function()
            --         vim.diagnostic.goto_prev()
            --     end,
            --     keymap_opts("Previous diagnostic"),
            -- },
            -- {
            --     "n",
            --     "ga",
            --     function()
            --         vim.cmd("Lspsaga code_action")
            --     end,
            --     keymap_opts("Code actions"),
            -- },
            -- {
            --     "n",
            --     "gr",
            --     function()
            --         vim.cmd("Lspsaga rename")
            --     end,
            --     keymap_opts("Rename"),
            -- },
            -- {
            --     "n",
            --     "go",
            --     function()
            --         vim.cmd("Lspsaga outline")
            --     end,
            --     keymap_opts("Open outline"),
            -- },
            -- {
            --     "n",
            --     "gF",
            --     function()
            --         vim.cmd("Lspsaga finder ++inexist")
            --     end,
            --     keymap_opts("Open finder"),
            -- },
            -- {
            --     "n",
            --     "gR",
            --     function()
            --         vim.cmd("Lspsaga finder ++inexist ref")
            --     end,
            --     keymap_opts("List references"),
            -- },
            -- {
            --     "n",
            --     "gD",
            --     function()
            --         vim.cmd("Lspsaga finder ++inexist def")
            --     end,
            --     keymap_opts("List definitions"),
            -- },
            -- {
            --     "n",
            --     "gI",
            --     function()
            --         vim.cmd("Lspsaga finder ++inexist imp")
            --     end,
            --     keymap_opts("List implementations"),
            -- },
            -- {
            --     "n",
            --     "<leader>vlw",
            --     function()
            --         telescope_builtin.diagnostics({ bufnr = 0 })
            --     end,
            --     keymap_opts("List file diagnostics"),
            -- },
            -- {
            --     "n",
            --     "<leader>vlW",
            --     function()
            --         telescope_builtin.diagnostics()
            --     end,
            --     keymap_opts("List workspace diagnostics"),
            -- },
            -- {
            --     "n",
            --     "<leader>vls",
            --     function()
            --         telescope_builtin.lsp_document_symbols()
            --     end,
            --     keymap_opts("List document symbols"),
            -- },
            -- {
            --     "n",
            --     "<leader>vlS",
            --     function()
            --         -- vim.cmd("Lspsaga peek_definition")
            --         telescope_builtin.lsp_workspace_symbols()
            --     end,
            --     keymap_opts("List workspace symbols"),
            -- },
        }

        utils.set_keymaps(mappings)
    end,
}
