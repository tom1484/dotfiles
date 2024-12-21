vim.g.transparent_enabled = true

return {
    "xiyaowong/nvim-transparent",
    lazy = false,
    opts = {
        -- enable = true, -- boolean: enable transparent
        extra_groups = { -- table/string: additional groups that should be cleared
            "NormalFloat",
            "FloatBorder",
            "TelescopeNormal",
            "TelescopeBorder",
            "NvimTreeNormal",
            "VertSplit",
            "NoiceFormatProgressTodo",
            "NoiceCmdlinePopupBorder",
            "NoiceCmdlinePopupBorderSearch",
        },
        exclude_groups = {}, -- table: groups you don't want to clear
    },
    -- config = function()
    --     vim.g.transparent_enabled = true
    -- end,
}
