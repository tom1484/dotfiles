local M = {}

M.get_language_groups = function()
    local language_groups = require("languages.group")
    local disabled = vim.g.disable.language

    local enabled_groups = {}
    for name, group in pairs(language_groups) do
        if not disabled[name] then
            enabled_groups[name] = group
        end
    end

    return enabled_groups
end

-- Generate a list of enabled formatter / linter tool names.
---@return table
M.get_tool_entries = function()
    local language_groups = M.get_language_groups()
    local entries = {
        formatters = {},
        linters = {},
    }

    for _, lang in pairs(language_groups) do
        if lang.tools then
            for kind, list in pairs(entries) do
                if lang.tools[kind] ~= nil then
                    for _, entry in ipairs(lang.tools[kind]) do
                        table.insert(list, entry)
                    end
                end
            end
        end
    end

    return entries
end

-- Resolve formatter/linter configs into the shapes conform, nvim-lint, and
-- mason-tool-installer each need.
---@return table
M.get_tool_resolved = function()
    local config_loader = require("utils.config_loader")
    local entries = M.get_tool_entries()
    local configs = {
        formatters = config_loader.read_config_files(
            vim.fn.stdpath("config") .. "/lua/languages/tools/formatters",
            { match_wildcards = { "*.lua" } }
        ),
        linters = config_loader.read_config_files(
            vim.fn.stdpath("config") .. "/lua/languages/tools/linters",
            { match_wildcards = { "*.lua" } }
        ),
    }

    local function append_unique(list, value)
        for _, existing in ipairs(list) do
            if existing == value then
                return
            end
        end
        table.insert(list, value)
    end

    local formatters_by_ft = {}
    local formatter_overrides = {}
    local linters_by_ft = {}
    local linter_overrides = {}
    local ensure_installed = {}

    for _, name in ipairs(entries.formatters) do
        local cfg = configs.formatters[name]
        if cfg then
            for _, ft in ipairs(cfg.filetypes or {}) do
                formatters_by_ft[ft] = formatters_by_ft[ft] or {}
                append_unique(formatters_by_ft[ft], name)
            end
            if cfg.config then
                formatter_overrides[name] = cfg.config
            end
            if cfg.mason then
                append_unique(ensure_installed, cfg.mason)
            end
        end
    end

    for _, name in ipairs(entries.linters) do
        local cfg = configs.linters[name]
        if cfg then
            for _, ft in ipairs(cfg.filetypes or {}) do
                linters_by_ft[ft] = linters_by_ft[ft] or {}
                append_unique(linters_by_ft[ft], name)
            end
            if cfg.config then
                linter_overrides[name] = cfg.config
            end
            if cfg.mason then
                append_unique(ensure_installed, cfg.mason)
            end
        end
    end

    return {
        formatters_by_ft = formatters_by_ft,
        formatter_overrides = formatter_overrides,
        linters_by_ft = linters_by_ft,
        linter_overrides = linter_overrides,
        ensure_installed = ensure_installed,
    }
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
