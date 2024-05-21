local lazygit = require("lazygit")

local function opts(desc)
    return {
        noremap = true,
        -- silent = true,
        desc = desc,
    }
end
vim.custom.fn.set_keymaps({
    { "n", "<leader>g", ":LazyGit<CR>", opts("Git") },
})
