return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = require("core.keymaps").lazy("which_key"),
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    config = function(_)
        local wk = require("which-key")
        local style = require("config").style

        wk.setup({
            delay = 500,
            win = {
                padding = { 1, 1 },
                border = style.border,
            },
        })
        wk.add(require("core.keymaps").which_key_groups())
    end,
}
