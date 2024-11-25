return {
    set_keymaps = function(keymaps)
        for _, mapping in ipairs(keymaps) do
            vim.keymap.set(mapping[1], mapping[2], mapping[3], mapping[4])
        end
    end,
    opts_with_desc = function(opts)
        return function(desc)
            return vim.tbl_extend("force", opts, {
                desc = desc,
            })
        end
    end,
    get_keys = function(t)
        local keys = ""
        for key, _ in pairs(t) do
            keys = keys .. key .. "\n"
        end
        vim.notify(keys)
    end,
    update_hl = function(group, opts)
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
    end,
    find_files = function()
        require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = true,
        })
    end,
}
