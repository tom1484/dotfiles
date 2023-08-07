local lsp = require("lspconfig")

lsp.clangd.setup({
  cmd = {
    vim.fn.expand("$HOME/.local/share/nvim/mason/bin/clangd"),
    "--background-index",
  },
})
