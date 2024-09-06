return {
    'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
           defaults = {
                path_display = {"smart"}
           },
        });

        telescope.load_extension("fzf")

        vim.keymap.set("n", "<leader>f", "<cmd> Telescope git_files<cr>", {})
        vim.keymap.set("n", "<leader>pf", "<cmd> Telescope find_files<cr>", {})
    end
}
