return function()
    -- backward kill word
    vim.keymap.set("i", "<C-H>", "<C-w>")
    -- vim.keymap.set("i", "<C-H>", "<C-w>")
    -- vim.keymap.set("i", "<C-^>", "<C-O>b", { silent = true })
    -- vim.keymap.set("i", "<C-L>", "<C-O>w", { silent = true })

	-- netrw
	-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

	-- panes manipulation
	vim.keymap.set("n", "<leader>wt", ":tabe ")
	vim.keymap.set("n", "<leader>wh", ":vsplit ")
	vim.keymap.set("n", "<leader>wv", ":split ")

	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

	-- vim.keymap.set("n", "J", "mzJ`z")
	vim.keymap.set("n", "<C-d>", "<C-d>zz")
	vim.keymap.set("n", "<C-u>", "<C-u>zz")
	-- vim.keymap.set("n", "n", "nzzzv")
	-- vim.keymap.set("n", "N", "Nzzzv")

	-- vim.keymap.set("n", "<leader>vwm", function()
	-- 	require("vim-with-me").StartVimWithMe()
	-- end)
	-- vim.keymap.set("n", "<leader>svwm", function()
	-- 	require("vim-with-me").StopVimWithMe()
	-- end)

	-- greatest remap ever
	vim.keymap.set("x", "p", '"0P')
	vim.keymap.set("x", "<leader>p", "p")

	-- next greatest remap ever : asbjornHaland
	vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
	vim.keymap.set("n", "<leader>Y", [["+Y]])

	vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

	-- This is going to get me cancelled
	vim.keymap.set("i", "<C-c>", "<Esc>")

	vim.keymap.set("n", "Q", "<nop>")
	-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
	-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

	-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
	-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
	-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
	-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

	vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
	-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

	-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

	vim.keymap.set("n", "<leader>1", "1gt")
	vim.keymap.set("n", "<leader>2", "2gt")
	vim.keymap.set("n", "<leader>3", "3gt")
	vim.keymap.set("n", "<leader>4", "4gt")
	vim.keymap.set("n", "<leader>5", "5gt")
	vim.keymap.set("n", "<leader>6", "6gt")
	vim.keymap.set("n", "<leader>7", "7gt")
	vim.keymap.set("n", "<leader>8", "8gt")
	vim.keymap.set("n", "<leader>9", "9gt")
end
