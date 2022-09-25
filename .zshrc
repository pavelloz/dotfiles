export PATH=$HOME/bin:$PATH

ZSH_THEME="miloshadzic"

plugins=(pj git)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias c="clear"
alias ls="/bin/ls -F"
alias ll='ls -l'

# asdf
brew_prefix_asdf="$brewery/opt/asdf"
export ASDF_DIR="$brew_prefix_asdf"
. "$brew_prefix_asdf/asdf.sh"

export PATH="/usr/local/opt/sqlite/bin:$PATH"
export ZSH="/Users/pavel/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
