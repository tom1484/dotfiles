local M = {}

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

return M
