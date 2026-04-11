-- ═══════════════════════════════════════════════════════════
-- MASON
-- Core package manager
-- for LSP servers, formatters, linters, etc.
-- to browse and install tools
-- Handles downloading, installing, and updating tools
-- ═══════════════════════════════════════════════════════════

-- vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim", name = "mason" },
})
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
