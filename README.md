# Configuration based on Neovim 0.12

Neovim 0.12 introduces a significant new feature: a **built-in plugin manager** under `vim.pack`.

## LSP


Since the release of Neovim v0.11, the `vim.lsp.config` and `vim.lsp.enable` are available for configuring LSP without downloading [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
However, we _may_ need a third-party plugin called `mason.nvim`. This plugin is an LSP registry, that is, you can download any LSP you want easily.

There exist two ways to set up a an LSP

1. We could use  `vim.lsp.config.<lsp> = { ... }` to configure a specific LSP.
2. Creating an `lsp` folder in `runtimepath` (`~/.config/nvim` creating a file for each LSP under the `lsp` folder. 

This repo still uses nvim-lspconfig, but considering removing it.

All LSP configurations are located here: https://github.com/neovim/nvim-lspconfig/tree/master/lsp

## Git integration

gitsigns — inline, buffer-focused

- Signs in the signcolumn (added/changed/removed lines)
- Hunk navigation (]h/[h) and hunk actions (stage, reset, preview a hunk)
- Blame annotations inline
- Everything operates on the current file's hunks

vim-fugitive — full Git workflow (removed because I use lazygit)

- `:Git (or :G)` — interactive staging area (like git add -p but visual)
- `:Git log`, `:Git blame` (full file, navigable), `:Git diff`
- `:GBrowse` — open file on GitHub
- `:Git push/pull/fetch/rebase` — run any git command with output in a buffer
- Conflict resolution with 3-way diff (`:Gdiffsplit`)
- Operates on the whole repository
