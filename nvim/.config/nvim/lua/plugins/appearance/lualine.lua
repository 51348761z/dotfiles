-- plugins
vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
})

-- options
local lualine = require("lualine")
lualine.setup({
	options = {
		theme = "rose-pine",
		-- globalstatus = true,
		-- component_separators = "",
		-- section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = { { "filename", path = 1 }, { "lsp_status" } },
		lualine_x = {
			"encoding",
			"fileformat",
			{
				"filetype",
				cond = function()
					return vim.fn.reg_recording() == ""
				end,
			},
			{
				function()
					return "Recording @" .. vim.fn.reg_recording()
				end,
				cond = function()
					return vim.fn.reg_recording() ~= ""
				end,
				padding = 1,
			},
		},
		lualine_y = {
			{
				"diagnostics",
				sources = { "nvim_workspace_diagnostic" },
			},
			"progress",
		},
		lualine_z = { "location" },
	},
	extensions = { "quickfix", "oil" },
})
