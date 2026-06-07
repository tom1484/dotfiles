return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    config = function()
        local resolved = require("utils.language").get_tool_resolved()
        require("mason-tool-installer").setup({
            ensure_installed = resolved.ensure_installed,
        })
    end,
}
