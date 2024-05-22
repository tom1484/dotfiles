require("conform").setup({
    formatters_by_ft = {
        lua = { "beautysh" },
        python = { "isort", "black" },
        javascript = { "eslint_d" },
        cpp = { "clang_format" },
    },
})
