local teletab = require("telescope-tabs")

require("telescope").load_extension("telescope-tabs")
teletab.setup({
    show_preview = true,
    entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
        local entry_string = table.concat(file_names, " | ")
        return string.format("%d: %s%s", tab_id, entry_string, is_current and " <" or "")
    end,
    entry_ordinal = function(tab_id, buffer_ids, file_names, file_paths, is_current)
        return string.format("%d %s", tab_id, table.concat(file_names, " "))
    end,
})

vim.custom.fn.set_keymaps({
    {
        "n",
        "<leader>t",
        teletab.list_tabs,
        { desc = "Tabs" },
    },
})
