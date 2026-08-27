-- plugins
vim.pack.add({
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/b0o/SchemaStore.nvim",
})

-- options
require("mason").setup()
require("mason-lspconfig").setup({})
require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"prettierd",
		"eslint",
		"lua_ls",
		"tailwindcss-language-server",
		"tsc",
		-- "gopls",
		-- "sqls",
		"jsonls",
		"yamlls",
		-- "biome",
	},
	auto_update = false,
	run_on_start = true,
})

-- keymaps
vim.api.nvim_create_autocmd(
	"LspAttach",
	{ --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

			local opts = function(desc)
				return { buffer = ev.buf, silent = true, desc = desc }
			end
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
			-- vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts("Hover documentation"))
			vim.keymap.set("n", "<S-k>", vim.lsp.buf.hover, opts("Hover documentation"))
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
			vim.keymap.set("n", "<leader>ct", vim.lsp.buf.type_definition, opts("Go to type definition"))
			vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, opts("Rename symbol"))
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, opts("Find references"))

			vim.keymap.set({ "n", "v" }, "<leader>ca", function()
				require("tiny-code-action").code_action({})
			end, opts("Code action"))
			vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts("Format buffer"))

			vim.keymap.set("n", "<leader>xd", function()
				vim.diagnostic.open_float({
					border = "rounded",
				})
			end, opts("Show diagnostics float"))
		end,
	}
)
