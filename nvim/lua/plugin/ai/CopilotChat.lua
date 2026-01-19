local utils = require("util")

return {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
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

        local make_opts = utils.opts_with_desc({})

        local mappings = {
            {
                "n",
                "<leader>C",
                ":CopilotChat<CR>",
                make_opts("Open Copilot Chat"),
            }
        }

        utils.set_keymaps(mappings)
    end,
}
