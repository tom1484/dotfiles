return {
    "neovim/nvim-lspconfig",
    keys = require("core.keymaps").lazy("lsp"),
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
        local config_loader = require("utils.config_loader")

        local entries = require("utils.language").get_lsp_entries()
        local configs = config_loader.read_config_files(vim.fn.stdpath("config") .. "/lua/languages/lsp", {
            match_wildcards = { "*.lua" },
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
        -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, )
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({
            border = style.border,
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({
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

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = false

        for _, config in pairs(opts.enabled_configs) do
            local config_opts = config.opts or {}
            config_opts.capabilities = vim.tbl_deep_extend("force", capabilities, config_opts.capabilities or {})
            vim.lsp.config(config.server, config_opts)
            vim.lsp.enable(config.server)
            if config.additional_capabilities then
                config.additional_capabilities()
            end
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = require("utils.lsp").attach_callback,
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
                table.insert(
                    lines,
                    string.format("  • %s (id: %d, pid: %s)", client.name, client.id, client.pid or "N/A")
                )
            end

            local all_clients = vim.lsp.get_clients()
            if #all_clients > #clients then
                table.insert(lines, "\nOther active LSP clients:")
                for _, client in ipairs(all_clients) do
                    local attached = false
                    for _, c in ipairs(clients) do
                        if c.id == client.id then
                            attached = true
                            break
                        end
                    end
                    if not attached then
                        table.insert(
                            lines,
                            string.format("  • %s (id: %d, pid: %s)", client.name, client.id, client.pid or "N/A")
                        )
                    end
                end
            end

            print(table.concat(lines, "\n"))
        end, { desc = "Show LSP client information" })
    end,
}
