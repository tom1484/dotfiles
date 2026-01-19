local util = require("util")

local opts = util.opts_with_desc()
local silent_opts = util.opts_with_desc({
    silent = true,
})

return {
    -- panes manipulation
    { "n", "<leader>wt", ":tabe",            opts("New tab") },
    { "n", "<leader>wh", ":vsplit",          opts("New vertical split") },
    { "n", "<leader>wv", ":split",           opts("New horizontal split") },
    -- line manipulation
    { "v", "J",          ":m '>+1<CR>gv=gv", silent_opts("Move lines down") },
    { "v", "K",          ":m '<-2<CR>gv=gv", silent_opts("Move lines up") },
    -- register
    {
        "v",
        "<leader>y",
        [["+y]],
        silent_opts("Copy to system"),
    },
}
