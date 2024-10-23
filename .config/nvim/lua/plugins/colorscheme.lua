return {
     -- "catppuccin/nvim",
  -- "neanias/everforest-nvim",
   "shatur/neovim-ayu",
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme ayu-mirage]])
        -- vim.cmd([[colorscheme catppuccin-mocha]])
    end
}
