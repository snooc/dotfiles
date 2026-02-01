# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository managed with GNU Stow. Configurations for Neovim, Zsh, Ghostty, Zed, and various CLI tools.

## Deployment

```bash
# Install/update symlinks (from ~/.dotfiles)
stow .

# Stow automatically converts dot- prefix to . (e.g., dot-zshrc → ~/.zshrc)
```

The `.stowrc` file configures `--dotfiles` mode and verbose output.

## Structure

- `dot-*` files → symlinked to home directory as `.*`
- `dot-config/*` → symlinked to `~/.config/*`

## Key Configuration Files

| File | Purpose |
|------|---------|
| `dot-config/nvim/init.lua` | Neovim config with mini.nvim, LSP, treesitter |
| `dot-config/mise/config.toml` | Tool versions (Go, Node, CLI tools) |
| `dot-zshrc` | Shell aliases and environment |
| `dot-zprofile` | Shell initialization (Starship, mise, editor) |
| `dot-config/starship.toml` | Cross-shell prompt configuration |
| `dot-config/zed/settings.json` | Zed editor settings (Vim mode enabled) |
| `dot-config/ghostty/config` | Terminal emulator settings |

## Neovim Architecture

Uses **mini.nvim** as the sole dependency manager via `add()` function. Plugins are declared and loaded in `init.lua`:

- Mini modules: basics, notify, git, diff, statusline, clue, pick, extra, map
- LSP: lua_ls, gopls with format-on-save
- Treesitter for syntax highlighting
- Filetype configs in `after/ftplugin/` (2-space for Lua/JS, 4-space for Python, tabs for Go)

## Conventions

- **Theme**: Catppuccin (frappe dark, latte light) across all tools
- **Indentation**: Language-specific (see ftplugin files)
- **Shell**: Zsh primary with fzf integration
- **Version management**: mise for languages and CLI tools
