# Neovim 0.12 Configuration

Based on nightly build (0.12).

Visit [Neovin Installation](https://github.com/neovim/neovim/blob/master/INSTALL.md).

## Neovim 0.5

**Neovim 0.5** introduced a native LSP client, enabling direct communication with language servers. However, this initial implementation lacked integrated, server-specific configurations, making external plugins like nvim-lspconfig a de-facto requirement for practical LSP setup.

## Neovim 0.11

**Neovim 0.11** brings what is described as "full LSP support", aiming to reduce the need for additional plugins for basic LSP setup and offering a more integrated experience. Key changes and new features include:

- Simplified LSP setup and Configuration:
    - Native Configuration: introduces `vim.lsp.config()` to define default configurations for language servers.
    - Configurations can now be stored in `lsp/<name>.lua` files within runtime path.
    - `vim.lsp.enable()`: A new function, `vim.lsp.enable()`, simplifies the process of enabling language servers.

- Builtin auto-completion

- Improved hover documentation.
    - Note: Use `vim.o.winborder = 'rounded'` to use rounded borders on all floating windows

- Diagnostic Improvements

- Native Keymaps: Neovim 0.11 also introduces new native keymaps for common LSP functionalities

# Neovim 0.12

Neovim 0.12 will introduce a significant new feature: a **built-in plugin manager** under `vim.pack`.

This new addition aims to provide a minimal, native solution for managing plugins, reducing the reliance on external plugin managers (like lazy.nvim).

It's generally considered a more minimal solution compared to feature-rich external plugin managers like lazy.nvim or packer.nvim. These external managers often offer advanced features like lazy-loading, dependency management, and more sophisticated UIs. vim.pack does not inherently support lazy loading, meaning plugins added with it are loaded at startup.

Also Neovim 0.12 continues to mature its native Language Server Protocol (LSP) client, building upon the foundational work of 0.5 and the significant enhancements in 0.11. The focus in 0.12 is on further streamlining the LSP experience, adding new capabilities, and refining existing functionalities.

This configuration is based on the **new integrated package manager**.
