local action_state = require("telescope.actions.state")
local log = require("telescope.log")
local utils = require("utils")

local tab_drop = function(prompt_bufnr)
    local Path = require("plenary.path")

    local command = action_state.select_key_to_edit_key("tab drop")
    local entry = action_state.get_selected_entry()

    if not entry then
        utils.notify("actions.set.edit", {
            msg = "Nothing currently selected",
            level = "WARN",
        })
        return
    end

    local filename, row, col

    if entry.path or entry.filename then
        filename = entry.path or entry.filename

        -- TODO: Check for off-by-one
        row = entry.row or entry.lnum
        col = entry.col
    elseif not entry.bufnr then
        -- TODO: Might want to remove this and force people
        -- to put stuff into `filename`
        local value = entry.value
        if not value then
            utils.notify("actions.set.edit", {
                msg = "Could not do anything with blank line...",
                level = "WARN",
            })
            return
        end

        if type(value) == "table" then
            value = entry.display
        end

        local sections = vim.split(value, ":")

        filename = sections[1]
        row = tonumber(sections[2])
        col = tonumber(sections[3])
    end

    local entry_bufnr = entry.bufnr

    local picker = action_state.get_current_picker(prompt_bufnr)
    require("telescope.pickers").on_close_prompt(prompt_bufnr)
    pcall(vim.api.nvim_set_current_win, picker.original_win_id)
    local win_id = picker.get_selection_window(picker, entry)

    if picker.push_cursor_on_edit then
        vim.cmd("normal! m'")
    end

    if picker.push_tagstack_on_edit then
        local from = { vim.fn.bufnr("%"), vim.fn.line("."), vim.fn.col("."), 0 }
        local items = { { tagname = vim.fn.expand("<cword>"), from = from } }
        vim.fn.settagstack(vim.fn.win_getid(), { items = items }, "t")
    end

    if win_id ~= 0 and vim.api.nvim_get_current_win() ~= win_id then
        vim.api.nvim_set_current_win(win_id)
    end

    if entry_bufnr then
        if not vim.api.nvim_buf_get_option(entry_bufnr, "buflisted") then
            vim.api.nvim_buf_set_option(entry_bufnr, "buflisted", true)
        end
        filename = vim.api.nvim_buf_get_name(entry_bufnr)
        vim.cmd("drop " .. vim.fn.fnameescape(filename))
    else
        -- check if we didn't pick a different buffer
        -- prevents restarting lsp server
        if vim.api.nvim_buf_get_name(0) ~= filename or command ~= "edit" then
            filename = Path:new(filename):normalize(vim.loop.cwd())
            pcall(vim.cmd, "tab drop " .. vim.fn.fnameescape(filename))
        end
    end

    -- HACK: fixes folding: https://github.com/nvim-telescope/telescope.nvim/issues/699
    if vim.wo.foldmethod == "expr" then
        vim.schedule(function()
            vim.opt.foldmethod = "expr"
        end)
    end

    local pos = vim.api.nvim_win_get_cursor(0)
    if col == nil then
        if row == pos[1] then
            col = pos[2] + 1
        elseif row == nil then
            row, col = pos[1], pos[2] + 1
        else
            col = 1
        end
    end

    if row and col then
        if vim.api.nvim_buf_get_name(0) == filename then
            vim.cmd([[normal! m']])
        end
        local ok, err_msg = pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
        if not ok then
            log.debug("Failed to move to cursor:", err_msg, row, col)
        end
    end
end

return {
    tab_drop = tab_drop,
}
