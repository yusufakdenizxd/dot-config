#!/usr/bin/env bash
custom_list=("/Users/akdeniz/dev" "/Users/akdeniz/playground/javascript"  "/Users/akdeniz/playground/go"  "/Users/akdeniz/playground/python" "/Users/akdeniz/github" '/Users/akdeniz/leetcode')

selected=$(printf "%s\n" "${custom_list[@]}" | fzf --tmux center,35%,50% --layout reverse --prompt="Main Folder: ")

if [[ -z "$selected" ]]; then
  exit 0
fi

tmux command-prompt -p "Enter directory name:" "run-shell 'mkdir -p \"$selected/%1\" && tmux display-message \"Directory created: $selected/%1\" || tmux display-message \"Failed to create directory.\"'"
