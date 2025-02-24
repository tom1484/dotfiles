return {
    "rcarriga/nvim-dap-ui",
    -- enabled = false,
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
    },
    event = "VeryLazy",
    opts = {},
    config = function()
        local dapui = require("dapui")
        local dap = require("dap")
        dapui.setup({
            expand_lines = false,
            floating = {
                border = "rounded",
                mappings = {
                    close = { "q", "<Esc>", "<c-q>" },
                },
            },
            layouts = {
                {
                    elements = {
                        {
                            id = "scopes",
                            size = 0.70,
                        },
                        -- {
                        --     id = "breakpoints",
                        --     size = 0.25,
                        -- },
                        {
                            id = "stacks",
                            size = 0.30,
                        },
                        -- {
                        --     id = "watches",
                        --     size = 0.25,
                        -- },
                    },
                    position = "left",
                    size = 40,
                },
                {
                    elements = {
                        {
                            id = "repl",
                            size = 1.0,
                        },
                        -- {
                        --     id = "console",
                        --     size = 0.5,
                        -- },
                    },
                    position = "bottom",
                    size = 15,
                },
            },
        })

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.after.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.after.event_exited["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.after.disconnect["dapui_config"] = function()
            dapui.close()
        end

        local utils = require("utils")

        local float_opts = function(opts)
            local result = { position = "center", height = 40, width = 100 }
            if opts ~= nil then
                return vim.tbl_extend("force", result, opts)
            end
            return result
        end
        utils.set_keymaps({
            {
                "n",
                "<leader>dc",
                function()
                    dapui.float_element("console", float_opts({ enter = false }))
                end,
                { noremap = true, silent = true, desc = "Open console" },
            },
        })
        utils.set_keymaps({
            {
                "n",
                "<leader>dr",
                function()
                    dapui.float_element("repl", float_opts({ enter = true }))
                    vim.cmd([[a]])
                end,
                { noremap = true, silent = true, desc = "Open repl" },
            },
        })
        utils.set_keymaps({
            {
                "n",
                "<leader>dS",
                function()
                    dapui.float_element("stacks", float_opts({ enter = true }))
                end,
                { noremap = true, silent = true, desc = "Open stacks" },
            },
        })
        utils.set_keymaps({
            {
                "n",
                "<leader>ds",
                function()
                    dapui.float_element("scopes", float_opts({ enter = true }))
                end,
                { noremap = true, silent = true, desc = "Open variable scopes" },
            },
        })
        utils.set_keymaps({
            {
                "n",
                "<leader>dw",
                function()
                    dapui.float_element("watches", float_opts({ enter = true }))
                end,
                { noremap = true, silent = true, desc = "Open watch expressions" },
            },
        })
        utils.set_keymaps({
            {
                "n",
                "<leader>db",
                function()
                    dapui.float_element("breakpoints", float_opts({ enter = true }))
                end,
                { noremap = true, silent = true, desc = "Open breakpoints" },
            },
        })
        utils.set_keymaps({
            {
                "n",
                "<leader>de",
                function()
                    dapui.eval()
                end,
                { noremap = true, silent = true, desc = "Run eval under cursor" },
            },
        })
        utils.set_keymaps({
            {
                "n",
                "<leader>dE",
                function()
                    dapui.eval(vim.fn.input("Expression: "))
                end,
                { noremap = true, silent = true, desc = "Run eval" },
            },
        })
    end,
}
