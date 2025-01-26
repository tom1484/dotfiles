return {
    "github/copilot.vim",
    enabled = true,
    event = "VeryLazy",
    lazy = false,
    config = function()
        vim.api.nvim_set_keymap("i", "<C-Space>", 'copilot#Accept("")', { silent = true, expr = true })
        vim.g.copilot_no_tab_map = true
        -- vim.g.copilot_assume_mapped = true
    end,
}
