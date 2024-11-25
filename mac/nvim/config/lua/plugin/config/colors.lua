vim.cmd.colorscheme("kanagawa")

local border = "#777777"

vim.api.nvim_set_hl(0, "FloatBorder", { fg = border })
vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = border })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = border })
vim.api.nvim_set_hl(0, "DapUIFloatBorder", { fg = border })
vim.api.nvim_set_hl(0, "NullLsInfoBorder", { fg = border })
vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = border })
vim.api.nvim_set_hl(0, "LspLinesDiagBorder", { fg = border })
vim.api.nvim_set_hl(0, "LspSagaHoverBorder", { fg = border })
vim.api.nvim_set_hl(0, "LspSagaRenameBorder", { fg = border })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = border })
vim.api.nvim_set_hl(0, "LspSagaLspFinderBorder", { fg = border })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = border })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = border })
vim.api.nvim_set_hl(0, "LspSagaCodeActionBorder", { fg = border })
vim.api.nvim_set_hl(0, "LspSagaDefPreviewBorder", { fg = border })
vim.api.nvim_set_hl(0, "LspSagaDiagnosticBorder", { fg = border })
vim.api.nvim_set_hl(0, "ChatGPTTotalTokensBorder", { fg = border })
vim.api.nvim_set_hl(0, "CompeDocumentationBorder", { fg = border })
vim.api.nvim_set_hl(0, "LspSagaSignatureHelpBorder", { fg = border })

vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#757575" })

vim.api.nvim_set_hl(0, "Visual", { bg = "#30496e" })
