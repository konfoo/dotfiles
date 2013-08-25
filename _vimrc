"" neobundle
set nocompatible
filetype off
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimproc', {'build':{'mac':'make -f make_mac.mak', 'unix':'make -f make_unix.mak' }}
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'karakaram/vim-quickrun-phpunit'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'othree/eregex.vim'
NeoBundle 'kana/vim-surround'
NeoBundle 'superbrothers/vim-vimperator'
NeoBundle 'bling/vim-airline'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'migemo', {'type' : 'nosync', 'base' : '~/.vim/bundle/manual'}
filetype plugin indent on
filetype indent on
NeoBundleCheck

"" <LEADER>の設定
let mapleader=','

"" neocomplecache
set completeopt=menuone "補完候補が１つだけでも表示
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1 " 大文字が入力されるまで大文字小文字の区別を無視
let g:neocomplcache_enable_underbar_completion=1 " スネークケースの補完を有効化
let g:neocomplcache_enable_camel_case_completion=1 " キャメルケースの補完を有効化
let g:neocomplcache_max_list=20 " ポップアップメニューで表示される候補の数
let g:neocomplcache_min_syntax_length=3 " シンタックスをキャッシュするときの最小文字長
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
" Enter/Deleteキーで補完ウィンドウを閉じる
function! s:my_cr_func()
    return pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
endfunction 
inoremap <silent> <CR> <C-R>=<SID>my_cr_func()<CR>
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'php' : $HOME . '/.vim/dict/php.dict',
\ }
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

"let g:neocomplcache_keyword_patterns['default'] = '\h\w*' "日本語補完を無効化


"" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

"" vim-airline
let g:airline_powerline_fonts = 1

"" tab width setting
"" et:TabをSpace展開 sw:行頭Tab幅 ts:行頭以外Tab幅 sts:expandtabで1Tab辺りのSpace数
set et sw=4 ts=4 
au FileType c set ts=4 sw=4 sts=0
au FileType cpp set ts=4 sw=4 sts=0

"" encodings
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp

"" keymaps
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k> <C-o>D
nnoremap <tab> :tabnext<cr>
nnoremap <S-tab> :tabprev<cr>

"" backup & history
set nobackup
set browsedir=buffer    "ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set directory=~/.vim/backup "スワップファイルディレクトリを指定する
set history=1000    "履歴保存数

"" other
set laststatus=2
"set backspace=2
set smartindent

"" search
set ignorecase
set incsearch
set smartcase
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap g* g*zz
noremap g# g#zz

"" display
" colorscheme
colo solarized

syn on
set visualbell t_vb= "no beeps
set t_Co=256 "256色表示
"set list "タブと行末を表示
set cmdheight=2
"set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l,%c%V%8P

