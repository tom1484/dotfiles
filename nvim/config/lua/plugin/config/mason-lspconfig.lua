local languages = require("utils.languages")

require("mason-lspconfig").setup({
    ensure_installed = languages.filter_languages({
        lua = {
            "lua_ls",
        },
        c = {
            "clangd",
            "cmake",
        },
        python = {
            "pyright",
        },
        go = {
            "gopls",
        },
        rust = {
            "rust_analyzer",
        },
        web = {
            "ts_ls",
            "tailwindcss",
            "html",
        },
        julia = {
            -- "julials",
        },
        misc = {
            "taplo",
            "jsonls",
        },
    }),
})
