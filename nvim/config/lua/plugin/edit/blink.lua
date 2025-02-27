return {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = {
        "rafamadriz/friendly-snippets",
        "Kaiser-Yang/blink-cmp-avante",
    },
    event = "VeryLazy",
    -- use a release tag to download pre-built binaries
    version = "*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',
    opts = {
        -- enabled = function()
        --     return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype)
        --         and vim.bo.buftype ~= "prompt"
        --         and vim.b.completion ~= false
        -- end,
        enabled = function()
            return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
        end,
        -- Disable cmdline
        cmdline = {
            enabled = true,
            keymap = {
                -- set to 'none' to disable the 'default' preset
                preset = "none",
                ["<C-space>"] = {},
                ["<C-e>"] = { "hide" },
                ["<CR>"] = { "accept", "fallback" },

                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },

                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },

                ["<C-n>"] = { "snippet_forward", "fallback" },
                ["<C-p>"] = { "snippet_backward", "fallback" },

                ["<C-h>"] = { "show_signature", "hide_signature", "fallback" },
                ["<C-d>"] = { "show", "show_documentation", "hide_documentation", "fallback_to_mappings" },
            },
            completion = {
                trigger = {
                    show_on_blocked_trigger_characters = {},
                    show_on_x_blocked_trigger_characters = {},
                },
                list = {
                    selection = {
                        -- When `true`, will automatically select the first item in the completion list
                        preselect = false,
                        -- When `true`, inserts the completion item automatically when selecting it
                        auto_insert = true,
                    },
                },
                -- Whether to automatically show the window when new completion items are available
                menu = { auto_show = true },
                -- Displays a preview of the selected item on the current line
                ghost_text = { enabled = true },
            },
        },
        completion = {
            -- 'prefix' will fuzzy match on the text before the cursor
            -- 'full' will fuzzy match on the text before _and_ after the cursor
            -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
            keyword = { range = "full" },
            -- Disable auto brackets
            -- NOTE: some LSPs may add auto brackets themselves anyway
            accept = { auto_brackets = { enabled = false } },
            -- Don't select by default, auto insert on selection
            -- list = { selection = { preselect = false, auto_insert = true } },
            -- or set via a function
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false,
                },
            },
            menu = {
                border = "rounded",
                -- Don't automatically show the completion menu
                auto_show = true,
                winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                -- nvim-cmp style menu
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind" },
                    },
                    treesitter = { "lsp" },
                },
            },
            -- Show documentation when selecting a completion item
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                window = {
                    border = "rounded",
                    winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
                },
            },
            -- Display a preview of the selected item on the current line
            ghost_text = { enabled = false },
        },
        sources = {
            -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
            default = { "lsp", "path", "snippets", "buffer" },
            -- providers = {
            --     avante = {
            --         module = "blink-cmp-avante",
            --         name = "Avante",
            --         opts = {
            --             -- options for blink-cmp-avante
            --          },
            --     },
            -- },
        },
        -- Blink.cmp uses a Rust fuzzy matcher by default for frecency, proximity bonsu, typo resistance and
        -- significantly better performance. A lua implementation has been included as well.
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },
        -- Use a preset for snippets, check the snippets documentation for more information
        -- snippets = { preset = "default" | "luasnip" | "mini_snippets" },
        snippets = {
            -- Function to use when expanding LSP provided snippets
            expand = function(snippet)
                vim.snippet.expand(snippet)
            end,
            -- Function to use when checking if a snippet is active
            active = function(filter)
                return vim.snippet.active(filter)
            end,
            -- Function to use when jumping between tab stops in a snippet, where direction can be negative or positive
            jump = function(direction)
                vim.snippet.jump(direction)
            end,
        },

        -- Experimental signature help support
        signature = { enabled = true },
        keymap = {
            -- set to 'none' to disable the 'default' preset
            preset = "none",
            ["<C-space>"] = {},
            ["<C-e>"] = { "hide" },
            ["<CR>"] = { "accept", "fallback" },

            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },

            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },

            ["<C-n>"] = { "snippet_forward", "fallback" },
            ["<C-p>"] = { "snippet_backward", "fallback" },

            ["<C-h>"] = { "show_signature", "hide_signature", "fallback" },
            ["<C-d>"] = { "show", "show_documentation", "hide_documentation", "fallback_to_mappings" },
        },
        appearance = { use_nvim_cmp_as_default = true },
    },
    opts_extend = { "sources.default" },
}
