return {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    keys = require("core.keymaps").lazy("copilot_chat"),
    dependencies = {
        { "zbirenbaum/copilot.lua" },
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
        model = "claude-3.7-sonnet",
        mappings = {
            -- submit_prompt = {
            --     normal = "<Leader>s",
            --     insert = "<C-s>",
            -- },
            show_diff = {
                full_diff = false,
            },
            reset = {
                normal = "<C-x>",
                insert = "<C-x>",
            }
        },
    },
    -- See Commands section for default commands if you want to lazy load on them
    config = function(_, opts)
        require("CopilotChat").setup(opts)
    end,
}
