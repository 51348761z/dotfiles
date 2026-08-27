--- plugins
vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

require("which-key").setup({
	preset = "modern",
	delay = function(ctx)
		return ctx.plugin and 0 or 250
	end,
	win = {
		border = "rounded",
		padding = { 1, 2 },
		title = true,
		title_pos = "center",
	},
	layout = {
		width = { min = 20, max = 50 },
		spacing = 3,
	},
	icons = {
		colors = true,
		rules = {
			{ pattern = "open file explorer", icon = "󰙅", color = "green" },
			{ pattern = "disable", icon = "󰍵", color = "grey" },
			{ pattern = "save", icon = "", color = "cyan" },
			{ pattern = "quit", icon = "󰈆", color = "red" },
			{ pattern = "paste", icon = "󰅇", color = "yellow" },
			{ pattern = "yank", icon = "󰆏", color = "cyan" },
			{ pattern = "copy", icon = "󰆏", color = "cyan" },
			{ pattern = "split horizontally", icon = "󰤼", color = "cyan" },
			{ pattern = "split vertically", icon = "󰤻", color = "purple" },
			{ pattern = "find", icon = "", color = "green" },
			{ pattern = "search", icon = "", color = "green" },
			{ pattern = "replace", icon = "󰛔", color = "orange" },
			{ pattern = "code action", icon = "󰌵", color = "orange" },
			{ pattern = "format", icon = "󰉢", color = "cyan" },
			{ pattern = "reference", icon = "󰈇", color = "green" },
			{ pattern = "rename", icon = "󰑕", color = "yellow" },
			{ pattern = "type definition", icon = "󰆧", color = "purple" },
			{ pattern = "test", icon = "󰙨", color = "purple" },
			{ pattern = "diagnostic", icon = "󰀦", color = "red" },
			{ pattern = "todo", icon = "󰄬", color = "yellow" },
			{ pattern = "tab", icon = "󰓩", color = "cyan" },
			{ pattern = "source", icon = "󰑓", color = "cyan" },
			{ pattern = "restart", icon = "󰑓", color = "cyan" },
			{ pattern = "rotate", icon = "󰑓", color = "cyan" },
			{ pattern = "config", icon = "󰒓", color = "cyan" },
			{ pattern = "inlay", icon = "󰅩", color = "orange" },
			{ pattern = "diff", icon = "󰦓", color = "yellow" },
		},
	},
	filter = function(mapping)
		return mapping.desc and mapping.desc ~= ""
	end,
	sort = { "alphanum" },
	expand = 2,
	spec = {
		{ "<leader>c", group = "Code Actions", icon = { icon = "󰅩", color = "orange" } },
		{ "<leader>s", group = "Search", icon = { icon = "", color = "green" } },
		{ "<leader>g", group = "Git", icon = { icon = "󰊢", color = "orange" } },
		{ "<leader>m", group = "Tests", icon = { icon = "󰙨", color = "purple" } },
		{ "<leader>t", group = "Tabs", icon = { icon = "󰓩", color = "cyan" } },
		{ "<leader>x", group = "Diagnostics", icon = { icon = "󱖫", color = "red" } },
		{ "<leader>r", group = "Runtime", icon = { icon = "󰑓", color = "cyan" } },
		{ "<leader>z", group = "Diff", icon = { icon = "󰦓", color = "yellow" } },
		{ "gr", group = "LSP", icon = { icon = "󰒋", color = "cyan" } },
		{ "<leader>l", group = "LeetCode", icon = { icon = "󰓎", color = "yellow" } },
	},
})

-- Keep any which-key fallback icons away from blue-toned highlight groups.
vim.api.nvim_set_hl(0, "WhichKeyIconAzure", { link = "WhichKeyIconCyan" })
vim.api.nvim_set_hl(0, "WhichKeyIconBlue", { link = "WhichKeyIconCyan" })
