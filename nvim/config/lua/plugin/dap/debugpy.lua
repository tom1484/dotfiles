local M = {}

function M.setup(dap)
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
end

return M
