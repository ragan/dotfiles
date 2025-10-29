# Agent Guidelines for Dotfiles Repository

## Repository Overview
Personal configuration files (dotfiles) for Linux/macOS development environment including nvim, i3, zsh, tmux, and other tools.

## Build/Deploy Commands
- `make dump-keybindings` - Export Cinnamon keybindings to file
- `make load-keybindings` - Import keybindings from file
- `ansible-playbook ansible-home/.ansible/deploy-open-webui.yml -i ansible-home/.ansible/hosts.ini` - Deploy with Ansible

## Code Style Guidelines

### Lua (Neovim config)
- Use tabs for indentation (shown in init.lua and plugin files)
- Configure LSP servers via Mason and nvim-lspconfig
- Import plugins in `nvim/.config/nvim/lua/plugins/` as separate module files
- Use `return {}` pattern for plugin specifications
- Set leader key to space: `vim.g.mapleader = " "`

### Shell Scripts
- Use `#!/usr/bin/env bash` shebang
- Follow standard bash best practices with proper quoting
- Use long-form flags for readability where possible

### Configuration Files
- YAML: 2-space indentation (Ansible playbooks)
- TOML: Used for Alacritty, Starship configs
- Lua: Used for Neovim, Awesome WM, Yazi configs

## File Organization
- Each tool has its own directory matching stow structure
- Config files go in `tool-name/.config/tool-name/`
- Root dotfiles (`.zshrc`, `.tmux.conf`) go in `tool-name/` directory
- Use GNU Stow for symlink management

## Notes
- No test suite (configuration repository)
- `.gitignore` excludes: `.aider*`, `.env`, `lazy-lock.json`, `.venv`
- Primary editors: Neovim with LSP support for Go, Python, TypeScript, Rust, Bash, Lua, C/C++, Java, Zig
