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

require("plugins.configs.lspconfig.configs.lua")
require("plugins.configs.lspconfig.configs.clangd")
require("plugins.configs.lspconfig.configs.pyright")
-- require("plugins.configs.lspconfig.configs.pylsp")
-- require("plugins.configs.lspconfig.configs.ruff")
-- require("plugins.configs.lspconfig.configs.pylyzer")
require("plugins.configs.lspconfig.configs.cmake")
require("plugins.configs.lspconfig.configs.gopls")
require("plugins.configs.lspconfig.configs.html")
require("plugins.configs.lspconfig.configs.jsonls")
require("plugins.configs.lspconfig.configs.rust_analyzer")
require("plugins.configs.lspconfig.configs.tailwindcss")
require("plugins.configs.lspconfig.configs.taplo")
require("plugins.configs.lspconfig.configs.tsserver")
-- require("plugins.configs.lspconfig.configs.arduino_language_server")
-- vim.notify("Config LSP")
-- require("plugins.configs.Arduino")

-- LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = require("plugins.configs.lspconfig.utils.attach_callback"),
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
    if msg:match("deprecated") or msg:match("tbl_add_reverse") then
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
