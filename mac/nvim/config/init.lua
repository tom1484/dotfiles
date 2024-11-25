if vim.g.vscode then
    -- VSCode extension
    require("vscode-config")
else
    -- ordinary Neovim
    vim.g.mapleader = " "

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local style = require("def.style")
    local config = require("config")
    config.setup()

    -- Bootstrap lazy.nvim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    end
    vim.opt.rtp:prepend(lazypath)

    -- Load plugin configs
    local nvim_config_path = vim.fn.stdpath("config")
    local plugin_config_path = nvim_config_path .. "/lua/plugins"

    local plugin_configs = require("plugin")
    for _, full_path in ipairs(vim.fn.globpath(plugin_config_path, "**/*.lua", true, true)) do
        local _, index = string.find(full_path, "lua/")
        local module_path = string.sub(full_path, index + 1, -5)
        -- If start with _, skip
        if string.find(module_path, "/_") == nil then
            local config = require(module_path)
            table.insert(plugin_configs, config)
        else
            -- print("Skip " .. module_path)
        end
    end

    -- require("lazy").setup("plugin", {
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
end
