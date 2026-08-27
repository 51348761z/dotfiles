-- pre install
vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Build blink.cmp after install/update",
	group = vim.api.nvim_create_augroup("blink_build", { clear = true }),
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "blink.cmp" and (kind == "install" or kind == "update") then
			vim.notify("Building blink.cmp...", vim.log.levels.INFO)
			vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.path }):wait()
			local cmp = require("blink.cmp")
			cmp.build():pwait()
		end
	end,
})

-- plugins
vim.pack.add({
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/Saghen/blink.lib",
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/xzbdmw/colorful-menu.nvim",
})

-- options
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").filetype_extend("typescript", { "javascript" })

require("blink.cmp").setup({
	snippets = { preset = "luasnip" },
	keymap = {
		preset = "default",
		-- ["<Tab>"] = { "accept", "fallback" },
		["<C-k>"] = false,
		["<C-;>"] = { "show_signature", "hide_signature", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		["<C-e>"] = {
			function(cmp)
				if cmp.is_visible() then
					return cmp.cancel()
				end
				return cmp.show()
			end,
			"fallback",
		},
		-- ["<S-j>"] = { "select_next", "fallback" },
		-- ["<S-k>"] = { "select_prev", "fallback" },
	},
	completion = {
		menu = {
			auto_show = true,
			draw = {
				-- treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
				components = {
					label = {
						width = { fill = true, max = 60 },
						text = function(ctx)
							local highlights_info = require("colorful-menu").blink_highlights(ctx)
							if highlights_info ~= nil then
								-- Or you want to add more item to label
								return highlights_info.label
							else
								return ctx.label
							end
						end,
						highlight = function(ctx)
							local highlights = {}
							local highlights_info = require("colorful-menu").blink_highlights(ctx)
							if highlights_info ~= nil then
								highlights = highlights_info.highlights
							end
							for _, idx in ipairs(ctx.label_matched_indices) do
								table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
							end
							-- Do something else
							return highlights
						end,
					},
				},
			},
		},
		documentation = { auto_show = true },
	},
	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust" },
	sources = {
		default = {
			"snippets",
			"lsp",
			"buffer",
			"path",
		},
		per_filetype = {
			sql = { "lsp", "snippets", "buffer" },
		},
		providers = {},
	},
})
