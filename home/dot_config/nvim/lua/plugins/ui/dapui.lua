return {
    "rcarriga/nvim-dap-ui",
    keys = require("core.keymaps").lazy("dapui"),
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
                            size = 0.40,
                        },
                        {
                            id = "breakpoints",
                            size = 0.20,
                        },
                        {
                            id = "stacks",
                            size = 0.20,
                        },
                        {
                            id = "watches",
                            size = 0.20,
                        },
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
    end,
}
