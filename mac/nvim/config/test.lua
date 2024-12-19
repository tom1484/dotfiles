local bufs = vim.api.nvim_list_bufs()

local get_buf_names = function()
    local bufnrs = vim.api.nvim_list_bufs()
    local names = {}
    for _, bufnr in ipairs(bufnrs) do
        table.insert(names, vim.api.nvim_buf_get_name(bufnr))
    end
    return names
end

local p = function(some)
    print(vim.inspect(some))
end

for _, b in ipairs(bufs) do
    -- print(b)
    local winids = vim.fn.win_findbuf(b)
    if #winids > 0 then
        p(vim.api.nvim_buf_get_name(b))
        p(vim.api.nvim_win_get_tabpage(winids[1]))
    end
end

p(get_buf_names())
