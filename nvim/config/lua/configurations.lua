return {
	ui = { border = "rounded" },
	defaults = { lazy = true },
	install = { colorscheme = { "vscode" } },
	checker = { enabled = false },
	change_detection = { enabled = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"netrw",
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				-- "tarPlugin",
				-- "tohtml",
				-- "tutor",
				-- "zipPlugin",
			},
		},
	},
	-- debug = true,
}
