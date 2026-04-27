#!/usr/bin/env bash
set -euo pipefail

BASE_SESSION="${1:-ffai}"
SIDE_SESSION="${2:-${BASE_SESSION}-side}"

# Rename a window in the session if it has a generic shell name
_rename_if_generic() {
  local session="$1" old="$2" new="$3"
  if tmux list-windows -t "$session" -F "#{window_name}" | grep -q "^${old}$"; then
    tmux rename-window -t "$session:${old}" "$new"
  fi
}

# Ensure a named window exists, create it if not
_ensure_window() {
  local session="$1" name="$2"
  if ! tmux list-windows -t "$session" -F "#{window_name}" | grep -q "^${name}$"; then
    tmux new-window -t "$session:" -n "$name"
  fi
}

if ! tmux has-session -t "$BASE_SESSION" 2>/dev/null; then
  # Create fresh session with all three windows
  tmux new-session -d -s "$BASE_SESSION" -n "editor"
  tmux new-window -t "$BASE_SESSION:" -n "docs"
  tmux new-window -t "$BASE_SESSION:" -n "shell"
  tmux select-window -t "$BASE_SESSION:editor"
  echo "Created session '$BASE_SESSION' with windows: editor, docs, shell"
else
  # Session exists — fix generic first window name, then ensure all windows present
  _rename_if_generic "$BASE_SESSION" "zsh"  "editor"
  _rename_if_generic "$BASE_SESSION" "bash" "editor"
  _rename_if_generic "$BASE_SESSION" "sh"   "editor"
  _ensure_window "$BASE_SESSION" "docs"
  _ensure_window "$BASE_SESSION" "shell"
  echo "Using existing session '$BASE_SESSION'"
fi

# Create grouped side session if it doesn't exist
if ! tmux has-session -t "$SIDE_SESSION" 2>/dev/null; then
  tmux new-session -d -t "$BASE_SESSION" -s "$SIDE_SESSION"
  echo "Created grouped session: $SIDE_SESSION"
else
  echo "Session '$SIDE_SESSION' already exists."
fi

# Switch into the base session at the editor window
tmux switch-client -t "$BASE_SESSION:editor"

echo ""
echo "On your second monitor, open a new kitty window and run:"
echo "  ta $SIDE_SESSION"
echo "Then switch to the docs window with: prefix + 2"
