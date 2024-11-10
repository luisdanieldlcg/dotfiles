return {
     -- "catppuccin/nvim",
  -- "neanias/everforest-nvim",
   -- "shatur/neovim-ayu",
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme gruvbox-material]])
    end
}
