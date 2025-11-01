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

## Security Guidelines

### Pre-Commit Sensitive Data Check
**CRITICAL**: Always scan for sensitive data before committing. Run these checks:

```bash
# Search for common sensitive patterns
rg -i "password|passwd|api_key|apikey|secret|token|private_key|credentials|bearer" --glob '!.git/*'

# Search for cloud service credentials
rg -i "aws_access_key|aws_secret|github_token|gh_token|ssh_key" --glob '!.git/*'

# Find potential credential files
find . -name "*.pem" -o -name "*.key" -o -name "*.env" -o -name "*_rsa" -o -name "*.p12" 2>/dev/null | grep -v ".git"

# Check for tracked sensitive files
git ls-files | rg -i "ssh|gpg|key|secret|password|credential"
```

### What Should NEVER Be Committed
- SSH keys (`id_rsa`, `id_ed25519`, `*.pem`)
- GPG private keys
- API keys, tokens, or authentication credentials
- `.env` files with secrets (already in `.gitignore`)
- Email addresses or usernames (use placeholders in examples)
- IP addresses or hostnames (use `localhost` or `example.com`)

### Safe to Commit
- Keyboard shortcuts and keybindings
- Theme configurations and color schemes
- Public configuration without credentials
- Example configs with placeholder values

## Notes
- No test suite (configuration repository)
- `.gitignore` excludes: `.aider*`, `.env`, `lazy-lock.json`, `.venv`
- Primary editors: Neovim with LSP support for Go, Python, TypeScript, Rust, Bash, Lua, C/C++, Java, Zig
