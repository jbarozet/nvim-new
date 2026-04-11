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
