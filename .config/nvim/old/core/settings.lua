local opt = vim.opt

opt.number = true
opt.relativenumber = true
-- do not show a line break if it is not there 
opt.wrap = false
-- opt.clipboard:append("unnamedplus") -- copy to system clipboard
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
-- case-insensitive search/replace
opt.ignorecase = true
-- unless uppercase in search term
opt.smartcase = true
opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true
-- infinite undo!
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true

