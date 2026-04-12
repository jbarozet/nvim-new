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

Since Neovim v0.11, vim.lsp.config and vim.lsp.enable allow configuring LSP servers natively without any third-party plugin. However, I use a small stack on top to automate tool installation:

- nvim-lspconfig — pre-built launch configurations (cmd, filetypes, root detection) for 100+ servers
- mason.nvim — UI and engine for downloading/installing language tools (servers, formatters, linters, DAPs) into a managed directory
- mason-lspconfig.nvim — bridges mason with nvim-lspconfig so installed servers are automatically wired up
- mason-tool-installer.nvim — declarative ensure_installed list so all tools are auto-installed on startup without manual :MasonInstall

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
