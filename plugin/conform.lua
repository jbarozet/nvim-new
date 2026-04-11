-- ═══════════════════════════════════════════════════════════
-- CONFORM
-- Formatter runner — invokes prettier, stylua, ruff, etc.
-- as subprocesses, with LSP format as fallback.
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	formatters_by_ft = {
		javascript  = { "prettier" },
		typescript  = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		json        = { "prettier" },
		jsonc       = { "prettier" },
		yaml        = { "prettier" },
		markdown    = { "prettier" },
		html        = { "prettier" },
		css         = { "prettier" },
		lua         = { "stylua" },
		python      = { "ruff_format" },
	},
	format_on_save = function()
		if not vim.g.autoformat then return end
		return { timeout_ms = 500, lsp_fallback = true }
	end,
})
