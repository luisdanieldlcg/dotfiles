return {
    'akinsho/toggleterm.nvim', 
    version = "*",
  	config = function()
        require("toggleterm").setup({
            shell = vim.o.shell, -- change the default shell
        })
        -- set keymap for :ToggleTerm
        vim.api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true })
    end
}