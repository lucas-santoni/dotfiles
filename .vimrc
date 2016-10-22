"Manage plugins with Vundle
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Load all plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ervandew/supertab'
Plugin 'raimondi/delimitmate'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/goyo.vim'

"End loading plugins
call vundle#end()

"256 colors
set t_Co=256

"Syntax processing
syntax on

"Syntaxt check with Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 1

"vim-markdown configuration
let g:vim_markdown_folding_disabled = 1

"Correct indentation
filetype plugin indent on

"Invisibles
set listchars=tab:..,eol:¬,trail:~
set list
hi NonText ctermfg=241 guifg=gray
hi SpecialKey ctermfg=241 guifg=gray

"Correct indentation (for Epitech currently)
set softtabstop=2
set shiftwidth=2

"But still insert tab
inoremap <F2> <C-V><Tab>

"Show line numbers
set number

"Set line cursor
set cursorline
hi cursorline cterm=none ctermbg=238
hi cursorlinenr cterm=none ctermbg=238
hi SignColumn cterm=none ctermbg=238

"Wildmenu
set wildmenu

"Avoid useless redraw
set lazyredraw

"Show matching chars
set showmatch
hi MatchParen ctermfg=red

"Better search
set incsearch
set hlsearch

"Powerline
let powerlineLocalPath = $HOME .
      \"/.local/lib/python3.5/site-packages/powerline/bindings/vim"
if isdirectory(powerlineLocalPath)
  set rtp+=~/.local/lib/python3.5/site-packages/powerline/bindings/vim
else
  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup
endif
set laststatus=2

"More than 80 chars is bad
if exists('+colorcolumn')
  hi colorcolumn ctermbg=238
  set colorcolumn=80
else
  match OverLength /\%81v.\+/
endif

"Keyboard shortcuts
nnoremap <F6> :GundoToggle<CR>
nnoremap <F5> :NERDTreeTabsToggle<CR>
