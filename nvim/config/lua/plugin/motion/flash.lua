return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            char = {
                keys = {},
            },
        },
    },
    config = function(_, opts)
        local flash = require("flash")
        flash.setup(opts)

        local utils = require("utils")
        local set_opts = utils.opts_with_desc({
            noremap = true,
            silent = true,
        })

        local mappings = {
            {
                { "n", "x", "o" },
                "s",
                function()
                    flash.jump()
                end,
                set_opts("Flash jump"),
            },
            {
                { "n", "o", "x" },
                "S",
                function()
                    flash.treesitter()
                end,
                set_opts("Flash region"),
            },
            -- {
            --     "o",
            --     "r",
            --     function()
            --         flash.remote()
            --     end,
            --     opts("Jump to next flash"),
            -- },
            {
                { "n", "o", "x" },
                "R",
                function()
                    flash.treesitter_search()
                end,
                set_opts("Flash remote region"),
            },
            -- {
            --     { "c" },
            --     "<c-s>",
            --     function()
            --         flash.toggle()
            --     end,
            --     opts("Jump to next flash"),
            -- },
        }

        utils.set_keymaps(mappings)
    end,
    specs = {
        {
            "folke/snacks.nvim",
            opts = {
                picker = {
                    win = {
                        input = {
                            keys = {
                                ["<a-s>"] = { "flash", mode = { "n", "i" } },
                                ["s"] = { "flash" },
                            },
                        },
                    },
                    actions = {
                        flash = function(picker)
                            require("flash").jump({
                                pattern = "^",
                                label = { after = { 0, 0 } },
                                search = {
                                    mode = "search",
                                    exclude = {
                                        function(win)
                                            return vim.bo[vim.api.nvim_win_get_buf(win)].filetype
                                                ~= "snacks_picker_list"
                                        end,
                                    },
                                },
                                action = function(match)
                                    local idx = picker.list:row2idx(match.pos[1])
                                    picker.list:_move(idx, true, true)
                                end,
                            })
                        end,
                    },
                },
            },
        },
    },
}
