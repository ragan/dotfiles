# Zsh Configuration

This directory contains Zsh shell configuration files for Linux/macOS development environments.

## Overview

The configuration uses Oh My Zsh framework with customizations for enhanced development experience. It includes:

- Standard Oh My Zsh setup with custom plugins and themes
- Platform-specific configurations for macOS and Linux
- History management to prevent truncation and duplicate entries
- Custom aliases and functions for common tasks
- Integration with Starship prompt for a modern terminal experience

## Key Features

- **History Configuration**: Large history size (100,000 commands) with duplicate removal to prevent truncation
- **Cross-platform Support**: Separate configurations for macOS and Linux systems  
- **Oh My Zsh Integration**: Standard framework with custom extensions
- **Starship Prompt**: Modern cross-shell prompt
- **Custom Aliases**: Useful shortcuts for development workflows

## Files

- `.zshrc` - Main configuration file with Oh My Zsh setup and customizations
- `zsh-macos/` - macOS-specific Zsh configuration (separate from standard linux configs)

## Platform Considerations

- **macOS**: Use `zsh-macos` directory instead of `zsh` for platform-specific settings
- **Linux**: Standard configuration files in `zsh/` directory
- **WSL**: Properly configured with Nerd Font support and locale settings

This configuration aims to provide a consistent, powerful shell environment across different platforms while maintaining portability.