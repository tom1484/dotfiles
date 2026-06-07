-- To install debugpy manually:
--     mkdir ~/.virtualenvs
--     cd ~/.virtualenvs
--     python -m venv debugpy
--     debugpy/bin/python -m pip install debugpy

return {
    mason = "debugpy",
    setup = function(dap)
        require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    end,
}
