return {
    lua = {
        lsp = { "lua_ls" },
        null_ls = {
            formatting = { "stylua" },
        },
    },
    shell = {
        lsp = { "bashls" },
        null_ls = {
            formatting = { "shfmt" },
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
        null_ls = {
            formatting = {
                "clang_format",
                "cmake_format",
            },
            diagnostics = {
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
        null_ls = {
            formatting = {
                "black",
            },
        },
    },
    dart = {
        -- lsp = {
        --     "dartls",
        -- },
        null_ls = {
            formatting = { "dart_format" },
        },
    },
    go = {
        lsp = {
            "gopls",
        },
        null_ls = {
            formatting = {
                "gofumpt",
                "goimports",
            },
            diagnostics = {
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
        null_ls = {
            formatting = {
                "prettierd",
                -- "eslint_d",
            },
            diagnostics = {
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
        null_ls = {
            formatting = {
                "prettierd",
                -- "xmlformat",
            },
            diagnostics = {
                -- "jsonlint",
            },
        },
    },
}
