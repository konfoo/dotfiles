# PAGER
if brew list vim > /dev/null  2>&1; then
    alias vless=`find $(brew --cellar vim) -name less.sh | sort -r | head -1`
    export PAGER=vless
fi
GIT_PAGER=$PAGER

# z.sh
if brew list z > /dev/null 2>&1; then
    _Z_CMD=j
    source `find $(brew --cellar z) -name z.sh | sort -r | head -1`
fi

# ls color
if brew list coreutils > /dev/null 2>&1; then
    alias ls="gls --color"
else
    alias ls="ls -G"
fi

# ls alias
alias l='ls -F'
alias la='ls -AF'
alias ll='ls -lF'
alias lla='ls -lAF'

# command aliases
alias vi="vim"
alias pd='popd'
alias zshload="source ~/.zshrc"
[[ -s `which tmux` ]] && alias tmux='tmux -2'
[[ -s `which htop` ]] && alias top='htop'

# global aliases
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g X='| xargs'
alias -g W='| wc'
alias -g L="| $PAGER"

# rvm alias
alias rvm-prompt=$HOME/.rvm/bin/rvm-prompt
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

