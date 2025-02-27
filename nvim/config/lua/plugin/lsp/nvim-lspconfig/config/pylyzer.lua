local lspconfig = require("lspconfig")

return {
    server = "pylyzer",
    config = {
        settings = {
            python = {
                checkOnType = false,
                diagnostics = false,
                inlayHints = true,
                smartCompletion = true,
            },
        },
        root_dir = lspconfig.util.root_pattern("*.py"),
    },
}
