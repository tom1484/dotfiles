local lsp = require("lsp-zero").preset({
  float_border = "rounded",
  manage_nvim_cmp = false,
  -- manage_nvim_cmp = true,
})
local lspconfig = require("lspconfig")

local telescope_builtin = require("telescope.builtin")

lsp.ensure_installed({
  "clangd",
  "cmake",
  "gopls",
  "html",
  "jsonls",
  "julials",
  "lua_ls",
  "rust_analyzer",
  "tailwindcss",
  "taplo",
  "pyright",
  "tsserver",
})

-- Configure servers

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

-- Set additional settings

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
})

lsp.on_attach(function(client, bufnr)
  local lsp_signature = require("lsp_signature")
  lsp_signature.on_attach({
    bind = true,
    floating_window = false,
    -- floating_window = true,
    handler_opts = {
      border = "rounded",
    },
  }, bufnr)

  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "<leader>v", function() end)

  vim.keymap.set("n", "<leader>vh", function()
    vim.lsp.buf.hover()
  end, opts)

  vim.keymap.set("n", "<leader>ve", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "<leader>vne", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "<leader>vpe", function()
    vim.diagnostic.goto_prev()
  end, opts)

  vim.keymap.set("n", "<leader>vca", function()
    vim.lsp.buf.code_action()
  end, opts)

  vim.keymap.set("n", "<leader>vrn", function()
    vim.lsp.buf.rename()
  end, opts)

  -- Telescope

  vim.keymap.set("n", "<leader>vre", function()
    telescope_builtin.lsp_references()
  end, opts)

  vim.keymap.set("n", "<leader>vdi", function()
    telescope_builtin.diagnostics()
  end, opts)

  vim.keymap.set("n", "<leader>vde", function()
    telescope_builtin.lsp_definitions({
      jump_type = "tab",
    })
  end, opts)

  vim.keymap.set("n", "<leader>vim", function()
    telescope_builtin.lsp_implementations({
      jump_type = "tab",
    })
  end, opts)

  vim.keymap.set("n", "<leader>vds", function()
    telescope_builtin.lsp_document_symbols()
  end, opts)

  vim.keymap.set("n", "<leader>vws", function()
    telescope_builtin.lsp_workspace_symbols()
  end, opts)
end)

lsp.setup({
  window = {
    border = "rounded",
  },
})

vim.diagnostic.config({
  virtual_text = true,
})

local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end
  notify(msg, ...)
end
