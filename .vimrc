:syntax on
:set number
:set hidden
:set shiftwidth=4
:set tabstop=4
:set hlsearch
:set relativenumber
:set splitbelow
:set splitright
" shortcut to move among splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" .c files
:autocmd FileType c ab #d #define
:autocmd FileType c ab #D #define
:autocmd FileType c ab #i #include
:autocmd FileType c ab #I #include
:autocmd FileType c set cindent
" .cpp files
:autocmd FileType cpp ab #d #define
:autocmd FileType cpp ab #D #define
:autocmd FileType cpp ab #i #include
:autocmd FileType cpp ab #I #include
:autocmd FileType cpp set cindent
:autocmd FileType cpp ab cout cout <<
:autocmd FileType cpp ab cin cin >>
" java files
:autocmd FileType java ab Sys System
:autocmd FileType java ab pr print
:autocmd FileType java set cindent
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
