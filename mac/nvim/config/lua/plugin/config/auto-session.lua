require("auto-session").setup({
    log_level = "error",
    auto_restore_enabled = true,
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
})

local function opts(desc)
    return {
        noremap = true,
        -- silent = true,
        desc = desc,
    }
end
vim.custom.fn.set_keymaps({
    { "n", "<leader>sr", ":SessionRestore<CR>", opts("Restore session") },
    { "n", "<leader>sd", ":SessionDelete<CR>", opts("Delete session") },
    { "n", "<leader>ss", ":SessionSave<CR>", opts("Save session") },
})
