return {
	settings = {
		Lua = {
			hint = { enable = true },

			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},

			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
				-- library = { vim.env.VIMRUNTIME, vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1] },
				-- library = { vim.env.VIMRUNTIME },
			},

			-- diagnostics = {
			-- 	globals = { "vim" },
			-- },
		},
	},
}
