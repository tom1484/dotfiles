local M = {}

function M.setup(dap)
    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            -- CHANGE THIS to your path!
            command = vim.fn.expand("$HOME/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"),
            -- command = "/absolute/path/to/codelldb/extension/adapter/codelldb",
            args = { "--port", "${port}" },

            -- On windows you may have to uncomment this:
            -- detached = false,
        },
    }

    local configurations = {
        {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", "./", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
        },
    }

    -- If you want to use this for Rust and C, add something like this:

    dap.configurations.cpp = configurations
    dap.configurations.c = configurations
    dap.configurations.rust = configurations
end

return M
