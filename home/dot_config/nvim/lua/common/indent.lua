local find_in_list = function(list, ft)
    for _, v in pairs(list) do
        if v == ft then
            return true
        end
    end
    return false
end

return {
    setup = function(bufnr)
        -- Indent style settings
        local table_utils = require("utils.table")
        local config = require("config").indent
        local options = {}

        table_utils.extend(options, config.default.options)

        local filetype = vim.bo[bufnr].filetype
        for _, extra in pairs(config.extras) do
            if find_in_list(extra.filetypes, filetype) then
                table_utils.extend(options, extra.options)
                break
            end
        end

        table_utils.extend(vim.opt_local, options)
    end,
}
