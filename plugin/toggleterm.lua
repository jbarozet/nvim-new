-- ═══════════════════════════════════════════════════════════
-- TOGGLETERM
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
})
require("toggleterm").setup({
	direction = "float",
	open_mapping = [[<c-]>]],
	close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

