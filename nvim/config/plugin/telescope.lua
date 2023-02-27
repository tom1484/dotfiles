require("telescope").setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                -- ["<Esc>"] = "close",
                ["<C-h>"] = "select_vertical",
                ["<C-v>"] = "select_horizontal",
                ["<C-t>"] = "select_tab",
                ["<Tab>"] = "move_selection_next",
                ["<S-Tab>"] = "move_selection_previous",
            },
            n = {
                -- ["<C-s>"] = "send_selected_to_qflist",
                ["<C-s>"] = "smart_send_to_qflist",
            },
        },
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
            prompt_position = "top",
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },
})

local builtin = require("telescope.builtin")
-- local themes = require("telescope.themes")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})

vim.keymap.set("n", "<leader>ps", function()
    builtin.live_grep({
    -- builtin.grep_string({
        -- search = vim.fn.input("Grep > "),
        use_regex = true,
    })
end)
-- vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

vim.keymap.set("n", "<leader>fs", function()
    -- builtin.grep_string({
    builtin.live_grep({
        -- search = vim.fn.input("Grep > "),
        search_dirs = { "%:p" },
        path_display = "hidden",
        use_regex = true,
    })
end, {})
