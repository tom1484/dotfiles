require("mason-null-ls").setup({
  ensure_installed = {
    -- Formatter
    "beautysh", -- bash
    "clang-format", -- c, c++
    "cmakelang", -- cmake
    "gofumpt", -- go
    "goimports", -- go
    "prettierd", -- css, scss, less, html, json, jsonc, yaml, markdown, markdown.mdx, graphql, handlebars
    "rustfmt", -- rust
    "stylua", -- lua
    "autopep8", -- python
    "eslint_d", -- javascript, typescript
    -- Linter
    "cmakelang", -- cmake
    "jsonlint", -- json
    "revive", -- go
    "ruff", -- python
    "eslint_d", -- javascript, typescript
  },
})
