local style = require("def.style")

return {
    "matbme/JABS.nvim",
    -- enabled = false,
    event = "VeryLazy",
    opts = {
        -- Options for the main window
        position = { "center", "center" }, -- position = {'<position_x>', '<position_y>'} | <position_x> left, center, right,
        --                                                 <position_y> top, center, bottom
        -- Default {'right', 'bottom'}

        -- relative = "win", -- win, editor, cursor. Default win
        relative = "editor", -- win, editor, cursor. Default win
        clip_popup_size = true, -- clips the popup size to the win (or editor) size. Default true

        width = 80, -- default 50
        height = 20, -- default 10
        border = style.border, -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow

        -- offset = {
        --   top = 2, -- default 0
        --   bottom = 2, -- default 0
        --   left = 2, -- default 0
        --   right = 2, -- default 0
        -- },

        sort_mru = true, -- Sort buffers by most recently used (true or false). Default false
        split_filename = true, -- Split filename into separate components for name and path. Default false
        split_filename_path_width = 20, -- If split_filename is true, how wide the column for the path is supposed to be, Default 0 (don't show path)

        -- Options for preview window
        preview_position = "top", -- top, bottom, left, right. Default top
        preview = {
            width = 40, -- default 70
            height = 60, -- default 30
            border = style.border, -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
        },

        -- Default highlights (must be a valid :highlight)
        highlight = {
            current = "Title", -- default StatusLine
            hidden = "StatusLineNC", -- default ModeMsg
            split = "WarningMsg", -- default StatusLine
            alternate = "StatusLine", -- default WarningMsg
        },

        -- Default symbols
        symbols = {
            current = "C", -- default 
            split = "S", -- default 
            alternate = "A", -- default 
            hidden = "H", -- default ﬘
            locked = "L", -- default 
            ro = "R", -- default 
            edited = "E", -- default 
            terminal = "T", -- default 
            default_file = "D", -- Filetype icon if not present in nvim-web-devicons. Default 
            terminal_symbol = ">_", -- Filetype icon for a terminal split. Default 
        },

        -- Keymaps
        keymap = {
            close = "D", -- Close buffer. Default D
            jump = "<cr>", -- Jump to buffer. Default <cr>
            h_split = "v", -- Horizontally split buffer. Default s
            v_split = "h", -- Vertically split buffer. Default v
        },

        -- Whether to use nvim-web-devicons next to filenames
        -- use_devicons = false -- true or false. Default true
    },
    config = function(_, opts)
        require("jabs").setup(opts)

        -- local utils = require("utils")
        -- utils.set_keymaps({
        --     {
        --         "n",
        --         "<leader>b",
        --         function()
        --             if vim.o.filetype == "JABSwindow" then
        --                 vim.cmd.q()
        --                 return
        --             end
        --             vim.cmd.JABS()
        --         end,
        --         { desc = "JABS" },
        --     },
        -- })
    end,
}
