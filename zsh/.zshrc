export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="zhann"
# source ~/dev/dot-config/zsh/themes/headline.zsh-theme

# source ~/dev/dot-config/zsh/themes/021011.zsh-theme

plugins=(
zsh-syntax-highlighting
zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

source ~/dev/dot-config/zsh/.zsh_env
source ~/dev/dot-config/zsh/.zsh_alias
eval $(/opt/homebrew/bin/brew shellenv)
# eval "$(starship init zsh)"

function set_name () {echo -ne "\033]0;Mac Terminal\007" }
# Add the function to the environment variable in either Zsh or Bash
if [ -n "$ZSH_VERSION" ]; then
  precmd_functions+=(set_name)
elif [ -n "$BASH_VERSION" ]; then
  PROMPT_COMMAND='set_name'
fi
