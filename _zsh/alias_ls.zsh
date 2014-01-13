# ls color
if ls --color > /dev/null 2>&1; then
    export LS_COLOR_OPTION="--color=auto"
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
else
    export LS_COLOR_OPTION="-G"
    export LSCOLORS=gxfxcxdxbxegedabagacad
fi

# ls alias
alias l="ls -F $LS_COLOR_OPTION"
alias la="ls -AF $LS_COLOR_OPTION"
alias ll="ls -slF $LS_COLOR_OPTION"
alias lla="ls -slAF $LS_COLOR_OPTION"
