export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="zhann"
#source ~/dev/dot-config/zsh/themes/headline.zsh-theme

#source ~/dev/dot-config/zsh/themes/021011.zsh-theme

plugins=(
zsh-syntax-highlighting
zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

source ~/dev/dot-config/zsh/.zsh_env
source ~/dev/dot-config/zsh/.zsh_alias

eval $(/opt/homebrew/bin/brew shellenv)
#eval "$(starship init zsh)"
#
eval "$(zoxide init zsh)"

function set_name () {echo -ne "\033]0;Mac Terminal\007" }
# Add the function to the environment variable in either Zsh or Bash
if [ -n "$ZSH_VERSION" ]; then
  precmd_functions+=(set_name)
elif [ -n "$BASH_VERSION" ]; then
  PROMPT_COMMAND='set_name'
fi

PATH=~/.console-ninja/.bin:$PATH

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/yusufakdeniz/.dart-cli-completion/zsh-config.zsh ]] && . /Users/yusufakdeniz/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export PATH="/Users/yusufakdeniz/.shorebird/bin:$PATH"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/yusufakdeniz/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP binary.
export PATH="/Users/yusufakdeniz/Library/Application Support/Herd/bin/":$PATH


# Herd injected NVM configuration
export NVM_DIR="/Users/yusufakdeniz/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"


# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/yusufakdeniz/Library/Application Support/Herd/config/php/81/"

pokemon-colorscripts -r 1-3 --no-title

# pokemon-colorscripts -n suicune --no-title
# pokemon-colorscripts -n charizard --no-title
