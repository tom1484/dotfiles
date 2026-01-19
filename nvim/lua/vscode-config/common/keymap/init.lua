local vscode = require("vscode")
local util = require("util")

return {
    setup = function()
        local basic_mappings = require("vscode-config.common.keymap.basic")
        local vscode_mappings = require("vscode-config.common.keymap.vscode")

        local merged_mappings = vim.list_extend(basic_mappings, vscode_mappings)
        util.set_keymaps(merged_mappings)
    end,
}
