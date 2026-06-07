return {
    setup = function(opts)
        opts = opts or {}
        local table_utils = require("utils")
        local options = require("config").options
        table_utils.extend(vim.opt, options)

        vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
        if opts.colors ~= false then
            vim.opt.termguicolors = true
        end

        vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

        vim.opt.isfname:append("@-@")

        vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
            command = "silent! checktime",
            desc = "Auto-reload files changed outside of Neovim",
        })

        if opts.laststatus ~= false then
            vim.opt.laststatus = 3
        end

        if opts.clipboard ~= false then
            vim.g.clipboard = {
                name = "OSC 52",
                copy = {
                    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
                    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
                },
                paste = {
                    ["+"] = function()
                        return { vim.fn.getreg('+"'), vim.fn.getregtype('+"') }
                    end,
                    ["*"] = function()
                        return { vim.fn.getreg('*"'), vim.fn.getregtype('*"') }
                    end,
                },
            }
        end
    end,
}
