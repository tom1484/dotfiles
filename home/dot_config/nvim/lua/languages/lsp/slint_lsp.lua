return {
    server = "slint_lsp",
    additional_capabilities = function()
        vim.cmd([[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]])
    end,
}
