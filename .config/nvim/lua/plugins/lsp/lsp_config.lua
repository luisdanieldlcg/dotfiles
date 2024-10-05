return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
    opts = {
        inlay_hints = { enabled = true}
    },
	config = function()
		local lsp = require("lspconfig")
		local keymap = vim.keymap;

 		local on_attach = function(_, buf)
			local opts = { noremap = true, silent = true, buffer = buf }
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts);
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts);
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts);
			keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts);
			keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts);
			keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts);
			keymap.set('n', '<C-p>', vim.lsp.buf.signature_help, opts);

            vim.lsp.inlay_hint.enable(true)
            vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#9DA9A0" })
			-- Setup autoformatting on buffer write
			-- vim.cmd [[ autocmd BufWritePre <buffer> lua vim.lsp.buf.format() ]]
		end

		local caps = require("cmp_nvim_lsp").default_capabilities();

		lsp["wgsl_analyzer"].setup({
			capabilities = caps,
			on_attach = on_attach,
		})

		lsp["rust_analyzer"].setup({
			capabilities = caps,
			on_attach = on_attach,
		})

        lsp["ts_ls"].setup({
            capabilities = caps,
            on_attach = on_attach,
        })
	end
}
