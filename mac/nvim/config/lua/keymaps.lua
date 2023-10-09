return function()
    -- backward kill word
    -- vim.keymap.set("i", "<C-h>", "<C-w>")

    -- panes manipulation
    vim.keymap.set("n", "<leader>wt", ":tabe ")
    vim.keymap.set("n", "<leader>wh", ":vsplit ")
    vim.keymap.set("n", "<leader>wv", ":split ")

    vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
    vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

    vim.keymap.set("n", "<C-d>", "<C-d>zz")
    vim.keymap.set("n", "<C-u>", "<C-u>zz")

    -- next greatest remap ever : asbjornHaland
    -- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
    -- vim.keymap.set("n", "<leader>Y", [["+Y]])
    -- vim.keymap.set("v", "<leader>y", [["+y]])
    -- vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r>+\>/<C-r><C-w>/gI<Left><Left><Left>]])

    vim.keymap.set("v", "<leader>y", [["+y]])
    vim.keymap.set("v", "<leader>p", [["_p"]])
    vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

    -- This is going to get me cancelled
    vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

    vim.keymap.set("n", "<leader>1", "1gt")
    vim.keymap.set("n", "<leader>2", "2gt")
    vim.keymap.set("n", "<leader>3", "3gt")
    vim.keymap.set("n", "<leader>4", "4gt")
    vim.keymap.set("n", "<leader>5", "5gt")
    vim.keymap.set("n", "<leader>6", "6gt")
    vim.keymap.set("n", "<leader>7", "7gt")
    vim.keymap.set("n", "<leader>8", "8gt")
    vim.keymap.set("n", "<leader>9", "9gt")
    vim.keymap.set("n", "<leader>0", "10gt")

    vim.keymap.set("n", "W", ":w<CR>", { silent = true })
    vim.keymap.set("n", "Q", ":q<CR>", { silent = true })

    -- vim.keymap.set({ "i", "c" }, "<A-BS>", "<C-w>")
    -- vim.keymap.set({ "i", "c" }, "<A-h>", "<LEFT>")
    -- vim.keymap.set({ "i", "c" }, "<A-j>", "<DOWN>")
    -- vim.keymap.set({ "i", "c" }, "<A-k>", "<UP>")
    -- vim.keymap.set({ "i", "c" }, "<A-l>", "<RIGHT>")

    vim.keymap.set("n", "<C-H>", "<C-W>h")
    vim.keymap.set("n", "<C-J>", "<C-W>j")
    vim.keymap.set("n", "<C-K>", "<C-W>k")
    vim.keymap.set("n", "<C-L>", "<C-W>l")
end
