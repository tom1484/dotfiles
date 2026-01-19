local M = {}

-- Track buffer history (most recent first)
local buffer_history = {}

-- Auto-command to track buffer changes globally
local function setup_buffer_tracking()
    local group = vim.api.nvim_create_augroup("LastUsedBufferTracking", { clear = true })
    
    vim.api.nvim_create_autocmd("BufLeave", {
        group = group,
        callback = function()
            local current_buf = vim.api.nvim_get_current_buf()
            -- Only track real files, not special buffers
            if vim.api.nvim_buf_get_option(current_buf, 'buflisted') and
               vim.api.nvim_buf_get_option(current_buf, 'buftype') == '' then
                
                -- Remove the buffer from history if it already exists
                for i, buf in ipairs(buffer_history) do
                    if buf == current_buf then
                        table.remove(buffer_history, i)
                        break
                    end
                end
                
                -- Add to the front of history
                table.insert(buffer_history, 1, current_buf)
                
                -- Keep only the last 10 buffers in history
                if #buffer_history > 10 then
                    table.remove(buffer_history)
                end
            end
        end,
    })
end

--- Jump to the last used buffer globally (across all tabs)
--- Skips the current buffer and uses the second-to-last used buffer
--- If the buffer is already open in another window, jump to that window
--- If not, open the buffer in the current window
function M.jump_to_last_buffer()
    -- Initialize tracking if not already done
    if #buffer_history == 0 then
        setup_buffer_tracking()
        vim.notify("Buffer tracking initialized. Try again after switching buffers.", vim.log.levels.INFO)
        return
    end
    
    local current_buf = vim.api.nvim_get_current_buf()
    local target_buffer = nil
    
    -- Find the first buffer in history that's not the current buffer and is still valid
    for _, buf in ipairs(buffer_history) do
        if buf ~= current_buf and vim.api.nvim_buf_is_valid(buf) then
            target_buffer = buf
            break
        end
    end
    
    if not target_buffer then
        vim.notify("No alternative buffer available in history", vim.log.levels.WARN)
        return
    end
    
    -- Check if the buffer is already displayed in any window across all tabs
    local found_win = nil
    local found_tab = nil
    
    for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
            local buf = vim.api.nvim_win_get_buf(win)
            if buf == target_buffer then
                found_win = win
                found_tab = tab
                break
            end
        end
        if found_win then break end
    end
    
    if found_win then
        -- Buffer is already open, switch to that tab and window
        vim.api.nvim_set_current_tabpage(found_tab)
        vim.api.nvim_set_current_win(found_win)
    else
        -- Buffer is not currently displayed, open it in current window
        vim.api.nvim_set_current_buf(target_buffer)
    end
end

-- Initialize buffer tracking when the module is loaded
setup_buffer_tracking()

return M
