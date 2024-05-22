local dap = require("dap")
local _, dapui = pcall(require, "dapui")

require("plugin.config.dap.debugpy").setup(dap)
-- require("plugin.config.dap.cpptools").setup(dap)
require("plugin.config.dap.codelldb").setup(dap)

local function cmd(name)
    return function()
        vim.cmd(name)
    end
end

local actions = {
    cmd("DapToggleBreakpoint"),
    cmd("DapContinue"),
    cmd("DapStepOver"),
    cmd("DapStepInto"),
    cmd("DapStepOut"),
    function()
        vim.cmd("DapTerminate")
        if not dapui == nil then
            dapui.close()
        end
    end,
    cmd("DapToggleRepl"),
    cmd("DapSetLogLevel"),
    cmd("DapRestartFrame"),
    cmd("DapLoadLaunchJSON"),
}

local opts = vim.custom.fn.opts_with_desc({
    silent = true,
})
local mappings = {
    { "n", "<leader>kb", actions[1], opts("Toggle breakpoint") },
    { "n", "<leader>kc", actions[2], opts("Continue") },
    { "n", "<leader>ks", actions[4], opts("Step into") },
    { "n", "<leader>kt", actions[6], opts("Terminate") },
    {
        "n",
        "<leader>ka",
        function()
            vim.ui.select({
                "Toggle breakpoint",
                "Continue",
                "Step over",
                "Step into",
                "Step out",
                "Terminate",
                "Repl toggle",
                "Set log level",
                "Restart frame",
                "Load launch JSON",
            }, {
                prompt = "Select a action",
            }, function(_, idx)
                if idx then
                    actions[idx]()
                end
            end)
        end,
        opts("Actions"),
    },
}
vim.custom.fn.set_keymaps(mappings)
