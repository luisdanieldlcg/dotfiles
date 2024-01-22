return {
	"nvim-tree/nvim-tree.lua",
	-- {"nvim-tree/nvim-web-devicons"},
	config = function()
		local tree = require("nvim-tree");
		-- require("nvim-web-devicons")
		-- auto close Nvim-tree on q!
		--
		local function is_modified_buffer_open(buffers)
			for _, v in pairs(buffers) do
				if v.name:match("NvimTree_") == nil then
					return true
				end
			end
			return false
		end

		vim.api.nvim_create_autocmd("BufEnter", {
			nested = true,
			callback = function()
				if
					#vim.api.nvim_list_wins() == 1
					and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
					and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
				then
					vim.cmd("quit")
				end
			end,
		})

		tree.setup({
			filters = {
				dotfiles = false,
			},
			git = {
				ignore = false,
			},
			view = {
				width = 40,
			},
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "→", -- arrow when folder is closed
							arrow_open = "↓", -- arrow when folder is open
						}
					}
				}
			}
		});
		local keymap = vim.keymap;
		keymap.set("n", "<leader>v", "<cmd>NvimTreeToggle<CR>");
		keymap.set("n", "<A-Left>", "<C-w>h");
		keymap.set("n", "<A-Right>", "<C-w>l");
	end,
}
