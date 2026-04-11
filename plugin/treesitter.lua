-- ═══════════════════════════════════════════════════════════
-- TREESITTER
-- Ensure to switch to the main branch of treesitter-nvim
-- (main is more up to date than master). 
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'main' },
})

require("nvim-treesitter").setup({
	ensure_installed = {
		"bash", "json", "jsonc", "lua", "markdown", "markdown_inline",
		"python", "terraform", "hcl", "typescript", "javascript", "yaml",
	},
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})

