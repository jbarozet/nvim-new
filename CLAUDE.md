# Neovim Configuration — Claude Context

## Overview

This is a Neovim 0.12 configuration built to use native Neovim features wherever
possible, minimizing reliance on third-party abstractions. The structure mirrors
Neovim's own runtime conventions so the editor does the heavy lifting.

## Key architectural decisions

- **`vim.pack`** (native 0.12 package manager) — no lazy.nvim or packer. Each
  plugin is added with `vim.pack.add()` inline with its setup call, in its own
  `plugin/` file. The lockfile is `nvim-pack-lock.json`.
- **`plugin/` auto-sourcing** — Neovim automatically sources every `*.lua` file
  under `plugin/` at startup (after `init.lua`). Each plugin gets its own file
  there; no central plugin registry needed.
- **`vim.lsp.config`** — per-server overrides are applied inline in `lua/lsp.lua` via
  `vim.lsp.config('<name>', {...})`. The wildcard `vim.lsp.config('*', {...})` in
  `plugin/blink.cmp.lua` applies blink capabilities to all servers after blink is set up.
  There is no `lsp/` directory — mason-lspconfig handles server discovery and setup.
- **`mason` + `mason-lspconfig` + `mason-tool-installer`** — used for fully automated
  installation of LSP servers, formatters, linters, and DAP adapters. `mason-lspconfig`
  bridges Mason with `vim.lsp.enable()` so servers are auto-installed on demand.
  `mason-tool-installer` handles non-LSP tools (prettier, stylua, ruff, debuggers, etc.).
  These are configured in `lua/lsp.lua` (not in a `plugin/` file) because they must be
  set up before LSP servers attach. This is the reason `nvim-lspconfig` is also present —
  `mason-lspconfig` requires it as a peer dependency to resolve server names.
- **`vim.ui2`** (native 0.12 UI) — opted in via `require('vim._core.ui2').enable({})`
  in `lua/configs.lua`.

## File structure

| Path | Purpose |
|------|---------|
| `init.lua` | Entry point — requires `configs`, `keymaps`, `lsp`, `diagnostics`, `autocmds` |
| `lua/configs.lua` | `vim.opt` settings, filetype overrides, leader key, ui2 opt-in |
| `lua/keymaps.lua` | All global keymaps |
| `lua/lsp.lua` | `LspAttach` keymap block + `vim.lsp.enable()` server list + mason/lspconfig setup |
| `lua/diagnostics.lua` | `vim.diagnostic.config` and diagnostic keymaps |
| `lua/autocmds.lua` | All autocommands |
| `plugin/*.lua` | One file per plugin — `vim.pack.add()` + setup, auto-sourced by Neovim |

## Plugin inventory

| File | Plugin | Role |
|------|--------|------|
| `plugin/colorscheme.lua` | catppuccin | Colorscheme + diagnostic line highlights (must be after colorscheme) |
| `plugin/lualine.lua` | lualine | Statusline (`globalstatus = true`) |
| `plugin/plenary.lua` | plenary | Utility library |
| `plugin/which-key.lua` | which-key | Keymap hints |
| `plugin/gitsigns.lua` | gitsigns | Git signs in signcolumn |
| `plugin/treesitter.lua` | nvim-treesitter (`main` branch) | Syntax / folding / highlighting |
| `plugin/blink.cmp.lua` | blink.cmp | Autocompletion; also wires `vim.lsp.config('*', capabilities)` |
| `plugin/snacks.lua` | snacks.nvim | Explorer, picker, notifier, lazygit, indent, scroll, scope, statuscolumn |
| `plugin/conform.lua` | conform.nvim | Formatter runner (prettier, stylua, ruff_format); `<leader>cf` and format-on-save |
| `plugin/nvim-linter.lua` | nvim-lint | Linter runner (installed, setup not yet configured) |
| `plugin/toggleterm.lua` | toggleterm | Floating terminal |
| `plugin/copilot.lua` | copilot.vim | GitHub Copilot inline suggestions |
| `lua/lsp.lua` (inline) | mason + mason-lspconfig + mason-tool-installer + nvim-lspconfig | Automated install of LSP servers, formatters, linters, DAP adapters |
| `plugin/code-companion.lua` | code-companion | AI coding assistant |

## LSP servers

Enabled via `vim.lsp.enable()` in `lua/lsp.lua`; configs in `lsp/`:

`pyright`, `yamlls`, `jsonls`, `terraformls`, `bashls`, `marksman`, `lua_ls`, `ruff`

Auto-installed by `mason-tool-installer` along with formatters and linters:
`prettier`, `stylua`, `ruff`, `ts_ls`, `rust_analyzer`

Formatters (`prettier`, `stylua`, `ruff`) are not LSP servers — invoked via
`conform.nvim` (`plugin/conform.lua`), not via `vim.lsp.enable()`.

## Completion (blink.cmp)

- Sources: `lsp`, `path`, `snippets`, `buffer`
- Cmdline completion enabled with `:` auto-show
- Keymap preset: `enter`; `<C-y>` also accepts
- Ghost text tied to `vim.g.ai_cmp`
- `auto_brackets = true` — do not add manual insert-mode bracket mappings
- Capabilities wired via `vim.lsp.config('*', { capabilities = ... })` at the
  bottom of `plugin/blink.cmp.lua`, after `blink.setup()`

## Key leader mappings (space)

| Key | Action |
|-----|--------|
| `<leader>ff` / `<leader><space>` | Find files (Snacks) |
| `<leader>fg` | Live grep |
| `<leader>fb` / `<leader>,` | Buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |
| `<leader>e` | Toggle file explorer |
| `<leader>cg` | LazyGit |
| `<leader>cl` | LSP info (Snacks picker) |
| `<leader>cf` | Format file (LSP) |
| `<leader>ca` | Code action (LSP, buffer-local) |
| `<leader>rn` | Rename (LSP, buffer-local) |
| `<leader>ds` | Document symbols (LSP, buffer-local) |
| `<leader>ws` | Workspace symbols (LSP, buffer-local) |
| `<leader>dd` | Diagnostics picker |
| `<leader>cd` | Line diagnostics float |
| `<leader>pu` | `vim.pack.update()` — update all plugins |
| `<leader>pr` | `vim.pack.update` to lockfile versions |
| `gd` | Go to definition (Snacks picker) |
| `gr` | References (Snacks picker) |
| `K` | Hover (LSP) |

## Important conventions

- All LSP keymaps set in `LspAttach` must include `buffer = ev.buf` to be buffer-local.
- New LSP server: add a `lsp/<name>.lua` config file, add the name to
  `vim.lsp.enable()` in `lua/lsp.lua`, and add it to `mason-tool-installer`'s
  `ensure_installed` list so Mason auto-installs it.
- Do not add a direct `<leader>f` binding — it shadows the `<leader>f*` file picker prefix.
- Diagnostic line highlight groups (`DiagnosticErrorLine` etc.) are defined in
  `plugin/colorscheme.lua` after the colorscheme loads — do not move them earlier.
- Treesitter uses the `main` branch (not `master`) — keep this when updating.
- `nvim-lint` is installed but its `setup()` is not yet configured — add linters in
  `plugin/nvim-linter.lua` when needed.
- `prettier` and `stylua` are formatters, not LSP servers — do not add them to
  `vim.lsp.enable()`.
