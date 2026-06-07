return {
    setup = function()
        require("core.keymaps").register_common()
        require("common.misc").setup()
        require("common.color").setup()

        local indent = require("common.indent")
        local buffer = require("common.buffer")
        local group = vim.api.nvim_create_augroup("UserCommonConfig", { clear = true })

        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            callback = function(args)
                indent.setup(args.buf)
                buffer.setup(args.buf)
            end,
        })
    end,
}
