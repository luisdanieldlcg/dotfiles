
-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

vim.api.nvim_create_user_command('BC', 'bp | sp | bn | bd', {})

local flutter = {
    pid_file = "/tmp/flutter.pid"
}

local function flutter_hot_reload()
    local pid = vim.fn.system('cat ' .. flutter.pid_file)
    vim.fn.system('kill -usr1 ' .. pid)
end 

vim.api.nvim_create_autocmd("bufwritepost", {
    pattern = "*.dart",
    callback = function()
        flutter_hot_reload()
    end,
})
