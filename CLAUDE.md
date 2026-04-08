# Neovim Configuration — Claude Context

## Overview

This is a Neovim 0.12 configuration built to use native Neovim features wherever
possible, minimizing reliance on third-party abstractions.

## Key architectural decisions

- **`vim.pack`** (native 0.12 package manager) — no lazy.nvim or packer. Plugins are
  added with `vim.pack.add()` inline with their setup calls. The lockfile is
  `nvim-pack-lock.json`.
- **`vim.lsp.config` / `vim.lsp.enable`** (native 0.11+ LSP) — no lspconfig wrappers.
  Server configs live in `lua/lsp.lua`. The wildcard `vim.lsp.config('*', {...})`
  applies shared settings (blink capabilities) to all servers.
- **`vim.ui2`** (native 0.12 UI) — opted in via `require('vim._core.ui2').enable({})` in
  `lua/interface.lua`.
- **mason-lspconfig `automatic_enable`** (default: true) — handles calling
  `vim.lsp.enable()` for all Mason-installed servers. Individual server configs must be
  set via `vim.lsp.config()` **before** `require('mason-lspconfig').setup()`.

## File structure

| File | Purpose |
|------|---------|
| `init.lua` | Entry point — loads modules in order |
| `lua/interface.lua` | Leader key, UI2 opt-in, colorscheme (catppuccin), lualine, plenary |
| `lua/lsp.lua` | Mason + LSP setup, blink capabilities, per-server configs |
| `lua/plugins.lua` | All other plugins: which-key, gitsigns, treesitter, blink.cmp, snacks, toggleterm, fugitive, copilot |
| `lua/configs.lua` | `vim.opt` settings, filetype overrides |
| `lua/diagnostics.lua` | `vim.diagnostic.config`, diagnostic keymaps, custom line highlights |
| `lua/keymaps.lua` | All global keymaps |
| `lua/autocmds.lua` | Autocommands, including the `LspAttach` keymap block |
| `lsp_from_lspconfig/` | Reference copies of lspconfig server definitions (not loaded) |

## Plugin inventory

| Plugin | Role |
|--------|------|
| catppuccin | Colorscheme |
| lualine | Statusline |
| plenary | Utility library |
| which-key | Keymap hints |
| gitsigns | Git signs in signcolumn |
| nvim-treesitter (main branch) | Syntax / folding / highlighting |
| blink.cmp | Autocompletion (LSP, path, snippets, buffer, cmdline) |
| snacks.nvim | File explorer, picker (replaces telescope), notifier, lazygit, indent guides, scroll, scope, statuscolumn |
| nvim-lint | Linter runner (installed but not yet configured) |
| toggleterm | Floating terminal (`<C-]>`) |
| copilot.vim | GitHub Copilot inline suggestions |
| mason + mason-lspconfig + mason-tool-installer | LSP server / tool installation |
| nvim-lspconfig | Server definition reference (used by mason-lspconfig) |

## LSP servers (auto-installed via Mason)

`pyright`, `yamlls`, `jsonls`, `terraformls`, `bashls`, `marksman`, `lua_ls`,
`ts_ls`, `rust_analyzer`

Formatters: `prettier`, `stylua`, `ruff`

## Completion (blink.cmp)

- Sources: `lsp`, `path`, `snippets`, `buffer`
- Cmdline completion enabled with `:` auto-show
- Keymap preset: `enter`; `<C-y>` also accepts
- Ghost text tied to `vim.g.ai_cmp`
- Capabilities passed to all LSP servers via `vim.lsp.config('*', { capabilities = ... })`

## Key leader mappings (space)

| Key | Action |
|-----|--------|
| `<leader>ff` / `<leader><space>` | Find files (Snacks) |
| `<leader>fg` | Live grep |
| `<leader>fb` / `<leader>,` | Buffers |
| `<leader>fr` | Recent files |
| `<leader>e` | Toggle file explorer |
| `<leader>cg` | LazyGit |
| `<leader>cf` | Format file (LSP) |
| `<leader>ca` | Code action (LSP, buffer-local) |
| `<leader>rn` | Rename (LSP, buffer-local) |
| `<leader>ds` | Document symbols (LSP, buffer-local) |
| `<leader>ws` | Workspace symbols (LSP, buffer-local) |
| `<leader>dd` | Diagnostics picker |
| `<leader>cd` | Line diagnostics float |
| `gd` | Go to definition (Snacks picker) |
| `gr` | References (Snacks picker) |
| `K` | Hover (LSP) |

## Important conventions

- All LSP keymaps in `LspAttach` must include `buffer = ev.buf` to be buffer-local.
- Per-server `vim.lsp.config()` calls go in `lua/lsp.lua` **before** `require('mason-lspconfig').setup()`.
- Do not add a direct `<leader>f` binding — it shadows the `<leader>f*` file picker prefix.
- `nvim-lint` is installed but its `setup()` call is commented out; configure linters there when needed.
- Treesitter uses the `main` branch (not `master`) — keep this when updating.
