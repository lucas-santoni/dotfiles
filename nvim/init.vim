"Plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'raimondi/delimitmate'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-grepper'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf'
Plug 'airblade/vim-gitgutter'
call plug#end()

"Colors
set termguicolors
set background=dark
colorscheme gruvbox

"Splits
set splitright
set splitbelow

"Cursorline
set cursorline
"highlight CursorLineNr guibg=NONE

"Search
set incsearch
set hlsearch
set ignorecase
nnoremap qq :nohl<CR>

"Avoid useless redraw
"Currently kind of buggy in nvim
"set lazyredraw

"Ignore some extensions
set wildignore+=*.so,*.o,*.swp

"Remap escape
imap jj <Esc>

"Remap page moves
map <M-j> <S-Down>
map <M-k> <S-Up>

"Syntax processing
syntax on

"Invisibles
set listchars=tab:..,trail:~
set list

"Buffers integration
set hidden
set history=500
nnoremap <C-H> :bprev<CR>
nnoremap <C-L> :bnext<CR>
nnoremap <C-J> :bdelete<CR>
nnoremap <C-K> :ls<CR>

"Identation
filetype plugin indent on
syntax enable
set nosmartindent
set cindent
set softtabstop=2
set shiftwidth=2
set expandtab

"But still insert tab
inoremap hh <C-V><Tab>

"Just in case I can not find
"these on the keyboard
inoremap ww <
inoremap WW >

"Show matching chars
set showmatch

"More than 80 chars is bad
set colorcolumn=80
set tw=79

"Splits
cabbrev s split
cabbrev v vsplit

"Signcolumns
hi clear SignColumn
hi SignColumn guibg=None

"Status line
set laststatus=2
set noshowmode

"Line numbers
set number
set relativenumber

"Do not show command
set noshowcmd

"Quickfix colors
hi QuickFixLine gui=None guibg=None guifg=None

"GitGutter color
hi GitGutterAdd guifg=grey
hi GitGutterChange guifg=grey
hi GitGutterDelete guifg=grey
hi GitGutterChangeDelete guifg=grey

"ALE colors
hi clear ALEErrorSign
hi clear ALEWarningSign
hi ALEErrorSign guifg=Red
hi ALEWarningSign guifg=Orange

"Ale signs
let g:ale_set_highlights = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>>'

"Ale C/C++ linting
let g:ale_c_gcc_options = '-Wall -Wextra -O -Iinclude -Iincludes -Iinc'
let g:ale_c_clang_options = '-Wall -Wextra -O -Iinclude -Iincludes -Iinc'
let g:ale_cpp_gcc_options =
      \'-Wall -Wextra -O -Iinclude -Iincludes -Iinc --std=c++14'
let g:ale_cpp_clang_options =
      \'-Wall -Wextra -O -Iinclude -Iincludes -Iinc --std=c++14'

"Ale Python linting
"Override python.vim defaults
"Ignored rules are for 2 spaces indenting
let g:python_recommended_style = 0
let g:ale_python_flake8_options = '--ignore E111,E114,E121'

"Airline
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_min_count = 3
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#default#layout = [
      \ [ 'a', 'error', 'warning', 'b', 'c' ],
      \ [ 'x', 'z' ]
      \ ]
let g:airline#extensions#hunks#enabled = 0
let g:airline_section_z = airline#section#create(['%3p%%'])
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#error_symbol = '✘ '
let g:airline#extensions#ale#warning_symbol = '! '

"FZF
map ff :FZF <CR>
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~30%' }

"Nerdtree
nnoremap rr :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore=['\.o$', '\~$']
