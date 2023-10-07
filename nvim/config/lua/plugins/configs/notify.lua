local notify = require("notify")

vim.opt.termguicolors = true
-- vim.notify = require("notify")

notify.setup({
    background_colour = "#000000",
    stages = "static",
    render = "minimal",
})
