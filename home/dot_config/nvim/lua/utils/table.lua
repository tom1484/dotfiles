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

M.get_keys = function(t)
    local keys = ""
    for key, _ in pairs(t) do
        keys = keys .. key .. "\n"
    end
    vim.notify(keys)
end

M.match_words = function(list, pattern)
    local matched_entries = {}

    for _, str in ipairs(list) do
        if string.match(str, pattern) then
            table.insert(matched_entries, str)
        end
    end

    return matched_entries
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
    local list_len = #list
    local i = list_len - n + 1
    while i <= list_len do
        table.insert(result, list[i])
        i = i + 1
    end
    return result
end

M.pinspect = function(obj)
    print(vim.inspect(obj))
end

return M
