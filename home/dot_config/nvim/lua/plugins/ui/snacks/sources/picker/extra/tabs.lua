-- ~/.config/nvim/lua/util/snacks_tabs.lua
local M = {}

-- Helper: get a label for each tab (e.g. "Tab 1: filename")
local function get_tab_label(tabnr)
    -- Get first window in the tab
    local wins = vim.api.nvim_tabpage_list_wins(tabnr)
    local bufnr = vim.api.nvim_win_get_buf(wins[1])
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name == "" then
        name = "[No Name]"
    end
    return string.format("Tab %d — %s", tabnr, vim.fn.fnamemodify(name, ":t"))
end

function M.list_tabs()
    -- Build a list of items for Snacks.picker
    local items = {}
    for _, tabid in ipairs(vim.api.nvim_list_tabpages()) do
        table.insert(items, {
            label = get_tab_label(tabid),
            tabnr = tabid,
        })
    end

    -- Create a new picker
    require("snacks.picker")
        .new({
            prompt_title = "Tabs List",
            items = items,
            format_item = function(item)
                return item.label
            end,
            confirm = function(selection)
                -- When confirmed, switch to the selected tab
                vim.api.nvim_set_current_tabpage(selection.tabnr)
            end,
        })
        .open()
end

return M
