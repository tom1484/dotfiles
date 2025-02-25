---@diagnostic disable: undefined-global

return {
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
            Snacks.picker.buffers(require("plugin.ui.snacks.sources.picker.modules.buffers"))
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
    -- {
    --     "<leader>/",
    --     function()
    --         Snacks.picker.grep()
    --     end,
    --     desc = "Grep",
    -- },
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
            Snacks.explorer(require("plugin.ui.snacks.sources.picker.modules.explorer"))
        end,
        desc = "File Explorer",
    },
    -- find
    {
        "<leader>pc",
        function()
            Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Pick Config File",
    },
    {
        "<leader>pf",
        function()
            Snacks.picker.files()
        end,
        desc = "Pick Files",
    },
    {
        "<leader>pp",
        function()
            Snacks.picker.projects()
        end,
        desc = "Projects",
    },
    {
        "<leader>pr",
        function()
            Snacks.picker.recent()
        end,
        desc = "Recent",
    },
    {
        "<leader>gf",
        function()
            Snacks.picker.git_files()
        end,
        desc = "Pick Git Files",
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
        "<leader>pb",
        function()
            Snacks.picker.lines()
        end,
        desc = "Buffer Lines",
    },
    {
        "<leader>pB",
        function()
            Snacks.picker.grep_buffers()
        end,
        desc = "Grep Open Buffers",
    },
    {
        "<leader>pg",
        function()
            Snacks.picker.grep()
        end,
        desc = "Grep",
    },
    {
        "<leader>pw",
        function()
            Snacks.picker.grep_word()
        end,
        desc = "Visual selection or word",
        mode = { "n", "x" },
    },
    -- search
    {
        '<leader>p"',
        function()
            Snacks.picker.registers()
        end,
        desc = "Registers",
    },
    {
        "<leader>p/",
        function()
            Snacks.picker.search_history()
        end,
        desc = "Search History",
    },
    {
        "<leader>pa",
        function()
            Snacks.picker.autocmds()
        end,
        desc = "Autocmds",
    },
    {
        "<leader>pb",
        function()
            Snacks.picker.lines()
        end,
        desc = "Buffer Lines",
    },
    {
        "<leader>pc",
        function()
            Snacks.picker.command_history()
        end,
        desc = "Command History",
    },
    {
        "<leader>pC",
        function()
            Snacks.picker.commands()
        end,
        desc = "Commands",
    },
    {
        "<leader>pd",
        function()
            Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
    },
    {
        "<leader>pD",
        function()
            Snacks.picker.diagnostics_buffer()
        end,
        desc = "Buffer Diagnostics",
    },
    {
        "<leader>ph",
        function()
            Snacks.picker.help()
        end,
        desc = "Help Pages",
    },
    {
        "<leader>pH",
        function()
            Snacks.picker.highlights()
        end,
        desc = "Highlights",
    },
    {
        "<leader>pi",
        function()
            Snacks.picker.icons()
        end,
        desc = "Icons",
    },
    {
        "<leader>pj",
        function()
            Snacks.picker.jumps()
        end,
        desc = "Jumps",
    },
    {
        "<leader>pk",
        function()
            Snacks.picker.keymaps()
        end,
        desc = "Keymaps",
    },
    {
        "<leader>pl",
        function()
            Snacks.picker.loclist()
        end,
        desc = "Location List",
    },
    {
        "<leader>pm",
        function()
            Snacks.picker.marks()
        end,
        desc = "Marks",
    },
    {
        "<leader>pM",
        function()
            Snacks.picker.man()
        end,
        desc = "Man Pages",
    },
    {
        "<leader>pP",
        function()
            Snacks.picker.lazy()
        end,
        desc = "Search for Plugin Spec",
    },
    {
        "<leader>pq",
        function()
            Snacks.picker.qflist()
        end,
        desc = "Quickfix List",
    },
    {
        "<leader>pR",
        function()
            Snacks.picker.resume()
        end,
        desc = "Resume",
    },
    {
        "<leader>pu",
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
        "<leader>ps",
        function()
            Snacks.picker.lsp_symbols()
        end,
        desc = "LSP Symbols",
    },
    {
        "<leader>pS",
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
                    Grepstatuscolumn = " ",
                    conceallevel = 3,
                },
            })
        end,
    },
}
