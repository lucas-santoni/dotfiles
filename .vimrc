"256 colors
set t_Co=256

"Manage plugins
execute pathogen#infect()

"Syntax processing
syntax on

"Correct indentation
filetype plugin indent on

"Solarized dark color scheme
"set background=dark
"colorscheme solarized

"Use spaces instead of tabs
set tabstop=4
set softtabstop=4
set expandtab

"Show line numbers
set number

"Set line cursor
set cursorline
hi cursorline cterm=none
hi cursorlinenr ctermfg=red

"Wildmenu
set wildmenu

"Avoid useless redraw
set lazyredraw

"Show matching chars
set showmatch

"Better search
set incsearch
set hlsearch

"Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
