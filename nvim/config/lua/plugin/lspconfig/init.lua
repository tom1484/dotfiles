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

lsp.lua_ls.setup(require("plugin.lspconfig.nvim_workspace")({
  library = vim.api.nvim_get_runtime_file("", true),
}))
lsp.pyright.setup({})
lsp.clangd.setup({})
lsp.cmake.setup({})
lsp.gopls.setup({})
lsp.html.setup({})
lsp.jsonls.setup({})
lsp.julials.setup({})
lsp.rust_analyzer.setup({})
lsp.tailwindcss.setup({})
lsp.taplo.setup({})
lsp.pyright.setup({})
lsp.tsserver.setup({})

-- LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = require("plugin.lspconfig.attach_callback"),
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
