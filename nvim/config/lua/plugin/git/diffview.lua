return {
    "sindrets/diffview.nvim",
    enabled = false,
    lazy = false,
    event = "VeryLazy",
    opts = {
        keymaps = {
            disable_defaults = true,
        },
    },
    config = function(_, opts)
        require("diffview").setup(opts)

        local utils = require("utils")
        local silent_opts = utils.opts_with_desc({
            silent = true,
        })
        local mappings = {
            {
                "n",
                "<leader>gd",
                ":DiffviewOpen<CR>",
                silent_opts("Open diff view"),
            },
            {
                "n",
                "<leader>gc",
                ":DiffviewClose<CR>",
                silent_opts("Close diff view"),
            },
            {
                "n",
                "<leader>gr",
                ":DiffviewRefresh<CR>",
                silent_opts("Refresh diff view"),
            },
            {
                "n",
                "<leader>gf",
                ":DiffviewFileHistory<CR>",
                silent_opts("Open file history"),
            },
            {
                "n",
                "<leader>gt",
                ":DiffviewToggleFiles<CR>",
                silent_opts("Toggle file panel"),
            },
        }
        utils.set_keymaps(mappings)
    end,
}
