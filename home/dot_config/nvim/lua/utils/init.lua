local M = {}
local config_loader = require("utils.config_loader")
local highlight = require("utils.highlight")
local mappings = require("utils.mappings")
local table_utils = require("utils.table")

M.extend = table_utils.extend
M.deep_extend = table_utils.deep_extend
M.get_keys = table_utils.get_keys
M.match_words = table_utils.match_words
M.split_str = table_utils.split_str
M.array_last_n = table_utils.array_last_n
M.pinspect = table_utils.pinspect

M.remove_ext = config_loader.remove_ext
M.remove_path_prefix = config_loader.remove_path_prefix
M.extract_module_name = config_loader.extract_module_name
M.load_disable = config_loader.load_disable
M.read_config_files = config_loader.read_config_files

M.set_keymaps = mappings.set_keymaps
M.opts_with_desc = mappings.opts_with_desc

M.set_highlights = highlight.set_highlights
M.update_highlights = highlight.update_highlights

M.buffer_infos = function()
    local results = {}
    local ls_output = vim.api.nvim_exec2("ls", { output = true }).output

    for line in string.gmatch(ls_output, "[^\n]+") do
        local bufnr = tonumber(string.gmatch(line, "(%d+)")())
        if bufnr ~= nil then
            line = string.gmatch(line, "%d+%s*(.*)")()
            local options = {}

            for i = 1, 5 do
                local option = string.sub(line, i, i)
                table.insert(options, i, option)
            end

            results[bufnr] = {
                bufnr = bufnr,
                info = {
                    unlisted = options[1] == "u",
                    current_win = options[2] == "%",
                    alternate = options[2] == "#",
                    active = options[3] == "a",
                    hidden = options[3] == "h",
                    modifiable_off = options[4] == "-",
                    read_only = options[4] == "=",
                    running_term = options[4] == "R",
                    finished_term = options[4] == "F",
                    none_term = options[4] == "?",
                    modifiable = options[5] == "+",
                    read_error = options[5] == "x",
                },
            }
        end
    end

    return results
end

return M
