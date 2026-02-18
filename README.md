# Dotfiles

Personal configuration files for Linux/macOS development environment. Organized using GNU Stow for easy deployment across machines.

## Key Components

### Terminal & Shell
- **Alacritty** - GPU-accelerated terminal with Catppuccin Mocha theme
- **Kitty** - Alternative terminal with macOS-specific configuration
- **Tmux** - Terminal multiplexer with tmux-powerkit and vim-tmux-navigator
  - Prefix: `Ctrl+a`
  - Powerline status bar with Catppuccin theme
  - Unicode glyph support (WSL-compatible)
- **Zsh** - Shell with Oh My Zsh, separate configs for macOS and Linux
- **Starship** - Cross-shell prompt

### Editor
- **Neovim** - Configured with Lazy.nvim plugin manager
  - Leader key: `Space`
  - LSP support for Go, Python, TypeScript, Rust, Bash, Lua, C/C++, Java, Zig
  - Git integration (fugitive, gitsigns)
  - Completions, linting, debugging
  - Telescope, Treesitter, Neo-tree
  - Copilot, Claude integration

### Window Managers & Desktop
- **i3** - Tiling window manager configuration
- **Awesome** - Lua-based window manager
- **Polybar** - Status bar
- **Rofi** - Application launcher with Catppuccin theme
- **Dunst** - Notification daemon
- **Picom** - Compositor

### Tools
- **Ranger** - Terminal file manager with custom commands
- **Yazi** - Modern terminal file manager with plugins
- **Newsraft** - RSS reader
- **Ulauncher** - Application launcher with Bitwarden/Firefox integration
- **Autorandr** - Monitor profile management
- **Ansible** - Deployment automation (Open WebUI)

## Installation

### Prerequisites
- GNU Stow
- Git
- Nerd Font (recommended: FiraCode Nerd Font, JetBrainsMono Nerd Font)

### Setup

1. Clone the repository:
```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
```

2. Use GNU Stow to symlink configurations:
```bash
# Install specific configuration
stow nvim

# Install multiple configurations
stow tmux zsh alacritty

# Install all (be careful!)
stow */
```

3. Platform-specific:
   - macOS: Use `zsh-macos` and `kitty-mac` instead of `zsh` and `kitty`
   - Linux: Standard directories
   - WSL: Ensure proper font setup in Windows Terminal

4. Post-install:
```bash
# Install Neovim plugins
nvim --headless "+Lazy! sync" +qa

# Install tmux plugins (press prefix+I to install)
tmux source-file ~/.tmux.conf

# Source shell config
source ~/.zshrc
```

## Configuration Management

### Keybinding Management (Cinnamon)
```bash
make dump-keybindings  # Export keybindings
make load-keybindings  # Import keybindings
```

### Reload Configurations
```bash
# Tmux
tmux source-file ~/.tmux.conf

# Zsh
source ~/.zshrc

# Awesome (requires restart)
```

### Ansible Deployment
```bash
ansible-playbook ansible-home/.ansible/deploy-open-webui.yml \
  -i ansible-home/.ansible/hosts.ini
```

## Directory Structure

Each tool has its own directory following GNU Stow conventions:
```
tool-name/
  .config/tool-name/    # Config files
  .tool-rc              # Root dotfiles (if applicable)
```

Examples:
- `nvim/.config/nvim/` - Neovim configuration
- `tmux/.tmux.conf` - Tmux configuration
- `zsh/.zshrc` - Zsh configuration
- `alacritty/.config/alacritty/` - Alacritty configuration

## Troubleshooting

### WSL-Specific Issues
- **Unicode glyphs not displaying**: Ensure Windows Terminal uses a Nerd Font. tmux automatically detects and sets `C.utf8` locale for WSL.
- **Powerkit glyphs broken**: Verify font supports Nerd Font glyphs (F4BC and similar PUA characters).

### Tmux
- **Plugins not loading**: Press `Ctrl+a` then `I` to install tmux plugins via TPM.
- **Status line missing**: Check that tmux-powerkit is installed: `ls ~/.tmux/plugins/tmux-powerkit`

### Neovim
- **LSP not working**: Run `:Mason` to ensure language servers are installed.
- **Plugin issues**: Run `:Lazy sync` to update/manage plugins.

## Theme & Visuals

Consistent **Catppuccin Mocha** color scheme across:
- Alacritty/Kitty terminal
- Tmux (via tmux-powerkit)
- Neovim
- Rofi
- Polybar
- Yazi (Dracula and Catppuccin variants available)

## Contributing

When modifying configurations:
1. Test changes thoroughly in your environment
2. Ensure platform-specific configs (macOS vs Linux) are correctly separated
3. Check for sensitive data before committing (see AGENTS.md for security guidelines)
4. Run `git status` and `git diff` before committing
5. Use descriptive commit messages

## Notes

- Uses Catppuccin Mocha color scheme across multiple tools
- Neovim uses space as leader key
- Tmux prefix: `Ctrl+a`
- FiraCode Nerd Font or JetBrainsMono Nerd Font recommended for proper icon rendering
- Configuration files are designed to be portable across Linux/macOS systems
