-- ═══════════════════════════════════════════════════════════
-- LSP CONFIGURATION
-- ═══════════════════════════════════════════════════════════

vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- ═══════════════════════════════════════════════════════════
-- 1. Install LSP configurations
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" }, -- pull LSP server configurations
})

-- ═══════════════════════════════════════════════════════════
-- 2. Install the package manager
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup({
	ensure_installed = {
		"lua_ls",
	},
})

-- ═══════════════════════════════════════════════════════════
-- 3: Configure LSP servers
--    if mason-tool-installer is not used, add `ensure_installed`
-- ═══════════════════════════════════════════════════════════

vim.pack.add({
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require("mason-lspconfig").setup({
	-- A list of servers to ensure are installed by Mason
	ensure_installed = {
		"pyright",
		"ruff",
		"yamlls",
		"jsonls",
		-- "terraform-lsp", -- Use this if you want juliosueiras/terraform-lsp
		"terraformls", -- Use this is you want HashiCorp's terraform-ls
		"bashls",
		"marksman",
		"lua_ls",
		"ts_ls",
		"rust_analyzer",
		-- Add any other LSP servers you want Mason to manage
	},
	-- Server configuration
  -- This callback is called for each installed server
	-- It allows you to add custom configurations for each LSP server
	handlers = {
		-- Default handler for most servers: just use their default setup
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		
    -- Example of a custom handler for a specific server (if needed)
		-- ["lua_ls"] = function()
		--     require("lspconfig").lua_ls.setup({
		--         settings = {
		--             Lua = {
		--                 runtime = {
		--                     version = "LuaJIT",
		--                 },
		--                 diagnostics = {
		--                     globals = { "vim" },
		--                 },
		--                 workspace = {
		--                     library = vim.api.nvim_get_runtime_file("", true),
		--                 },
		--                 telemetry = {
		--                     enable = false,
		--                 },
		--             },
		--         },
		--     })
		-- end,
	},
})


-- vim.lsp.enable({
-- 	"pyright",
-- 	"ruff",
-- 	"yamlls",
--   "terraform_lsp",
-- 	"bashls",
--   "marksman",
-- 	"gopls",
-- 	"lua_ls",
-- 	"texlab",
-- 	"ts_ls",
-- 	"rust-analyzer",
-- 	"helm_ls",
-- })
--
