#!/usr/bin/env bash

fcommands=`echo "doctor,pub get,clean,run --flavor dev -t lib/main_dev.dart,run --flavor prod -t lib/main_prod.dart" | tr ',' '\n'`
SELECTED_PROJECTS=$(printf "$fcommands" |
    fzf --tmux center,20%,30% --prompt="Commands: " -m -1 -q "$1")

if [ -n "$SELECTED_PROJECTS" ]; then
    IFS=$'\n'

    for PROJECT in $SELECTED_PROJECTS; do
      flutter $PROJECT
    done

fi
