-- plugins
vim.pack.add({
	"https://github.com/rachartier/tiny-cmdline.nvim",
	"https://github.com/rachartier/tiny-code-action.nvim",
})

-- options
vim.o.cmdheight = 0
local cmdline = require("tiny-cmdline")
-- tiny-cmdline merges this partial configuration with its internal defaults.
---@diagnostic disable-next-line: missing-fields
cmdline.setup({
	on_reposition = cmdline.adapters.blink,
})

local code_action = require("tiny-code-action")
code_action.setup({
	picker = { "buffer", opts = {
		auto_preview = true,
	} },
})
