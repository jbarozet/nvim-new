vim.g.mapleader = " "

local HOME = vim.fn.expand("~")
local local_dev = "file://" .. HOME
vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	-- { src = "https://github.com/blazkowolf/gruber-darker.nvim" },
	-- { src = local_dev .. "/personal/techbase.nvim", version = "fix/core-hl-groups" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/vieitesss/miniharp.nvim" },
	{ src = "https://github.com/vieitesss/gh-permalink.nvim" },
	-- { src = local_dev .. "/personal/miniharp.nvim", version = "fix/do-not-save-index" },
	-- { src = "https://github.com/ThePrimeagen/harpoon",        version = "harpoon2" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	-- { src = "https://github.com/vieitesss/command.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/github/copilot.vim" },
	{ src = "https://github.com/olimorris/codecompanion.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/ravitemer/mcphub.nvim" },
	{ src = "https://github.com/lervag/vimtex" },
})

vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

vim.cmd.colorscheme("catppuccin")

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

require("which-key").setup({})

require("miniharp").setup({ show_on_autoload = true })
require("mason").setup({})
-- require('techbase').setup({})
-- require('gruber-darker').setup({
--     bold = false,
--     italic = {
--         strings = false,
--     },
-- })
require("gitsigns").setup({ signcolumn = false })
require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<C-space>"] = {},
		["<C-p>"] = {},
		["<Tab>"] = {},
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

	sources = { default = { "lsp" } },
})

-- ═══════════════════════════════════════════════════════════
-- SNACKS
-- ═══════════════════════════════════════════════════════════

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

local actions = require("fzf-lua.actions")
require("fzf-lua").setup({
	winopts = {
		height = 1,
		width = 1,
		backdrop = 85,
		preview = {
			horizontal = "right:70%",
		},
	},
	keymap = {
		builtin = {
			["<C-f>"] = "preview-page-down",
			["<C-b>"] = "preview-page-up",
			["<C-p>"] = "toggle-preview",
		},
		fzf = {
			["ctrl-a"] = "toggle-all",
			["ctrl-t"] = "first",
			["ctrl-g"] = "last",
			["ctrl-d"] = "half-page-down",
			["ctrl-u"] = "half-page-up",
		},
	},
	actions = {
		files = {
			["ctrl-q"] = actions.file_sel_to_qf,
			["ctrl-n"] = actions.toggle_ignore,
			["ctrl-h"] = actions.toggle_hidden,
			["enter"] = actions.file_edit_or_qf,
		},
	},
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

vim.g.vimtex_imaps_enabled = 0
vim.g.vimtex_view_method = "skim"
vim.g.latex_view_general_viewer = "skim"
vim.g.latex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_ignore_filters = {
	"Underfull",
	"Overfull",
	"LaTeX Warning: .\\+ float specifier changed to",
	"Package hyperref Warning: Token not allowed in a PDF string",
}
