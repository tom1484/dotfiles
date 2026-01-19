local find_in_list = function(list, ft)
    for _, v in pairs(list) do
        if v == ft then
            return true
        end
    end
    return false
end

return {
    setup = function()
        -- Indent style settings
        local utils = require("util")
        local config = require("config").indent
        local options = {}

        utils.extend(options, config.default.options)

        local filetype = vim.opt.filetype._value
        for _, extra in pairs(config.extras) do
            if find_in_list(extra.filetypes, filetype) then
                -- options = vim.tbl_extend("force", options, extra.options)
                utils.extend(options, extra.options)
                break
            end
        end

        -- vim.opt = vim.tbl_extend("force", vim.opt, options)
        utils.extend(vim.opt, options)
    end,
}
