return {
    "mfussenegger/nvim-dap",
    keys = require("core.keymaps").lazy("dap"),
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap-python",
        "jay-babu/mason-nvim-dap.nvim",
        "Joakker/lua-json5",
    },
    event = "VeryLazy",
    opts = function()
        local config_loader = require("utils.config_loader")

        local entries = require("utils.language").enabled_dap_entries()
        local configs = config_loader.read_config_files(vim.fn.stdpath("config") .. "/lua/languages/dap", {
            match_wildcards = { "*.lua" },
        })

        local enabled_setups = {}
        local mason_entries = {}

        for _, entry in ipairs(entries) do
            local config = configs[entry]
            if config then
                enabled_setups[entry] = config.setup
                table.insert(mason_entries, config.mason)
            end
        end

        return {
            ensure_installed = mason_entries,
            enabled_setups = enabled_setups,
        }
    end,
    config = function(_, opts)
        require("mason-nvim-dap").setup({
            ensure_installed = opts.ensure_installed,
        })

        local dap = require("dap")
        for _, setup in pairs(opts.enabled_setups) do
            setup(dap)
        end

        -- Use json5
        local dap_vscode = require("dap.ext.vscode")
        dap_vscode.json_decode = require("json5").parse
    end,
}
