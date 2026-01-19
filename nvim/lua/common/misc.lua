return {
    setup = function()
        local utils = require("util")
        local options = require("config").options
        utils.extend(vim.opt, options)

        vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
        vim.opt.termguicolors = true

        vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

        vim.opt.isfname:append("@-@")

        vim.opt.laststatus = 3
    end,
}
