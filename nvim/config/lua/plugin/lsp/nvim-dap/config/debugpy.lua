-- To install debugpy manually:
--     mkdir ~/.virtualenvs
--     cd ~/.virtualenvs
--     python -m venv debugpy
--     debugpy/bin/python -m pip install debugpy

local M = {}

function M.setup(dap)
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
end

return M
