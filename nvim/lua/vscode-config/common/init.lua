return {
    setup = function()
        local keymap = require("vscode-config.common.keymap")
        local misc = require("vscode-config.common.misc")
        local buffer = require("vscode-config.common.buffer")

        vim.api.nvim_create_autocmd("BufEnter", {
            callback = buffer.setup,
        })

        keymap.setup()
        misc.setup()
    end,
}
