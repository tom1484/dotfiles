local dapui = require("dapui")

dapui.setup()

local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- dap.listeners.after.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.after.event_exited["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.after.disconnect["dapui_config"] = function()
--   dapui.close()
-- end
