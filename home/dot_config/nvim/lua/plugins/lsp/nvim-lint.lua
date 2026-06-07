return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")
        local resolved = require("utils.language").get_tool_resolved()

        lint.linters_by_ft = resolved.linters_by_ft

        for name, cfg in pairs(resolved.linter_overrides or {}) do
            lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name] or {}, cfg)
        end

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("NvimLintTrigger", { clear = true }),
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
