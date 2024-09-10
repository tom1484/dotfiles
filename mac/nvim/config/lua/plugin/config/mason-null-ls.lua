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
        },
        python = {
            "autopep8",
            "ruff",
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
            "revive",
            "ruff",
            "xmlformatter"
        },
    }),
})
