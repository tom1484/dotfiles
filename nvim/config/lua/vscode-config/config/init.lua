return {
    setup = function()
        local keymap = require("vscode-config.config.keymap")
        local misc = require("vscode-config.config.misc")

        keymap.setup()
        misc.setup()

        local indent = require("vscode-config.config.indent")
        local buffer = require("vscode-config.config.buffer")

        vim.api.nvim_create_autocmd("FileType", {
            callback = indent.setup,
        })
        vim.api.nvim_create_autocmd("BufEnter", {
            callback = buffer.setup,
        })
    end,
}
