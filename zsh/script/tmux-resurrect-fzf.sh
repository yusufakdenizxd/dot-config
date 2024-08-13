#!/usr/bin/env bash
SELECTED_PROJECTS=$(tmuxinator list -n |
    tail -n +2 |
    fzf --tmux center,20%,30% --layout reverse --prompt="Sessions: " -m -1 -q "$1")

if [ -n "$SELECTED_PROJECTS" ]; then
    IFS=$'\n'

    for PROJECT in $SELECTED_PROJECTS; do
        tmuxinator start "$PROJECT"
    done

fi
