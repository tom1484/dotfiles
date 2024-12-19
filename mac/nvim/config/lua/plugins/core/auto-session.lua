return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        log_level = "error",
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        use_git_branch = false,
    },
    config = function(_, opts)
        require("auto-session").setup(opts)

        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

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
