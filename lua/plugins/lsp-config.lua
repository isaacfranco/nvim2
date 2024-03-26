return {
	{
		-- mason take care of lang server installs
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- mason-lspconfig connects mason and lspconfig. ensures installed lang servers
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- availability on https://github.com/williamboman/mason-lspconfig.nvim
				-- only lsps. no formatters (for example) can be ensured intalled here
				ensure_installed = {
					"lua_ls",
					"tsserver",
                    "biome"
				},
			})
		end,
	},
	{
		-- nvim-lspconfig (https://github.com/neovim/nvim-lspconfig)
		-- configures neovim to send messages and connect to lang servers
		-- responsible for keybindings as well
		-- Help: :h vim.lsp.buf
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.biome.setup({})
			--lspconfig.eslint.setup({})

			local opts = {}
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<space>FF", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end,
	},
}
