require("reactive").setup({
    builtin = {
        -- cursorline = true,
        cursor = true,
        modemsg = true,
    },
    configs = {
        -- a key here is a preset name, a value can be a boolean (if false, presets will be disabled)
        -- or a table that overwrites preset's values
        presetone = {
            modes = {
                i = {
                    winhl = {
                        -- overwrites StatusLine highlight group in insert mode
                        StatusLine = { bg = "", fg = "" },
                    },
                },
            },
        },
        -- disables `presettwo`
        presettwo = false,
    },
})
