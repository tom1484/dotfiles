local opts = vim.custom.fn.opts_with_desc({
    silent = true,
})
local mappings = {
    {"n", "<leader>u", vim.cmd.UndotreeToggle, opts("Undotree")},
}
vim.custom.fn.set_keymaps(mappings)
