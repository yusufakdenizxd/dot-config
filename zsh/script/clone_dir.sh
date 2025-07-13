#!/usr/bin/env bash
custom_list=("/Users/akdeniz/dev" "/Users/akdeniz/work" "/Users/akdeniz/playground/javascript"  "/Users/akdeniz/playground/go"  "/Users/akdeniz/playground/python" "/Users/akdeniz/github" '/Users/akdeniz/leetcode')

selected=$(printf "%s\n" "${custom_list[@]}" | fzf --tmux center,35%,50% --layout reverse --prompt="Repository Main Folder: ")

if [[ -z "$selected" ]]; then
  exit 0
fi

tmux command-prompt -p "Enter repository url:" "run-shell 'cd \"$selected\" && git clone %1 && tmux display-message \"Repository Cloned to: $selected\" || tmux display-message \"Failed to clone repository %1\"'"
