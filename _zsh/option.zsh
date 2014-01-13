# prompt
setopt  prompt_subst

# directory
setopt  auto_cd
setopt  auto_pushd
setopt  pushd_ignore_dups       #ignore duplicate directory

# history
set HISTFILE=${HOME}/.zsh/history
set HISTSIZE=10000
set SAVEHIST=10000
setopt  hist_ignore_all_dups    #ignore duplicate command (delete old command)
setopt  hist_ignore_dups        #ignore duplicate command (ignore only prev command)
setopt  hist_no_store           #ignore history command
setopt  hist_reduce_blanks      #remove excess spaces
setopt  append_history          #
setopt  share_history           #permit access history from other zsh session

# completion
setopt  auto_menu               #select next candidate with TAB key
setopt  auto_param_slash
#setopt  complete_aliases        #show aliases in the list #z.shが動かないのでコメントアウト
setopt  list_types
setopt  list_packed             #show the list packed
setopt  list_rows_first

# 8 ビット目を通すようになり、日本語のファイル名などを見れるようになる
setopt print_eightbit

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# 戻り値が 0 以外の場合終了コードを表示する
setopt print_exit_value

# beep
setopt nolistbeep               #stop beep when listing completion
