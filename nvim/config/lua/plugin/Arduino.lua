local arduino = require("arduino")

arduino.setup({
  default_fqbn = "arduino:avr:uno",
  --Path to clangd (all paths must be full)
  clangd = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/clangd"),
  --Path to arduino-cli
  arduino = vim.fn.expand("$HOME/.local/bin/arduino-cli"),
  --Data directory of arduino-cli
  arduino_config_dir = vim.fn.expand("$HOME/.arduino15"),
  --Extra options to arduino-language-server
  extra_opts = {},
})
