return {
	"catppuccin/nvim",
	-- "bluz71/vim-moonfly-colors",
	-- "Mofiqul/adwaita.nvim",
	priority = 1000,
	config = function()
		-- vim.g.adwaita_darker = true
		vim.cmd([[colorscheme catppuccin]])
	end,
}
