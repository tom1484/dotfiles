require("marks").setup({})

vim.keymap.set("n", "<leader>m", function()
  vim.cmd("MarksListAll")
end)
