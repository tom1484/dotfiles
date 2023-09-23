require("transparent").setup({
    -- enable = true, -- boolean: enable transparent
    extra_groups = { -- table/string: additional groups that should be cleared
        "NormalFloat",
        "FloatBorder",
        "TelescopeNormal",
        "TelescopeBorder",
        "NvimTreeNormal",
        "VertSplit",
        "NoiceFormatProgressTodo",
    },
    exclude_groups = {}, -- table: groups you don't want to clear
})

vim.g.transparent_enabled = true
