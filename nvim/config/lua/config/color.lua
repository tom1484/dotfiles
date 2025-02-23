return {
    setup = function()
        local utils = require("utils")

        local highlight_string = vim.api.nvim_exec("highlight", true)
        local highlights = {}
        local highlight_names = {}

        -- Split the input string into lines
        for line in highlight_string:gmatch("[^\r\n]+") do
            -- Match the highlight group name and its attributes
            local name, attributes = line:match("^(%S+)%s+(.*)$")

            if name and attributes then
                -- Create a table for each highlight group
                highlights[name] = {}
                table.insert(highlight_names, name)

                -- Split attributes into key-value pairs
                for attr in attributes:gmatch("%S+") do
                    local key, value = attr:match("^(%S+)=(.*)$")
                    if key and value then
                        highlights[name][key] = value
                    else
                        -- Handle attributes without '=' (like 'cleared')
                        highlights[name][attr] = true
                    end
                end
            end
        end

        local set_highlights = utils.set_highlights
        local update_highlights = utils.update_highlights
        local set_highlights_pattern = function(pattern, opts)
            local result = utils.match_words(highlight_names, pattern)
            for _, highlight_name in ipairs(result) do
                set_highlights(highlight_name, opts)
            end
        end
        local update_highlights_pattern = function(pattern, opts)
            local result = utils.match_words(highlight_names, pattern)
            update_highlights(result, opts)
        end

        vim.cmd.colorscheme("kanagawa")
        -- vim.cmd.colorscheme("ash")

        update_highlights({
            "FloatBorder",
            "NormalFloat",
            "LspInfoBorder",
            "TelescopeBorder",
            "DapUIFloatBorder",
            "NullLsInfoBorder",
            "LspFloatWinBorder",
            "LspLinesDiagBorder",
            "LspSagaHoverBorder",
            "LspSagaRenameBorder",
            "TelescopePromptBorder",
            "LspSagaLspFinderBorder",
            "TelescopePreviewBorder",
            "TelescopeResultsBorder",
            "LspSagaCodeActionBorder",
            "LspSagaDefPreviewBorder",
            "LspSagaDiagnosticBorder",
            "ChatGPTTotalTokensBorder",
            "CompeDocumentationBorder",
            "LspSagaSignatureHelpBorder",
        }, { fg = "#777777" })
        update_highlights_pattern(".*Border", { bg = "none" })

        update_highlights("TelescopeSelection", { bg = "#284b71" })

        set_highlights("LspInlayHint", { fg = "#757575" })
        set_highlights("Visual", { bg = "#30496e" })

        set_highlights("SatelliteBar", { bg = "#888888" })
        set_highlights("SatelliteCursor", { bg = "#ffffff" })
        set_highlights("SatelliteBackground", { bg = "#2a2b38" })

        set_highlights("LineNr", { fg = "#ff980b" })
        set_highlights({ "LineNrAbove", "LineNrBelow" }, { fg = "#888888" })

        update_highlights_pattern("DiagnosticSign.*", { bg = "none" })

        update_highlights({
            "GitSignsAdd",
            "GitSignsChange",
            "GitSignsDelete",
            "GitSignsChangedelete",
            "GitSignsTopdelete",
            "GitSignsUntracked",
        }, { bg = "none" })

        update_highlights_pattern("DapUI.*NC", { bg = "none" })

        update_highlights("FloatTitle", { bg = "none" })

        update_highlights("NonText", { fg = "#999999" })
        update_highlights("Comment", { fg = "#999999" })
    end,
}
