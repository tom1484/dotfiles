local setup = function()
    vim.get_keys = function(t)
        local keys = ""
        for key, _ in pairs(t) do
            keys = keys .. key .. "\n"
        end
        vim.notify(keys)
    end
end

return setup
