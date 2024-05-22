local lsp = require("lspconfig")

lsp.pylyzer.setup({
    settings = {
        python = {
            checkOnType = false,
            diagnostics = false,
            inlayHints = true,
            smartCompletion = true,
        },
    },
    root_dir = lsp.util.root_pattern("*.py"),
})
