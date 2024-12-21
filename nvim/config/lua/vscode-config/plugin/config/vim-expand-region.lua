local utils = require("utils")

utils.set_keymaps({
    { "v", "=", "<Plug>(expand_region_expand)", { silent = true, desc = "Expand region" } },
    { "v", "-", "<Plug>(expand_region_shrink)", { silent = true, desc = "Shrink region" } },
})
