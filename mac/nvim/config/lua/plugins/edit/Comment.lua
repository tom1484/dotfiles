return {
    "numToStr/Comment.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
        -- Add a space b/w comment and the line
        padding = true,
        -- Whether the cursor should stay at its position
        sticky = true,
        -- Lines to be ignored while (un)comment
        ignore = "^$",
        -- LHS of toggle mappings in NORMAL mode
        toggler = {
            -- line-comment toggle keymap
            line = "gcc",
            -- Block-comment toggle keymap
            block = "gbc",
        },
        -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            -- Line-comment keymap
            line = "gc",
            -- Block-comment keymap
            block = "gb",
        },
        -- LHS of extra mappings
        extra = {
            -- Add comment on the line above
            above = "gca",
            -- Add comment on the line below
            below = "gcb",
            -- Add comment at the end of line
            eol = "gce",
        },
        -- Enable keybindings
        -- NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
            -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            -- Extra mapping; `gco`, `gcO`, `gcA`
            extra = true,
        },
        -- Function to call before (un)comment
        pre_hook = nil,
        -- Function to call after (un)comment
        post_hook = nil,
    },
    config = function(opts)
        local Comment = require("Comment")
        Comment.setup(opts)

        local utils = require("utils")
        local set_opts = utils.opts_with_desc({
            remap = true,
            silent = true,
        })

        utils.set_keymaps({
            {
                "n",
                "<leader>c",
                "gcc",
                set_opts("Comment line"),
            },
            {
                "v",
                "<leader>b",
                "gbc<Esc>",
                set_opts("Comment block selection"),
            },
            {
                "v",
                "<leader>c",
                "gcc<Esc>",
                set_opts("Comment selection"),
            },
        })
    end,
}
