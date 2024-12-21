return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("ibl").setup()
    end,
}
