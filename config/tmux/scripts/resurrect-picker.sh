#!/bin/bash
# resurrect-picker.sh — interactively restore any tmux-resurrect snapshot
#
# Usage: bound to a tmux key via display-popup -E

RESURRECT_DIR="$HOME/.local/share/tmux/resurrect"
RESTORE_SCRIPT="$HOME/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh"

if [[ ! -d "$RESURRECT_DIR" ]]; then
  echo "No resurrect directory found: $RESURRECT_DIR"
  sleep 2
  exit 1
fi

# Build parallel arrays: one for display, one for file paths
declare -a display_lines
declare -a file_paths

while IFS= read -r f; do
  basename="${f##*/}"

  # Parse timestamp from filename: tmux_resurrect_YYYYMMDDTHHMMSS.txt
  ts="${basename#tmux_resurrect_}"
  ts="${ts%.txt}"
  date_str="${ts:0:4}-${ts:4:2}-${ts:6:2} ${ts:9:2}:${ts:11:2}"

  # Extract session names from the file
  sessions=$(grep '^session' "$f" 2>/dev/null | awk '{print $2}' | paste -sd ', ' -)
  [[ -z "$sessions" ]] && sessions="(no sessions)"

  display_lines+=("$date_str  │  $sessions")
  file_paths+=("$f")
done < <(ls -t "$RESURRECT_DIR"/tmux_resurrect_*.txt 2>/dev/null)

if [[ ${#file_paths[@]} -eq 0 ]]; then
  echo "No saved snapshots found in $RESURRECT_DIR"
  sleep 2
  exit 1
fi

# fzf picker
chosen_line=$(printf '%s\n' "${display_lines[@]}" | \
  fzf --height=100% \
      --reverse \
      --no-sort \
      --prompt="Restore snapshot: " \
      --header="Enter to restore  ·  Esc to cancel")

[[ -z "$chosen_line" ]] && exit 0

# Map chosen display line back to its file
chosen_file=""
for i in "${!display_lines[@]}"; do
  if [[ "${display_lines[$i]}" == "$chosen_line" ]]; then
    chosen_file="${file_paths[$i]}"
    break
  fi
done

[[ -z "$chosen_file" ]] && exit 1

ln -sf "$chosen_file" "$RESURRECT_DIR/last"
tmux run-shell "$RESTORE_SCRIPT"
