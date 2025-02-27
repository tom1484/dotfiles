local lspconfig = require("lspconfig")

return {
    server = "pylsp",
    config = {
        settings = {
            pylsp = {
                plugins = {
                    -- formatter options
                    black = { enabled = false },
                    autopep8 = { enabled = false },
                    yapf = { enabled = true },
                    -- linter options
                    pylint = { enabled = true, executable = "pylint" },
                    pyflakes = { enabled = false },
                    -- pycodestyle = { enabled = true },
                    -- type checker
                    pylsp_mypy = { enabled = true },
                    -- auto-completion options
                    -- jedi_completion = { fuzzy = true },
                    -- import sorting
                    pyls_isort = { enabled = true },
                },
            },
        },
        root_dir = lspconfig.util.root_pattern("*.py"),
    },
}
