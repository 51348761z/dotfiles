-- plugins
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/kawre/leetcode.nvim",
})

-- options
require("leetcode").setup({
	---@type lc.lang
	lang = "typescript",

	cn = { -- leetcode.cn
		enabled = false, ---@type boolean
		translator = false, ---@type boolean
		translate_problems = false, ---@type boolean
	},

	---@type lc.storage
	storage = {
		home = vim.fn.expand("~/.leetcode"),
		cache = vim.fn.stdpath("cache") .. "/leetcode",
	},

	---@type table<string, boolean>
	plugins = {
		non_standalone = true,
	},

	---@type lc.picker
	picker = { provider = nil },
})

-- keymaps
vim.keymap.set("n", "<leader>lp", "<cmd>Leet list<CR>", { desc = "LeetCode: problem list" })
vim.keymap.set("n", "<leader>ll", "<cmd>Leet<CR>", { desc = "LeetCode: toggle console" })
vim.keymap.set("n", "<leader>ld", "<cmd>Leet desc<CR>", { desc = "LeetCode: toggle description" })
vim.keymap.set("n", "<leader>lt", "<cmd>Leet test<CR>", { desc = "LeetCode: test" })
vim.keymap.set("n", "<leader>ls", "<cmd>Leet submit<CR>", { desc = "LeetCode: submit" })
