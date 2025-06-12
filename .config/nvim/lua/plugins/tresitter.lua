return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
	ensure_installed = { "c", "lua", "rust", "javascript", "html", "typescript" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
}

