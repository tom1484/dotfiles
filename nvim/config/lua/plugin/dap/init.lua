local dap = require("dap")
local dapui = require("dapui")

require("plugin.dap.debugpy").setup(dap)
-- require("plugin.dap.cpptools").setup(dap)
require("plugin.dap.codelldb").setup(dap)

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
    dapui.close()
  end,
  cmd("DapToggleRepl"),
  cmd("DapSetLogLevel"),
  cmd("DapRestartFrame"),
  cmd("DapLoadLaunchJSON"),
}

vim.keymap.set("n", "<leader>kb", actions[1])
vim.keymap.set("n", "<leader>kc", actions[2])
vim.keymap.set("n", "<leader>ks", actions[4])
vim.keymap.set("n", "<leader>kt", actions[6])

vim.keymap.set("n", "<leader>ka", function()
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
end)
