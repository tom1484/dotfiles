local notify = require("notify")

vim.opt.termguicolors = true
-- vim.notify = require("notify")

notify.setup({
    -- background_colour = "#000000",
    stages = "static",
    render = "minimal",
    top_down = false,
    timeout = 2000,
})

-- Ignore some messages
local ignored_message = {
    "deprecated",
    "tbl_add_reverse",
    "tbl_add_reverse_lookup",
    "warning: multiple different client offset_encodings",
}

vim.notify = function(msg, ...)
    for _, pattern in ipairs(ignored_message) do
        if msg:match(pattern) then
            return
        end
    end
    notify(msg, ...)
end
