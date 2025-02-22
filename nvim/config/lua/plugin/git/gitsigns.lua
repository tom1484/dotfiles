return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = {},
    config = function(_, opts)
        require("gitsigns").setup(opts)

        local utils = require("utils")

        utils.set_keymaps({
            {
                "n",
                "<leader>gb",
                function()
                    vim.cmd([[Gitsigns blame_line]])
                end,
                { desc = "Show git blame" },
            },
        })

        utils.set_keymaps({
            {
                "n",
                "<leader>gB",
                function()
                    vim.cmd([[Gitsigns toggle_current_line_blame]])
                end,
                { desc = "Toggle git blame" },
            },
        })

        utils.set_keymaps({
            {
                "n",
                "<leader>gd",
                function()
                    vim.cmd([[Gitsigns diffthis]])
                end,
                { desc = "Open diff view" },
            },
        })

        -- vim.api.nvim_create_autocmd("FileType", {
        --     callback = function()
        --         if vim.fn.finddir(".git", vim.fn.getcwd() .. ";") ~= "" then
        --             vim.cmd([[set signcolumn=yes:2]])
        --         end
        --     end,
        -- })
    end,
}
