# Configuration based on Neovim 0.12

Neovim 0.12 introduces a significant new feature: a **built-in plugin manager** under `vim.pack`.

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
