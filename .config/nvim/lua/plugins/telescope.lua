-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
	branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({

		})

		local keymap = vim.keymap;

		keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>");
	end
}
