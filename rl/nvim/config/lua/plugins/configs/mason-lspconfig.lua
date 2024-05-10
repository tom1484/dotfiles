require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",
        "cmake",
        -- "gopls",
        -- "html",
        -- "jsonls",
        -- "julials",
        -- "lua_ls",
        "rust_analyzer",
        -- "tailwindcss",
        -- "taplo",
        "pyright",
        -- "tsserver",
        -- "arduino_language_server",
    },
})
