"This file is a Neovim configuration file
"It may work on Vim > 8, who knows
"It is a quite heavy configuration

"Plugins
"Managed via vim-plug
"Use :PlugInstall / :PlugClean
"Use :PlugUpdate / :PlugUpgrade
call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'danro/rename.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'
Plug 'mhartington/nvim-typescript'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'digitaltoad/vim-pug'
Plug 'dag/vim-fish'
Plug 'neovimhaskell/haskell-vim'
call plug#end()

"Remap leader
let mapleader=" "

"Change shell (env variable)
"At least for FZF
let $SHELL = '/bin/bash'

"Colors
"True colors only for compatible terminal emulators
"Dark background (may affet color scheme)
"Enable italics (may require patched terminfo)
"Harder contrast
"Set a colorscheme
if has("termguicolors")
  set termguicolors
endif
set background=dark
colorscheme base16-tomorrow-night

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
"set cursorline

"Search
"Search as you type
"Highlight results
"Ignore case
"Use qq to remove the highlight
set incsearch
set hlsearch
set ignorecase
nnoremap qq :nohl<CR>

"Avoid useless redraw
set lazyredraw

"Ignore some extensions in wildmenu
set wildignore+=*.so,*.o,*.swp

"Remap escape
"jj is always near
inoremap jj <Esc>

"Remap page moves
"Avoid scrolling one line by one line
noremap <C-J> }
noremap <C-K> {

"Syntax processing
syntax on

"Buffers integration
"Buffers can be hidden but still alive
"Limit buffer history for speed
"Switch buffers by using ctrl+h/l
set hidden
set history=500
nnoremap <C-H> :bprev<CR>
nnoremap <C-L> :bnext<CR>

"Identation
filetype plugin indent on
syntax enable
set nosmartindent
set cindent

"2 spaces indentations if not at Epitech
"Tabs if at Epitech, but displayed as two columns
set shiftwidth=2
set list
if !empty($EPITECH_PATH) && getcwd() =~ $EPITECH_PATH
  set noexpandtab
  set tabstop=2
  set softtabstop=2
  set listchars=tab:\ \ ,trail:~
  set cino+=g0
else
  set expandtab
  set listchars=tab:..,trail:~
endif

"But still insert tab
inoremap hh <C-V><Tab>

"Just in case I can not find
"these on the keyboard
inoremap ww <
inoremap WW >

" Remap write
nnoremap s :w<CR>

"Show matching chars
"Like () or {}
set showmatch

"More than 80 chars is bad
"Show a ruller on toggle
nnoremap cc :let &cc = &cc == '' ? '79' : ''<CR>

"Signcolumns
"Always show it
"Avoid any unwanted background
set signcolumn=yes
hi clear SignColumn

"Vertical split color
hi VertSplit guibg=bg

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
"set number
"set relativenumber

"Autocompletion
"Completion with ncm
"Trigger with C-p
"Use tab and S-tab to move between the choices
"Use enter to expand a snippet (see next block)
imap <C-p> <Plug>(cm_force_refresh)
inoremap <expr> <Tab> (pumvisible() ? "\<C-n>" : "\<Tab>")
inoremap <expr> <S-Tab> (pumvisible() ? "\<C-p>" : "\<S-Tab>")
let g:cm_auto_popup=1
set shortmess+=c
set completeopt=menu,menuone,noinsert
set pumheight=5

"Snippets
"UltiSnips is the snippet framework
"Tons of default snippets provided by vim-snippets
"Disable the traditional expand key
"Use a function instead, triggered on enter when completion window is open
"I do so because I use the enter key as my expand key
"and this prevent a bug which makes the key useless otherwise
"Not necessary to remap jump forward/backward as it is
"done on the autocompletion framework
"let g:UltiSnipsJumpForwardTrigger=\"<tab>"
"let g:UltiSnipsJumpBackwardTrigger=\"<S-tab>"
"TODO: Disable default snippets for some languages
let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsSnippetDirectories=[$HOME . '/.snippets']
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

"Quickfix colors
"Hide this ugly yellow
hi QuickFixLine gui=None guibg=None guifg=None

"Ale colors
"Ale is the syntax processing framework
"Intrusive colors
hi clear ALEErrorSign
hi clear ALEWarningSign
hi ALEErrorSign guifg=Red
hi ALEWarningSign guifg=Orange

"Ale signs
let g:ale_set_highlights=0
let g:ale_sign_error='! '
let g:ale_sign_warning='! '

"Linters to use
"If nothing is precised, the default linters are used
let g:ale_linters={
      \'javascript': ['eslint'],
      \'typescript': ['tslint', 'tsserver'],
      \'c': ['clang'],
      \'cpp': ['clang'],
      \}

"Ale C/C++ linting
"Use basic flags
"More specific flags should be provided on a project basis
"by using a local .nvimrc at projet root re-exporting these variables
let g:ale_c_clang_options='-Wall -Wextra -Wshadow --std=gnu11 -O0'
let g:ale_cpp_clang_options='-Wall -Wextra -Wshadow --std=gnu++14 -O0'

"Ale Python linting
"Override python.vim defaults
"Ignored rules are for 2 spaces indenting
let g:python_recommended_style=0
let g:ale_python_flake8_options='--ignore E111,E114,E121,E128'

"Airline
"Airline is the statusbar framework
"Set a matching colorscheme
"Do not use powerline
"Disable Git tracking
"Mode, Git, Ale errors, Ale warnings, filename
"syntax, file position
let g:airline_theme='base16_grayscale'
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#tabline#buffer_min_count=2
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#default#layout=[
      \ [ 'a', 'error', 'warning', 'b', 'c' ],
      \ [ 'x', 'z' ]
      \ ]
let g:airline#extensions#hunks#enabled=0
let g:airline_section_z=airline#section#create(['%l/%L'])
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#ale#error_symbol='! '
let g:airline#extensions#ale#warning_symbol='! '
let g:airline#extensions#tagbar#enabled=0
let g:airline_symbols.readonly='🔒'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''

"FZF
"FZF is the fuzzy finder
"Define some shortcuts
"Choose a layout
"Get the good colors
noremap ff :FZF <CR>
let g:fzf_action={
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_layout={ 'down': '~30%' }
let g:fzf_colors={
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Normal', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }

"And also the grepper
"Install ag because it is good
nnoremap <Leader>h :Ag<CR>

"And also the buffer switcher
noremap <Leader>j :Buffers <CR>

"And also the commit explorer
noremap <Leader>k :Commits <CR>
noremap <Leader>K :BCommits <CR>

"Nerdtree
"Ignore object and tmp ~files
nnoremap rr :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeIgnore=['\.o$', '\~$']

"Enable project specific stuff
"This is provided using a local .nvimrc
"Secure avoid loading dangerous stuff
set exrc
set secure
