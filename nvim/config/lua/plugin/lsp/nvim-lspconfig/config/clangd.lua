return {
    server = "clangd",
    config = {
        cmd = {
            vim.fn.expand("$HOME/.local/share/nvim/mason/bin/clangd"),
            "--background-index",
        },
        -- root_dir = lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    },
}
