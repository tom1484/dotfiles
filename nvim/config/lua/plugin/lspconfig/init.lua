local lsp = require("lspconfig")

-- "clangd"
-- "cmake"
-- "gopls"
-- "html"
-- "jsonls"
-- "julials"
-- "lua_ls"
-- "rust_analyzer"
-- "tailwindcss"
-- "taplo"
-- "pyright"
-- "tsserver"
-- "arduino_language_server"

require("plugin.lspconfig.configs.lua")
require("plugin.lspconfig.configs.clangd")
require("plugin.lspconfig.configs.pyright")
require("plugin.lspconfig.configs.cmake")
require("plugin.lspconfig.configs.gopls")
require("plugin.lspconfig.configs.html")
require("plugin.lspconfig.configs.jsonls")
require("plugin.lspconfig.configs.rust_analyzer")
require("plugin.lspconfig.configs.tailwindcss")
require("plugin.lspconfig.configs.taplo")
require("plugin.lspconfig.configs.tsserver")
-- require("plugin.lspconfig.configs.arduino_language_server")
-- vim.notify("Config LSP")
-- require("plugin.Arduino")

-- LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = require("plugin.lspconfig.utils.attach_callback"),
})

vim.diagnostic.config({
  virtual_text = true,
  float = {
    border = "rounded",
  },
})

local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end
  notify(msg, ...)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--     border = "rounded",
-- })
require("lspconfig.ui.windows").default_options.border = "rounded"



