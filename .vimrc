" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'lervag/vimtex'
call vundle#end()

" Config starts here
"set background=dark
filetype plugin indent on
syntax on
set number
set hidden
set shiftwidth=4
set tabstop=4
set hlsearch
set relativenumber
set splitbelow
set splitright
set laststatus=2

" shortcut to move among splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" .c files
autocmd FileType c ab #d #define
autocmd FileType c ab #D #define
autocmd FileType c ab #i #include
autocmd FileType c ab #I #include
autocmd FileType c set cindent

" .cpp files
autocmd FileType cpp ab #d #define
autocmd FileType cpp ab #D #define
autocmd FileType cpp ab #i #include
autocmd FileType cpp ab #I #include
autocmd FileType cpp set cindent
autocmd FileType cpp ab cout cout <<
autocmd FileType cpp ab cin cin >>

" java files
autocmd FileType java ab Sys System
autocmd FileType java ab pr print
autocmd FileType java set cindent

" .md files
autocmd FileType md set textwidth=80

set  spell
set textwidth=80
set noautoindent
set nocindent
set nofoldenable
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" .hs files
autocmd FileType hs setlocal shiftwidth=2 softtabstop=2 expandtab tabstop=2

" Ctrl-j/k inserts blank line below/above, and Alt-j/k deletes.
nnoremap <silent><A-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Enable IndentGuide on startup
" let g:indent_guides_enable_on_vim_startup = 1

" Load skeleton for LaTeX files
autocmd BufNewFile *.tex 0r ~/.vim/skeletons/skeleton.tex
" Load skeleton for cpp files
autocmd BufNewFile *.cpp 0r ~/.vim/skeletons/skeleton.cpp
" Load skeleton for c files
autocmd BufNewFile *.c 0r ~/.vim/skeletons/skeleton.c

