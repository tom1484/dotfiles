return {
    "rmagatti/auto-session",
    lazy = false,
    keys = require("core.keymaps").lazy("auto_session"),
    opts = {
        log_level = "error",
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        use_git_branch = false,
    },
    config = function(_, opts)
        require("auto-session").setup(opts)

        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end,
}
