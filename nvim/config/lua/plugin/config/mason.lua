local style = require("def.style")

require("mason").setup({
    ui = {
        border = style.border,
        -- height = 0.8,
        -- width = 60,
        -- icons = {
        -- 	package_installed = "✓",
        -- 	package_pending = "➜",
        -- 	package_uninstalled = "✗",
        -- },
    },
})

-- Linter
--     commitlint
--     eslint_d
--     jsonlint
--     revive
--     ruff
--     staticcheck
