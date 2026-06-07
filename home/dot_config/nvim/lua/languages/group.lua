-- Source of truth for enabled language features in the main Neovim config.
return {
    lua = {
        lsp = { "lua_ls" },
        tools = {
            formatters = { "stylua" },
        },
    },
    shell = {
        lsp = { "bashls" },
        tools = {
            formatters = { "shfmt" },
        },
    },
    c = {
        lsp = {
            "clangd",
            "cmake",
        },
        dap = {
            "cpptools",
            "codelldb",
        },
        tools = {
            formatters = {
                "clang_format",
                "cmake_format",
            },
            linters = {
                "cmake_lint",
            },
        },
    },
    python = {
        lsp = {
            "pyright",
        },
        dap = {
            "debugpy",
        },
        tools = {
            formatters = {
                "black",
            },
        },
    },
    dart = {
        -- lsp = {
        --     "dartls",
        -- },
        tools = {
            formatters = { "dart_format" },
        },
    },
    go = {
        lsp = {
            "gopls",
        },
        tools = {
            formatters = {
                "gofumpt",
                "goimports",
            },
            linters = {
                "revive",
            },
        },
    },
    rust = {
        lsp = {
            "rust_analyzer",
        },
    },
    web = {
        lsp = {
            "ts_ls",
            "tailwindcss",
            "html",
        },
        tools = {
            formatters = {
                "prettierd",
                -- "eslint_d",
            },
            linters = {
                -- "eslint_d",
            },
        },
    },
    slint = {
        lsp = {
            "slint_lsp",
        },
    },
    misc = {
        lsp = {
            "taplo",
            "jsonls",
        },
        tools = {
            formatters = {
                "prettierd",
                -- "xmlformat",
            },
            linters = {
                -- "jsonlint",
            },
        },
    },
}
