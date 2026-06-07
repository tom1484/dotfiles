return {
    flash = {
        {
            mode = { "n", "x", "o" },
            lhs = "s",
            rhs = function()
                require("flash").jump()
            end,
            desc = "Flash jump",
            noremap = true,
            silent = true,
        },
        {
            mode = { "n", "o", "x" },
            lhs = "S",
            rhs = function()
                require("flash").treesitter()
            end,
            desc = "Flash region",
            noremap = true,
            silent = true,
        },
        {
            mode = { "n", "o", "x" },
            lhs = "R",
            rhs = function()
                require("flash").treesitter_search()
            end,
            desc = "Flash remote region",
            noremap = true,
            silent = true,
        },
    },
    vim_expand_region = {
        {
            mode = "v",
            lhs = "=",
            rhs = "<Plug>(expand_region_expand)",
            desc = "Expand region",
            silent = true,
        },
        {
            mode = "v",
            lhs = "-",
            rhs = "<Plug>(expand_region_shrink)",
            desc = "Shrink region",
            silent = true,
        },
    },
}
