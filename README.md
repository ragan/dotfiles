# Dotfiles

Personal configuration files for Linux/macOS development environment. Organized using GNU Stow for easy deployment across machines.

## Key Components

### Terminal & Shell
- **Alacritty** - GPU-accelerated terminal (Catppuccin themes available)
- **Kitty** - Alternative terminal with macOS-specific configuration (Catppuccin Macchiato theme)
- **Tmux** - Terminal multiplexer with tmux-powerkit and tmux-yank
  - Prefix: `Ctrl+a`
  - Powerline status bar (theme configurable via @powerkit_theme)
  - Unicode glyph support (WSL-compatible)
  - URL viewing with urlscan (`prefix + u`)
- **Zsh** - Shell with Oh My Zsh, separate configs for macOS and Linux
  - See [zsh/README.md](zsh/README.md) for detailed configuration information
- **Starship** - Cross-shell prompt (configured via eval in zshrc, no custom config files)

### Window Managers & Desktop
- **Rofi** - Application launcher with Catppuccin theme

### Tools
- **Autorandr** - Monitor profile management (stored as `autorandr-home-desktop`)

## Installation

### Prerequisites
- GNU Stow
- Git
- Nerd Font (recommended: FiraCode Nerd Font, JetBrainsMono Nerd Font)
- urlscan (for tmux URL viewing feature: `pacman -S urlscan` on Arch, `apt install urlscan` on Debian/Ubuntu)

### Setup

1. Clone the repository:
```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
```

2. Use GNU Stow to symlink configurations:
```bash
# Install specific configuration
stow tmux

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
# Install tmux plugins
tmux source-file ~/.tmux.conf
# Then press Ctrl+a I to install plugins

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



## Directory Structure

Each tool has its own directory following GNU Stow conventions:
```
tool-name/
  .config/tool-name/    # Config files
  .tool-rc              # Root dotfiles (if applicable)
```

Examples:
- `tmux/.tmux.conf` - Tmux configuration
- `zsh/.zshrc` - Zsh configuration
- `alacritty/.config/alacritty/alacritty.toml` - Alacritty configuration

## Troubleshooting

### WSL-Specific Issues
- **Unicode glyphs not displaying**: Ensure Windows Terminal uses a Nerd Font. tmux automatically detects and sets `C.utf8` locale for WSL.
- **Powerkit glyphs broken**: Verify font supports Nerd Font glyphs (F4BC and similar PUA characters).

### Tmux
- **Plugins not loading**: Press `Ctrl+a` then `I` to install tmux plugins via TPM.
- **Status line missing**: Check that tmux-powerkit is installed:
  ```bash
  ls ~/.tmux/plugins/tmux-powerkit
  # If not found:
  cd ~/dotfiles && stow tmux && tmux source ~/.tmux.conf
  # Then press Ctrl+a I to install plugins
  ```

## Theme & Visuals

Theme configurations across tools:
- **Alacritty**: Catppuccin themes available (including Mocha, Macchiato)
- **Kitty**: Catppuccin Macchiato theme
- **Tmux**: tmux-powerkit (default theme, configurable via @powerkit_theme)
- **Rofi**: Catppuccin Mocha theme
- **Awesome**: Default theme
- **Polybar**: Custom configuration

## Contributing

When modifying configurations:
1. Test changes thoroughly in your environment
2. Ensure platform-specific configs (macOS vs Linux) are correctly separated
3. Check for sensitive data before committing (see AGENTS.md for security guidelines)
4. Run `git status` and `git diff` before committing
5. Use descriptive commit messages

## Notes

- Tmux prefix: `Ctrl+a`
- FiraCode Nerd Font or JetBrainsMono Nerd Font recommended for proper icon rendering
- Configuration files are designed to be portable across Linux/macOS systems
- Theme consistency varies across tools - see "Theme & Visuals" section for details
