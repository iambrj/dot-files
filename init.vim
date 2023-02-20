call plug#begin()
" The default plugin directory will be as follows:
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
Plug 'gpanders/nvim-parinfer'
Plug 'preservim/nerdtree'
Plug 'kien/rainbow_parentheses.vim'
Plug 'haishanh/night-owl.vim'
Plug 'yasukotelin/shirotelin'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'} " autocompletion
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'} " autocompletion snippets
Plug 'lervag/vimtex'
Plug 'Olical/conjure'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
filetype plugin indent on
colorscheme night-owl

let g:coq_settings = { 'auto_start': v:true }
let g:lightline = { 'colorscheme': 'nightowl' }
" Conjure eval code
let g:conjure#client#scheme#stdio#command = "petite"
let g:conjure#client#scheme#stdio#prompt_pattern = "> $?"

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
set splitbelow
set splitright
set textwidth=80
set lispwords+=fresh,conde,project,match,define-syntax-rule

" Too lazy to move hand from homerow
inoremap jk <ESC>

" Delete trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Shortcut for NERDTree
:command Fs NERDTree

" Toggle search highlight
nnoremap <C-h> :noh<cr>

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
