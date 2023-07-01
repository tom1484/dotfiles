return {
    init = function() end,
    setup = function()
        local null_ls = require("null-ls")

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup({
            border = "rounded",
            sources = {
                formatting.autopep8,
                formatting.beautysh,
                formatting.clang_format.with({
                    extra_args = {
                        "--style",
                        "{BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 100}",
                    },
                }),
                formatting.eslint,
                formatting.gofumpt,
                formatting.goimports,
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
                    },
                }),

                diagnostics.commitlint,
                diagnostics.eslint,
                diagnostics.jsonlint,
                diagnostics.staticcheck,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.keymap.set("n", "<leader>vf", function()
                        vim.lsp.buf.format()
                        vim.cmd.w()
                    end)
                end

                -- require("lazy_plugin.mason-null-ls")
            end,
        })
    end,
}
