# XDG base directories
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Wayland
export XDG_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1

# NVIDIA Wayland support (Yoga 720 GTX 1050M)
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=
