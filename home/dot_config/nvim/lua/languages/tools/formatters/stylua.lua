return {
    mason = "stylua",
    filetypes = { "lua" },
    config = {
        prepend_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "4",
        },
    },
}
