return function()
    local opts = vim.custom.fn.opts_with_desc({})
    local silent_opts = vim.custom.fn.opts_with_desc({
        silent = true,
    })
    local mappings = {
        -- panes manipulation
        { "n", "<leader>wt", ":tabe ", opts("New tab") },
        { "n", "<leader>wh", ":vsplit ", opts("New vertical split") },
        { "n", "<leader>wv", ":split ", opts("New horizontal split") },
        -- line manipulation
        { "v", "J", ":m '>+1<CR>gv=gv", silent_opts("Move lines down") },
        { "v", "K", ":m '<-2<CR>gv=gv", silent_opts("Move lines up") },
        -- scroll
        { "n", "<C-d>", "<C-d>zz", silent_opts("Scroll down") },
        { "n", "<C-u>", "<C-u>zz", silent_opts("Scroll up") },
        -- register
        { "v", "<leader>y", [["+y]], silent_opts("Copy to system") },
        -- replace and search
        { "n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts("Replace word") },
        { "n", "<leader>h", [[/\<<C-r><C-w>\>]], opts("Search word") },
        -- tab navigation
        { "n", "<leader>1", "1gt", silent_opts("Tab 1") },
        { "n", "<leader>2", "2gt", silent_opts("Tab 2") },
        { "n", "<leader>3", "3gt", silent_opts("Tab 3") },
        { "n", "<leader>4", "4gt", silent_opts("Tab 4") },
        { "n", "<leader>5", "5gt", silent_opts("Tab 5") },
        { "n", "<leader>6", "6gt", silent_opts("Tab 6") },
        { "n", "<leader>7", "7gt", silent_opts("Tab 7") },
        { "n", "<leader>8", "8gt", silent_opts("Tab 8") },
        { "n", "<leader>9", "9gt", silent_opts("Tab 9") },
        { "n", "<leader>0", "10gt", silent_opts("Tab 10") },
        -- save and quit
        { "n", "W", ":w<CR>", silent_opts("Save") },
        { "n", "Q", ":q<CR>", silent_opts("Quit") },
        -- window navigation
        { "n", "<C-H>", "<C-W>h", silent_opts("Go to left window") },
        { "n", "<C-J>", "<C-W>j", silent_opts("Go to down window") },
        { "n", "<C-K>", "<C-W>k", silent_opts("Go to up window") },
        { "n", "<C-L>", "<C-W>l", silent_opts("Go to right window") },
        -- next greatest remap ever : asbjornHaland
        -- {{ "n", "v" }, "<leader>y", [["+y]]},
        -- {"n", "<leader>Y", [["+Y]]},
        -- {"v", "<leader>y", [["+y]]},
        -- {"n", "<leader>S", [[:%s/\<<C-r>+\>/<C-r><C-w>/gI<Left><Left><Left>]]},

        -- {{ "n", "v" }, "<leader>d", [["_d]]},

        -- This is going to get me cancelled
        -- {{ "i", "c" }, "<A-BS>", "<C-w>"},
        -- {{ "i", "c" }, "<A-h>", "<LEFT>"},
        -- {{ "i", "c" }, "<A-j>", "<DOWN>"},
        -- {{ "i", "c" }, "<A-k>", "<UP>"},
        -- {{ "i", "c" }, "<A-l>", "<RIGHT>"},
    }
    vim.custom.fn.set_keymaps(mappings)
end
