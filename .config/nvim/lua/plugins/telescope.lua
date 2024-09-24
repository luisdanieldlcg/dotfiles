return {
    'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
            local telescope = require("telescope")

        telescope.setup({
            -- defaults = require("telescope.themes").get_ivy(),
        })
--[[ 
        vim.keymap.set("n", "<leader>f", function() 
            local find = require("telescope.builtin")
            local ok = pcall(find.git_files)
            if not ok then 
                find.find_files()
            end
        end) ]]
        vim.keymap.set("n", "<leader>f", "<cmd> Telescope find_files <cr>")
        vim.keymap.set("n", "<leader>pf", "<cmd> Telescope git_files <cr>", {})
        vim.keymap.set("n", "<leader>/", "<cmd> Telescope live_grep<cr>", {})
    end
}
