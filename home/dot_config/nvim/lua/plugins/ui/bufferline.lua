return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
        options = {
            mode = "tabs",
            themable = true,
            indicator = {
                style = "none",
            },
            diagnostics = "nvim_lsp",
        }
    },
}
