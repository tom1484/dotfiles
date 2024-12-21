local languages = require("utils.languages")

require("mason-nvim-dap").setup({
    ensure_installed = languages.filter_languages({
        python = {
            "debugpy",
        },
        c = {
            "codelldb",
        },
        go = {
            "delve",
        },
    }),
})
