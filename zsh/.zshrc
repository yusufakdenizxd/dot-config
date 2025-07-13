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

eval "$(zoxide init zsh)"



# echo -ne '\033[?12l'
