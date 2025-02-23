local M = {}

function M.setup(dap)
    local utils = require("plugin.lsp.nvim-dap.utils")

    utils.register_debugger(dap, "codelldb", {
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
    }, {
        {
            name = "Launch file (codelldb)",
            type = "codelldb",
            request = "launch",
            cwd = "${workspaceFolder}",
            program = "${workspaceFolder}/<executable file>",
            stopOnEntry = false,
        },
    })

    -- If you want to use this for Rust and C, add something like this:
    -- local add_config = require("plugin.lsp.nvim-dap.utils").add_config
    -- add_config(dap, "cpp", configurations)
    -- add_config(dap, "c", configurations)
    -- add_config(dap, "rust", configurations)
end

return M
