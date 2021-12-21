set nocompatible

call plug#begin('~/.vim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kien/rainbow_parentheses.vim'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'jpalardy/vim-slime'
Plug 'relastle/bluewery.vim'
" Initialize plugin system
call plug#end()

" Coc stuff
set updatetime=300
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make slime work with :term
let g:slime_target = "vimterminal"

filetype plugin indent on
syntax on

set termguicolors
colorscheme bluewery
let g:lightline = { 'colorscheme': 'bluewery' }

" Rainbow-Paren Config
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set number
set relativenumber
set tabstop=2 shiftwidth=2 expandtab
set hidden
set splitbelow
set splitright
set mouse=a
set hlsearch
set incsearch
set scrolloff=9
set cursorline
set textwidth=80
set cmdheight=1

" Statusline, don't need an extra plugin for that!
" see help statusline for what options mean
set laststatus=2
set statusline=
set statusline+=\ %t
set statusline+=\ %m
set statusline+=\ %p

" Better formatting when miniKanrening
set lispwords+=fresh,conde,project

" Highlighting current column
set cursorline cursorcolumn

" Toggle search highlight
nnoremap <C-h> :noh<cr>

" Too lazy to move hand from homerow
inoremap jk <ESC>

" Delete trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Auto complete closing characters
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino " ""<left>
ino {<CR> {<CR>}<ESC>O

" Load skeleton for LaTeX files
autocmd BufNewFile *.tex 0r ~/.vim/skeletons/skeleton.tex
" Load skeleton for cpp files
autocmd BufNewFile *.cpp 0r ~/.vim/skeletons/skeleton.cpp
" Load skeleton for c files
autocmd BufNewFile *.c 0r ~/.vim/skeletons/skeleton.c
" Load skeleton for md files
autocmd BufNewFile *.md 0r ~/.vim/skeletons/skeleton.md

" .cpp files
autocmd FileType cpp ab #d #define
autocmd FileType cpp ab #D #define
autocmd FileType cpp ab #i #include
autocmd FileType cpp ab #I #include
autocmd FileType cpp ab cout cout <<
autocmd FileType cpp ab cin cin >>
