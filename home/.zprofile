# XDG base directories
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Wayland
export XDG_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1

# ── PATH ──────────────────────────────────────────────────────────────
# Set here (login shell, before auto-Hypr execs Hyprland) so GUI apps the
# compositor launches — Steam, etc. — also see these dirs. .zshrc repeats
# this for non-login terminals; `typeset -U` keeps PATH duplicate-free.
#   dotfiles/bin : personal scripts (prime-run, restow, …)
#   .local/bin   : uv tool shims (ruff, …)
typeset -U path PATH
path=("$HOME/dotfiles/bin" "$HOME/.local/bin" $path)
export PATH
