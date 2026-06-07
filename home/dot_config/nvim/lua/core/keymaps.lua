local mapping_utils = require("utils.mappings")

local M = {}

local validated = false

local function settings_keymaps()
    return require("settings").keymaps
end

local function is_enabled(entry)
    if entry.enabled == false then
        return false
    end
    if type(entry.condition) == "function" then
        return entry.condition()
    end
    return true
end

local function modes_of(entry)
    local mode = entry.mode or "n"
    if type(mode) == "table" then
        return mode
    end
    return { mode }
end

local function normalize_lazy_entry(entry)
    local spec = vim.deepcopy(entry)
    local lhs = spec.lhs or spec[1]
    local rhs = spec.rhs or spec[2]

    spec.lhs = nil
    spec.rhs = nil
    spec[1] = lhs
    spec[2] = rhs

    return spec
end

local function normalize_vim_mapping(entry)
    local opts = {}
    if entry.desc ~= nil then
        opts.desc = entry.desc
    end
    if entry.silent ~= nil then
        opts.silent = entry.silent
    end
    if entry.remap ~= nil then
        opts.remap = entry.remap
    end
    if entry.noremap ~= nil then
        opts.noremap = entry.noremap
    end
    if entry.nowait ~= nil then
        opts.nowait = entry.nowait
    end
    if entry.expr ~= nil then
        opts.expr = entry.expr
    end
    if entry.buffer ~= nil then
        opts.buffer = entry.buffer
    end

    return {
        entry.mode or "n",
        entry.lhs or entry[1],
        entry.rhs or entry[2],
        opts,
    }
end

local function conflict_id(entry, mode)
    local lhs = entry.lhs or entry[1]
    local ft = entry.ft or "*"
    return string.format("%s|%s|%s", mode, lhs, ft)
end

local function collect_conflicts()
    local buckets = {}
    local keymaps = settings_keymaps()

    local function add_entries(source, entries)
        for _, entry in ipairs(entries) do
            if is_enabled(entry) and not entry.allow_duplicate then
                for _, mode in ipairs(modes_of(entry)) do
                    local id = conflict_id(entry, mode)
                    buckets[id] = buckets[id] or {}
                    table.insert(buckets[id], {
                        source = source,
                        desc = entry.desc or "(no desc)",
                    })
                end
            end
        end
    end

    add_entries("common", keymaps.common)
    for plugin, entries in pairs(keymaps.lazy) do
        add_entries("lazy:" .. plugin, entries)
    end

    local conflicts = {}
    for id, entries in pairs(buckets) do
        if #entries > 1 then
            table.insert(conflicts, {
                id = id,
                entries = entries,
            })
        end
    end

    table.sort(conflicts, function(a, b)
        return a.id < b.id
    end)

    return conflicts
end

M.conflicts = collect_conflicts

M.validate = function()
    if validated then
        return
    end
    validated = true

    local conflicts = collect_conflicts()
    if #conflicts == 0 then
        return
    end

    local lines = { "Keymap conflicts detected:" }
    for _, conflict in ipairs(conflicts) do
        table.insert(lines, "- " .. conflict.id)
        for _, entry in ipairs(conflict.entries) do
            table.insert(lines, string.format("  %s: %s", entry.source, entry.desc))
        end
    end

    vim.schedule(function()
        vim.notify(table.concat(lines, "\n"), vim.log.levels.WARN)
    end)
end

M.register_common = function()
    M.register_entries(settings_keymaps().common)
end

M.register_entries = function(entries)
    M.validate()

    local mappings = {}
    for _, entry in ipairs(entries) do
        if is_enabled(entry) then
            table.insert(mappings, normalize_vim_mapping(entry))
        end
    end

    mapping_utils.set_keymaps(mappings)
end

M.common_entries = function()
    return vim.deepcopy(settings_keymaps().common)
end

M.lazy = function(plugin)
    M.validate()

    local result = {}
    for _, entry in ipairs(settings_keymaps().lazy[plugin] or {}) do
        if is_enabled(entry) then
            table.insert(result, normalize_lazy_entry(entry))
        end
    end

    return result
end

M.which_key_groups = function()
    return vim.deepcopy(settings_keymaps().which_key_groups)
end

return M
