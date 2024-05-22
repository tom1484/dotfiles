vim.opt.list = true

require("ibl").setup({
    enabled = true,
    indent = {
        char = "▏",
    },
    scope = {
        highlight = { "Function", "Label" },
    },
})
