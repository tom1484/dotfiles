return {
    -- "jose-elias-alvarez/null-ls.nvim",
    "nvimtools/none-ls.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "jay-babu/mason-null-ls.nvim",
    },
    event = "VeryLazy",
    opts = function()
        local style = require("config").style

        local utils = require("util")
        local null_ls = require("null-ls")

        local entries = require("util.language").get_null_ls_entries()
        local configs = {
            formatting = utils.read_config_files(vim.fn.stdpath("config") .. "/lua/language/null-ls/formatting", {
                match_wildcards = { "*.lua" },
            }),
            diagnostics = utils.read_config_files(vim.fn.stdpath("config") .. "/lua/language/null-ls/diagnostics", {
                match_wildcards = { "*.lua" },
            }),
        }

        local sources = {}
        local ensure_installed = {}

        for _, builtin in ipairs({ "formatting", "diagnostics" }) do
            for _, entry in ipairs(entries[builtin]) do
                if configs[builtin][entry] then
                    table.insert(sources, null_ls.builtins[builtin][entry].with(configs[builtin][entry].opts or {}))
                    if configs[builtin][entry].mason then
                        table.insert(ensure_installed, configs[builtin][entry].mason)
                    end
                else
                    table.insert(sources, null_ls.builtins[builtin][entry])
                end
            end
        end

        return {
            ensure_installed = ensure_installed,
            opts = {
                border = style.border,
                sources = sources,
                on_attach = function(client, _)
                    if client.supports_method("textDocument/formatting") then
                        utils.set_keymaps({
                            {
                                "n",
                                "<leader>f",
                                function()
                                    vim.lsp.buf.format({})
                                    vim.cmd.w()
                                end,
                                { desc = "Format buffer" },
                            },
                        })
                    end
                end,
            },
        }
    end,
    config = function(_, opts)
        require("mason-null-ls").setup({
            ensure_installed = opts.ensure_installed,
        })
        require("null-ls").setup(opts.opts)
        -- ensure_installed = languages.filter_languages({
        --     bash = {
        --         "beautysh",
        --     },
        --     lua = {
        --         "stylua",
        --     },
        --     c = {
        --         "clang-format",
        --         "cmakelang",
        --         "codelldb",
        --     },
        --     python = {
        --         "autopep8",
        --         "ruff",
        --         "debugpy",
        --     },
        --     go = {
        --         "gofumpt",
        --         "goimports",
        --         "revive",
        --     },
        --     rust = {
        --         "rustfmt",
        --     },
        --     web = {
        --         "eslint_d",
        --     },
        --     julia = {
        --         "stylua",
        --     },
        --     misc = {
        --         "prettierd",
        --         "cmakelang",
        --         "jsonlint",
        --         "ruff",
        --         "xmlformatter",
        --     },
        -- }),
    end,
}
