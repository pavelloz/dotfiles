# set -x

# https://scriptingosx.com/2019/07/moving-to-zsh-part-4-aliases-and-functions/

autoload -Uz vcs_info
precmd() { vcs_info }

export EDITNOW='subl'
export EDITOR='subl -w'
export LESS="$LESS -i -F -R -X"

alias ls="/bin/ls -F"
alias ll='ls -l'

host=$(uname -n | sed -e 's/\.local//g')

# asdf
brew_prefix_asdf="$brewery/opt/asdf"
export ASDF_DIR="$brew_prefix_asdf"
. "$brew_prefix_asdf/asdf.sh"

export PATH="/usr/local/opt/sqlite/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
