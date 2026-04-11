--- diagnostic settings
local map = vim.keymap.set

local sev = vim.diagnostic.severity

vim.diagnostic.config({
	-- keep underline & severity_sort on for quick scanning
	underline = true,
	severity_sort = true,
	update_in_insert = false, -- less flicker
	float = {
		border = "rounded",
		source = true,
	},
	-- keep signs & virtual text, but tune them as you like
	-- signs = {
	-- 	text = {
	-- 		[sev.ERROR] = " ",
	-- 		[sev.WARN] = " ",
	-- 		[sev.INFO] = " ",
	-- 		[sev.HINT] = "󰌵 ",
	-- 	},
	-- },
	virtual_text = {
    current_line = true, -- show virtual text only for current line
		spacing = 4,
		source = "if_many",
		prefix = "●",
	},
	-- NEW in 0.11 — dim whole line
	linehl = {
		[sev.ERROR] = "DiagnosticErrorLine",
		[sev.WARN] = "DiagnosticWarnLine",
		[sev.INFO] = "DiagnosticInfoLine",
		[sev.HINT] = "DiagnosticHintLine",
	},
})

-- vim.diagnostic.config({ signs = true })
-- vim.diagnostic.config({
-- 	virtual_text = { current_line = true },
-- })
--
-- diagnostic keymaps
local diagnostic_goto = function(next, severity)
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		vim.diagnostic.jump({ count = next and 1 or -1, float = true, severity = severity })
	end
end

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
