# Zsh Configuration

Zsh configuration with standard Oh My Zsh setup and platform-specific customizations.

## Key Differences from Standard Configuration

- **macOS-specific additions**: 
  - `export PATH=$HOME/go/bin:$PATH` - Adds Go binary directory to PATH
  - Additional plugins: `taskwarrior tmux` 
  - Custom alias: `nvim="~/nvim-macos-arm64/bin/nvim"`
  - Backup function: `bkp()` for file backup operations

## Platform Considerations

- Use `zsh-macos/` directory for macOS-specific settings
- Standard `zsh/` directory for Linux/WSL systems