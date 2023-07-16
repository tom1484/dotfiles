-- vim.cmd([[imap <silent><script><expr> <C-Space> copilot#Accept("")]])
-- vim.cmd([[let g:copilot_no_tab_map = v:true]])
vim.api.nvim_set_keymap("i", "<C-Space>", 'copilot#Accept("")', { silent = true, expr = true })
vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
