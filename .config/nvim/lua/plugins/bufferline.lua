return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- event = "User FileOpened",
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local tab = require("bufferline");
		local keymap = vim.keymap;
		local opts = {};
		keymap.set("n", "bp", "<cmd>BufferLineCyclePrev<cr>", opts);
		keymap.set("n", "bn", "<cmd>BufferLineCycleNext<cr>", opts);
		keymap.set("n", "<leader>[", "<cmd>BufferLineMovePrev<cr>", opts);
		keymap.set("n", "<leader>]", "<cmd>BufferLineCycleNext<cr>", opts);
		keymap.set("n", "<leader>1", "<cmd>BufferLineGoTo 1<cr>", opts);
		keymap.set("n", "<leader>2", "<cmd>BufferLineGoTo 2<cr>", opts);
		keymap.set("n", "<leader>3", "<cmd>BufferLineGoTo 3<cr>", opts);
		keymap.set("n", "<leader>4", "<cmd>BufferLineGoTo 4<cr>", opts);
		keymap.set("n", "<leader>5", "<cmd>BufferLineGoTo 5<cr>", opts);
		keymap.set("n", "<leader>6", "<cmd>BufferLineGoTo 6<cr>", opts);
		keymap.set("n", "<leader>7", "<cmd>BufferLineGoTo 7<cr>", opts);
		keymap.set("n", "<leader>8", "<cmd>BufferLineGoTo 8<cr>", opts);
		keymap.set("n", "<leader>9", "<cmd>BufferLineGoTo 9<cr>", opts);
		keymap.set("n", "bc", "<cmd>bp | sp | bn | bd<cr>", opts);
		keymap.set("n", "bcc", "<cmd>BufferLineCloseOthers<cr>", opts);
		tab.setup({
			options = {
				buffer_close_icon = "✖",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						separator = false,
					}
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = { 'close' }
				}
			},
		})
	end
}
