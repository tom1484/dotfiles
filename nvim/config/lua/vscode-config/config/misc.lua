local vscode = require("vscode")

return {
    setup = function()
        vim.opt.guicursor = "n-v-c:block,i:ver25"

        vim.opt.nu = true
        vim.opt.relativenumber = true

        vim.opt.smartindent = true

        vim.opt.wrap = false

        vim.opt.swapfile = false
        vim.opt.backup = false
        vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
        vim.opt.undofile = true

        vim.opt.hlsearch = false
        vim.opt.incsearch = true

        vim.opt.termguicolors = true

        vim.opt.scrolloff = 0
        vim.opt.signcolumn = "yes"
        vim.opt.isfname:append("@-@")

        vim.opt.updatetime = 50

        vim.opt.foldmethod = "indent"
        vim.opt.foldlevel = 99

        vim.opt.showcmd = false

        vim.opt.tagbsearch = false

        vim.opt.showtabline = 0

        vim.opt.list = true

        vim.notify = vscode.notify
        vim.opt.laststatus = 0
    end,
}
