return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        log_level = "error",
        auto_restore_enabled = true,
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    },
    config = function(_, opts)
        require("auto-session").setup(opts)

        local utils = require("utils")
        local function keymap_opts(desc)
            return {
                noremap = true,
                desc = desc,
            }
        end
        utils.set_keymaps({
            { "n", "<leader>sr", ":SessionRestore<CR>", keymap_opts("Restore session") },
            { "n", "<leader>sd", ":SessionDelete<CR>", keymap_opts("Delete session") },
            { "n", "<leader>ss", ":SessionSave<CR>", keymap_opts("Save session") },
        })
    end,
}
