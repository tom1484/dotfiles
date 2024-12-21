M = {}

M.import = function (plugin_folder)
    local configs = {}
    -- import all files in the plugin folder recursively
    for _, file in ipairs(vim.fn.globpath(plugin_folder, "**/*.lua", true, true)) do
        print(file)
        -- local config = require(file)
        -- table.insert(configs, config)
    end

    return configs
end

return M
