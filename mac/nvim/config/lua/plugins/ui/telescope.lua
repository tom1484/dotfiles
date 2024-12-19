return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    lazy = false,
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        local utils = require("utils")
        local tweak = require("utils.telescope")

        local hidden_folder_pattern = function(pattern)
            -- "^%.[^/]*/",
            return {
                "^([^/]+/)" .. pattern .. "/",
                "^" .. pattern .. "/",
            }
        end

        local hidden_folder = {
            -- "%.[^/]*",
            "node_modules",
            "target",
            ".git",
        }
        local hidden_folder_patterns = {}

        for _, folder in ipairs(hidden_folder) do
            local pattern = hidden_folder_pattern(folder)
            table.insert(hidden_folder_patterns, pattern[1])
            table.insert(hidden_folder_patterns, pattern[2])
        end

        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        -- even more opts
                    }),

                    -- pseudo code / specification for writing custom displays, like the one
                    -- for "codeactions"
                    -- specific_opts = {
                    --   [kind] = {
                    --     make_indexed = function(items) -> indexed_items, width,
                    --     make_displayer = function(widths) -> displayer
                    --     make_display = function(displayer) -> function(e)
                    --     make_ordinal = function(e) -> string
                    --   },
                    --   -- for example to disable the custom builtin "codeactions" display
                    --      do the following
                    --   codeactions = false,
                    -- }
                },
            },
            defaults = {
                mappings = {
                    i = {
                        ["<Tab>"] = actions.move_selection_next,
                        ["<S-Tab>"] = actions.move_selection_previous,

                        ["<C-y>"] = function(prompt_bufnr)
                            actions.toggle_selection(prompt_bufnr)
                            actions.move_selection_next(prompt_bufnr)
                        end,
                        ["<C-n>"] = function(prompt_bufnr)
                            actions.toggle_selection(prompt_bufnr)
                            actions.move_selection_previous(prompt_bufnr)
                        end,
                        ["<C-x>"] = actions.drop_all,

                        ["<C-h>"] = actions.select_vertical,
                        ["<C-v>"] = actions.select_horizontal,

                        ["<C-s>"] = actions.smart_send_to_qflist,

                        ["<Esc>"] = actions.close,
                        ["<C-d>"] = actions.delete_buffer,

                        ["<CR>"] = actions.select_tab_drop,
                        ["<C-CR>"] = actions.select_default,
                    },
                    n = {
                        ["q"] = actions.close,
                        ["<Esc>"] = actions.close,
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
                file_ignore_patterns = hidden_folder_patterns,
            },
        })

        require("telescope").load_extension("ui-select")

        local builtin = require("telescope.builtin")

        local opts = utils.opts_with_desc({
            silent = true,
        })
        local mappings = {
            {
                "n",
                "<leader>pf",
                utils.find_files,
                opts("Find files"),
            },
            {
                "n",
                "<leader>b",
                function(opt)
                    if opt == nil then
                        opt = {}
                    end
                    opt = vim.tbl_extend("force", opt, { sort_mru = true, ignore_current_buffer = true })
                    builtin.buffers(opt)
                end,
                opts("Find buffers"),
            },
            {
                "n",
                "<leader>pg",
                builtin.git_files,
                opts("Find git files"),
            },
            {
                "n",
                "<leader>ps",
                function()
                    builtin.live_grep({ use_regex = true })
                end,
                opts("Search in project"),
            },
            {
                "n",
                "<leader>fs",
                function()
                    builtin.live_grep({ search_dirs = { "%:p" }, path_display = "hidden", use_regex = true })
                end,
                opts("Search in file"),
            },
        }
        utils.set_keymaps(mappings)
    end,
}
