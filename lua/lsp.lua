-- ═══════════════════════════════════════════════════════════
-- LSP CONFIGURATION
-- ═══════════════════════════════════════════════════════════

vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- ═══════════════════════════════════════════════════════════
-- 1. Install  LSP-related packages
-- ═══════════════════════════════════════════════════════════

vim.pack.add {
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
}

-- ═══════════════════════════════════════════════════════════
-- 2. Setup Mason
--
-- Core package manager
-- for LSP servers, formatters, linters, etc.
-- to browse and install tools
-- Handles downloading, installing, and updating tools
-- ═══════════════════════════════════════════════════════════

require("mason").setup()

-- ═══════════════════════════════════════════════════════════
-- 3: Configure LSP servers
--
-- Bridge between mason.nvim and nvim-lspconfig
-- Automatically configures LSP servers installed via Mason
-- Automatically enaables LSP servers in lspconfig
-- Maps Mason package names to lspconfig server names
-- If mason-tool-installer is not used, add `ensure_installed`
-- ═══════════════════════════════════════════════════════════

require('mason-lspconfig').setup()

-- ═══════════════════════════════════════════════════════════
-- 4: Configure LSP servers
--
-- Auto-installs ANY Mason tool (LSPs, formatters, linters, DAPs)
-- Works with **all** Mason packages, not just LSP servers
-- ═══════════════════════════════════════════════════════════

require('mason-tool-installer').setup({
	ensure_installed = {
		"pyright", -- python lsp
		"yamlls",
		"jsonls",
		-- "terraform-lsp", -- Use this if you want juliosueiras/terraform-lsp (seems there are some issues with it)
		"terraformls", -- Use this is you want HashiCorp's terraform-ls
		"bashls",
		"marksman", -- makrdown lsp
		"lua_ls",
		"ts_ls",
		"rust_analyzer",
		-- Add any other LSP servers you want Mason to manage
		-- Formatters
		"prettier",
    "stylua",
    -- Linters
    "ruff", -- Python linter (and formatter)
	}
})

-- ═══════════════════════════════════════════════════════════
-- Example of a custom handler for a specific server (if needed)
-- ═══════════════════════════════════════════════════════════

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {
					'vim',
					'require'
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

