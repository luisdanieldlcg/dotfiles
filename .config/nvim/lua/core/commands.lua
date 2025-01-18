
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

local flutter_configs = {
    default = {
        args = ""
    },
    dev = {
        args = "--flavor=dev --target=lib/main_dev.dart"
    }
}

local function on_flutter_event(_, data, event)
    if data then
        vim.schedule(function()
            -- Open log file in append mode
            local log_file = io.open("/tmp/flutter.log", "a")

            if event == 'stdout' then
                for _, line in ipairs(data) do
                    if line ~= "" then
                        print("flutter: " .. line)
                        -- Also write to log file
                        log_file:write("flutter: " .. line .. "\n")
                    end
                end
            elseif event == 'stderr' then
                for _, line in ipairs(data) do
                    if line ~= "" then
                        vim.notify("flutter error: " .. line, vim.log.levels.error)
                        -- Also write to log file
                        log_file:write("flutter error: " .. line .. "\n")
                    end
                end
            end
            log_file:close()
        end)
    end
end

local function flutter_hot_reload()
    if flutter.job_id ~= 0 then
        local pid = vim.fn.system('cat ' .. flutter.pid_file)
        vim.fn.system('kill -usr1 ' .. pid)
    else
        vim.notify('flutter is not running', vim.log.levels.warn)
    end
end

local function flutter_start_server(args)
    if flutter.job_id ~= 0 then
        vim.notify("Flutter already running", vim.log.levels.WARN)
        return
    end
    vim.notify("Starting Flutter")
    
    local cmd = string.format(
        'flutter run --pid-file %s %s > /tmp/flutter.log 2>&1',
        flutter.pid_file,
        args or ""
    )
    
    flutter.job_id = vim.fn.jobstart(cmd, {
        on_exit = function(_, code)
            flutter.job_id = 0
            if code == 0 then
                vim.notify("Flutter exited")
            else
                vim.notify("Flutter crashed. Check out the /tmp/flutter.log file for more details.", vim.log.levels.ERROR)
            end
        end
    })
end

local function flutter_stop_run()
    if flutter.job_id ~= 0 then
        vim.fn.jobstop(flutter.job_id)
        flutter.job_id = 0
        vim.notify("flutter stopped")
    end
end

vim.api.nvim_create_user_command('FlutterRun', function()
    flutter_start_server(flutter_configs.default.args)
end, {})

vim.api.nvim_create_user_command('FlutterRunDevFlavor', function()
    flutter_start_server(flutter_configs.dev.args)
end, {})
vim.api.nvim_create_user_command('FlutterStopRun', flutter_stop_run, {})
vim.api.nvim_create_user_command('FlutterHotReload', flutter_hot_reload, {})

vim.api.nvim_create_autocmd("bufwritepost", {
    pattern = "*.dart",
    callback = function()
        if flutter.job_id ~= 0 then
            flutter_hot_reload()
        end
    end,
})
