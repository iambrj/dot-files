:syntax on
:set cindent
:set number
:set hidden
:set shiftwidth=4
:set tabstop=4
:set hlsearch
:set textwidth=100
:ab #d #define
:ab #i #include
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
