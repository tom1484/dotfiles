return {
    "Bekaboo/dropbar.nvim",
    enabled = false,
    -- optional, but required for fuzzy finder support
    event = "VeryLazy",
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("plugin.config.dropbar")
    end,
}
