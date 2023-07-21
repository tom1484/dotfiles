require("nvterm").setup({
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        row = 0.08,
        col = 0.1,
        width = 0.8,
        height = 0.8,
        border = "rounded",
      },
    },
  },
})

local terminal = require("nvterm.terminal")

local toggle_modes = { "n", "t" }
local mappings = {
  {
    toggle_modes,
    "<A-t>",
    function()
      terminal.toggle("float")
    end,
  },
}

local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end

vim.keymap.set("t", "<C-BS>", "<BS>", opts)
