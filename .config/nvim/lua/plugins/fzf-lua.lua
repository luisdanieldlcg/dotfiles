return {
    "ibhagwan/fzf-lua",
    opts = {},
    init = function()
        vim.api.nvim_create_user_command('ConfigOpen', function()
            require('fzf-lua').files({ cwd = vim.fn.stdpath("config") })
        end, {})
    end,
    keys = {
        { "<leader>f", function() require('fzf-lua').files() end },
        { "<leader>/", function() require('fzf-lua').live_grep() end }
    }
}
