local languages = require("utils.languages")

local lsp_configs = languages.filter_languages({
    lua = {
        "lua",
    },
    c = {
        "clangd",
        "cmake",
    },
    python = {
        "pyright",
        -- "pylsp",
        -- "ruff",
        -- "pylyzer",
    },
    -- dart = {
    --     "dartls",
    -- },
    go = {
        "gopls",
    },
    rust = {
        "rust_analyzer",
    },
    web = {
        "ts_ls",
        "tailwindcss",
        "html",
    },
    -- julia = {
    --     "julials",
    -- },
    misc = {
        "taplo",
        "jsonls",
    },
})

for _, lsp_config in ipairs(lsp_configs) do
    require("plugin.config.lspconfig.config." .. lsp_config)
end

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
