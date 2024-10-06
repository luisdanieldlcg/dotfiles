return {
    'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
            local telescope = require("telescope")

        telescope.setup({
        })
        vim.keymap.set("n", "<leader>f", "<cmd> Telescope find_files <cr>")
        vim.keymap.set("n", "<leader>pf", "<cmd> Telescope git_files <cr>", {})
        vim.keymap.set("n", "<leader>/", "<cmd> Telescope live_grep<cr>", {})
    end
}
