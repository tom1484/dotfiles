return {
    "yetone/avante.nvim",
    enabled = true,
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1" -- for windows
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
    opts = {
        ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
        provider = "gemini", -- Recommend using Claude
        auto_suggestions_provider = "gemini",
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-3-5-sonnet-20240620",
            temperature = 0,
            max_tokens = 4096,
        },
        gemini = {
            endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
            model = "gemini-1.5-flash-latest",
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 100000,
        },
        behaviour = {
            auto_suggestions = false, -- Experimental stage
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = true,
            support_paste_from_clipboard = false,
        },
        mappings = {
            --- @class AvanteConflictMappings
            diff = {
                ours = "co",
                theirs = "ct",
                all_theirs = "ca",
                both = "cb",
                cursor = "cc",
                next = "]x",
                prev = "[x",
            },
            suggestion = {
                accept = "<M-l>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
            jump = {
                next = "]]",
                prev = "[[",
            },
            submit = {
                normal = "<CR>",
                insert = "<C-s>",
            },
        },
        hints = { enabled = false },
        windows = {
            ---@type "right" | "left" | "top" | "bottom"
            position = "right", -- the position of the sidebar
            wrap = true, -- similar to vim.o.wrap
            width = 30, -- default % based on available width
            sidebar_header = {
                align = "center", -- left, center, right for title
                rounded = true,
            },
        },
        highlights = {
            diff = {
                current = "DiffText",
                incoming = "DiffAdd",
            },
        },
        diff = {
            autojump = true,
            ---@type string | fun(): any
            list_opener = "copen",
        },
        file_selector = {
            -- provider = "telescope",
            -- WARNING: This is experimental and may not work as expected
            provider = "snacks",
            -- Options override for custom providers
            provider_opts = {},
        },
    },
    config = function(_, opts)
        require("avante").setup(opts)
    end,
}
