local utils = require("utils")

return {
    "LukasPietzschmann/telescope-tabs",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
        show_preview = true,
        entry_formatter = function(tab_id, _, file_names, file_paths, is_current)
            local entries = {}
            for _, path in ipairs(file_paths) do
                local splits = utils.split_str(path, "/")
                local last_two = utils.array_last_n(splits, 2)
                local entry = table.concat(last_two, "/")
                table.insert(entries, entry)
            end
            local entry_string = table.concat(entries, " | ")
            return string.format("%d: %s%s", tab_id, entry_string, is_current and " <" or "")
        end,
        entry_ordinal = function(tab_id, _, file_names, _, _)
            return string.format("%d %s", tab_id, table.concat(file_names, " "))
        end,
    },
    config = function(_, opts)
        require("telescope-tabs").setup(opts)
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
