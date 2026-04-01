#!/usr/bin/env bash
set -euo pipefail

BASE_SESSION="${1:-ffai}"
SIDE_SESSION="${2:-${BASE_SESSION}-side}"

# Ensure base session exists
if ! tmux has-session -t "$BASE_SESSION" 2>/dev/null; then
  echo "Base session '$BASE_SESSION' not found."
  echo "Start it first, e.g.: tmux new -s $BASE_SESSION"
  exit 1
fi

# Create grouped side session only if missing
if ! tmux has-session -t "$SIDE_SESSION" 2>/dev/null; then
  tmux new-session -d -t "$BASE_SESSION" -s "$SIDE_SESSION"
  echo "Created grouped session: $SIDE_SESSION (shares windows with $BASE_SESSION)"
else
  echo "Session $SIDE_SESSION already exists."
fi

echo ""
echo "Now in a second terminal run:"
echo "  tmux attach -t $SIDE_SESSION"
echo ""
echo "Tip: keep terminal 1 on 'claude', terminal 2 on 'editor'"
