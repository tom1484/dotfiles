local config_loader = require("utils.config_loader")

local M = {}

M.load_disabled = function()
    local disable = config_loader.load_disable()
    vim.g.disable = disable
    return disable
end

M.collect_specs = function()
    local plugin_config_path = vim.fn.stdpath("config") .. "/lua/plugins"
    local plugin_configs =
        config_loader.read_config_files(plugin_config_path, { match_wildcards = { "*/*.lua", "*/*/init.lua" } })

    local plugin_config_list = {}
    local disabled_plugins = vim.g.disable.plugin or {}
    for name, config in pairs(plugin_configs) do
        if not disabled_plugins[name] then
            table.insert(plugin_config_list, config)
        end
    end

    return plugin_config_list
end

M.setup = function()
    local style = require("config").style

    M.load_disabled()

    require("lazy").setup(M.collect_specs(), {
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
end

return M
