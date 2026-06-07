return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local nts = require("nvim-treesitter")
        nts.setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        local ensure_installed = {
            "bash",
            "c",
            "cpp",
            "css",
            "diff",
            "dockerfile",
            "fish",
            "gitignore",
            "go",
            "graphql",
            "html",
            "javascript",
            "json",
            "json5",
            "jsonc",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "requirements",
            "rust",
            "scss",
            "tmux",
            "toml",
            "vim",
            "vimdoc",
            "yaml",
        }

        nts.install(ensure_installed)

        local highlight_disable = { markdown = true, text = true }
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local buf = args.buf
                local ft = vim.bo[buf].filetype
                if ft == "" or highlight_disable[ft] then
                    return
                end
                local lang = vim.treesitter.language.get_lang(ft) or ft
                if not pcall(vim.treesitter.language.add, lang) then
                    return
                end
                pcall(vim.treesitter.start, buf, lang)
                vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
