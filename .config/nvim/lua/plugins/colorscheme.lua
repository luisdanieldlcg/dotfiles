return {
    -- "sainnhe/gruvbox-material",
    -- "ellisonleao/gruvbox.nvim"
     "catppuccin/nvim",
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme catppuccin]])
    end
}
