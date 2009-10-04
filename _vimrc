filetype on
filetype indent on
filetype plugin on
au FileType ruby set ts=2 sw=2 et
au FileType c set ts=4 sw=4 sts=0
au FileType cpp set ts=4 sw=4 sts=0

" 256 colors
colo wombat
syn on
set t_Co=256

" no beeps
set visualbell t_vb=

" tabs
set et sw=4 ts=4

" keymaps
nnoremap j gj
nnoremap k gk
nnoremap <tab> :tabnext<cr>
nnoremap <S-tab> :tabprev<cr>

" auto complete braces and quotes
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi{<C-R>z}<ESC>
"vnoremap [ "zdi[<C-R>z]<ESC>
"vnoremap ( "zdi(<C-R>z)<ESC>
"vnoremap " "zdi"<C-R>z"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

" history
set history=1000

" options
set cmdheight=2
set ignorecase
set nobackup
set laststatus=2
set backspace=2
set incsearch
set smartindent

set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l,%c%V%8P

" plugins
"FuzzyFinder.vim
nnoremap <Space>f f
nnoremap <Space>F F
nnoremap f <Nop>
nnoremap <silent> fb :<C-u>FuzzyFinderBuffer!<CR>
nnoremap <silent> ff :<C-u>FuzzyFinderFile! <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nnoremap <silent> fm :<C-u>FuzzyFinderMruFile!<CR>
nnoremap <silent> tb :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderBuffer!<CR>
nnoremap <silent> tf :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderFile!<C-r>=expand('#:~:.')[:-1-len(expand('#:~:.:t'))]<CR><CR>
nnoremap <silent> tm :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderMruFile!<CR>

"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin で発動します）
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

