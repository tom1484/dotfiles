local res = vim.api.nvim_get_hl(0, {
    -- name = "EndOfBuffer",
    name = "NoiceCmdlinePopupBorder",
})
res = vim.api.nvim_get_hl(0, {
    -- name = "EndOfBuffer",
    name = res.link,
})
res.bg = nil
for k, v in pairs(res) do
    print(k, v)
end
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", res)
