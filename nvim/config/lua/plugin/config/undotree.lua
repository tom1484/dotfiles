local utils = require("utils")

local opts = utils.opts_with_desc({
    silent = true,
})
local mappings = {
    {"n", "<leader>u", vim.cmd.UndotreeToggle, opts("Undotree")},
}
utils.set_keymaps(mappings)
