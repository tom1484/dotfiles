return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "rcarriga/cmp-dap",
    },
    event = "VeryLazy",
    opts = function()
        local style = require("def.style")

        local lspkind = require("lspkind")
        local luasnip = require("luasnip")
        local cmp = require("cmp")

        -- local has_words_before = function()
        --     unpack = unpack or table.unpack
        --     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        --     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        -- end

        return {
            mapping = {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                        -- elseif has_words_before() then
                        --   cmp.complete()
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
                        if cmp.get_selected_entry() then
                            cmp.mapping.confirm({ select = true })()
                        else
                            cmp.close()
                        end
                    else
                        fallback()
                    end
                end, { "i" }),
                -- ["<C-Space>"] = cmp.mapping.complete(),
                -- ["<C-Space>"] = cmp.mapping(function(fallback)
                -- vim.fn["copilot#Accept"]("")
                -- if vim.b._copilot_suggestion ~= nil then
                -- 	vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn["copilot#Accept"](), true, true, true), "")
                --           vim.cmd("q")
                --       else
                --           vim.cmd("w")
                -- end
                -- end, { "i" }),
            },
            preselect = cmp.PreselectMode.None,
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,
            },
            sources = cmp.config.sources({
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- For luasnip users.
                { name = "dap" },
            }, {
                { name = "buffer" },
            }),
            window = {
                documentation = {
                    zindex = 98,
                    border = style.border,
                    winhighlight = "FloatBorder:LspInfoBorder,CursorLine:PmenuSel",
                    scrollbar = true,
                },
                completion = {
                    zindex = 99,
                    border = style.border,
                    winhighlight = "FloatBorder:LspInfoBorder,CursorLine:PmenuSel",
                    scrollbar = true,
                },
            },
            formatting = {
                fileds = { "kind", "abbr", "menu" },
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 45,
                    -- menu = {
                    -- 	buffer = "[Buffer]",
                    -- 	nvim_lsp = "[LSP]",
                    -- 	luasnip = "[LuaSnip]",
                    -- 	nvim_lua = "[Lua]",
                    -- 	latex_symbols = "[Latex]",
                    -- },
                }),
            },
        }
    end,
    config = function(_, opts)
        local cmp = require("cmp")
        cmp.setup(opts)

        local cmd_mappings = {
            ["<Tab>"] = {
                c = function()
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        cmp.complete()
                    end
                end,
            },
            ["<S-Tab>"] = {
                c = function()
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        cmp.complete()
                    end
                end,
            },
            ["<CR>"] = {
                c = function(fallback)
                    if cmp.visible() and cmp.get_selected_entry() then
                        cmp.mapping.confirm({ select = true })()
                    else
                        fallback()
                    end
                end,
            },
        }

        cmp.setup.cmdline("/", {
            mapping = cmd_mappings,
            preselect = cmp.PreselectMode.None,
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline("@", {
            mapping = cmd_mappings,
            preselect = cmp.PreselectMode.None,
            sources = {
                { name = "path" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmd_mappings,
            preselect = cmp.PreselectMode.None,
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = { "Man", "!" },
                    },
                },
            }),
        })
    end,
}
