return {
    setup = function()
        local keymap = require("common.keymap")
        local misc = require("common.misc")
        local indent = require("common.indent")
        local buffer = require("common.buffer")
        local color = require("common.color")

        vim.api.nvim_create_autocmd("BufEnter", {
            callback = indent.setup,
        })
        vim.api.nvim_create_autocmd("BufEnter", {
            callback = buffer.setup,
        })

        keymap.setup()
        misc.setup()
        color.setup()
    end,
}
