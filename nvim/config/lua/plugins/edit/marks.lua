return {
    "chentoast/marks.nvim",
    -- enabled = false,
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        require("marks").setup(opts)

        local utils = require("utils")
        utils.set_keymaps({
            {
                "n",
                "<leader>m",
                function()
                    vim.cmd("MarksListAll")
                end,
                { desc = "Marks" },
            },
        })
    end,
}
