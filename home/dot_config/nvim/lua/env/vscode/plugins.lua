local config_loader = require("utils.config_loader")

local M = {}

M.collect_specs = function()
    local plugin_config_path = vim.fn.stdpath("config") .. "/lua/env/vscode/plugins"
    return config_loader.read_config_files(plugin_config_path, { match_wildcards = { "*/*.lua", "*/*/init.lua" } })
end

M.setup = function()
    local style = require("config").style
    local plugin_path = vim.fn.stdpath("data") .. "/vscode/lazy"
    local lazypath = plugin_path .. "/lazy.nvim"

    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    end
    vim.opt.rtp:prepend(lazypath)

    local plugin_config_list = {}
    for _, config in pairs(M.collect_specs()) do
        table.insert(plugin_config_list, config)
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
                },
            },
        },
        root = plugin_path,
    })
end

return M
