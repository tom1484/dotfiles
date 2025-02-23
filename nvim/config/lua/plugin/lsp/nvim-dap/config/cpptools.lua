local M = {}

function M.setup(dap)
    local utils = require("plugin.lsp.nvim-dap.utils")

    utils.register_debugger(dap, "cppdbg", {
        id = "cppdbg",
        type = "executable",
        command = vim.fn.expand(
            "$HOME/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
        ),
    }, {
        {
            name = "Launch file (cppdbg)",
            type = "cppdbg",
            request = "launch",
            cwd = "${workspaceFolder}",
            program = "${workspaceFolder}/<executable file>",
            stopAtEntry = true,
        },
        {
            name = "Attach to gdbserver",
            type = "cppdbg",
            request = "launch",
            MIMode = "gdb",
            miDebuggerServerAddress = "localhost:3333",
            miDebuggerPath = "/usr/bin/gdb",
            cwd = "${workspaceFolder}",
            program = "${workspaceFolder}/<executable file>",
            setupCommands = {
                {
                    text = "-enable-pretty-printing",
                    description = "enable pretty printing",
                    ignoreFailures = false,
                },
            },
        },
    })

    -- If you want to use this for Rust and C, add something like this:
    -- add_config(dap, "cpp", configurations)
    -- utils.add_config(dap, "c", configurations)
    -- add_config(dap, "rust", configurations)
end

return M
