return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true }
	},
	config = function()
		local lsp = require("lspconfig")
		local cmp = require("cmp_nvim_lsp")
		local keymap = vim.keymap;

		local opts = { noremap = true, silent = true }
		local on_attach = function (client, buf)
			opts.buffer = buf;
			keymap.set("n",	"gd", "<cmd>Telescope lsp_definitions<CR>", opts);
			keymap.set("n",	"gD", vim.lsp.buf.declaration, opts);
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts);
			keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts);
			-- TODO: maybe add go to implementation
		end
		local caps = cmp.default_capabilities();

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    	for type, icon in pairs(signs) do
      		local hl = "DiagnosticSign" .. type
      		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    	end



		lsp["clangd"].setup({
			capabilities = caps,
			on_attach = on_attach,
		})

		lsp["lua_ls"].setup({
			capabilities = caps,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library ={
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			}
		})
	end
	}

