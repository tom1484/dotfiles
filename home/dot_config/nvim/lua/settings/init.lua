local table_utils = require("utils.table")
local validators = require("settings.validators")

local M = {}

local cache = nil

local function load_local_overrides()
    local path = vim.fn.stdpath("config") .. "/lua/.settings.lua"
    if vim.fn.filereadable(path) == 1 then
        return assert(loadfile(path))() or {}
    end
    return {}
end

local function load_settings()
    local settings = table_utils.deep_extend("force", require("settings.defaults"), load_local_overrides())
    validators.validate(settings)
    return settings
end

setmetatable(M, {
    __index = function(_, key)
        if cache == nil then
            cache = load_settings()
        end
        return cache[key]
    end,
})

M.reload = function()
    cache = load_settings()
    return cache
end

return M
