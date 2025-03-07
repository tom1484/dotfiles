return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        panel = {
            enabled = true,
            auto_refresh = true,
            keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>",
            },
            layout = {
                position = "bottom", -- | top | left | right | horizontal | vertical
                ratio = 0.4,
            },
        },
        suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = false,
            debounce = 75,
            keymap = {
                accept = "<C-Space>",
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-BS>",
            },
        },
        filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
    },
    config = function(_, opts)
        require("copilot").setup(opts)
    end,
}
