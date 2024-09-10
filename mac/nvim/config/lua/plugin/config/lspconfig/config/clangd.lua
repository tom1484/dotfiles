local lsp = require("lspconfig")

lsp.clangd.setup({
    cmd = {
        vim.fn.expand("$HOME/.local/share/nvim/mason/bin/clangd"),
        "--background-index",
    },
    -- root_dir = lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
})
