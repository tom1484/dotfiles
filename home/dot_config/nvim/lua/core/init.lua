local M = {}

M.setup = function()
    require("core.bootstrap").setup()
    require("core.plugins").setup()
    vim.api.nvim_create_user_command("KeymapConflicts", function()
        local conflicts = require("core.keymaps").conflicts()
        if #conflicts == 0 then
            print("No keymap conflicts detected")
            return
        end

        local lines = { "Keymap conflicts:" }
        for _, conflict in ipairs(conflicts) do
            table.insert(lines, "- " .. conflict.id)
            for _, entry in ipairs(conflict.entries) do
                table.insert(lines, string.format("  %s: %s", entry.source, entry.desc))
            end
        end

        print(table.concat(lines, "\n"))
    end, { desc = "Show detected keymap conflicts" })
    require("common").setup()
end

return M
