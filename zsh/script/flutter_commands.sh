#!/usr/bin/env bash

declare -A commands

# Mapping labels to commands
commands["Build Release Apk"]="build apk --release"
commands["Test"]="test"
commands["Doctor"]="doctor"
commands["Pub Get"]="pub get --no-example"
commands["Clean"]="clean"
commands["List Devices"]="devices"
commands["Run Without Flavor"]="run"
commands["Run Dev Flavor"]="run --flavor dev -t lib/main_dev.dart"
commands["Run Prod Flavor"]="run --flavor prod -t lib/main_prod.dart"
commands["Build Appbundle Prod Flavor"]="build appbundle --flavor prod -t lib/main_prod.dart"
commands["Build Ipa Prod Flavor"]="build ipa --flavor prod -t lib/main_prod.dart"

# Show labels in fzf
selected_label=$(printf "%s\n" "${!commands[@]}" | fzf --height 30% --layout reverse --prompt="Commands: " -m -1 -q "$1")

# Execute the corresponding command
if [ -n "$selected_label" ]; then
    flutter ${commands["$selected_label"]}
else
    echo "Command not selected bro"
fi
