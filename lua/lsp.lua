-- ═══════════════════════════════════════════════════════════
-- LSP CONFIGURATION
-- ═══════════════════════════════════════════════════════════

-- Setup keymaps when LSP attaches to a buffer
-- (blink capabilities are wired in plugin/blink.cmp.lua)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }

		-- Go to definition (Snacks picker)
		vim.keymap.set("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end, { buffer = ev.buf, desc = "Show definition" })

		-- Find references with Snacks picker
		vim.keymap.set("n", "gr", function()
			Snacks.picker.lsp_references()
		end, { buffer = ev.buf, desc = "Show references" })

		-- Find implementations with Snacks picker
		vim.keymap.set("n", "gI", function()
			Snacks.picker.lsp_implementations()
		end, { buffer = ev.buf, desc = "Show implementations" })

		-- Find type definitions with Snacks picker
		vim.keymap.set("n", "gt", function()
			Snacks.picker.lsp_type_definitions()
		end, { buffer = ev.buf, desc = "Show type definitions" })

		-- Document symbols with Snacks picker
		vim.keymap.set("n", "<leader>ds", function()
			Snacks.picker.lsp_symbols()
		end, { buffer = ev.buf, desc = "Show symbols" })

		-- Workspace symbols with Snacks picker
		vim.keymap.set("n", "<leader>ws", function()
			Snacks.picker.lsp_workspace_symbols()
		end, { buffer = ev.buf, desc = "Show Workspace symbols" })

		-- Diagnostics with Snacks picker
		vim.keymap.set("n", "<leader>dd", function()
			Snacks.picker.diagnostics()
		end, { buffer = ev.buf, desc = "Show diagnostics" })

		-- Other LSP mappings
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename symbol" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
	end,
})

vim.lsp.enable({
	"pyright",
	"yamlls",
	"jsonls",
	"terraformls",
	"bashls",
	"marksman",
	"lua_ls",
	"ruff",
})

-- require("mason-tool-installer").setup({
-- 	ensure_installed = {
-- 		"pyright", -- python lsp
-- 		"yamlls",
-- 		"jsonls",
-- 		-- "terraform-lsp", -- Use this if you want juliosueiras/terraform-lsp (seems there are some issues with it)
-- 		"terraformls", -- Use this is you want HashiCorp's terraform-ls
-- 		"bashls",
-- 		"marksman", -- makrdown lsp
-- 		"lua_ls",
-- 		"ts_ls",
-- 		"rust_analyzer",
-- 		-- Add any other LSP servers you want Mason to manage
-- 		-- Formatters
-- 		"prettier",
-- 		"stylua",
-- 		-- Linters
-- 		"ruff", -- Python linter (and formatter)
-- 	},
-- })
