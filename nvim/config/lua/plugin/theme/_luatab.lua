return {
    "alvarosevilla95/luatab.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    lazy = false,
    opts = function()
        local hls = {
            select_fg = "#1f2029",
            select_bg = "#7e9cd8",
            -- normal_fg = "#1a70b7",
            normal_fg = "#7e9cd8",
            normal_bg = "#373737",
            bar_bg = "#1f2029",
        }

        return {
            separator = function(isSelected, isLast, isNextSelected)
                if not (isSelected or isLast or isNextSelected) then
                    return ""
                else
                    return ""
                end
            end,
            devicon = function(bufnr, isSelected)
                local h = require("luatab.highlight")

                local icon, devhl
                local file = vim.fn.bufname(bufnr)
                local buftype = vim.fn.getbufvar(bufnr, "&buftype")
                local filetype = vim.fn.getbufvar(bufnr, "&filetype")
                local devicons = require("nvim-web-devicons")
                if filetype == "TelescopePrompt" then
                    icon, devhl = devicons.get_icon("telescope")
                elseif filetype == "fugitive" then
                    icon, devhl = devicons.get_icon("git")
                elseif filetype == "vimwiki" then
                    icon, devhl = devicons.get_icon("markdown")
                elseif buftype == "terminal" then
                    icon, devhl = devicons.get_icon("zsh")
                else
                    icon, devhl = devicons.get_icon(file, vim.fn.expand("#" .. bufnr .. ":e"))
                end
                if icon then
                    local fg = h.extract_highlight_colors(devhl, "fg")
                    local bg = hls.normal_bg
                    local sel_fg = hls.select_fg
                    local sel_bg = hls.select_bg

                    if isSelected then
                        local hl =
                            h.create_component_highlight_group({ bg = sel_bg, fg = sel_fg }, devhl .. "_selected")
                        return "%#" .. hl .. "#" .. icon .. " "
                    else
                        local hl = h.create_component_highlight_group({ bg = bg, fg = fg }, devhl)
                        return "%#" .. hl .. "#" .. icon .. " "
                    end
                end

                return ""
            end,
            cell = function(index)
                local h = require("luatab.highlight")
                local helpers = require("luatab").helpers

                local isSelected = vim.fn.tabpagenr() == index
                local isLast = vim.fn.tabpagenr("$") == index
                local isNextSelected = vim.fn.tabpagenr() == index + 1

                local buflist = vim.fn.tabpagebuflist(index)
                local winnr = vim.fn.tabpagewinnr(index)
                local bufnr = buflist[winnr]

                local select_hl = h.create_component_highlight_group({
                    bg = hls.select_bg,
                    fg = hls.select_fg,
                }, "luatab_select")
                local normal_hl = h.create_component_highlight_group({
                    bg = hls.normal_bg,
                    fg = hls.normal_fg,
                }, "luatab_normal")
                local hl_text = (isSelected and "%#" .. select_hl .. "#" or "%#" .. normal_hl .. "#")

                local sep_hl_text = ""
                if isSelected then
                    if isLast then
                        local sep_hl = h.create_component_highlight_group({
                            bg = hls.bar_bg,
                            fg = hls.select_bg,
                        }, "luatab_last_select_sep")
                        sep_hl_text = "%#" .. sep_hl .. "#"
                    else
                        local sep_hl = h.create_component_highlight_group({
                            bg = hls.normal_bg,
                            fg = hls.select_bg,
                        }, "luatab_select_sep")
                        sep_hl_text = "%#" .. sep_hl .. "#"
                    end
                else
                    if isLast then
                        local sep_hl = h.create_component_highlight_group({
                            bg = hls.bar_bg,
                            fg = hls.normal_bg,
                        }, "luatab_last_sep")
                        sep_hl_text = "%#" .. sep_hl .. "#"
                    else
                        if isNextSelected then
                            local sep_hl = h.create_component_highlight_group({
                                bg = hls.select_bg,
                                fg = hls.normal_bg,
                            }, "luatab_last_next_sep")
                            sep_hl_text = "%#" .. sep_hl .. "#"
                        else
                            local sep_hl = h.create_component_highlight_group({
                                bg = hls.normal_bg,
                                fg = hls.normal_fg,
                            }, "luatab_sep")
                            sep_hl_text = "%#" .. sep_hl .. "#"
                        end
                    end
                end

                return hl_text
                    -- .. "%"
                    .. " "
                    .. index
                    -- .. "T"
                    .. " "
                    -- .. helpers.windowCount(index)
                    .. helpers.title(bufnr)
                    .. " "
                    .. helpers.modified(bufnr)
                    .. helpers.devicon(bufnr, isSelected)
                    .. sep_hl_text
                    .. helpers.separator(isSelected, isLast, isNextSelected)
            end,
        }
    end,
}
