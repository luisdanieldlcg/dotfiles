return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local tree = require("nvim-treesitter.configs")
        tree.setup({
            ensure_installed = { "c", "lua", "rust", "javascript", "html", "typescript" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}

