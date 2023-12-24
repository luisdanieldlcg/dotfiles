return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lsp_config = require("mason-lspconfig")
		mason.setup({
			ui = {
				icon = {

				}	
			}
		})

		mason_lsp_config.setup({
			ensure_installed = {
				"clangd",
				"rust_analyzer",
				"lua_ls",
			},
			automatic_installation = true,
		})

	end
}
