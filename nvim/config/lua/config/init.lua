return {
    setup = function()
        local keymap = require("config.keymap")
        local misc = require("config.misc")
        local indent = require("config.indent")
        local buffer = require("config.buffer")
        local color = require("config.color")

        vim.api.nvim_create_autocmd("FileType", {
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
