"This file is a Neovim configuration file
"It may work on Vim > 8, who knows
"It is a pretty heavy configuration

"Plugins
"Managed via vim-plug
"Use :PlugInstall / :PlugClean
"Use :PlugUpdate / :PlugUpgrade
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'raimondi/delimitmate'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'danro/rename.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim'
Plug 'majutsushi/tagbar'
call plug#end()

"Colors
"True colors only for compatible terminal emulators
"Dark background (may affet color scheme)
"Set a colorscheme
if has("termguicolors")
  set termguicolors
endif
set background=dark
colorscheme gruvbox

"Splits
"Split on right and on below
"More natural
"Use :s and :v
set splitright
set splitbelow
cabbrev s split
cabbrev v vsplit

"Cursorline
"Show the cursorline
"Remove any eventual unwanted background
set cursorline
highlight CursorLineNr guibg=NONE

"Search
"Search as you type
"Highlight results
"Ignore case
"Use qq to remove the highlight
set incsearch
set hlsearch
set ignorecase
nnoremap qq :nohl<CR>

"Popup menu
"Not too many entries
set pumheight=10

"Avoid useless redraw
"Currently kind of buggy in nvim
"set lazyredraw

"Ignore some extensions in wildmenu
set wildignore+=*.so,*.o,*.swp

"Remap escape
"jj is always near
imap jj <Esc>

"Remap page moves
"Avoid scrolling one line by one line
map <C-J> }
map <C-K> {

"Syntax processing
syntax on

"Invisibles
"Spot trailing characters
set listchars=tab:..,trail:~
set list

"Buffers integration
"Buffers can be hidden but still alive
"Limit buffer history for speed
"Switch buffers by using ctrl+h/l
set hidden
set history=500
nnoremap <C-H> :bprev<CR>
nnoremap <C-L> :bnext<CR>

"Identation
"2 spaces as identation, everytime
"This prevent from inserting a tab character
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
"Like () or {}
set showmatch

"More than 80 chars is bad
"Show a ruller
"Auto wrap
set colorcolumn=80
set tw=79

"Signcolumns
"Avoid any unwanted background
hi clear SignColumn
hi SignColumn guibg=None

"Status line
"Always show statusline
"Hide the mode indicator as it is built in Airline
"Hide command while typing
set laststatus=2
set noshowmode
set noshowcmd

"Line numbers
"Show linenumbers
"Relative to current line
set number
set relativenumber

"Deoplete
"Deoplete is the autocompletion framework
"Enable it on startup
"Load 30 entries at most
let g:deoplete#enable_at_startup=1
let g:deoplete#max_list=30

"Deoplete autocompletion with tab
"Script for GitHub
"More reliable that Supertab ?
"Use tab/shift+tab to navigate between entries
let g:deoplete#disable_auto_complete=1
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<c-n>" :
      \ <sid>check_back_space() ? "\<tab>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort
  let col=col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"Snippets
"UltiSnips is the snippet framework
"Tons of default snippets provided by vim-snippets
"Disable the traditional expand key
"Use a function instead
"I do so because I use the enter key as my expand key
"and this prevent a bug which makes the key useless otherwise
"Not necessary to remap jump forward/backward
"when deoplete is present has it is prioritary
"let g:UltiSnipsJumpForwardTrigger=\"<tab>"
"let g:UltiSnipsJumpBackwardTrigger=\"<S-tab>"
"TODO: Disable default snippets for some languages
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res=0
function! <SID>ExpandSnippetOrReturn()
  let snippet=UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ?
      \"<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

"Tagbar
"Install ctags for this to work
nnoremap tt :TagbarToggle<CR>
let g:tagbar_iconchars=['+', '-']

"Quickfix colors
"Hide this ugly yellow
hi QuickFixLine gui=None guibg=None guifg=None

"GitGutter color
"Non intrusive colors
hi GitGutterAdd guifg=grey
hi GitGutterChange guifg=grey
hi GitGutterDelete guifg=grey
hi GitGutterChangeDelete guifg=grey

"Ale colors
"Ale is the syntax processing framework
"Intrusive colors
hi clear ALEErrorSign
hi clear ALEWarningSign
hi ALEErrorSign guifg=Red
hi ALEWarningSign guifg=Orange

"Ale signs
"No cute UTF chars, sorry
let g:ale_set_highlights=0
let g:ale_sign_error='>>'
let g:ale_sign_warning='>>'

"Linters to use
"If nothing is precised, the default linters are used
let g:ale_linters={
      \'cpp': ['clang'],
      \}

"Ale C/C++ linting
"Use basic flags
"More specific flags should be provided on a project basis
"by using a local .nvimrc at projet root re-exporting these variables
let g:ale_c_clang_options='-Wall -Wextra -Wshadow --std=gnu11'
let g:ale_cpp_clang_options='-Wall -Wextra -Wshadow --std=gnu++14'

"Ale Python linting
"Override python.vim defaults
"Ignored rules are for 2 spaces indenting
let g:python_recommended_style=0
let g:ale_python_flake8_options='--ignore E111,E114,E121'

"Airline
"Airline is the statusbar framework
"Set a matching colorscheme
"Do not use powerline
"Mode, Ale errors, Ale warnings, file name
"tagbar, syntax, percent
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#tabline#buffer_min_count=2
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#default#layout=[
      \ [ 'a', 'error', 'warning', 'b', 'c' ],
      \ [ 'x', 'z' ]
      \ ]
let g:airline#extensions#hunks#enabled=0
let g:airline_section_z=airline#section#create(['%3p%%'])
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#ale#error_symbol='☭ '
let g:airline#extensions#ale#warning_symbol='☨⚕'
let g:airline#extensions#tagbar#enabled=1
let g:airline_symbols.readonly=''

"FZF
"FZF is the fuzzy finder
map ff :FZF <CR>
let g:fzf_action={
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_layout={ 'down': '~30%' }

"Nerdtree
"Ignore object and tmp ~files
nnoremap rr :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeIgnore=['\.o$', '\~$']

"Grepper
"Install ag because it is good
nnoremap <C-g> :Grepper<CR>

"Enable project specific stuff
"This is provided using a local .nvimrc
"Secure avoid loading dangerous stuff
set exrc
set secure
