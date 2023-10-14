local wk = require("which-key")
wk.setup({
    window = {
        border = "rounded",
    },
})
wk.register({
    p = {
        name = "Project",
    },
    f = {
        name = "File",
    },
    k = {
        name = "Dap",
    },
    v = {
        name = "Lsp",
        l = {
            name = "Telescope lists",
            s = {
                name = "Symbols",
            },
        },
        n = {
            name = "Next",
        },
        p = {
            name = "Previous",
        },
    },
    s = {
        name = "Session",
    },
    w = {
        name = "Window",
    },
}, { prefix = "<leader>" })

vim.custom.fn.set_keymaps({
    {
        "n",
        "<leader>K",
        ":WhichKey<CR>",
        { noremap = true, silent = true, desc = "WhichKey" },
    },
})
