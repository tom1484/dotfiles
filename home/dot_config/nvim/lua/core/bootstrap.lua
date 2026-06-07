local M = {}

M.setup = function()
    vim.g.mapleader = " "

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    end
    vim.opt.rtp:prepend(lazypath)
end

return M
