return {
    setup = function()
        vim.custom = {
            fn = {},
        }

        vim.custom.fn.set_keymaps = function(keymaps)
            for _, mapping in ipairs(keymaps) do
                vim.keymap.set(mapping[1], mapping[2], mapping[3], mapping[4])
            end
        end

        vim.custom.fn.opts_with_desc = function(opts)
            return function(desc)
                return vim.tbl_extend("force", opts, {
                    desc = desc,
                })
            end
        end

        vim.custom.fn.get_keys = function(t)
            local keys = ""
            for key, _ in pairs(t) do
                keys = keys .. key .. "\n"
            end
            vim.notify(keys)
        end
    end,
}
