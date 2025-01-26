return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    config = function(_)
        local wk = require("which-key")
        local style = require("def.style")

        wk.setup({
            delay = 500,
            win = {
                padding = { 1, 1 },
                border = style.border,
            },
        })
        wk.add({
            { "<leader>f", group = "File" },
            { "<leader>k", group = "Dap" },
            { "<leader>d", group = "DapUI" },
            { "<leader>p", group = "Project" },
            { "<leader>s", group = "Session" },
            { "<leader>v", group = "Lsp" },
            { "<leader>l", group = "Telescope lists" },
            { "<leader>vn", group = "Next" },
            { "<leader>vp", group = "Previous" },
            { "<leader>w", group = "Window" },
        })

        local utils = require("utils")
        utils.set_keymaps({
            {
                "n",
                "<leader>K",
                ":WhichKey<CR>",
                { noremap = true, silent = true, desc = "WhichKey" },
            },
        })
    end,
}
