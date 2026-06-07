return {
    setup = function(bufnr)
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
}
