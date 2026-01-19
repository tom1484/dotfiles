local M = {}

M.get_language_groups = function()
    local language_groups = require("language.group")
    local disabled = vim.g.disable.language

    local enabled_groups = {}
    for name, group in pairs(language_groups) do
        if not disabled[name] then
            enabled_groups[name] = group
        end
    end

    return enabled_groups
end

-- Generate a list of enabled null_ls entries
---@return table
M.get_null_ls_entries = function()
    local language_groups = M.get_language_groups()
    local builtin_enabled_entries = {
        formatting = {},
        diagnostics = {},
    }

    for _, lang in pairs(language_groups) do
        if lang.null_ls then
            for builtin, entries in pairs(builtin_enabled_entries) do
                if lang.null_ls[builtin] == nil then
                    goto continue
                end
                for _, entry in ipairs(lang.null_ls[builtin]) do
                    table.insert(entries, entry)
                end
                ::continue::
            end
        end
    end

    return builtin_enabled_entries
end

-- Generate a list of enabled languages
---@return table
M.get_lsp_entries = function()
    local language_groups = M.get_language_groups()
    local enabled_entries = {}

    for _, lang in pairs(language_groups) do
        if lang.lsp == nil then
            goto continue
        end
        for _, entry in ipairs(lang.lsp) do
            table.insert(enabled_entries, entry)
        end
        ::continue::
    end

    return enabled_entries
end

-- Generate a list of enabled languages
---@return table
M.enabled_dap_entries = function()
    local language_groups = M.get_language_groups()
    local enabled_entries = {}

    for _, lang in pairs(language_groups) do
        if lang.dap == nil then
            goto continue
        end
        for _, entry in ipairs(lang.dap) do
            table.insert(enabled_entries, entry)
        end
        ::continue::
    end

    return enabled_entries
end

return M
