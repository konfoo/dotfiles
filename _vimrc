"" neobundle
set nocompatible
filetype off
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/vimproc', {'build':{'mac':'make -f make_mac.mak', 'unix':'make -f make_unix.mak' }}
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'mojako/ref-sources.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'superbrothers/vim-quickrun-markdown-gfm'
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'karakaram/vim-quickrun-phpunit'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'othree/eregex.vim'
NeoBundle 'kana/vim-surround'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'superbrothers/vim-vimperator'
NeoBundle 'bling/vim-airline'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'stephpy/vim-php-cs-fixer'
NeoBundle 'veloce/vim-behat'
NeoBundle 'migemo', {'type' : 'nosync', 'base' : '~/.vim/bundle/manual'}
NeoBundle 'nacitar/terminalkeys.vim'
filetype plugin indent on
filetype indent on
NeoBundleCheck

"" <LEADER>の設定
let mapleader=','
noremap \ , 

"" display & color settings
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
  set t_Co=256 "256色表示
endif

syn on
set visualbell t_vb= "no beeps
"set list "タブと行末を表示
set cmdheight=2
colo Tomorrow-Night

"" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

"" neocomplete
"use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
\ 'default' : '',
\ 'vimshell' : $HOME.'/.vimshell_hist',
\ 'php' : $HOME.'/.vim/dict/php.dict'
\ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

"" Unite
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git/',
            \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-P> :<C-u>Unite  -buffer-name=files   -start-insert buffer file_rec/async:!<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
    let b:SuperTabDisabled=1
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-x> unite#do_action('split')
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction



"" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
nnoremap <silent><leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

"" vimquickrun
" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ?  quickrun#sweep_sessions() : "\<C-c>"
" runner/vimproc/updatetime で出力バッファの更新間隔をミリ秒で設定できます
" updatetime が一時的に書き換えられてしまうので注意して下さい
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60,
\       "outputter/buffer/split" : ":botright",
\       "outputter/buffer/close_on_empty" : 1
\   },
\   'markdown': {
\     'type': 'markdown/gfm',
\     'outputter': 'browser'
\   }
\}

"" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_post_args='--standard=psr2'

"" php-cs-fixer
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

"" vim-behat
let g:feature_filetype='behat'
let g:behat_executables = ['~/SkyDrive/Github/Behat/bin/behat']

"" vim-quickrun-markdown-gfm


"" migemo
noremap  // :<C-u>Migemo<CR>

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
nnoremap Q <Nop> "exモード無効化

"" backup & history
set backupskip+=/private/tmp/* "macでcrontabエラーにならないようにする
set browsedir=buffer    "ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set directory=$HOME/.vim/backup "スワップファイルディレクトリを指定する
set history=1000    "履歴保存数

"" other
set laststatus=2
"set backspace=2
set smartindent

"" search
" /
set ignorecase
set incsearch
set smartcase
set hlsearch
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap g* g*zz
noremap g# g#zz

" grep
" ag > grep の順に優先して使用
if executable('ag')
    set grepprg=ag\ --nogroup\ -iS
    set grepformat=%f:%l:%m
else
    set grepprg=grep\ -Hnd\ skip\ -r
    set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
endif

" 拡張子指定grep
command! -bang -nargs=+ -complete=file Grep call s:Grep(<bang>0, <f-args>)
function! s:Grep(bang, pattern, directory, ...)
    let grepcmd = []
    call add(grepcmd, 'grep' . (a:bang ? '!' : ''))
    if executable('ag')
        if a:0 && a:1 != ''
            call add(grepcmd, '-G "\.' . a:1 . '$"')
        else
            call add(grepcmd, '-a')
        endif
    else
        if a:0 && a:1 != ''
            call add(grepcmd, '--include="*.' . a:1 . '"')
        endif
    endif
    call add(grepcmd, a:pattern)
    call add(grepcmd, a:directory)
    execute join(grepcmd, ' ')
endfunction

" grep + auto quickfix
autocmd QuickFixCmdPost *grep* cwindow

