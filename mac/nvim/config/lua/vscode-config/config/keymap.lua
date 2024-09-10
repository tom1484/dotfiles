local vscode = require("vscode")

return {
    setup = function()
        local opts = vim.custom.fn.opts_with_desc({})
        local silent_opts = vim.custom.fn.opts_with_desc({
            silent = true,
        })
        local mappings = {
            -- line manipulation
            {
                "v",
                "J",
                ":m '>+1<CR>gv=gv",
                silent_opts("Move lines down"),
            },
            { "v", "K", ":m '<-2<CR>gv=gv", silent_opts("Move lines up") },
            -- scroll
            { "n", "<C-d>", "<C-d>zz", silent_opts("Scroll down") },
            { "n", "<C-u>", "<C-u>zz", silent_opts("Scroll up") },
            -- register
            {
                "v",
                "<leader>y",
                [["+y]],
                silent_opts("Copy to system"),
            },
            -- move
            {
                "n",
                "<C-H>",
                "<Left>",
                silent_opts("Move left"),
            },
            {
                "n",
                "<C-J>",
                "<Down>",
                silent_opts("Move down"),
            },
            {
                "n",
                "<C-K>",
                "<Up>",
                silent_opts("Move up"),
            },
            {
                "n",
                "<C-L>",
                "<Right>",
                silent_opts("Move right"),
            },
            -- replace and search
            -- { "n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts("Replace word") },
            -- { "n", "<leader>h", [[/\<<C-r><C-w>\>]], opts("Search word") },
            -- VSCode mapping
            {
                "n",
                "<leader>vh",
                function()
                    vscode.call("editor.action.showHover")
                end,
                opts("Show hover"),
            },
            {
                "n",
                "<leader>vf",
                function()
                    vscode.call("editor.action.formatDocument")
                end,
                opts("Format document"),
            },
        }
        vim.custom.fn.set_keymaps(mappings)
    end,
}
