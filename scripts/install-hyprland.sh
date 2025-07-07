#!/bin/bash
# Hyprland installation with end-4's config

# Verify Arch Linux
if ! grep -q "Arch Linux" /etc/os-release; then
    echo "Error: This script only supports Arch Linux"
    exit 1
fi

# Install prerequisites
sudo pacman -S --needed git curl wget

# Run end-4's installer with safety checks
INSTALL_SCRIPT_URL="https://end-4.github.io/dots-hyprland-wiki/setup.sh"
TEMP_SCRIPT=$(mktemp)

echo "Downloading Hyprland installer..."
curl -fsSL "$INSTALL_SCRIPT_URL" > "$TEMP_SCRIPT"

# Basic security check
if grep -q "rm -rf /" "$TEMP_SCRIPT"; then
    echo "Security alert: Installer contains dangerous commands!"
    exit 1
fi

echo "Running Hyprland installer..."
bash "$TEMP_SCRIPT"

# Cleanup
rm -f "$TEMP_SCRIPT"
