local shared_lhs = {
    ["<leader>wt"] = true,
    ["<leader>wh"] = true,
    ["<leader>wv"] = true,
    J = true,
    K = true,
    ["<leader>y"] = true,
}

local M = {}

local function shared_entries()
    local entries = {}
    for _, entry in ipairs(require("core.keymaps").common_entries()) do
        if shared_lhs[entry.lhs or entry[1]] then
            table.insert(entries, entry)
        end
    end
    return entries
end

M.register = function()
    require("core.keymaps").register_entries(shared_entries())
    require("core.keymaps").register_entries(require("settings").keymaps.vscode)
end

M.lazy = function(plugin)
    local result = {}
    for _, entry in ipairs(require("settings").keymaps.vscode_lazy[plugin] or {}) do
        local spec = {
            entry.lhs or entry[1],
            entry.rhs or entry[2],
            mode = entry.mode or "n",
            desc = entry.desc,
            silent = entry.silent,
            noremap = entry.noremap,
            remap = entry.remap,
        }
        table.insert(result, spec)
    end
    return result
end

return M
