require("telescope").setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        -- even more opts
      }),

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    },
  },
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<Esc>"] = "close",
        ["<Tab>"] = "move_selection_next",
        ["<S-Tab>"] = "move_selection_previous",
      },
      n = {
        ["h"] = "select_vertical",
        ["v"] = "select_horizontal",
        ["t"] = "select_tab",
        ["<C-s>"] = "smart_send_to_qflist",
        ["q"] = "close",
      },
    },
    sorting_strategy = "ascending",
    layout_strategy = "flex",
    layout_config = {
      prompt_position = "top",
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
})

require("telescope").load_extension("ui-select")

local builtin = require("telescope.builtin")
-- local themes = require("telescope.themes")

vim.keymap.set("n", "<leader>pf", function()
  builtin.find_files({ hidden = true })
end, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})

vim.keymap.set("n", "<leader>ps", function()
  builtin.live_grep({
    use_regex = true,
  })
end)

vim.keymap.set("n", "<leader>fs", function()
  builtin.live_grep({
    search_dirs = { "%:p" },
    path_display = "hidden",
    use_regex = true,
  })
end, {})
