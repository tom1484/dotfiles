local lsp = require("lspconfig")

lsp.lua_ls.setup(require("plugin.lspconfig.utils.nvim_workspace")({
  library = vim.api.nvim_get_runtime_file("", true),
}))
