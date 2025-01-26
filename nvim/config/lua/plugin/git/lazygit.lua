return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    otps = {},
    config = function()
        local utils = require("utils")

        local function make_opts(desc)
            return {
                noremap = true,
                -- silent = true,
                desc = desc,
            }
        end
        utils.set_keymaps({
            { "n", "<leader>gl", ":LazyGit<CR>", make_opts("Open lazygit") },
        })
    end,
}
