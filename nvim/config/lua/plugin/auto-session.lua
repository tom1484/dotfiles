require("auto-session").setup({
  log_level = "error",
  auto_restore_enabled = true,
  -- auto_restore_enabled = false,
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
})

vim.keymap.set("n", "<leader>rs", ":SessionRestore<CR>", { noremap = true, silent = true })
