-- plugin
vim.pack.add({
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
})

require("tiny-inline-diagnostic").setup({
	options = {
		show_source = {
			enabled = true,
		},
		multilines = {
			always_show = true,
			enabled = true,
			severity = { vim.diagnostic.severity.ERROR },
		},
	},
})
