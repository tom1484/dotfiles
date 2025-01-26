return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = function()
        local style = require("def.style")
        return {
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
        }
    end,
    config = function(_, opts)
        require("mason").setup(opts)
    end,
}
