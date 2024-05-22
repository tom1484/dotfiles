local ft = require("guard.filetype")

-- Assuming you have guard-collection
-- ft('lang'):fmt('format-tool-1')
--           :append('format-tool-2')
--           :env(env_table)
--           :lint('lint-tool-1')
--           :extra(extra_args)

-- ft('python'):fmt('black')
--     :append("isort")
--
-- ft('c'):fmt('clang-format')
--     :extra({
--         "--style",
--         "{BasedOnStyle: Google}",
--     })
--
-- ft("cmake"):fmt("cmake_format")
--     :lint("cmake_lint")
--
-- ft("css, scss, less, html, json, jsonc, yaml, markdown, markdown.mdx, graphql, handlebars")
--     :fmt("prettierd")
--
-- ft("lua")
--     :fmt("stylua")
--     :extra({
--         "--indent-type",
--         "Spaces",
--         "--indent-width",
--         "4",
--     })
--     :lint("luacheck")

-- Call setup() LAST!
require("guard").setup({
    -- Choose to format on every write to a buffer
    fmt_on_save = false,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = true,
    -- By default, Guard writes the buffer on every format
    -- You can disable this by setting:
    -- save_on_fmt = false,
})

vim.custom.fn.set_keymaps({
    {
        "n",
        "<leader>vf",
        function()
            vim.lsp.buf.format({
                -- async = true,
            })
            vim.cmd.w()
        end,
        { desc = "Format buffer" },
    },
})
