-- ordinary Neovim
vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local style = require("def.style")

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

-- Bootstrap lazy.nvim
local plugin_path = vim.fn.stdpath("data") .. "/vscode/lazy"
local lazypath = plugin_path .. "/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugin configs
local utils = require("utils")
local plugin_config_path = vim.fn.stdpath("config") .. "/lua/vscode-config/plugin"
local plugin_configs = utils.get_plugin_configs(plugin_config_path, false)

require("lazy").setup(plugin_configs, {
    ui = { border = style.border },
    defaults = { lazy = true },
    checker = { enabled = false },
    change_detection = { enabled = true },
    performance = {
        rtp = {
            disabled_plugins = {
                "netrw",
                -- "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                -- "tarPlugin",
                -- "tohtml",
                -- "tutor",
                -- "zipPlugin",
            },
        },
    },
    root = plugin_path,
    -- debug = true,
})

local config = require("vscode-config.config")
config.setup()
