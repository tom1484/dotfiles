return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "VonHeikemen/lsp-zero.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "ray-x/lsp_signature.nvim",
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",
        "saghen/blink.cmp",
    },
    event = { "BufReadPost", "VeryLazy" },
    opts = function()
        local util = require("util")

        local entries = require("util.language").get_lsp_entries()
        local configs = util.read_config_files(vim.fn.stdpath("config") .. "/lua/language/lsp", {
            match_wildcards = { "*.lua" },
            keep_name = true,
        })

        local enabled_configs = {}
        local mason_entries = {}

        for _, entry in ipairs(entries) do
            local config = configs[entry]
            if config then
                enabled_configs[entry] = config
                table.insert(mason_entries, config.server)
            end
        end

        return {
            ensure_installed = mason_entries,
            enabled_configs = enabled_configs,
        }
    end,
    config = function(_, opts)
        local style = require("config").style
        
        -- Load lspconfig to register its commands like :LspInfo
        require("lspconfig")
        
        -- Configure borders BEFORE setting up LSP servers
        vim.diagnostic.config({
            virtual_text = true,
            float = {
                border = style.border,
            },
        })

        -- Configure borders for all LSP handlers
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = style.border,
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = style.border,
        })
        
        -- Set default border for all LSP windows
        require("lspconfig.ui.windows").default_options.border = style.border
        
        -- Override the default floating window options
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or style.border
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        require("mason-lspconfig").setup({
            ensure_installed = opts.ensure_installed,
            automatic_enable = false,
        })

        for _, config in pairs(opts.enabled_configs) do
            vim.lsp.config(config.server, config.opts or {})
            vim.lsp.enable(config.server)
            if config.additional_capabilities then
                config.additional_capabilities()
            end
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = require("util.lsp").attach_callback,
        })

        -- Custom LspInfo command
        vim.api.nvim_create_user_command("LspInfo", function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then
                print("No LSP clients attached to current buffer")
                return
            end
            
            local lines = { "LSP clients attached to buffer " .. vim.api.nvim_get_current_buf() .. ":" }
            for _, client in ipairs(clients) do
                table.insert(lines, string.format("  • %s (id: %d, pid: %s)", 
                    client.name, client.id, client.pid or "N/A"))
            end
            
            local all_clients = vim.lsp.get_clients()
            if #all_clients > #clients then
                table.insert(lines, "\nOther active LSP clients:")
                for _, client in ipairs(all_clients) do
                    local attached = false
                    for _, c in ipairs(clients) do
                        if c.id == client.id then attached = true break end
                    end
                    if not attached then
                        table.insert(lines, string.format("  • %s (id: %d, pid: %s)", 
                            client.name, client.id, client.pid or "N/A"))
                    end
                end
            end
            
            print(table.concat(lines, "\n"))
        end, { desc = "Show LSP client information" })

        -- Keymaps
        local utils = require("util")
        local keymap_opts = utils.opts_with_desc({ remap = false })

        local mappings = {
            {
                "n",
                "gr",
                function()
                    vim.lsp.buf.rename()
                end,
                keymap_opts("Rename"),
            },
            {
                "n",
                "gh",
                function()
                    vim.lsp.buf.hover()
                end,
                keymap_opts("Hover doc"),
            },
            {
                "n",
                "gW",
                function()
                    vim.diagnostic.open_float()
                end,
                keymap_opts("Show diagnostics"),
            },
            {
                "n",
                "gwn",
                function()
                    vim.diagnostic.goto_next()
                end,
                keymap_opts("Next diagnostic"),
            },
        }

        utils.set_keymaps(mappings)
    end,
}
