local table_utils = require("utils.table")

local M = {}

-- Remove lua file extension
---@param path string
---@return string
M.remove_ext = function(path)
    return string.sub(path, 1, -5)
end

-- Remove path prefix
---@param path string
---@param prefix string
---@return string
M.remove_path_prefix = function(path, prefix)
    local _, index = string.find(path, prefix, 1, true)
    if not index then
        return path
    end

    if string.sub(path, index + 1, index + 1) == "/" then
        return string.sub(path, index + 2)
    end

    return string.sub(path, index + 1)
end

-- Extract module name from path
---@param path string
---@param no_ext boolean|nil
---@return string
M.extract_module_name = function(path, no_ext)
    local _, index = string.find(path, "lua/", 1, true)
    local ending = not no_ext and -5 or nil
    local module_path = string.sub(path, index + 1, ending)
    return module_path
end

local function convert_array_to_dict(array)
    local dict = {}
    for _, item in ipairs(array) do
        dict[item] = true
    end
    return dict
end

local function recursive_convert_array_to_dict(dict)
    for k, v in pairs(dict) do
        if type(v) == "table" then
            if #v > 0 then
                dict[k] = convert_array_to_dict(v)
            else
                recursive_convert_array_to_dict(v)
            end
        end
    end
end

M.load_disable = function()
    local disable = { language = {}, plugin = {} }
    local local_disable_file_path = vim.fn.stdpath("config") .. "/lua/.disable.lua"
    if vim.fn.filereadable(local_disable_file_path) == 1 then
        local local_disable = assert(loadfile(local_disable_file_path))() or {}
        disable = local_disable
    end
    recursive_convert_array_to_dict(disable)

    return disable
end

---@param config_dir string
---@param opts table|nil
---@return table
M.read_config_files = function(config_dir, opts)
    local incoming_opts = opts or {}
    opts = {
        match_wildcards = { "*.lua" },
    }
    table_utils.extend(opts, incoming_opts)

    local configs = {}
    local match_lists = {}
    for _, wildcard in ipairs(opts.match_wildcards) do
        table.insert(match_lists, vim.fn.globpath(config_dir, wildcard, true, true))
    end

    local matches = {}
    for _, match_list in ipairs(match_lists) do
        for _, match in ipairs(match_list) do
            table.insert(matches, match)
        end
    end

    for _, full_path in ipairs(matches) do
        local module_path = M.extract_module_name(full_path)
        if string.find(module_path, "/_", 1, true) == nil then
            local config = require(module_path)
            local rel = M.remove_path_prefix(full_path, config_dir)
            local entry_name = rel:gsub("%.lua$", "")
            configs[entry_name] = config
        end
    end

    return configs
end

return M
