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
