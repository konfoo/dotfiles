autoload -Uz compinit && compinit
autoload -Uz colors && colors

# 途中まで打ったコマンドの先から補完
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 補完候補にもカラー表示適用
zstyle ':completion:*' list-colors $LS_COLORS
