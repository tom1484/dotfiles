return {
    setup = function()
        -- Indent style settings
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.shiftwidth = 4

        local tab_ft = {
            "go",
            "make",
        }
        local two_space_ft = {
            "css",
            "scss",
            "jsonc",
            "json",
            "yaml",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "html",
            "cmake",
            "prisma",
            "sql",
            "dart",
        }

        local find_in_list = function(list, ft)
            for _, v in pairs(list) do
                if v == ft then
                    return true
                end
            end
            return false
        end

        local ft = vim.opt.filetype._value
        if find_in_list(tab_ft, ft) then
            vim.opt.expandtab = false
        else
            vim.opt.expandtab = true
            if find_in_list(two_space_ft, ft) then
                vim.opt.tabstop = 2
                vim.opt.softtabstop = 2
                vim.opt.shiftwidth = 2
            end
        end
    end,
}
-- return function()
--   -- Indent style settings
--   vim.opt.tabstop = 2
--   vim.opt.softtabstop = 2
--   vim.opt.shiftwidth = 2
--
--   local tab_ft = {
--     "go",
--     "make",
--   }
--   local four_space_ft = {
--     -- "css",
--     -- "scss",
--     -- "jsonc",
--     -- "json",
--     -- "yaml",
--     -- "javascript",
--     -- "typescript",
--     -- "javascriptreact",
--     -- "typescriptreact",
--     -- "html",
--   }
--
--   local find_in_list = function(list, ft)
--     for _, v in pairs(list) do
--       if v == ft then
--         return true
--       end
--     end
--     return false
--   end
--
--   local ft = vim.opt.filetype._value
--   if find_in_list(tab_ft, ft) then
--     vim.opt.expandtab = false
--   else
--     vim.opt.expandtab = true
--     if find_in_list(four_space_ft, ft) then
--       vim.opt.tabstop = 4
--       vim.opt.softtabstop = 4
--       vim.opt.shiftwidth = 4
--     end
--   end
-- end
