local flash = require("flash")

flash.setup({
    modes = {
        char = {
            keys = {},
        },
    },
})

local opts = vim.custom.fn.opts_with_desc({
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
        opts("Flash jump"),
    },
    {
        { "n", "o", "x" },
        "S",
        function()
            flash.treesitter()
        end,
        opts("Flash region"),
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
        opts("Flash remote region"),
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

vim.custom.fn.set_keymaps(mappings)
