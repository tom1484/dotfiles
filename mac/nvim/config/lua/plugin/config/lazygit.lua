local lazygit = require("lazygit")

local function opts(desc)
    return {
        noremap = true,
        -- silent = true,
        desc = desc,
    }
end
vim.custom.fn.set_keymaps({
    { "n", "<leader>gl", ":LazyGit<CR>", opts("Open lazygit") },
})
