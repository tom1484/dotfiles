vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local keymaps_setup = require("keymaps")
local config_setup = require("config")
local ftconfig_setup = require("ftconfig")
local buffer_setup = require("buffer")
local utils_setup = require("utils")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    keymaps_setup()
    config_setup()
    utils_setup()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    ftconfig_setup()
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    buffer_setup()
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", require("configurations"))

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- require("commands")
  end,
})
