return {
    claudecode = {
        { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
        { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
        { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
        { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
        { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
        { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
        { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        desc = "Send to Claude",    mode = "v" },
        { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "Accept diff" },
        { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "Deny diff" },
        {
            "<leader>as",
            "<cmd>ClaudeCodeTreeAdd<cr>",
            desc = "Add file from tree",
            ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_explorer" },
        },
    },
    auto_session = {
        { "<leader>Sr", "<cmd>AutoSession restore<CR>", desc = "Restore session" },
        { "<leader>Sd", "<cmd>AutoSession delete<CR>",  desc = "Delete session" },
        { "<leader>Ss", "<cmd>AutoSession save<CR>",    desc = "Save session" },
    },
    comment = {
        { "<leader>c", "gcc",      mode = "n", desc = "Comment line",            remap = true, silent = true },
        { "<leader>b", "gbc<Esc>", mode = "v", desc = "Comment block selection", remap = true, silent = true },
        { "<leader>c", "gcc<Esc>", mode = "v", desc = "Comment selection",       remap = true, silent = true },
    },
    copilot_chat = {
        { "<leader>C", "<cmd>CopilotChat<CR>", desc = "Open Copilot Chat" },
    },
    dap = {
        { "<leader>kb", "<cmd>PBToggleBreakpoint<CR>", desc = "Toggle breakpoint", silent = true },
        { "<leader>kc", "<cmd>DapContinue<CR>",        desc = "Continue",          silent = true },
        { "<leader>ks", "<cmd>DapStepInto<CR>",        desc = "Step into",         silent = true },
        { "<leader>kS", "<cmd>DapStepOut<CR>",         desc = "Step out",          silent = true },
        { "<leader>ko", "<cmd>DapStepOver<CR>",        desc = "Step over",         silent = true },
        {
            "<leader>kl",
            function()
                require("dap.ext.vscode").load_launchjs("launch.json")
            end,
            desc = "Load launch JSON",
            silent = true,
        },
        {
            "<leader>kt",
            function()
                vim.cmd("DapTerminate")
                require("dapui").close()
            end,
            desc = "Terminate",
            silent = true,
        },
        {
            "<leader>ka",
            function()
                local actions = {
                    {
                        desc = "Toggle breakpoint",
                        action = function()
                            vim.cmd("PBToggleBreakpoint")
                        end,
                    },
                    {
                        desc = "Continue",
                        action = function()
                            vim.cmd("DapContinue")
                        end,
                    },
                    {
                        desc = "Step over",
                        action = function()
                            vim.cmd("DapStepOver")
                        end,
                    },
                    {
                        desc = "Step into",
                        action = function()
                            vim.cmd("DapStepInto")
                        end,
                    },
                    {
                        desc = "Step out",
                        action = function()
                            vim.cmd("DapStepOut")
                        end,
                    },
                    {
                        desc = "Terminate",
                        action = function()
                            vim.cmd("DapTerminate")
                            require("dapui").close()
                        end,
                    },
                    {
                        desc = "Repl toggle",
                        action = function()
                            vim.cmd("DapToggleRepl")
                        end,
                    },
                    {
                        desc = "Set log level",
                        action = function()
                            vim.cmd("DapSetLogLevel")
                        end,
                    },
                    {
                        desc = "Restart frame",
                        action = function()
                            vim.cmd("DapRestartFrame")
                        end,
                    },
                    {
                        desc = "Load launch JSON",
                        action = function()
                            require("dap.ext.vscode").load_launchjs("launch.json")
                        end,
                    },
                    {
                        desc = "Clear all breakpoints",
                        action = function()
                            vim.cmd("PBClearAllBreakpoints")
                        end,
                    },
                }

                local descriptions = {}
                local acts = {}
                for _, action in ipairs(actions) do
                    table.insert(descriptions, action.desc)
                    table.insert(acts, action.action)
                end

                vim.ui.select(descriptions, {
                    prompt = "Select a action",
                }, function(_, idx)
                    if idx then
                        acts[idx]()
                    end
                end)
            end,
            desc = "Actions",
            silent = true,
        },
        {
            "<leader>kn",
            function()
                require("utils.dap").create_launch(require("utils.dap"))
            end,
            desc = "New configuration",
            silent = true,
        },
    },
    dapui = {
        {
            "<leader>dc",
            function()
                require("dapui").float_element(
                    "console",
                    { position = "center", height = 40, width = 100, enter = false }
                )
            end,
            desc = "Open console",
            silent = true,
        },
        {
            "<leader>dr",
            function()
                require("dapui").float_element("repl", { position = "center", height = 40, width = 100, enter = true })
                vim.cmd([[a]])
            end,
            desc = "Open repl",
            silent = true,
        },
        {
            "<leader>dS",
            function()
                require("dapui").float_element(
                    "stacks",
                    { position = "center", height = 40, width = 100, enter = true }
                )
            end,
            desc = "Open stacks",
            silent = true,
        },
        {
            "<leader>ds",
            function()
                require("dapui").float_element(
                    "scopes",
                    { position = "center", height = 40, width = 100, enter = true }
                )
            end,
            desc = "Open variable scopes",
            silent = true,
        },
        {
            "<leader>dw",
            function()
                require("dapui").float_element(
                    "watches",
                    { position = "center", height = 40, width = 100, enter = true }
                )
            end,
            desc = "Open watch expressions",
            silent = true,
        },
        {
            "<leader>db",
            function()
                require("dapui").float_element(
                    "breakpoints",
                    { position = "center", height = 40, width = 100, enter = true }
                )
            end,
            desc = "Open breakpoints",
            silent = true,
        },
        {
            "<leader>de",
            function()
                require("dapui").eval(nil, { enter = true })
            end,
            desc = "Run eval under cursor",
            silent = true,
        },
        {
            "<leader>dE",
            function()
                require("dapui").eval(vim.fn.input("Expression: "), { enter = true })
            end,
            desc = "Run eval",
            silent = true,
        },
    },
    diffview = {
        { "<leader>gd", "<cmd>DiffviewOpen<CR>",        desc = "Open diff view",    silent = true },
        { "<leader>gc", "<cmd>DiffviewClose<CR>",       desc = "Close diff view",   silent = true },
        { "<leader>gr", "<cmd>DiffviewRefresh<CR>",     desc = "Refresh diff view", silent = true },
        { "<leader>gf", "<cmd>DiffviewFileHistory<CR>", desc = "Open file history", silent = true },
        { "<leader>gt", "<cmd>DiffviewToggleFiles<CR>", desc = "Toggle file panel", silent = true },
    },
    flash = {
        {
            "s",
            function()
                require("flash").jump()
            end,
            mode = { "n", "x", "o" },
            desc = "Flash jump",
            noremap = true,
            silent = true,
        },
        {
            "S",
            function()
                require("flash").treesitter()
            end,
            mode = { "n", "o", "x" },
            desc = "Flash region",
            noremap = true,
            silent = true,
        },
        {
            "R",
            function()
                require("flash").treesitter_search()
            end,
            mode = { "n", "o", "x" },
            desc = "Flash remote region",
            noremap = true,
            silent = true,
        },
    },
    gitsigns = {
        {
            "<leader>gb",
            function()
                vim.cmd([[Gitsigns blame_line]])
            end,
            desc = "Show git blame",
        },
        {
            "<leader>gB",
            function()
                vim.cmd([[Gitsigns toggle_current_line_blame]])
            end,
            desc = "Toggle git blame",
        },
    },
    lsp = {
        { "gr",  vim.lsp.buf.rename,        mode = "n", desc = "Rename",           remap = false },
        { "gh",  vim.lsp.buf.hover,         mode = "n", desc = "Hover doc",        remap = false },
        { "gW",  vim.diagnostic.open_float, mode = "n", desc = "Show diagnostics", remap = false },
        { "gwn", vim.diagnostic.goto_next,  mode = "n", desc = "Next diagnostic",  remap = false },
    },
    marks = {
        {
            "<leader>m",
            function()
                vim.cmd("MarksListAll")
            end,
            desc = "Marks",
        },
    },
    conform = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = false, lsp_format = "fallback" })
                vim.cmd.w()
            end,
            desc = "Format buffer",
        },
    },
    nvterm = {
        {
            "<C-T>",
            function()
                require("nvterm.terminal").toggle("float")
            end,
            mode = { "n", "t" },
            desc = "Toggle terminal",
            noremap = true,
            silent = true,
        },
    },
    snacks = require("settings.keymaps.snacks"),
    todo_comments = {
        {
            "<leader>st",
            function()
                Snacks.picker.todo_comments()
            end,
            desc = "Todo",
        },
        {
            "<leader>sT",
            function()
                Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
            end,
            desc = "Todo/Fix/Fixme",
        },
    },
    vim_expand_region = {
        { "=", "<Plug>(expand_region_expand)", mode = "v", desc = "Expand region", silent = true },
        { "-", "<Plug>(expand_region_shrink)", mode = "v", desc = "Shrink region", silent = true },
    },
    surround = {
        -- See `:h nvim-surround.keymaps`
        { "sa", "<Plug>(nvim-surround-normal)", mode = "n", desc = "Add a surrounding pair around a motion (normal mode)", silent = true },
        { "sd", "<Plug>(nvim-surround-delete)", mode = "n", desc = "Delete a surrounding pair", silent = true },
        { "sr", "<Plug>(nvim-surround-change)", mode = "n", desc = "Change a surrounding pair", silent = true },
    },
    which_key = {
        { "<leader>K", "<cmd>WhichKey<CR>", desc = "WhichKey", noremap = true, silent = true },
    },
}
