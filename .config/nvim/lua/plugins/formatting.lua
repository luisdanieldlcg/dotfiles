return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function ()
		local conform = require("conform");
		conform.setup({
			formatters_by_ft = {
				c = {"clang-format"},
				cpp = {"clang-format"},
				rust = {"rustfmt"},
				lua = {"stylua"}
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout = 500,
			}
		})
		vim.keymap.set({"n", "v" }, "<leader>s", function ()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end)
	end
}

