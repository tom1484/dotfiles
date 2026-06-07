local M = {}

local function patch_notify()
    local notify = vim.notify
    vim.notify = function(msg, ...)
        if msg:match("warning: multiple different client offset_encodings") then
            return
        end
        if msg:match("deprecated") or msg:match("tbl_add_reverse") then
            return
        end
        notify(msg, ...)
    end
end

M.setup = function()
    vim.g.mapleader = " "
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    patch_notify()
    require("env.vscode.plugins").setup()
    require("common.misc").setup({
        clipboard = false,
        colors = false,
        laststatus = false,
    })

    local buffer = require("common.buffer")
    local group = vim.api.nvim_create_augroup("UserVscodeCommonConfig", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(args)
            buffer.setup(args.buf)
        end,
    })

    require("env.vscode.keymaps").register()
end

return M
