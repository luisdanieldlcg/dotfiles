return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            ensure_installed = { "c", "lua", "rust", "javascript", "html", "typescript", "wgsl" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
