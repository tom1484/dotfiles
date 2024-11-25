return {
    "rcarriga/nvim-notify",
    -- enabled = false,
    lazy = false,
    event = "VeryLazy",
    opts = {
        stages = "static",
        render = "minimal",
        top_down = false,
        timeout = 2000,
    },
    config = function(_, opts)
        vim.opt.termguicolors = true

        local notify = require("notify")
        notify.setup(opts)

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
    end,
}
