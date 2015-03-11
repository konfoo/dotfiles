# z.sh
if brew list z > /dev/null 2>&1; then
    _Z_CMD=j
    source `find $(brew --cellar z) -name z.sh | sort -r | head -1`
fi

# command aliases
alias zshload="source ~/.zshenv || source ~/.zshrc"
export EDITOR=vim
alias vi='vim'
[[ -s `which Vim` ]] && alias vi='Vim'
[[ -s `which vimpager` ]] && export PAGER=vimpager
[[ -s `which tmux` ]] && alias tmux='tmux -2'
[[ -s `which htop` ]] && alias top='htop'
[[ -s `which ag` ]] && alias grep='ag'
[[ -e "$HOME/SkyDrive" ]] && alias todo="$EDITOR $HOME/SkyDrive/.todo.md"

# global aliases
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g X='| xargs'
alias -g W='| wc'
alias -g P='| peco'
alias -g L="| $PAGER"

