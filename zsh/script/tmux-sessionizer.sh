#!/usr/bin/env bash

# Add Homebrew to PATH (macOS specific)
export PATH="$PATH:/opt/homebrew/bin"

# FZF theme configuration
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
  --color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
  --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
  --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a
'

# -------------------------------------------------------------------------------------------------
# CONFIGURATION
# -------------------------------------------------------------------------------------------------

CATEGORIES=(
  "Default:ctrl-n|1|$HOME/work $HOME/dev $HOME/github"
  "Config:ctrl-c|1|$HOME/dev/dot-config"
  "Leetcode:ctrl-l|1|$HOME/leetcode"
  "Playground:ctrl-p|2|$HOME/playground/javascript $HOME/playground/python $HOME/playground/go"
)

ALL_DIRS_BINDING="All:ctrl-a"
FZF_POSITION="center,40%,60%"
FZF_PROMPT='Folders: '
FZF_LAYOUT="reverse"

SHOW_HEADER=true

# -------------------------------------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------------------------------------

get_category_depth() { echo "$1" | cut -d'|' -f2; }
get_category_paths() { echo "$1" | cut -d'|' -f3; }
get_binding_key() { echo "$1" | cut -d'|' -f1 | cut -d':' -f2; }
get_category_name() { echo "$1" | cut -d':' -f1; }
find_dirs() {
  local depth="$1"
  shift
  local valid_paths=()
  for path in "$@"; do
    [[ -d "$path" ]] && valid_paths+=("$path")
  done
  [[ ${#valid_paths[@]} -gt 0 ]] && find "${valid_paths[@]}" -mindepth 1 -maxdepth "$depth" -type d
}

build_fzf_args() {
  local args=(
    --tmux "$FZF_POSITION"
    --prompt "$FZF_PROMPT"
    --layout "$FZF_LAYOUT"
  )

  local all_paths=()
  local header=""

  for category in "${CATEGORIES[@]}"; do
    local key=$(get_binding_key "$category")
    local name=$(get_category_name "$category")
    header+="$key=$name "

    local depth=$(get_category_depth "$category")
    local paths=($(get_category_paths "$category"))
    all_paths+=("${paths[@]}")

    local reload_cmd="find"
    for path in "${paths[@]}"; do
      [[ -d "$path" ]] && reload_cmd+=" \"$path\""
    done
    reload_cmd+=" -mindepth 1 -maxdepth $depth -type d"

    args+=("--bind" "$key:reload:$reload_cmd")
  done

  local all_key=$(get_binding_key "$ALL_DIRS_BINDING")
  local all_desc=$(get_category_name "$ALL_DIRS_BINDING")
  header+="$all_key=$all_desc"

  local all_reload_cmd="find"
  for path in "${all_paths[@]}"; do
    [[ -d "$path" ]] && all_reload_cmd+=" \"$path\""
  done
  all_reload_cmd+=" -mindepth 1 -maxdepth 1 -type d"

  args+=("--bind" "$all_key:reload:$all_reload_cmd")
  if $SHOW_HEADER; then
    args+=("--header=$header")
  fi

  printf '%s\n' "${args[@]}"
}

# -------------------------------------------------------------------------------------------------
# Entry Point
# -------------------------------------------------------------------------------------------------

if [[ $# -eq 1 ]]; then
  selected=$1
else
  initial_paths=()
  initial_depth=1

  for category in "${CATEGORIES[@]}"; do
    if [[ $(get_category_name "$category") == "default" ]]; then
      initial_paths=($(get_category_paths "$category"))
      initial_depth=$(get_category_depth "$category")
      break
    fi
  done

  if [[ ${#initial_paths[@]} -eq 0 ]] && [[ ${#CATEGORIES[@]} -gt 0 ]]; then
    category=${CATEGORIES[0]}
    initial_paths=($(get_category_paths "$category"))
    initial_depth=$(get_category_depth "$category")
  fi

  mapfile -t fzf_args < <(build_fzf_args)

  if [[ ${#initial_paths[@]} -gt 0 ]]; then
    selected=$(find_dirs "$initial_depth" "${initial_paths[@]}" | fzf "${fzf_args[@]}")
  else
    selected=$(echo "No directories configured" | fzf "${fzf_args[@]}")
  fi
fi

# -------------------------------------------------------------------------------------------------
# Tmux Session Handling
# -------------------------------------------------------------------------------------------------

if [[ -z $selected ]] || [[ "$selected" == "No directories configured" ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
is_tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $is_tmux_running ]]; then
  tmux new-session -s "$selected_name" -c "$selected"
  exit 0
fi

if ! tmux has-session -t="$selected_name" 2> /dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected"
fi

if [[ -z $TMUX ]]; then
  tmux attach -t "$selected_name"
else
  tmux switch-client -t "$selected_name"
fi
