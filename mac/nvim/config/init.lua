if vim.g.vscode then
    -- VSCode extension
    require("vscode-config")
else
    -- ordinary Neovim
    vim.g.mapleader = " "

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local style = require("def.style")

    -- Bootstrap lazy.nvim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    end
    vim.opt.rtp:prepend(lazypath)

    -- Load plugin configs
    local utils = require("utils")
    local nvim_config_path = vim.fn.stdpath("config")
    local plugin_configs = utils.get_plugin_configs(nvim_config_path)

    require("lazy").setup(plugin_configs, {
        ui = { border = style.border },
        defaults = { lazy = true },
        -- install = { colorscheme = { "vscode" } },
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
        -- debug = true,
    })

    local config = require("config")
    config.setup()
end
