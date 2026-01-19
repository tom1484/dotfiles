local M = {}

-- This is a force extend function dedicated for small right table
---@param options table
---@param extra table
M.extend = function(options, extra)
    for key, value in pairs(extra) do
        options[key] = value
    end
end

M.deep_extend = function(behavior, ...)
    local result = {}
    local function merge_table(t1, t2)
        for k, v in pairs(t2) do
            if type(v) == "table" and type(t1[k]) == "table" then
                if behavior == "force" then
                    t1[k] = merge_table(t1[k], v)
                elseif behavior == "keep" then
                    t1[k] = merge_table(v, t1[k])
                end
            elseif type(k) == "number" then
                table.insert(t1, v)
            else
                if behavior == "force" or t1[k] == nil then
                    t1[k] = v
                end
            end
        end
        return t1
    end
    for _, t in ipairs({ ... }) do
        result = merge_table(result, t)
    end
    return result
end

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

    -- check if starts with slash
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
    -- Disable plugins in disable.lua
    local disable = vim.deepcopy(require("disable"), true) or {}
    local local_disable_file_path = vim.fn.stdpath("config") .. "/lua/.disable.lua"
    if vim.fn.filereadable(local_disable_file_path) == 1 then
        local local_disable = assert(loadfile(local_disable_file_path))() or {}
        disable = M.deep_extend("keep", disable, local_disable)
    end

    recursive_convert_array_to_dict(disable)

    return disable
end

---@param config_dir string
---@param opts table
---@return table
M.read_config_files = function(config_dir, opts)
    local incomming_opts = opts or {}
    opts = {
        match_wildcards = { "*.lua" },
        -- keep_name = false,
    }
    M.extend(opts, incomming_opts)

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
        -- If start with _, skip
        if string.find(module_path, "/_", 1, true) == nil then
            local config = require(module_path)
            local entry_name = M.remove_ext(M.remove_path_prefix(full_path, config_dir))
            configs[entry_name] = config
        end
    end

    return configs
end

M.set_keymaps = function(keymaps)
    for _, mapping in ipairs(keymaps) do
        vim.keymap.set(mapping[1], mapping[2], mapping[3], mapping[4])
    end
end

M.opts_with_desc = function(opts)
    if opts == nil then
        return function(desc)
            return {
                desc = desc,
            }
        end
    else
        return function(desc)
            return vim.tbl_extend("force", opts, {
                desc = desc,
            })
        end
    end
end

M.get_keys = function(t)
    local keys = ""
    for key, _ in pairs(t) do
        keys = keys .. key .. "\n"
    end
    vim.notify(keys)
end

M.set_highlights = function(groups, opts)
    if type(groups) == "string" then
        groups = { groups }
    end

    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

M.update_highlights = function(groups, opts)
    if type(groups) == "string" then
        groups = { groups }
    end

    for _, group in ipairs(groups) do
        local res = vim.api.nvim_get_hl(0, {
            name = group,
        })
        while res.link do
            res = vim.api.nvim_get_hl(0, {
                name = res.link,
            })
        end
        res = vim.tbl_extend("force", res, opts)
        vim.api.nvim_set_hl(0, group, res)
    end
end

M.match_words = function(list, pattern)
    local matchedEntries = {}

    -- Iterate through the list and apply the pattern
    for _, str in ipairs(list) do
        if string.match(str, pattern) then
            table.insert(matchedEntries, str)
        end
    end

    return matchedEntries
end

M.split_str = function(str, target)
    local result = {}
    for word in string.gmatch(str, "([^" .. target .. "]+)") do
        table.insert(result, word)
    end
    return result
end

M.array_last_n = function(list, n)
    local result = {}
    local N = #list
    local i = N - n + 1
    while i <= N do
        table.insert(result, list[i])
        i = i + 1
    end
    return result
end

M.pinspect = function(obj)
    print(vim.inspect(obj))
end

M.buffer_infos = function()
    local results = {}
    local ls_output = vim.api.nvim_exec2("ls", { output = true }).output

    for line in string.gmatch(ls_output, "[^\n]+") do
        local bufnr = tonumber(string.gmatch(line, "(%d+)")())
        if bufnr ~= nil then
            line = string.gmatch(line, "%d+%s*(.*)")()
            local options = {}

            for i = 1, 5 do
                local option = string.sub(line, i, i)
                table.insert(options, i, option)
            end

            results[bufnr] = {
                bufnr = bufnr,
                info = {
                    unlisted = options[1] == "u",
                    current_win = options[2] == "%",
                    alternate = options[2] == "#",
                    active = options[3] == "a",
                    hidden = options[3] == "h",
                    modifiable_off = options[4] == "-",
                    read_only = options[4] == "=",
                    running_term = options[4] == "R",
                    finished_term = options[4] == "F",
                    none_term = options[4] == "?",
                    modifiable = options[5] == "+",
                    read_error = options[5] == "x",
                },
            }
        end
    end

    return results
end

return M
