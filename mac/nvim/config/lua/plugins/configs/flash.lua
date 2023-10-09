local flash = require("flash")

flash.setup({
    modes = {
        char = {
            keys = {},
        },
    },
})

local mappings = {
    {
        { "n", "x", "o" },
        "s",
        function()
            flash.jump()
        end,
    },
    {
        { "n", "o", "x" },
        "S",
        function()
            flash.treesitter()
        end,
    },
    {
        "o",
        "r",
        function()
            flash.remote()
        end,
    },
    {
        { "o", "x" },
        "R",
        function()
            flash.treesitter_search()
        end,
    },
    {
        { "c" },
        "<c-s>",
        function()
            flash.toggle()
        end,
    },
}

local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
    vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
