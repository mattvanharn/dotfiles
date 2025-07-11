#!/bin/bash

DOTFILES_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# Safety checks
[ -d "$DOTFILES_ROOT/config" ] || { echo "Error: config directory missing"; exit 1; }
command -v stow >/dev/null || { echo "Error: stow not installed"; exit 1; }

# Remove existing symlinks
stow -t ~ -D home 2>/dev/null
stow -t ~/.config -D config 2>/dev/null

# Create new symlinks
stow -t ~ home
stow -t ~/.config config

echo "✅ Dotfiles successfully symlinked"
echo "⚠️ Note: Some changes may require restarting applications"
