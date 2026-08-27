-- plugins
vim.pack.add({
	"https://github.com/rose-pine/neovim",
})

-- options
require("rose-pine").setup({
	variant = "auto",
	dark_variant = "main",
	dim_inactive_windows = true,
	extend_background_behind_borders = false,

	highlight_groups = {
		LspInlayHint = { bg = "base", fg = "muted", italic = true },
		NotificationInfo = { bg = "none", fg = "text" },
		NotificationWarning = { bg = "none", fg = "subtle" },
		NotificationError = { bg = "none", fg = "love" },
		CurSearch = { fg = "base", bg = "leaf", inherit = false },
		Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
	},
})

vim.cmd("colorscheme rose-pine")
