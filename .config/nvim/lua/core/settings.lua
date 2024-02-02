local opt = vim.opt;

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
opt.number = true;
opt.tabstop = 4;
opt.shiftwidth = 4;
opt.clipboard:append("unnamedplus") -- use system clipboard to copy
opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true -- highlight the current cursor line
