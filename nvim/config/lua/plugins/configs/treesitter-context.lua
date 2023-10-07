require("treesitter-context").setup({
    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 3,            -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = "outer",     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = "cursor",          -- Line used to calculate context. Choices: 'cursor', 'topline'
    separator = nil,
    -- separator = '-',
    zindex = 20,     -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})

vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true })

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.cmd([[
        if exists(":TSContextEnable")
            TSContextEnable
        endif
        ]])
    end,
})
