return {
    init = function()
        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true

        vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
    end, 
    setup = function()
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                adaptive_size = true,
                mappings = {
                    list = {
                        { key = "u", action = "dir_up" },
                        { key = "<C-h>", action = "vsplit" },
                        { key = "<C-v>", action = "split" },
                    },
                },
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })
    end, 
}

