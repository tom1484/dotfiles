return {
    "jackMort/ChatGPT.nvim",
    -- enabled = false,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "folke/trouble.nvim",
    },
    event = "VeryLazy",
    opts = {
        keymaps = {
            submit = "<C-s>",
        },
    },
}
