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
Plug 'junegunn/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'danro/rename.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'kiddos/deoplete-cpp'
Plug 'majutsushi/tagbar'
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

"Popup menu
set pumheight=10

"Avoid useless redraw
"Currently kind of buggy in nvim
"set lazyredraw

"Ignore some extensions
set wildignore+=*.so,*.o,*.swp

"Remap escape
imap jj <Esc>

"Remap page moves
map <C-J> }
map <C-K> {

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

"Deoplete
"TODO: Add includes paths
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 30
let g:deoplete#sources#cpp#cflags = ['-std=gnu11',
      \'-Wall', '-Wextra', '-Wshadow']
let g:deoplete#sources#cpp#cppflags = ['-std=gnu++14',
      \'-Wall', '-Wextra', '-Wshadow']
let g:deoplete#sources#cpp#c_include_path = ['/usr/local/include',
      \'/usr/include', './include', './includes', './inc', '.']
let g:deoplete#sources#cpp#cpp_include_path = ['/usr/local/include',
      \'/usr/include', './include', './includes', './inc', '.']

"Deoplete autocompletion with tab
let g:deoplete#disable_auto_complete = 1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"Tagbar
nnoremap tt :TagbarToggle<CR>

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

"Linters to use
let g:ale_linters = {
\   'cpp': ['clang'],
\}

"Ale C/C++ linting
let g:ale_c_clang_options = '-Wall -Wextra -Wshadow --std=gnu11'
let g:ale_cpp_clang_options = '-Wall -Wextra -Wshadow --std=gnu++14'

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
let g:airline#extensions#tagbar#enabled = 1

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

"Grepper
nnoremap <C-g> :Grepper<CR>

"Enable project specific stuff
set exrc
set secure
