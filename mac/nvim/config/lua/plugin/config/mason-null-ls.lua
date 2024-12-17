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
