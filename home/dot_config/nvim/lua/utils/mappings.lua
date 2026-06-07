local M = {}

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
    end

    return function(desc)
        return vim.tbl_extend("force", opts, {
            desc = desc,
        })
    end
end

return M
