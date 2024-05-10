local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    border = "rounded",
    sources = {
        formatting.black,
        formatting.isort.with({
            extra_args = {
                "--profile",
                "black",
            },
        }),

        formatting.beautysh,

        formatting.clang_format.with({
            extra_args = {
                "--style",
                "{BasedOnStyle: Google}",
            },
        }),
        formatting.cmake_format,
        diagnostics.cmake_lint,

        formatting.gofumpt,
        formatting.goimports,
        diagnostics.revive,

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

        formatting.rustfmt,

        formatting.stylua.with({
            extra_args = {
                "--indent-type",
                "Spaces",
                "--indent-width",
                "4",
            },
        }),

        formatting.eslint_d,
        diagnostics.eslint_d,

        formatting.xmlformat,
        diagnostics.jsonlint,
        -- diagnostics.ruff,
    },
    on_attach = function(client, _)
        if client.supports_method("textDocument/formatting") then
            vim.custom.fn.set_keymaps({
                {
                    "n",
                    "<leader>vf",
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
})
