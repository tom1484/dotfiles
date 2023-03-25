require("mason-null-ls").setup({
    ensure_installed = {
        -- Formatter
        "autopep8",
        "beautysh",
        -- "cbfmt",
        "clang-format",
        "gofumpt",
        "goimports",
        -- "jq",
        "prettierd",
        "rustfmt",
        "shfmt",
        "stylua",
        -- Linter
        "commitlint",
        "eslint_d",
        "jsonlint",
        "revive",
        "ruff",
        "staticcheck",
    },
})
