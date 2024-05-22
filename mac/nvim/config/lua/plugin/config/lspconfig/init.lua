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
-- "pylyzer"

require("plugin.config.lspconfig.config.lua")
require("plugin.config.lspconfig.config.clangd")
require("plugin.config.lspconfig.config.pyright")
-- require("plugin.config.lspconfig.config.pylsp")
-- require("plugin.config.lspconfig.config.ruff")
-- require("plugin.config.lspconfig.config.pylyzer")
require("plugin.config.lspconfig.config.cmake")
require("plugin.config.lspconfig.config.gopls")
require("plugin.config.lspconfig.config.html")
require("plugin.config.lspconfig.config.jsonls")
require("plugin.config.lspconfig.config.rust_analyzer")
require("plugin.config.lspconfig.config.tailwindcss")
require("plugin.config.lspconfig.config.taplo")
require("plugin.config.lspconfig.config.tsserver")
-- require("plugin.config.lspconfig.config.arduino_language_server")
-- vim.notify("Config LSP")
-- require("plugin.config.Arduino")

-- LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = require("plugin.config.lspconfig.util.attach_callback"),
})

vim.diagnostic.config({
    virtual_text = true,
    float = {
        border = "rounded",
    },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--     border = "rounded",
-- })
require("lspconfig.ui.windows").default_options.border = "rounded"
