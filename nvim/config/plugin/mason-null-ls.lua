require("mason-null-ls").setup({
    ensure_installed = {
        -- Formatter
        "autopep8",
        "beautysh",
        "clang-format",
        "gofumpt",
        "goimports",
        "prettierd",
        "rustfmt",
        "shfmt",
        "stylua",
        -- Linter
        "commitlint",
        "jsonlint",
        "revive",
        "ruff",
        "staticcheck",
    },
})
