return {
    "jose-elias-alvarez/null-ls.nvim",
    -- "nvimtools/none-ls.nvim",
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
    },
    event = "VeryLazy",
    opts = function()
        local style = require("def.style")

        local utils = require("utils")
        local null_ls = require("null-ls")

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        return {
            border = style.border,
            sources = {
                -- Python
                formatting.black,
                -- formatting.isort.with({
                --     extra_args = {
                --         "--profile",
                --         "black",
                --     },
                -- }),
                -- Shell
                formatting.shfmt,
                -- C/C++
                formatting.clang_format.with({
                    extra_args = {
                        "--style",
                        "{BasedOnStyle: Google, IndentWidth: 4, UseTab: Never}",
                    },
                }),
                -- Lua
                formatting.cmake_format,
                diagnostics.cmake_lint,
                -- Dart
                null_ls.builtins.formatting.dart_format,
                -- Go
                formatting.gofumpt,
                formatting.goimports,
                diagnostics.revive,
                -- JavaScript/TypeScript
                formatting.prettierd.with({
                    filetypes = {
                        "css",
                        "scss",
                        "less",
                        "html",
                        "json",
                        "jsonc",
                        "yaml",
                        "markdown",
                        "markdown.mdx",
                        "graphql",
                        "handlebars",
                    },
                }),
                formatting.eslint_d,
                diagnostics.eslint_d,
                -- Rust
                formatting.rustfmt,
                -- Lua
                formatting.stylua.with({
                    extra_args = {
                        "--indent-type",
                        "Spaces",
                        "--indent-width",
                        "4",
                    },
                }),
                -- XML
                formatting.xmlformat,
                -- JSON
                diagnostics.jsonlint,
                -- diagnostics.ruff,
            },

            on_attach = function(client, _)
                if client.supports_method("textDocument/formatting") then
                    utils.set_keymaps({
                        {
                            "n",
                            "<leader>f",
                            function()
                                vim.lsp.buf.format({
                                    -- async = true,
                                    -- filter = function(client)
                                    --   -- print(client.name)
                                    --   -- vim.notify(client.name)
                                    --   return client.name ~= "tsserver"
                                    -- end,
                                })
                                vim.cmd.w()
                            end,
                            { desc = "Format buffer" },
                        },
                    })
                end
            end,
        }
    end,
    config = function(_, opts)
        local languages = require("utils.languages")

        require("mason-null-ls").setup({
            ensure_installed = languages.filter_languages({
                bash = {
                    "beautysh",
                },
                lua = {
                    "stylua",
                },
                c = {
                    "clang-format",
                    "cmakelang",
                    "codelldb",
                },
                python = {
                    "autopep8",
                    "ruff",
                    "debugpy",
                },
                go = {
                    "gofumpt",
                    "goimports",
                    "revive",
                },
                rust = {
                    "rustfmt",
                },
                web = {
                    "eslint_d",
                },
                julia = {
                    "stylua",
                },
                misc = {
                    "prettierd",
                    "cmakelang",
                    "jsonlint",
                    "ruff",
                    "xmlformatter",
                },
            }),
        })
        require("null-ls").setup(opts)
    end,
}
