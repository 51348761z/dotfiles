-- plugins
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- dependency?
	"https://github.com/folke/trouble.nvim",
	"https://github.com/folke/todo-comments.nvim",
})

-- options
require("trouble").setup()
require("todo-comments").setup()

-- keymaps
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { silent = true, desc = "Toggle diagnostics list" })
vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { silent = true, desc = "Toggle TODO list" })

-- auto open trouble quickfix list
vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("TroubleQuickfix", { clear = true }),
	callback = function(ev)
		if vim.bo[ev.buf].buftype == "quickfix" then
			vim.schedule(function()
				pcall(vim.cmd.cclose)
				vim.cmd([[Trouble qflist open]])
			end)
		end
	end,
})
