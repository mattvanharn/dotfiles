#!/bin/bash

# Navigate to dotfiles root
cd "$(dirname "$0")/.."

# Remove existing symlinks
stow -t ~ -D home 2>/dev/null
stow -t ~/.config -D config 2>/dev/null

# Create new symlinks
stow -t ~ home
stow -t ~/.config config

echo "Dotfiles successfully symlinked"
