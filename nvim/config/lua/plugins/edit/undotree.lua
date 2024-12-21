return {
    "mbbill/undotree",
    lazy = false,
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        local utils = require("utils")
        local key_opts = utils.opts_with_desc({
            silent = true,
        })
        local mappings = {
            { "n", "<leader>u", vim.cmd.UndotreeToggle, key_opts("Undotree") },
        }
        utils.set_keymaps(mappings)

        vim.g.undotree_SetFocusWhenToggle = 1
        vim.g.undotree_WindowLayout = 1
        vim.g.undotree_DiffpanelHeight = 20
    end,
}

-- return {
--     "jiaoshijie/undotree",
--     lazy = false,
--     dependencies = "nvim-lua/plenary.nvim",
--     opts = {
--         float_diff = true, -- using float window previews diff, set this `true` will disable layout option
--         layout = "left_bottom", -- "left_bottom", "left_left_bottom"
--         position = "left", -- "right", "bottom"
--         ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
--         window = {
--             winblend = 30,
--         },
--         keymaps = {
--             ["j"] = "move_next",
--             ["k"] = "move_prev",
--             ["gj"] = "move2parent",
--             ["J"] = "move_change_next",
--             ["K"] = "move_change_prev",
--             ["<cr>"] = "action_enter",
--             ["p"] = "enter_diffbuf",
--             ["q"] = "quit",
--         },
--     },
--     config = function(_, opts)
--         local undotree = require("undotree")
--         undotree.setup(opts)

--         local utils = require("utils")
--         local key_opts = utils.opts_with_desc({
--             silent = true,
--         })
--         local mappings = {
--             { "n", "<leader>u", undotree.toggle, key_opts("Undotree") },
--         }
--         utils.set_keymaps(mappings)
--     end,
-- }
