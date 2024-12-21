local style = require("def.style")

local utils = require("utils")
local lspsaga = require("lspsaga")
local telescope_builtin = require("telescope.builtin")

local opts = utils.opts_with_desc({ remap = false })

-- peek_definition
-- finder
-- rename
-- outline
-- open_log
-- hover_doc
-- code_action
-- term_toggle
-- winbar_toggle
-- outgoing_calls
-- incoming_calls
-- project_replace
-- goto_definition
-- diagnostic_jump_next
-- show_buf_diagnostics
-- goto_type_definition
-- peek_type_definition
-- diagnostic_jump_prev
-- show_line_diagnostics
-- show_cursor_diagnostics
-- show_workspace_diagnostics

local mappings = {
    {
        "n",
        "<leader>vh",
        function()
            -- vim.cmd("Lspsaga hover_doc")
            vim.lsp.buf.hover()
        end,
        opts("Hover doc"),
    },

    {
        "n",
        "<leader>vd",
        function()
            vim.diagnostic.open_float()
        end,
        opts("List diagnostics"),
    },
    {
        "n",
        "<leader>vnd",
        function()
            vim.diagnostic.goto_next()
        end,
        opts("Next diagnostic"),
    },
    {
        "n",
        "<leader>vpd",
        function()
            vim.diagnostic.goto_prev()
        end,
        opts("Previous diagnostic"),
    },

    {
        "n",
        "<leader>va",
        function()
            vim.cmd("Lspsaga code_action")
        end,
        opts("Code actions"),
    },

    {
        "n",
        "<leader>vr",
        function()
            vim.cmd("Lspsaga rename")
        end,
        opts("Rename"),
    },

    {
        "n",
        "<leader>vo",
        function()
            vim.cmd("Lspsaga outline")
        end,
        opts("Open outline"),
    },

    {
        "n",
        "<leader>vF",
        function()
            vim.cmd("Lspsaga finder ++inexist")
        end,
        opts("Open finder"),
    },
    {
        "n",
        "<leader>vR",
        function()
            vim.cmd("Lspsaga finder ++inexist ref")
        end,
        opts("List references"),
    },
    {
        "n",
        "<leader>vD",
        function()
            vim.cmd("Lspsaga finder ++inexist def")
        end,
        opts("List definitions"),
    },
    {
        "n",
        "<leader>vI",
        function()
            vim.cmd("Lspsaga finder ++inexist imp")
        end,
        opts("List implementations"),
    },
    {
        "n",
        "<leader>ld",
        function()
            telescope_builtin.diagnostics()
        end,
        opts("List file diagnostics"),
    },
    {
        "n",
        "<leader>ls",
        function()
            telescope_builtin.lsp_document_symbols()
        end,
        opts("List document symbols"),
    },
    {
        "n",
        "<leader>lw",
        function()
            vim.cmd("Lspsaga peek_definition")
            telescope_builtin.lsp_workspace_symbols()
        end,
        opts("List workspace symbols"),
    },
}
utils.set_keymaps(mappings)

lspsaga.setup({
    beacon = {
        -- enable = true,
        frequency = 10,
    },
    -- callhierarchy = {
    --     keys = {
    --         close = "<C-c>k",
    --         edit = "e",
    --         quit = "q",
    --         shuttle = "[w",
    --         split = "i",
    --         tabe = "t",
    --         toggle_or_req = "u",
    --         vsplit = "s",
    --     },
    --     layout = "float",
    --     left_width = 0.2,
    -- },
    -- code_action = {
    --     extend_gitsigns = false,
    --     keys = {
    --         exec = "<CR>",
    --         quit = "q",
    --     },
    --     max_height = 0.3,
    --     num_shortcut = true,
    --     only_in_cursor = true,
    --     show_server_name = false,
    -- },
    definition = {
        -- height = 0.5,
        -- width = 0.6,
        keys = {
            -- close = "<C-c>k",
            edit = "o",
            quit = "q",
            -- split = "<C-c>i",
            -- tabe = "<C-c>t",
            -- tabnew = "<C-c>n",
            -- vsplit = "<C-c>v",
        },
    },
    diagnostic = {
    --     border_follow = true,
    --     diagnostic_only_current = false,
    --     extend_relatedInformation = false,
    --     jump_num_shortcut = true,
    --     keys = {
    --         exec_action = "o",
    --         quit = "q",
    --         quit_in_show = { "q", "<ESC>" },
    --         toggle_or_jump = "<CR>",
    --     },
    --     max_height = 0.6,
    --     max_show_height = 0.6,
    --     max_show_width = 0.9,
    --     max_width = 0.8,
        show_code_action = false,
    --     show_layout = "float",
    --     show_normal_height = 10,
    --     text_hl_follow = true,
    },
    finder = {
        default = "def+ref+imp",
        -- filter = {},
        keys = {
            close = "<C-c>k",
            quit = "q",
            shuttle = "[w",
            split = "v",
            tabe = "t",
            tabnew = "r",
            toggle_or_open = "<CR>",
            vsplit = "h",
        },
        -- layout = "float",
        -- left_width = 0.4,
        -- ly_botright = false,
        -- max_height = 0.5,
        -- methods = {},
        -- silent = false,
        -- sp_global = false,
        -- sp_inexist = false,
    },
    -- floaterm = {
    --     height = 0.7,
    --     width = 0.7,
    -- },
    -- hover = {
    --     max_height = 0.8,
    --     max_width = 0.9,
    --     open_cmd = "!chrome",
    --     open_link = "gx",
    -- },
    implement = {
        enable = true,
        -- lang = {},
        -- priority = 100,
        sign = true,
        virtual_text = true,
    },
    lightbulb = {
        debounce = 500,
        enable = false,
        enable_in_insert = false,
        sign = false,
        -- sign_priority = 40,
        virtual_text = false,
    },
    outline = {
        -- auto_close = true,
        auto_preview = true,
        -- close_after_jump = false,
        -- detail = true,
        keys = {
            -- jump = "e",
            -- quit = "q",
            toggle_or_jump = "<CR>",
        },
        layout = "float",
        left_width = 0.4,
        max_height = 0.8,
        -- win_position = "right",
        -- win_width = 30,
    },
    rename = {
        -- auto_save = false,
        in_select = false,
        keys = {
            -- exec = "<CR>",
            quit = "<C-C>",
            -- select = "x",
        },
        -- project_max_height = 0.5,
        -- project_max_width = 0.5,
    },
    -- request_timeout = 2000,
    -- scroll_preview = {
    --     scroll_down = "<C-f>",
    --     scroll_up = "<C-b>",
    -- },
    symbol_in_winbar = {
        --     color_mode = true,
        --     dely = 300,
        enable = false,
        --     folder_level = 1,
        hide_keyword = true,
        --     separator = " › ",
        --     show_file = true,
    },
    ui = {
        --     actionfix = " ",
        border = style.border,
        --     code_action = "💡",
        --     collapse = "⊟",
        --     devicon = true,
        --     expand = "⊞",
        --     imp_sign = "󰳛 ",
        --     lines = { "┗", "┣", "┃", "━", "┏" },
        --     title = true,
    },
})
