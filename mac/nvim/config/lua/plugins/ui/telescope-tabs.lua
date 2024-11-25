return {
    "LukasPietzschmann/telescope-tabs",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
        show_preview = true,
        entry_formatter = function(tab_id, _, file_names, _, is_current)
            local entry_string = table.concat(file_names, " | ")
            return string.format("%d: %s%s", tab_id, entry_string, is_current and " <" or "")
        end,
        entry_ordinal = function(tab_id, _, file_names, _, _)
            return string.format("%d %s", tab_id, table.concat(file_names, " "))
        end,
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("telescope-tabs")

        local utils = require("utils")
        local teletab = require("telescope-tabs")

        utils.set_keymaps({
            {
                "n",
                "<leader>t",
                teletab.list_tabs,
                { desc = "Tabs" },
            },
        })
    end,
}
