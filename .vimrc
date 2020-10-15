set termguicolors
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'lervag/vimtex'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'dracula/vim'
Plugin 'relastle/bluewery.vim'
Plugin 'valloric/youcompleteme'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'chrisbra/csv.vim'
Plugin 'chrisbra/unicode.vim'
Plugin 'mattn/emmet-vim'
Plugin 'prettier/vim-prettier'
Plugin 'whonore/Coqtail' | Plugin 'let-def/vimbufsync'
Plugin 'alx741/vim-hindent'
Plugin 'Shougo/vimproc.vim'
Plugin 'vim-scripts/SearchComplete'
Plugin 'elmcast/elm-vim'
Plugin 'wlangstroth/vim-racket'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()

colorscheme bluewery

" Remap autocomplete to ctrl-space
if has("gui_running")
    inoremap <C-Space> <C-n>
else
  if has("unix")
    inoremap <Nul> <C-n>
  else
  endif
endif

" Racket
if has("autocmd")
  au BufReadPost *.rkt,*.rktl set filetype=racket
  au filetype racket set lisp
  au filetype racket set autoindent
  au Filetype racket let b:AutoPairs = {'(':')', '[':']', '{':'}', '"':'"', '```':'```', '"""':'"""', "'''":"'''"}
endif
autocmd Filetype racket setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

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

" Prolog
if version < 600
   syn clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

syntax keyword prologISOBuiltIn   var nonvar integer float number atom string 
			\atomic compound unify_with_occurs_check fail false true repeat call once 
			\catch throw abolish retract asserta assertz current_predicate clause open 
			\close stream_property set_stream_position set_input set_output current_ouput 
			\nl put_byte put_char put_code flush_output get_byte get_code get_char 
			\peek_byte peek_code peek_char at_end_of_stream write_term write_canonical 
			\write writeq read read_term functor arg copy_term atom_codes atom_chars 
			\char_code number_chars number_codes atom_length sub_atom op current_op 
			\char_conversion current_char_conversion is mod rem div round float 
			\float_fractional_part float_integer_part truncate floor ceiling sqrt sin cos 
			\atan log findall bagof setof sub_atom

syntax keyword prologSWIBuiltIn   rational callable ground cyclic_term subsumes subsumes_chk 
			\unifiable use_module compare apply not ignore call_with_depth_limit call_cleanup 
			\print_message print_message_lines message_hook on_signal current_signal block exit 
			\term_hash redefine_system_predicate retractall assert recorda recordz recorded 
			\erase flag compile_predicates index current_atom 
			\current_blob current_functor current_flag current_key dwim_predicate nth_clause 
			\predicate_property open_null_stream current_stream is_stream stream_position_data 
			\seek set_stream see tell append seeing telling seen set_prolog_IO told 
			\wait_for_input byte_count character_count line_count line_position read_clause 
			\put tab ttyflush get0 get skip get_single_char copy_stream_data print portray 
			\read_history prompt setarg nb_setarg nb_linkarg duplicate_term numbervars 
			\term_variables atom_number name term_to_atom atom_to_term atom_concat 
			\concat_atom atom_prefix normalize_space collation_key char_type string_to_list
			\code_type downcase_atom upcase_atom collation_key locale_sort string_to_atom 
			\string_length string_concat sub_string between succ plus rdiv max min random 
			\integer rationalize ceil xor tan asin acos pi e cputime eval msb lsb popcount 
			\powm arithmetic_function current_arithmetic_function is_list memberchk length 
			\sort msort keysort predsort merge merge_set maplist forall writeln writef 
			\swritef format format_predicate current_format_predicate tty_get_capability 
			\tty_goto tty_put set_tty tty_size shell win_exec win_shell win_folder 
			\win_registry_get_value getenv setenv unsetenv setlocale unix date time 
			\get_time stamp_date_time date_time_stamp date_time_value format_time 
			\parse_time window_title win_window_pos win_has_menu win_insert_menu 
			\win_insert_menu_item access_file exists_file file_directory_name file_base_name 
			\same_file exists_directory delete_file rename_file size_file time_file 
			\absolute_file_name is_absolute_file_name file_name_extension expand_file_name 
			\prolog_to_os_filename read_link tmp_file make_directory working_directory chdir 
			\garbage_collect garbage_collect_atoms trim_stacks stack_parameter dwim_match 
			\wildcard_match sleep qcompile portray_clause acyclic_term clause_property 
			\setup_and_call_cleanup message_to_string phrase hash with_output_to fileerrors 
			\read_pending_input prompt1 same_term sub_string merge_set 

syntax cluster prologBuiltIn      contains=prologSWIBuiltIn,prologISOBuiltIn

syntax match   prologArithmetic   /\*\*\?\|+\|\/\/\?\|\/\\\|<<\|>>\|\\\/\?\|\^/ 
			\contained containedin=prologBody

syntax match   prologRelations    /=\.\.\|!\|=:=\|=\?<\|=@=\|=\\=\|>=\?\|@=\?<\|@>=\?\|\\+\|\\\?=\?=\|\\\?=@=\|=/ 
			\contained containedin=prologBody

syntax region  prologCComment     fold start=/\/\*/ end=/\*\// contains=prologTODO,@Spell
syntax match   prologComment      /%.*/ contains=prologTODO,@Spell
syntax region  prologCommentFold  fold start=/^\zs\s*%/ skip=/^\s*%/ end=/^\ze\s*\([^%]\|$\)/ contains=prologComment
syntax keyword prologTODO         FIXME TODO fixme todo Fixme FixMe Todo ToDo XXX xxx contained
syntax cluster prologComments     contains=prologCComment,prologComment,prologCommentFold

syntax region  prologBody         fold start=/\(:-\|?-\)/ end=/\./ 
			\contains=@prologAll,prologPredicateWithArity
syntax region  prologDCGBody      fold start=/-->/ end=/\./ 
			\contains=@prologAll,prologDCGSpecials

syntax match   prologNumber       /\<\d\+\>/ contained
syntax match   prologNumber       /\<\d\+\.\d\+\>/ contained
syntax match   prologAtom         /\<\l\w*\>\ze\([^(]\|$\)/ contained
syntax match   prologVariable     /\<\(_\|\u\)\w*\>/ contained
syntax match   prologChar         /\<\0'\(\\\)\?.\>/ contained

syntax match   prologHead         /\<\l\w*\>/ nextgroup=prologBody,prologDCGBody skipwhite
syntax region  prologHeadWithArgs start=/\<\l\w*\>(/ end=/)/ nextgroup=prologBody,prologDCGBody contains=@prologAll

syntax match  prologOpStatement   /indexed\|discontiguous\|dynamic\|module_transparent\|multifile\|volatile\|initialization/ 
			\containedin=prologBody contained

syntax region  prologDCGSpecials  start=/{/ end=/}/ contained contains=@prologAll

syntax region  prologTuple        fold start=/\W\zs(/ end=/)/ contained containedin=prologPredicate,prologBody contains=@prologAll
syntax region  prologPredicate    start=/\<\l\w*\>\ze(/ end=/)/ contains=@prologAll
syntax match   prologPredicateWithArity /\<\l\w*\>\/\d\+/ contains=@prologBuiltIn,prologArity
syntax match   prologArity        contained /\/\d\+/
syntax cluster prologPredicates   contains=prologPredicate,prologPredicateWithArity

syntax region  prologList         start=/\[/ end=/\]/ contains=prologListDelimiters,@prologAll,prologPredicateWithArity contained
syntax match   prologListDelimiters /[,|]/ contained

syntax cluster prologAll          contains=prologList,prologPredicate,prologTuple,@prologTerms,@prologComments,prologQuoted,@prologBuiltIn,prologRelations,prologArithmetic,prologDiffList
syntax cluster prologTerms        contains=prologVariable,prologAtom,prologList,
			\prologNumber,prologErrorTerm,prologChar

syntax match   prologQuotedFormat /\~\(\d*[acd\~DeEgfGiknNpqrR@st\|+wW]\|`.t\)/ contained
syntax region  prologQuoted       start=/'/ end=/'/ contains=prologQuotedFormat,@Spell

syntax match   prologErrorVariable /\<\(_\|\u\)\w*\>/
syntax region  prologErrorTerm    start=/\<\(_\|\u\)\w*\>(/ end=/)/

"""" Highlights

highlight link prologErrorVariable Error
highlight link prologErrorTerm     Error

highlight link prologOpStatement  Preproc
highlight link prologComment      Comment
highlight link prologCComment     Comment
highlight link prologTODO         TODO

highlight link prologAtom         Constant
highlight link prologChar         Constant
highlight link prologVariable     Identifier
highlight link prologNumber       Number

highlight link prologISOBuiltIn   Keyword
highlight link prologSWIBuiltIn   Keyword

highlight link prologRelations    Statement

highlight link prologQuotedFormat Special
highlight link prologQuoted       String

highlight link prologPredicate    Normal
highlight link prologPredicateWithArity Normal
highlight link prologHead         Constant
highlight link prologHeadWithArgs Normal

highlight link prologBody         Statement
highlight link prologDCGBody      Statement

highlight link prologList         Type
highlight link prologListDelimiters Type
highlight link prologArity        Type
highlight link prologDCGSpecials  Type
highlight link prologTuple        Type
highlight link prologDiffList     Type

syn sync minlines=20 maxlines=50

let b:current_syntax = "prolog"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Config starts here
filetype plugin indent on
syntax on
set tabstop=4 shiftwidth=4 expandtab
set number
set hidden
set hlsearch
set relativenumber
set splitbelow
set splitright
set textwidth=80
set nofoldenable
set whichwrap+=<,>,h,l,[,] " go to next/previous line from end/beginning
set cursorcolumn
set cursorline
set wildmenu
set smartcase
set scrolloff=9
set incsearch
set mouse=a

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

" .hs files
autocmd Filetype haskell setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Ctrl-j/k inserts blank line below/above, and Alt-j/k deletes.
nnoremap <silent><A-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Toggle search highlight
nnoremap <C-h> :noh<cr>

" Too lazy to move hand from homerow
inoremap jk <ESC>

" Enable IndentGuide on startup
" let g:indent_guides_enable_on_vim_startup = 1

" Load skeleton for LaTeX files
autocmd BufNewFile *.tex 0r ~/.vim/skeletons/skeleton.tex
" Load skeleton for cpp files
autocmd BufNewFile *.cpp 0r ~/.vim/skeletons/skeleton.cpp
" Load skeleton for c files
autocmd BufNewFile *.c 0r ~/.vim/skeletons/skeleton.c

" Match vim background with terminal background
hi Normal guibg=NONE ctermbg=NONE

:packadd termdebug

" Literate haskell macros
let @x='"��a`>o]�kb\end{code]�kb}`<O\begin{code}��aO'

" Coq config
imap <C-L> \cl
imap <C-J> \cj
imap <C-K> \ck
map <C-L> \cl
map <C-J> \cj
map <C-K> \ck
