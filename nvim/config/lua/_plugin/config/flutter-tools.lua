local style = require("def.style")

-- alternatively you can override the default configs
require("flutter-tools").setup({
    ui = {
        border = style.border,
        notification_style = "plugin",
    },
    decorations = {
        statusline = {
            app_version = false,
            device = true,
            project_config = false,
        },
    },
    debugger = { -- integrate with nvim dap + install dart code debugger
        enabled = true,
        run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
        -- exception_breakpoints = {},
        -- register_configurations = function(paths)
        --     require("dap").configurations.dart = {}
        -- end,
    },
    -- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
    flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
    root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
    fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
    widget_guides = {
        enabled = true,
    },
    closing_tags = {
        highlight = "LspInlayHint", -- highlight for the closing tag
        prefix = ">", -- character to use for close tag e.g. > Widget
        priority = 10, -- priority of virtual text in current line
        -- consider to configure this when there is a possibility of multiple virtual text items in one line
        -- see `priority` option in |:help nvim_buf_set_extmark| for more info
        enabled = true, -- set to false to disable
    },
    dev_log = {
        enabled = true,
        filter = nil, -- optional callback to filter the log
        -- takes a log_line as string argument; returns a boolean or nil;
        -- the log_line is only added to the output if the function returns true
        notify_errors = false, -- if there is an error whilst running then notify the user
        open_cmd = "tabedit", -- command to use to open the log buffer
    },
    dev_tools = {
        autostart = false, -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
    },
    outline = {
        open_cmd = "30vnew", -- command to use to open the outline buffer
        auto_open = false, -- if true this will open the outline automatically when it is first populated
    },
    lsp = {
        -- enabled = false,
        color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = true, -- highlight the background
            background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
            foreground = true, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
        },
        -- on_attach = function()
        --     for _, client in ipairs(vim.lsp.get_clients({ name = "dartls" })) do
        --         vim.lsp.stop_client(client.id)
        --     end
        -- end,
        settings = {
            showTodos = true,
            completeFunctionCalls = true,
            -- analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
            renameFilesWithClasses = "prompt", -- "always"
            enableSnippets = true,
            updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
        },
    },
})
