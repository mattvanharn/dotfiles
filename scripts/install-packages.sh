#!/bin/bash
# Package installation with validation

CORE_PACKAGES=(
    kitty
    zsh
    git
    base-devel
)

# Install core packages first
sudo pacman -S --needed "${CORE_PACKAGES[@]}"

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install remaining packages with validation
if [ -f "pacman.txt" ]; then
    echo "Validating package list..."
    VALID_PACKAGES=()
    while read -r pkg; do
        if pacman -Si "$pkg" &>/dev/null; then
            VALID_PACKAGES+=("$pkg")
        else
            echo "Warning: Package $pkg not found in repositories"
        fi
    done < pacman.txt
    
    sudo pacman -S --needed "${VALID_PACKAGES[@]}"
else
    echo "Warning: pacman.txt not found"
fi
