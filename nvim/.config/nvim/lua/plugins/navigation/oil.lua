-- plugins
vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/refractalize/oil-git-status.nvim",
})

-- options
local oil = require("oil")
local oil_git_status = require("oil-git-status")

oil.setup({
	skip_confirm_for_simple_edits = true,
	win_options = {
		signcolumn = "yes:2",
	},
	view_options = {
		show_hidden = true,
	},
	watch_for_changes = true,
	column = {
		"icon",
		"permission",
		"size",
	},
	use_default_keymaps = false,
	keymaps = {
		["g?"] = { "actions.show_help", mode = "n" },
		["<CR>"] = "actions.select",
		["<C-s>"] = { "actions.select", opts = { vertical = true } },
		["<C-h>"] = { "actions.select", opts = { horizontal = true } },
		["<C-t>"] = { "actions.select", opts = { tab = true } },
		["<C-p>"] = "actions.preview",
		["<C-c>"] = { "actions.close", mode = "n" },
		["<ESC>"] = { "actions.close", mode = "n" },
		["q"] = { "actions.close", mode = "n" },
		["<C-l>"] = "actions.refresh",
		["-"] = { "actions.parent", mode = "n" },
		["_"] = { "actions.open_cwd", mode = "n" },
		["`"] = { "actions.cd", mode = "n" },
		["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
		["gs"] = { "actions.change_sort", mode = "n" },
		["gx"] = "actions.open_external",
		["g."] = { "actions.toggle_hidden", mode = "n" },
		["g\\"] = { "actions.toggle_trash", mode = "n" },
	},
})

oil_git_status.setup({
	show_ignored = true,
})

-- keymaps
vim.keymap.set("n", "<leader>e", ":Oil<cr>", { silent = true, desc = "Open file explorer" })
