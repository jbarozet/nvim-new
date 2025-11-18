

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
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- ═══════════════════════════════════════════════════════════
-- BLINK
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})
require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<C-space>"] = {},
		["<C-p>"] = {},
		["<Tab>"] = { "select_and_accept" },
		["<S-Tab>"] = {},
		["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-n>"] = { "select_and_accept" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_down", "fallback" },
		["<C-f>"] = { "scroll_documentation_up", "fallback" },
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
		-- ["<C-e>"] = { "hide" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
	},

	cmdline = {
		keymap = {
			preset = "inherit",
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
	},

	sources = { default = { "lsp", "path" } },
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

vim.pack.add({
	{ src = "https://github.com/olimorris/codecompanion.nvim" },
	{ src = "https://github.com/ravitemer/mcphub.nvim" },
})

require("codecompanion").setup({
	extensions = {
		mcphub = {
			callback = "mcphub.extensions.codecompanion",
			opts = {
				make_vars = true,
				make_slash_commands = true,
				show_result_in_chat = true,
			},
		},
	},
})

-- ═══════════════════════════════════════════════════════════
-- TOGGLETERM
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
})
require("toggleterm").setup({
	version = "*",
	config = false,
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
-- VIM-FUGITIVE
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/tpope/vim-fugitive" },
})

-- ═══════════════════════════════════════════════════════════
-- COPILOT
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/github/copilot.vim" },
})
