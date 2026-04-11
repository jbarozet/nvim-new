-- ═══════════════════════════════════════════════════════════
-- COLOR SCHEME
-- ═══════════════════════════════════════════════════════════

vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })
vim.cmd.colorscheme("catppuccin")

-- Custom diagnostic line highlights must be set after the colorscheme
-- or catppuccin will overwrite them.
local palette = {
	err  = "#51202A",
	warn = "#3B3B1B",
	info = "#1F3342",
	hint = "#1E2E1E",
}
vim.api.nvim_set_hl(0, "DiagnosticErrorLine", { bg = palette.err,  blend = 20 })
vim.api.nvim_set_hl(0, "DiagnosticWarnLine",  { bg = palette.warn, blend = 15 })
vim.api.nvim_set_hl(0, "DiagnosticInfoLine",  { bg = palette.info, blend = 10 })
vim.api.nvim_set_hl(0, "DiagnosticHintLine",  { bg = palette.hint, blend = 10 })
