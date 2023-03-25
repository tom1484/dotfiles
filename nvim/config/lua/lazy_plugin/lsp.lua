return {
    init = function() end,
    setup = function()
        local lsp = require("lsp-zero").preset({
            manage_nvim_cmp = false,
        })

        -- lsp.preset("recommended")
        lsp.ensure_installed({
            "clangd",
            "eslint",
            "gopls",
            "html",
            "jsonls",
            "julials",
            "lua_ls",
            "pylsp",
            "rust_analyzer",
            "taplo",
        })

        -- Fix Undefined global 'vim'
        lsp.configure("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        lsp.set_preferences({
            suggest_lsp_servers = true,
            sign_icons = {
                error = "E",
                warn = "W",
                hint = "H",
                info = "I",
            },
        })

        lsp.configure("eslint", {
            on_attach = function(client, bufnr)
                print("hello tsserver")
            end,
            settings = {
                completions = {
                    completeFunctionCalls = true,
                },
            },
        })

        lsp.on_attach(function(client, bufnr)
            local lsp_signature = require("lsp_signature")
            lsp_signature.on_attach({
                bind = true,
                floating_window = false,
                handler_opts = {
                    border = "rounded",
                },
            }, bufnr)

            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "<leader>v", function() end)

            vim.keymap.set("n", "<leader>vd", function()
                vim.lsp.buf.definition()
            end, opts)

            vim.keymap.set("n", "<leader>vh", function()
                vim.lsp.buf.hover()
            end, opts)

            vim.keymap.set("n", "<leader>vw", function()
                vim.diagnostic.open_float()
            end, opts)
            vim.keymap.set("n", "<leader>v]w", function()
                vim.diagnostic.goto_next()
            end, opts)
            vim.keymap.set("n", "<leader>v[w", function()
                vim.diagnostic.goto_prev()
            end, opts)

            vim.keymap.set("n", "<leader>vws", function()
                vim.lsp.buf.workspace_symbol()
            end, opts)

            vim.keymap.set("n", "<leader>vca", function()
                vim.lsp.buf.code_action()
            end, opts)

            vim.keymap.set("n", "<leader>vrr", function()
                vim.lsp.buf.references()
            end, opts)

            vim.keymap.set("n", "<leader>vrn", function()
                vim.lsp.buf.rename()
            end, opts)
        end)

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true,
        })

        local notify = vim.notify
        vim.notify = function(msg, ...)
            if msg:match("warning: multiple different client offset_encodings") then
                return
            end
            notify(msg, ...)
        end
    end,
}
