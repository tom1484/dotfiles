return {
    "folke/noice.nvim",
    lazy = false,
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                ["vim.lsp.util.stylize_markdown"] = false,
                ["cmp.entry.get_documentation"] = false,
            },
            signature = { enabled = false },
            hover = { enabled = false },
            progress = {
                enabled = false,
                -- enabled = true,
                -- view = "popup",
            },
        },
        cmdline = {
            view = "cmdline_popup",
            format = {
                cmdline = { pattern = "^:", icon = "", lang = "vim" },
                search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                -- filter = { pattern = "^:!", icon = "$", lang = "bash" },
                -- lua = { pattern = "^:lua ", icon = "", lang = "lua" },
                -- help = { pattern = "^:help ", icon = "?" },
                input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
                -- cmdline = false,
                -- search_down = false,
                -- search_up = false,
                filter = false,
                lua = false,
                help = false,
                -- input = false, -- Used by input()
            },
        },
        notify = { enabled = false },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = false, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        views = {
            cmdline_popup = {
                zindex = 97,
            },
            split = {
                enter = true,
            },
        },
    },
}
