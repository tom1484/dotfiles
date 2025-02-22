---@diagnostic disable: undefined-global

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = false },
        indent = { enabled = false },
        input = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        picker = {
            enabled = true,
            jump = {
                jumplist = true, -- save the current position in the jumplist
                tagstack = false, -- save the current position in the tagstack
                reuse_win = true, -- reuse an existing window if the buffer is already open
                close = true, -- close the picker when jumping/editing to a location (defaults to true)
                match = true, -- jump to the first match position. (useful for `lines`)
            },
            win = {
                -- input window
                input = {
                    keys = {
                        ["<Esc>"] = "cancel",
                        -- ["q"] = "close",
                        -- ["/"] = "toggle_focus",
                        ["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
                        ["<C-Up>"] = { "history_back", mode = { "i", "n" } },
                        -- ["<C-c>"] = { "cancel", mode = "i" },
                        -- ["<CR>"] = { "confirm", mode = { "n", "i" } },
                        ["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
                        ["<Down>"] = { "list_down", mode = { "i", "n" } },
                        ["<Up>"] = { "list_up", mode = { "i", "n" } },
                        -- ["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
                        -- ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
                        ["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
                        ["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
                        ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
                        ["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
                        ["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
                        ["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
                        ["?"] = "toggle_help_input",
                        ["<a-d>"] = { "inspect", mode = { "n", "i" } },
                        ["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
                        ["<c-a>"] = { "select_all", mode = { "n", "i" } },
                        ["<c-k>"] = { "list_up", mode = { "i", "n" } },
                        ["<c-j>"] = { "list_down", mode = { "i", "n" } },
                        ["<c-u>"] = { "list_scroll_up", mode = { "i", "n" } },
                        ["<c-d>"] = { "list_scroll_down", mode = { "i", "n" } },
                        ["G"] = "list_bottom",
                        ["gg"] = "list_top",
                        ["j"] = "list_down",
                        ["k"] = "list_up",
                        -- ["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
                        -- ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
                        -- ["<c-p>"] = { "list_up", mode = { "i", "n" } },
                        -- ["<c-n>"] = { "list_down", mode = { "i", "n" } },
                        ["<c-q>"] = { "qflist", mode = { "i", "n" } },
                        ["<c-t>"] = { "tab", mode = { "n", "i" } },
                        -- ["<c-s>"] = { "edit_split", mode = { "i", "n" } },
                        -- ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
                        ["<c-w>H"] = "layout_left",
                        ["<c-w>J"] = "layout_bottom",
                        ["<c-w>K"] = "layout_top",
                        ["<c-w>L"] = "layout_right",
                        -- ["q"] = "close",
                        -- Additional
                        ["<c-h>"] = { "edit_vsplit", mode = { "i", "n" } },
                        ["<c-v>"] = { "edit_split", mode = { "i", "n" } },
                        ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
                        ["<Tab>"] = { "list_down", mode = { "i", "n" } },
                        ["<c-y>"] = { "select_and_next", mode = { "i", "n" } },
                        ["<c-n>"] = { "select_and_prev", mode = { "i", "n" } },
                        ["<CR>"] = { "tabdrop", mode = { "n", "i" } },
                        ["<C-c>"] = { "close", mode = { "n", "i" } },
                        ["<c-f>"] = { "toggle_focus", mode = { "n", "i" } },
                    },
                    b = {
                        minipairs_disable = true,
                    },
                },
            },
            list = {
                -- list window
                keys = {
                    ["<Esc>"] = "cancel",
                    -- ["q"] = "close",
                    ["i"] = "focus_input",
                    -- ["/"] = "toggle_focus",
                    ["<2-LeftMouse>"] = "confirm",
                    -- ["<CR>"] = "confirm",
                    ["<S-CR>"] = { { "pick_win", "jump" } },
                    ["<Up>"] = "list_up",
                    ["<Down>"] = "list_down",
                    -- ["<S-Tab>"] = { "select_and_prev", mode = { "n", "x" } },
                    -- ["<Tab>"] = { "select_and_next", mode = { "n", "x" } },
                    ["<a-f>"] = "toggle_follow",
                    ["<a-h>"] = "toggle_hidden",
                    ["<a-i>"] = "toggle_ignored",
                    ["<a-m>"] = "toggle_maximize",
                    ["<a-p>"] = "toggle_preview",
                    ["?"] = "toggle_help_list",
                    ["<a-d>"] = "inspect",
                    ["<a-w>"] = "cycle_win",
                    ["<c-a>"] = "select_all",
                    ["<c-u>"] = "list_scroll_up",
                    ["<c-d>"] = "list_scroll_down",
                    -- ["<c-b>"] = "preview_scroll_up",
                    -- ["<c-f>"] = "preview_scroll_down",
                    ["<c-k>"] = "list_up",
                    ["<c-j>"] = "list_down",
                    ["<c-p>"] = "list_up",
                    ["<c-n>"] = "list_down",
                    ["gg"] = "list_top",
                    ["G"] = "list_bottom",
                    ["k"] = "list_up",
                    ["j"] = "list_down",
                    ["<c-q>"] = "qflist",
                    ["<c-t>"] = "tab",
                    -- ["<c-s>"] = "edit_split",
                    -- ["<c-v>"] = "edit_vsplit",
                    ["<c-w>H"] = "layout_left",
                    ["<c-w>J"] = "layout_bottom",
                    ["<c-w>K"] = "layout_top",
                    ["<c-w>L"] = "layout_right",
                    ["zb"] = "list_scroll_bottom",
                    ["zt"] = "list_scroll_top",
                    ["zz"] = "list_scroll_center",
                    -- Additional
                    ["<h>"] = { "edit_vsplit", mode = { "i", "n" } },
                    ["<v>"] = { "edit_split", mode = { "i", "n" } },
                    ["<t>"] = { "tabdrop", mode = { "i", "n" } },
                    ["<CR>"] = "tabdrop",
                    ["<C-c>"] = { "close", mode = { "n", "i" } },
                    ["<c-f>"] = { "toggle_focus", mode = { "n", "i" } },
                },
                wo = {
                    conceallevel = 2,
                    concealcursor = "nvc",
                },
            },
            -- preview window
            preview = {
                keys = {
                    ["<Esc>"] = "cancel",
                    -- ["q"] = "close",
                    ["i"] = "focus_input",
                    ["<ScrollWheelDown>"] = "list_scroll_wheel_down",
                    ["<ScrollWheelUp>"] = "list_scroll_wheel_up",
                    ["<a-w>"] = "cycle_win",
                    -- Additional
                    ["<C-c>"] = { "close", mode = { "n", "i" } },
                },
            },
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = false },
        styles = {
            notification = {
                wo = { wrap = true }, -- Wrap notifications
            },
        },
    },
    keys = {
        -- Top Pickers & Explorer
        {
            "<leader><space>",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>b",
            function()
                Snacks.picker.buffers(require("plugin.ui.snacks.sources.buffers"))
            end,
            desc = "Buffers",
        },
        -- {
        --     "<leader>t",
        --     function()
        --         Snacks.picker.tabs()
        --     end,
        --     desc = "Buffers",
        -- },
        {
            "<leader>/",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>:",
            function()
                Snacks.picker.command_history()
            end,
            desc = "Command History",
        },
        {
            "<leader>n",
            function()
                Snacks.picker.notifications()
            end,
            desc = "Notification History",
        },
        {
            "<leader>e",
            function()
                Snacks.explorer(require("plugin.ui.snacks.sources.explorer"))
            end,
            desc = "File Explorer",
        },
        -- find
        {
            "<leader>fc",
            function()
                Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "Find Config File",
        },
        {
            "<leader>ff",
            function()
                Snacks.picker.files()
            end,
            desc = "Find Files",
        },
        {
            "<leader>fg",
            function()
                Snacks.picker.git_files()
            end,
            desc = "Find Git Files",
        },
        {
            "<leader>fp",
            function()
                Snacks.picker.projects()
            end,
            desc = "Projects",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "Recent",
        },
        -- git
        {
            "<leader>gb",
            function()
                Snacks.picker.git_branches()
            end,
            desc = "Git Branches",
        },
        {
            "<leader>gl",
            function()
                Snacks.picker.git_log()
            end,
            desc = "Git Log",
        },
        {
            "<leader>gL",
            function()
                Snacks.picker.git_log_line()
            end,
            desc = "Git Log Line",
        },
        {
            "<leader>gs",
            function()
                Snacks.picker.git_status()
            end,
            desc = "Git Status",
        },
        {
            "<leader>gS",
            function()
                Snacks.picker.git_stash()
            end,
            desc = "Git Stash",
        },
        {
            "<leader>gd",
            function()
                Snacks.picker.git_diff()
            end,
            desc = "Git Diff (Hunks)",
        },
        {
            "<leader>gf",
            function()
                Snacks.picker.git_log_file()
            end,
            desc = "Git Log File",
        },
        -- Grep
        {
            "<leader>sb",
            function()
                Snacks.picker.lines()
            end,
            desc = "Buffer Lines",
        },
        {
            "<leader>sB",
            function()
                Snacks.picker.grep_buffers()
            end,
            desc = "Grep Open Buffers",
        },
        {
            "<leader>sg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>sw",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "Visual selection or word",
            mode = { "n", "x" },
        },
        -- search
        {
            '<leader>s"',
            function()
                Snacks.picker.registers()
            end,
            desc = "Registers",
        },
        {
            "<leader>s/",
            function()
                Snacks.picker.search_history()
            end,
            desc = "Search History",
        },
        {
            "<leader>sa",
            function()
                Snacks.picker.autocmds()
            end,
            desc = "Autocmds",
        },
        {
            "<leader>sb",
            function()
                Snacks.picker.lines()
            end,
            desc = "Buffer Lines",
        },
        {
            "<leader>sc",
            function()
                Snacks.picker.command_history()
            end,
            desc = "Command History",
        },
        {
            "<leader>sC",
            function()
                Snacks.picker.commands()
            end,
            desc = "Commands",
        },
        {
            "<leader>sd",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Diagnostics",
        },
        {
            "<leader>sD",
            function()
                Snacks.picker.diagnostics_buffer()
            end,
            desc = "Buffer Diagnostics",
        },
        {
            "<leader>sh",
            function()
                Snacks.picker.help()
            end,
            desc = "Help Pages",
        },
        {
            "<leader>sH",
            function()
                Snacks.picker.highlights()
            end,
            desc = "Highlights",
        },
        {
            "<leader>si",
            function()
                Snacks.picker.icons()
            end,
            desc = "Icons",
        },
        {
            "<leader>sj",
            function()
                Snacks.picker.jumps()
            end,
            desc = "Jumps",
        },
        {
            "<leader>sk",
            function()
                Snacks.picker.keymaps()
            end,
            desc = "Keymaps",
        },
        {
            "<leader>sl",
            function()
                Snacks.picker.loclist()
            end,
            desc = "Location List",
        },
        {
            "<leader>sm",
            function()
                Snacks.picker.marks()
            end,
            desc = "Marks",
        },
        {
            "<leader>sM",
            function()
                Snacks.picker.man()
            end,
            desc = "Man Pages",
        },
        {
            "<leader>sp",
            function()
                Snacks.picker.lazy()
            end,
            desc = "Search for Plugin Spec",
        },
        {
            "<leader>sq",
            function()
                Snacks.picker.qflist()
            end,
            desc = "Quickfix List",
        },
        {
            "<leader>sR",
            function()
                Snacks.picker.resume()
            end,
            desc = "Resume",
        },
        {
            "<leader>su",
            function()
                Snacks.picker.undo()
            end,
            desc = "Undo History",
        },
        {
            "<leader>uC",
            function()
                Snacks.picker.colorschemes()
            end,
            desc = "Colorschemes",
        },
        -- LSP
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "Goto Definition",
        },
        {
            "gD",
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = "Goto Declaration",
        },
        {
            "gr",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "gI",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Goto Implementation",
        },
        {
            "gy",
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = "Goto T[y]pe Definition",
        },
        {
            "gh",
            function()
                Snacks.picker.lsp_hover()
            end,
            desc = "Hover",
        },
        {
            "<leader>ss",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>sS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
        },
        -- Other
        {
            "<leader>z",
            function()
                Snacks.zen()
            end,
            desc = "Toggle Zen Mode",
        },
        {
            "<leader>Z",
            function()
                Snacks.zen.zoom()
            end,
            desc = "Toggle Zoom",
        },
        {
            "<leader>.",
            function()
                Snacks.scratch()
            end,
            desc = "Toggle Scratch Buffer",
        },
        {
            "<leader>S",
            function()
                Snacks.scratch.select()
            end,
            desc = "Select Scratch Buffer",
        },
        {
            "<leader>n",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "Notification History",
        },
        -- {
        --     "<leader>bd",
        --     function()
        --         Snacks.bufdelete()
        --     end,
        --     desc = "Delete Buffer",
        -- },
        {
            "<leader>R",
            function()
                Snacks.rename.rename_file()
            end,
            desc = "Rename File",
        },
        {
            "<leader>gB",
            function()
                Snacks.gitbrowse()
            end,
            desc = "Git Browse",
            mode = { "n", "v" },
        },
        {
            "<leader>gg",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
        {
            "<leader>un",
            function()
                Snacks.notifier.hide()
            end,
            desc = "Dismiss All Notifications",
        },
        -- {
        --     "<c-/>",
        --     function()
        --         Snacks.terminal()
        --     end,
        --     desc = "Toggle Terminal",
        -- },
        -- {
        --     "<c-_>",
        --     function()
        --         Snacks.terminal()
        --     end,
        --     desc = "which_key_ignore",
        -- },
        {
            "]]",
            function()
                Snacks.words.jump(vim.v.count1)
            end,
            desc = "Next Reference",
            mode = { "n", "t" },
        },
        {
            "[[",
            function()
                Snacks.words.jump(-vim.v.count1)
            end,
            desc = "Prev Reference",
            mode = { "n", "t" },
        },
        {
            "<leader>N",
            desc = "Neovim News",
            function()
                Snacks.win({
                    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                    width = 0.6,
                    height = 0.6,
                    wo = {
                        spell = false,
                        wrap = false,
                        signcolumn = "yes",
                        statuscolumn = " ",
                        conceallevel = 3,
                    },
                })
            end,
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle
                    .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                    :map("<leader>uc")
                Snacks.toggle.treesitter():map("<leader>uT")
                Snacks.toggle
                    .option("background", { off = "light", on = "dark", name = "Dark Background" })
                    :map("<leader>ub")
                Snacks.toggle.inlay_hints():map("<leader>uh")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.dim():map("<leader>uD")
            end,
        })
    end,
}
