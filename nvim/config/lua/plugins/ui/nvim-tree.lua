local style = require("def.style")
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    lazy = false,
    init = function()
        vim.opt.termguicolors = true
    end,
    opts = {
        sort_by = "case_sensitive",
        view = {
            adaptive_size = true,
            float = {
                enable = true,
                quit_on_focus_loss = true,
                open_win_config = function()
                    local screen_w = vim.opt.columns:get()
                    local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                    local window_w = screen_w * WIDTH_RATIO
                    local window_h = screen_h * HEIGHT_RATIO
                    local window_w_int = math.floor(window_w)
                    local window_h_int = math.floor(window_h)
                    local center_x = (screen_w - window_w) / 2
                    local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                    return {
                        border = style.border,
                        relative = "editor",
                        row = center_y,
                        col = center_x,
                        width = window_w_int,
                        height = window_h_int,
                    }
                end,
            },
            width = function()
                return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
            end,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            local utils = require("utils")

            local opts_raw = utils.opts_with_desc({
                buffer = bufnr,
                noremap = true,
                silent = true,
                nowait = true,
            })
            local opts = function(desc)
                return opts_raw("NvimTree: " .. desc)
            end

            -- BEGIN_DEFAULT_ON_ATTACH
            local mappings = {
                { "n", "<C-]>", api.tree.change_root_to_node, opts("CD") },
                { "n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open") },
                { "n", "<C-k>", api.node.show_info_popup, opts("Info") },
                { "n", "<C-r>", api.fs.rename_sub, opts("Rename full path") },
                { "n", "<C-v>", api.node.open.vertical, opts("Open vertical split") },
                { "n", "<C-x>", api.node.open.horizontal, opts("Open horizontal split") },
                { "n", "<BS>", api.node.navigate.parent_close, opts("Close directory") },
                { "n", "<Tab>", api.node.open.preview, opts("Open preview") },
                { "n", ">", api.node.navigate.sibling.next, opts("Next sibling") },
                { "n", "<", api.node.navigate.sibling.prev, opts("Previous sibling") },
                { "n", ".", api.node.run.cmd, opts("Run command") },
                { "n", "-", api.tree.change_root_to_parent, opts("Up") },
                { "n", "a", api.fs.create, opts("Create") },
                { "n", "bd", api.marks.bulk.delete, opts("Delete bookmarked") },
                { "n", "bmv", api.marks.bulk.move, opts("Move bookmarked") },
                { "n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle no buffer") },
                { "n", "c", api.fs.copy.node, opts("Copy") },
                { "n", "C", api.tree.toggle_git_clean_filter, opts("Toggle git clean") },
                { "n", "[c", api.node.navigate.git.prev, opts("Prev git") },
                { "n", "]c", api.node.navigate.git.next, opts("Next git") },
                { "n", "d", api.fs.remove, opts("Delete") },
                { "n", "D", api.fs.trash, opts("Trash") },
                { "n", "E", api.tree.expand_all, opts("Expand All") },
                { "n", "e", api.fs.rename_basename, opts("Rename basename") },
                { "n", "]e", api.node.navigate.diagnostics.next, opts("Next diagnostic") },
                { "n", "[e", api.node.navigate.diagnostics.prev, opts("Prev diagnostic") },
                { "n", "F", api.live_filter.clear, opts("Clean filter") },
                { "n", "f", api.live_filter.start, opts("Filter") },
                { "n", "g?", api.tree.toggle_help, opts("Help") },
                { "n", "gy", api.fs.copy.absolute_path, opts("Copy absolute path") },
                { "n", "H", api.tree.toggle_hidden_filter, opts("Toggle dotfiles") },
                { "n", "I", api.tree.toggle_gitignore_filter, opts("Toggle git ignore") },
                { "n", "J", api.node.navigate.sibling.last, opts("Last sibling") },
                { "n", "K", api.node.navigate.sibling.first, opts("First sibling") },
                { "n", "m", api.marks.toggle, opts("Toggle bookmark") },
                { "n", "o", api.node.open.edit, opts("Open") },
                { "n", "O", api.node.open.no_window_picker, opts("Open w/o window picker") },
                { "n", "p", api.fs.paste, opts("Paste") },
                { "n", "P", api.node.navigate.parent, opts("Parent directory") },
                { "n", "q", api.tree.close, opts("Close") },
                { "n", "r", api.fs.rename, opts("Rename") },
                { "n", "R", api.tree.reload, opts("Refresh") },
                { "n", "s", api.node.run.system, opts("Run system") },
                { "n", "S", api.tree.search_node, opts("Search") },
                { "n", "U", api.tree.toggle_custom_filter, opts("Toggle hidden") },
                { "n", "W", api.tree.collapse_all, opts("Collapse") },
                { "n", "x", api.fs.cut, opts("Cut") },
                { "n", "y", api.fs.copy.filename, opts("Copy name") },
                { "n", "Y", api.fs.copy.relative_path, opts("Copy relative path") },
                { "n", "<2-LeftMouse>", api.node.open.edit, opts("Open") },
                { "n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD") },
                -- END_DEFAULT_ON_ATTACH

                { "n", "u", api.tree.change_root_to_parent, opts("Up") },
                { "n", "h", api.node.open.vertical, opts("Open vertical split") },
                { "n", "v", api.node.open.horizontal, opts("Open horizontal split") },
                { "n", "<CR>", api.node.open.tab_drop, opts("Open") },
                { "n", "<C-CR>", api.node.open.edit, opts("Open") },
            }
            utils.set_keymaps(mappings)
        end,
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)
        local utils = require("utils")
        utils.set_keymaps({
            { "n", "<leader>e", vim.cmd.NvimTreeToggle, { desc = "NvimTree" } },
        })
    end,
}
