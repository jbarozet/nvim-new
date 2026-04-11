-- ═══════════════════════════════════════════════════════════
-- SNACKS
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
})

require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false },
  lazygit = { enabled = true },
	explorer = {
		enabled = true,
		width = 30, -- width of the explorer window
		position = "right", -- or "left"
	},
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		notification = {
			-- wo = { wrap = true } -- Wrap notifications
		},
	},
})

