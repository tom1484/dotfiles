local lsp = require("lspconfig")

lsp.lua_ls.setup(require("plugin.config.lspconfig.util.nvim_workspace")({
    library = vim.api.nvim_get_runtime_file("", true),
}))
