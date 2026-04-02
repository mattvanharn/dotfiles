# ── Tmux ──────────────────────────────────────────────────────────────────────
alias tl='tmux list-sessions'
alias ta='tmux attach -t'       # usage: ta ffai
alias tn='tmux new -s'          # usage: tn myproject
alias tk='tmux kill-session -t'

# ── Dotfiles config editing ───────────────────────────────────────────────────
# These are symlinked — editing them edits the repo directly
alias ezsh='$EDITOR ~/dotfiles/home/.zshrc'
alias szsh='source ~/.zshrc'
alias etmux='$EDITOR ~/dotfiles/config/tmux/tmux.conf'
alias ekitty='$EDITOR ~/dotfiles/config/kitty/custom.conf'

# ── Navigation ────────────────────────────────────────────────────────────────
alias dot='cd ~/dotfiles'
alias ..='cd ..'
alias ...='cd ../..'

# ── Filesystem ────────────────────────────────────────────────────────────────
alias la='ls -la'
alias ll='ls -l'

# ── Python ────────────────────────────────────────────────────────────────────
alias venv='source .venv/bin/activate'
alias deact='deactivate'
