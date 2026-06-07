return {
    "stevearc/conform.nvim",
    keys = require("core.keymaps").lazy("conform"),
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
        local resolved = require("utils.language").get_tool_resolved()
        return {
            formatters_by_ft = resolved.formatters_by_ft,
            formatters = resolved.formatter_overrides,
            default_format_opts = { lsp_format = "fallback" },
        }
    end,
}
