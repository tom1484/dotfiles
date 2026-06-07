return {
    options = {
        nu = true,
        relativenumber = true,
        smartindent = true,
        wrap = false,
        swapfile = false,
        backup = false,
        undofile = true,
        hlsearch = false,
        incsearch = true,
        scrolloff = 8,
        signcolumn = "yes",
        updatetime = 50,
        foldmethod = "indent",
        foldlevel = 99,
        showcmd = false,
        tagbsearch = false,
        showtabline = 0,
        list = true,
        autoread = true,
    },
    style = {
        border = "rounded",
    },
    indent = {
        default = {
            options = {
                expandtab = true,
                tabstop = 4,
                softtabstop = 4,
                shiftwidth = 4,
            },
        },
        extras = {
            {
                options = {
                    expandtab = false,
                },
                filetypes = {
                    "go",
                    "make",
                },
            },
            {
                options = {
                    tabstop = 2,
                    softtabstop = 2,
                    shiftwidth = 2,
                },
                filetypes = {
                    "css",
                    "scss",
                    "jsonc",
                    "json",
                    "yaml",
                    "javascript",
                    "typescript",
                    "javascriptreact",
                    "typescriptreact",
                    "html",
                    "cmake",
                    "prisma",
                    "sql",
                    "dart",
                },
            },
        },
    },
    keymaps = require("settings.keymaps"),
}
