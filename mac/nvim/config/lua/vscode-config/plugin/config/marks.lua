local utils = require("utils")

require("marks").setup({})

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
