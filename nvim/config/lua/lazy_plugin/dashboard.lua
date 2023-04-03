return {
    setup = function()
        require("dashboard").setup({
            theme = "doom",
            hide = {
                statusline = false,
                tabline = true,
                winbar = true,
            },
        })
    end,
}
