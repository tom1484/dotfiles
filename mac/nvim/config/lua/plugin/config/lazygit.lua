local utils = require("utils")

local lazygit = require("lazygit")

local function opts(desc)
    return {
        noremap = true,
        -- silent = true,
        desc = desc,
    }
end
utils.set_keymaps({
    { "n", "<leader>gl", ":LazyGit<CR>", opts("Open lazygit") },
})
