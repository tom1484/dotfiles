return {
    init = function() end,
    setup = function()
        local lsp = require("lsp-zero")

        lsp.preset("recommended")

        lsp.ensure_installed({
            "clangd",
            "eslint",
            "gopls",
            "html",
            "jsonls",
            "julials",
            "sumneko_lua",
            "pylsp",
            "rust_analyzer",
            "taplo",
            "tsserver",
        })

        -- Fix Undefined global 'vim'
        lsp.configure("sumneko_lua", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_mappings = lsp.defaults.cmp_mappings({
            -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            -- ["<C-Space>"] = cmp.mapping.complete(),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i" }),
            ["<C-n>"] = cmp.mapping(function(fallback)
                if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                else
                    -- fallback()
                end
            end, { "i", "s" }),
            ["<C-p>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    -- fallback()
                end
            end, { "i", "s" }),
            ["<CR>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.mapping.confirm({ select = true })()
                else
                    fallback()
                end
            end, { "i" }),
            ["<C-Space>"] = cmp.mapping.complete(),
        })

        -- disable completion with tab
        -- this helps with copilot setup
        -- cmp_mappings['<Tab>'] = nil
        -- cmp_mappings['<S-Tab>'] = nil

        lsp.setup_nvim_cmp({
            mapping = cmp_mappings,
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

        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "gd", function()
                vim.lsp.buf.definition()
            end, opts)
            vim.keymap.set("n", "gh", function()
                vim.lsp.buf.hover()
            end, opts)
            -- vim.keymap.set("n", "L", function()
            --     vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })
            -- end, opts)
            -- vim.keymap.set("n", "<leader>vws", function()
            --     vim.lsp.buf.workspace_symbol()
            -- end, opts)
            -- vim.keymap.set("n", "<leader>vd", function()
            --     vim.diagnostic.open_float()
            -- end, opts)
            -- vim.keymap.set("n", "[d", function()
            --     vim.diagnostic.goto_next()
            -- end, opts)
            -- vim.keymap.set("n", "]d", function()
            --     vim.diagnostic.goto_prev()
            -- end, opts)
            vim.keymap.set("n", "<leader>vca", function()
                vim.lsp.buf.code_action()
            end, opts)
            vim.keymap.set("n", "<leader>vrr", function()
                vim.lsp.buf.references()
            end, opts)
            vim.keymap.set("n", "<leader>vrn", function()
                vim.lsp.buf.rename()
            end, opts)
            -- vim.keymap.set("i", "<C-h>", function()
            --     vim.lsp.buf.signature_help()
            -- end, opts)
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

        -- Load null-ls
        require("lazy_plugin.null-ls")
    end,
}
