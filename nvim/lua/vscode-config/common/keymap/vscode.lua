local vscode = require("vscode")
local util = require("util")

local opts = util.opts_with_desc()
local silent_opts = util.opts_with_desc({
    silent = true,
})

return {
    -- lsp
    {
        "n",
        "gh",
        function()
            vscode.action("editor.action.showHover")
        end,
        opts("Show hover"),
    },
    {
        "n",
        "gr",
        function()
            vscode.action("editor.action.rename")
        end,
        opts("Rename"),
    },
    {
        "n",
        "gd",
        function()
            vscode.action("editor.action.revealDefinition")
        end,
        opts("Goto definitions"),
    },
    {
        "n",
        "gD",
        function()
            vscode.action("editor.action.peekDefinition")
        end,
        opts("Show definitions"),
    },
    {
        "n",
        "gR",
        function()
            vscode.action("editor.action.goToReferences")
        end,
        opts("Show references"),
    },
    {
        "n",
        "<leader>f",
        function()
            vscode.action("editor.action.formatDocument")
        end,
        opts("Format document"),
    },
    -- comment
    {
        { "n", "v" },
        "<leader>c",
        function()
            vscode.action("editor.action.commentLine")
        end,
    },
    -- navigation
    {
        "n",
        "<C-H>",
        function()
            vscode.action("workbench.action.focusLeftGroup")
        end,
        opts("Move left"),
    },
    {
        "n",
        "<C-L>",
        function()
            vscode.action("workbench.action.focusRightGroup")
        end,
        opts("Move right"),
    },
    {
        "n",
        "<C-J>",
        function()
            vscode.action("workbench.action.focusBelowGroup")
        end,
        opts("Move down"),
    },
    {
        "n",
        "<C-K>",
        function()
            vscode.action("workbench.action.focusAboveGroup")
        end,
        opts("Move up"),
    },
}
