if vim.g.vscode then
    -- VSCode extension
    require("vscode-config")
else
    -- ordinary Neovim
    vim.g.mapleader = " "

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local style = require("config").style

    -- Bootstrap lazy.nvim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    end
    vim.opt.rtp:prepend(lazypath)

    -- Load disable.lua and store into vim.g.disable
    local utils = require("util")
    local disable = utils.load_disable()
    vim.g.disable = disable

    -- Load plugin configs
    local plugin_config_path = vim.fn.stdpath("config") .. "/lua/plugin"
    local plugin_configs =
        utils.read_config_files(plugin_config_path, { match_wildcards = { "*/*.lua", "*/*/init.lua" } })

    local plugin_config_list = {}
    local disabled_plugins = vim.g.disable["plugin"]
    for name, config in pairs(plugin_configs) do
        if not disabled_plugins[name] then
            table.insert(plugin_config_list, config)
        end
    end

    require("lazy").setup(plugin_config_list, {
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
        -- debug = true,
    })

    require("common").setup()
end
