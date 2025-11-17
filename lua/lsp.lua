vim.lsp.enable({
	"pyright",
	"ruff",
	"bashls",
	"gopls",
	"lua_ls",
	"texlab",
	"ts_ls",
	"rust-analyzer",
	"helm_ls",
	"yamlls",
})

-- vim.diagnostic.config({ signs = true })
vim.diagnostic.config({
	virtual_text = { current_line = true },
})
