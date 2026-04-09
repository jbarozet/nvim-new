-- ═══════════════════════════════════════════════════════════
-- WHICH KEY
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim" },
})
require("which-key").setup({})

-- ═══════════════════════════════════════════════════════════
-- GITSIGNS
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})
require("gitsigns").setup({
	signcolumn = true,
	-- signs = {
	-- 	add = { text = "+" },
	-- 	change = { text = "~" },
	-- 	delete = { text = "_" },
	-- 	topdelete = { text = "‾" },
	-- 	changedelete = { text = "~" },
	-- },
})

-- ═══════════════════════════════════════════════════════════
-- TREESITTER
-- Ensure to switch to the main branch of treesitter-nvim
-- (main is more up to date than master). 
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'main' },
})


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

-- ═══════════════════════════════════════════════════════════
-- LINTER
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-lint" },
})
-- require("nvim-lint").setup({
-- 	event = {
-- 		"BufReadPre",
-- 		"BufNewFile",
-- 	},
-- 	config = function()
-- 		local lint = require("lint")
--
-- 		lint.linters_by_ft = {
-- 			python = { "ruff" },
-- 			-- python = { "pylint" },
-- 			markdown = { "markdownlint" },
-- 			ansible = { "ansible_lint" }, -- NOTE: make sure to use ansible_lint and not ansible-lint
-- 			yaml = { "yamllint" },
-- 			terraform = { "tflint" },
-- 			javascript = { "eslint_d" },
-- 			typescript = { "eslint_d" },
-- 			javascriptreact = { "eslint_d" },
-- 			typescriptreact = { "eslint_d" },
-- 			svelte = { "eslint_d" },
-- 		}
--
-- 		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
--
-- 		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
-- 			group = lint_augroup,
-- 			callback = function()
-- 				lint.try_lint()
-- 			end,
-- 		})
-- 	end,
-- })

-- ═══════════════════════════════════════════════════════════
-- CODE COMPANION
-- ═══════════════════════════════════════════════════════════

-- vim.pack.add({
-- 	{ src = "https://github.com/olimorris/codecompanion.nvim" },
-- 	{ src = "https://github.com/ravitemer/mcphub.nvim" },
-- })
--
-- require("codecompanion").setup({
-- 	extensions = {
-- 		mcphub = {
-- 			callback = "mcphub.extensions.codecompanion",
-- 			opts = {
-- 				make_vars = true,
-- 				make_slash_commands = true,
-- 				show_result_in_chat = true,
-- 			},
-- 		},
-- 	},
-- })

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

-- ═══════════════════════════════════════════════════════════
-- COPILOT
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/github/copilot.vim" },
})
