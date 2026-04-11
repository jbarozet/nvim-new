-- ═══════════════════════════════════════════════════════════
-- 2. BLINK
-- Auto-completion
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

local blink = require("blink.cmp")

blink.setup({
  fuzzy = { implementation = "lua" },
  completion = {
    accept = {
      -- experimental auto-brackets support
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      draw = {
        treesitter = { "lsp" },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    ghost_text = {
      enabled = vim.g.ai_cmp,
    },
  },
	sources = {
		-- adding any nvim-cmp sources here will enable them
		-- with blink.compat
		-- compat = {},
		default = { "lsp", "path", "snippets", "buffer" },
	},
	cmdline = {
		enabled = true,
		keymap = {
			preset = "cmdline",
			["<Right>"] = false,
			["<Left>"] = false,
		},
		completion = {
			list = { selection = { preselect = false } },
			menu = {
				auto_show = function(ctx)
					return vim.fn.getcmdtype() == ":"
				end,
			},
			ghost_text = { enabled = true },
		},
	},

	keymap = {
		preset = "enter",
		["<C-y>"] = { "select_and_accept" },
	},
})

-- Pass blink capabilities to all LSP servers.
-- Runs after blink.setup() but before any server attaches (servers only
-- start when a file is opened), so the ordering is safe.
vim.lsp.config("*", {
	capabilities = blink.get_lsp_capabilities(),
})

