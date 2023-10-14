require("marks").setup({})

vim.custom.fn.set_keymaps({
    {
        "n",
        "<leader>m",
        function()
            vim.cmd("MarksListAll")
        end,
        { desc = "Marks" },
    },
})
