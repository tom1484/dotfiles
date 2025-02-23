return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "mfussenegger/nvim-dap-python",
        "jay-babu/mason-nvim-dap.nvim",
        "Joakker/lua-json5",
    },
    event = "VeryLazy",
    opts = function()
        local languages = require("utils.languages")

        return {
            configs = languages.filter_languages({
                python = {
                    "debugpy",
                },
                c = {
                    "codelldb",
                    "cpptools",
                },
                go = {
                    -- "delve",
                },
                dart = {
                    "dart",
                },
            }),
        }
    end,
    config = function(_, opts)
        require("mason-nvim-dap").setup({
            ensure_installed = opts.configs,
        })

        local dap = require("dap")
        for _, config in ipairs(opts.configs) do
            require("plugin.lsp.nvim-dap.config." .. config).setup(dap)
        end

        -- Use json5
        local dap_vscode = require("dap.ext.vscode")
        dap_vscode.json_decode = require("json5").parse

        -- Set up keymaps
        local dapui = require("dapui")

        local function make_cmd(name, extra)
            return function()
                vim.cmd(name)
                if extra then
                    extra()
                end
            end
        end

        local function make_action(desc, action, extra)
            -- Use make_cmd if action is string
            if type(action) == "string" then
                return {
                    desc = desc,
                    action = make_cmd(action, extra),
                }
            end

            return {
                desc = desc,
                action = action,
            }
        end

        local actions = {
            ToggleBreakpoint = make_action("Toggle breakpoint", "PBToggleBreakpoint"),
            Continue = make_action("Continue", "DapContinue"),
            StepOver = make_action("Step over", "DapStepOver"),
            StepInto = make_action("Step into", "DapStepInto"),
            StepOut = make_action("Step out", "DapStepOut"),
            Terminate = make_action("Terminate", "DapTerminate", dapui.close),
            ToggleRepl = make_action("Repl toggle", "DapToggleRepl"),
            SetLogLevel = make_action("Set log level", "DapSetLogLevel"),
            RestartFrame = make_action("Restart frame", "DapRestartFrame"),
            LoadJSON = make_action("Load launch JSON", function()
                dap_vscode.load_launchjs("launch.json")
            end),
            ClearBreakpoints = make_action("Clear all breakpoints", "PBClearAllBreakpoints"),
        }

        local utils = require("utils")
        local make_opts = utils.opts_with_desc({
            silent = true,
        })

        local mappings = {}

        local shortcuts = {
            l = actions.LoadJSON,
            b = actions.ToggleBreakpoint,
            c = actions.Continue,
            s = actions.StepInto,
            t = actions.Terminate,
        }
        for key, action in pairs(shortcuts) do
            local map = {
                "n",
                "<leader>k" .. key,
                action.action,
                make_opts(action.desc),
            }
            table.insert(mappings, map)
        end

        table.insert(mappings, {
            "n",
            "<leader>ka",
            function()
                local descriptions = {}
                local acts = {}
                for _, action in pairs(actions) do
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
            make_opts("Actions"),
        })

        table.insert(mappings, {
            "n",
            "<leader>kn",
            function()
                local dap_utils = require("plugin.lsp.nvim-dap.utils")
                dap_utils.create_launch(dap)
            end,
            make_opts("New configuration"),
        })

        utils.set_keymaps(mappings)
    end,
}
