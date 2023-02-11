require("telescope").setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "select_vertical",
				["<C-v>"] = "select_horizontal",
				["<C-t>"] = "select_tab",
				-- ["<CR>"] = "select_tab",
				["<Esc>"] = "close",
				["<S-Tab>"] = "move_selection_next",
				["<Tab>"] = "move_selection_previous",
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
})

local builtin = require("telescope.builtin")
-- local themes = require("telescope.themes")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})

-- vim.keymap.set("n", "<leader>ps", function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
-- vim.keymap.set("n", "<leader>ps", builtin.grep_string, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
