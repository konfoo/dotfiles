# z.sh
if brew list z > /dev/null 2>&1; then
    _Z_CMD=j
    source `find $(brew --cellar z) -name z.sh | sort -r | head -1`
fi

# command aliases
alias vi="vim"
alias zshload="source ~/.zshenv ~/.zshrc"
[[ -s `which vimpage` ]] && export PAGER=vimpager
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

