return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
            keymaps = {
                insert = "<C-y>x",
                insert_line = "<C-y>X",
                normal = "yx",
                normal_cur = "yxx",
                normal_line = "yX",
                normal_cur_line = "yXX",
                visual = "X",
                visual_line = "gX",
                delete = "dx",
                change = "cx",
                change_line = "cX",
            },
        })
    end,
}
