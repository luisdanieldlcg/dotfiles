return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text paths
		"hrsh7th/cmp-path", -- source for fs paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
	},
	config = function()
		local cmp = require("cmp")
		local snip = require("luasnip")
		-- loads vscode style snippets from installed plugins e.g friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,select"
			},
			snippet = {
				-- configure how nvim-cmp interacts with the snippet engine
				expand = function(args)
					snip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<Tab>'] = cmp.mapping.select_next_item(),
				['<CR>'] = cmp.mapping.confirm({
      				behavior = cmp.ConfirmBehavior.Insert,
      				select = false,
    			})
			}),

			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "nvim_lsp" },
			})
		})
	end
}
