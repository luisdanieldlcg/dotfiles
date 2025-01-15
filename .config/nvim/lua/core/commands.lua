
-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

------------------ Flutter commands ------------------
-- Ported to lua from: https://gist.github.com/fvumbaca/1fe847f4bd4922afbbc4583a79e1de70
local flutter = {
    job_id = 0,
    pid_file = "/tmp/flutter.pid"
}

local function on_flutter_event(_, data, event)
    if data then
        vim.schedule(function()
            if event == 'stdout' then
                for _, line in ipairs(data) do
                    if line ~= "" then
                        print("Flutter: " .. line)
                    end
                end
            elseif event == 'stderr' then
                for _, line in ipairs(data) do
                    if line ~= "" then
                        vim.notify("Flutter error: " .. line, vim.log.levels.ERROR)
                    end
                end
            end
        end)
    end
end

local function flutter_hot_reload()
    if flutter.job_id ~= 0 then
        local pid = vim.fn.system('cat ' .. flutter.pid_file)
        vim.fn.system('kill -USR1 ' .. pid)
    else
        vim.notify('Flutter is not running', vim.log.levels.WARN)
    end
end

local function flutter_start_server()
    if flutter.job_id ~= 0 then
        vim.notify("Flutter already running", vim.log.levels.WARN)
        return
    end

    vim.notify("Starting Flutter")
    
    flutter.job_id = vim.fn.jobstart('fvm flutter run --pid-file ' .. flutter.pid_file, {
        on_stdout = on_flutter_event,
        on_stderr = on_flutter_event,
        on_exit = function(_, code)
            flutter.job_id = 0
            if code == 0 then
                vim.notify("Flutter exited")
            else
                vim.notify("Flutter crashed", vim.log.levels.ERROR)
            end
        end,
        stdout_buffered = true,
        stderr_buffered = true
    })
end

local function flutter_stop_run()
    if flutter.job_id ~= 0 then
        vim.fn.jobstop(flutter.job_id)
        flutter.job_id = 0
        vim.notify("Flutter stopped")
    end
end

-- Create user commands
vim.api.nvim_create_user_command('FlutterRun', flutter_start_server, {})
vim.api.nvim_create_user_command('FlutterStopRun', flutter_stop_run, {})
vim.api.nvim_create_user_command('FlutterHotReload', flutter_hot_reload, {})

vim.keymap.set('n', '<leader>fr', flutter_hot_reload, { desc = 'Flutter Hot Reload' })
vim.keymap.set('n', '<leader>fs', flutter_start_server, { desc = 'Start Flutter' })
vim.keymap.set('n', '<leader>fq', flutter_stop_run, { desc = 'Stop Flutter' })

-- Auto reload on save for Dart files
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.dart",
    callback = function()
        if flutter.job_id ~= 0 then
            flutter_hot_reload()
        end
    end,
})
