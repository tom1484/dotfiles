if vim.g.vscode then
    require("env.vscode").setup()
else
    require("env.nvim").setup()
end
