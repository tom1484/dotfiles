return {
    {
        mode = "n",
        lhs = "gh",
        rhs = function()
            local vscode = require("vscode")
            vscode.action("editor.action.showHover")
        end,
        desc = "Show hover",
    },
    {
        mode = "n",
        lhs = "gr",
        rhs = function()
            local vscode = require("vscode")
            vscode.action("editor.action.rename")
        end,
        desc = "Rename",
    },
    {
        mode = "n",
        lhs = "gd",
        rhs = function()
            local vscode = require("vscode")
            vscode.action("editor.action.revealDefinition")
        end,
        desc = "Goto definitions",
    },
    {
        mode = "n",
        lhs = "gD",
        rhs = function()
            local vscode = require("vscode")
            vscode.action("editor.action.peekDefinition")
        end,
        desc = "Show definitions",
    },
    {
        mode = "n",
        lhs = "gR",
        rhs = function()
            local vscode = require("vscode")
            vscode.action("editor.action.goToReferences")
        end,
        desc = "Show references",
    },
    {
        mode = "n",
        lhs = "<leader>f",
        rhs = function()
            local vscode = require("vscode")
            vscode.action("editor.action.formatDocument")
        end,
        desc = "Format document",
    },
    {
        mode = { "n", "v" },
        lhs = "<leader>c",
        rhs = function()
            local vscode = require("vscode")
            vscode.action("editor.action.commentLine")
        end,
        desc = "Comment line",
    },
    {
        mode = "n",
        lhs = "<C-H>",
        rhs = function()
            local vscode = require("vscode")
            vscode.action("workbench.action.focusLeftGroup")
        end,
        desc = "Move left",
    },
    {
        mode = "n",
        lhs = "<C-L>",
        rhs = function()
            local vscode = require("vscode")
            vscode.action("workbench.action.focusRightGroup")
        end,
        desc = "Move right",
    },
    {
        mode = "n",
        lhs = "<C-J>",
        rhs = function()
            local vscode = require("vscode")
            vscode.action("workbench.action.focusBelowGroup")
        end,
        desc = "Move down",
    },
    {
        mode = "n",
        lhs = "<C-K>",
        rhs = function()
            local vscode = require("vscode")
            vscode.action("workbench.action.focusAboveGroup")
        end,
        desc = "Move up",
    },
}
