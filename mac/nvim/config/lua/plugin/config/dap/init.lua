local dap = require("dap")
local dapui = require("dapui")
local languages = require("utils.languages")

local dap_configs = languages.filter_languages({
    python = {
        "debugpy",
    },
    c = {
        "codelldb",
    },
    go = {
        -- "delve",
    },
    dart = {
        "dart",
    },
})

for _, config in ipairs(dap_configs) do
    require("plugin.config.dap." .. config).setup(dap)
end

local function cmd(name)
    return function()
        vim.cmd(name)
    end
end

local actions = {
    -- cmd("DapToggleBreakpoint"),
    cmd("PBToggleBreakpoint"),
    cmd("DapContinue"),
    cmd("DapStepOver"),
    cmd("DapStepInto"),
    cmd("DapStepOut"),
    function()
        vim.cmd("DapTerminate")
        dapui.close()
    end,
    cmd("DapToggleRepl"),
    cmd("DapSetLogLevel"),
    cmd("DapRestartFrame"),
    cmd("DapLoadLaunchJSON"),
    -- function ()
    --     dap_vscode.load_launchjs("launch.json")
    -- end
    cmd("PBClearAllBreakpoints"),
}

local opts = vim.custom.fn.opts_with_desc({
    silent = true,
})
local mappings = {
    { "n", "<leader>kl", actions[10], opts("Load launch JSON") },
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
                "Clear all breakpoints",
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
