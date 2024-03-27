return {
    {
        -- adds lsps completions sources
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        -- expansion engine with some sources
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        }
    },
	{
		-- A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

            -- loads friendly snippets
            require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- deve também configurar o nvim-lsp servers para ter essa capabilitie
					{ name = 'luasnip' }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
