# Configuration based on Neovim 0.12

Neovim 0.12 introduces a significant new feature: a **built-in plugin manager** under `vim.pack`.

On Linux/macOS, the configuration directory for nvim is located at ~/.config/nvim.
It’s also called the runtimepath, the nvim will read ~/.config/nvim/init.lua when it starts up.

Neovim's runtime system automatically sources every .lua file found in a plugin/ directory that lives anywhere on the runtimepath.
My config root (~/.config/nvim) is always on the runtimepath, so ~/.config/nvim/plugin/\*.lua gets sourced at startup without any manual wiring.

The load order is:

1. init.lua runs first (loading options, keymaps, lsp)
2. Neovim then automatically sources all files under plugin/ after init.lua completes

## LSP

Since the release of Neovim v0.11, the `vim.lsp.config` and `vim.lsp.enable` are available for configuring LSP without downloading [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
However, I use a third-party plugin called `mason.nvim`. This plugin is an LSP registry, that is, you can download any LSP you want easily.

LSPs are enabled via `vim.lsp.enable()` in `lua/lsp.lua`; configurations are in `lsp/`:

- `pyright`, `yamlls`, `jsonls`, `terraformls`, `bashls`, `marksman`, `lua_ls`, `ruff`

Formatters managed by Mason (not LSP servers): `prettier`, `stylua`, `ruff`

- Invoked via `conform.nvim` (`plugin/conform.lua`), not via LSP.

There exist two ways to set up a LSP:

1. We could use `vim.lsp.config.<lsp> = { ... }` to configure a specific LSP.
2. Creating an `lsp` folder in `runtimepath` (`~/.config/nvim` creating a file for each LSP under the `lsp` folder.

LSP ccnfigurations used are downloaded from [neovim lspconfig github](https://github.com/neovim/nvim-lspconfig/tree/master/lsp) and saved in `lsp` folder.

## Git integration

gitsigns — inline, buffer-focused

- Signs in the signcolumn (added/changed/removed lines)
- Hunk navigation (]h/[h) and hunk actions (stage, reset, preview a hunk)
- Blame annotations inline
- Everything operates on the current file's hunks

lazygit

vim-fugitive — full Git workflow (removed because I use lazygit)

- `:Git (or :G)` — interactive staging area (like git add -p but visual)
- `:Git log`, `:Git blame` (full file, navigable), `:Git diff`
- `:GBrowse` — open file on GitHub
- `:Git push/pull/fetch/rebase` — run any git command with output in a buffer
- Conflict resolution with 3-way diff (`:Gdiffsplit`)
- Operates on the whole repository
