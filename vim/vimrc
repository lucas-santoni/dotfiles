"Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'plasticboy/vim-markdown'
Plug 'ervandew/supertab'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

"Avoid useless redraw
set lazyredraw

"Syntax processing
syntax on

"Invisibles
set listchars=tab:..,eol:¬,trail:~
set list
hi NonText ctermfg=241 ctermbg=none
hi SpecialKey ctermfg=241 ctermbg=none

"Snippets
let g:UltiSnipsSnippetsDir = "~/.vim/my_snippets"
let g:UltiSnipsSnippetDirectories=["my_snippets", "UltiSnips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

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

"Line numbers
set number
set relativenumber
hi linenr ctermbg=none

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'
set laststatus=2
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#close_symbol = ':p'
let g:airline#extensions#tabline#show_buffers = 0

"Cursorline
set cursorline
hi cursorlinenr ctermbg=0

"Smooth scrolling
set scrolloff=2

"Identation
filetype plugin indent on
set softtabstop=2
set shiftwidth=2

"But still insert tab
inoremap <F2> <C-V><Tab>

"Show matching chars
set showmatch
hi MatchParen ctermfg=5 ctermbg=none

"More than 80 chars is bad
hi colorcolumn ctermbg=0
set colorcolumn=80
set synmaxcol=150

"Colorscheme
colo seoul256
set background=dark

"Autocomplation color
highlight Pmenu ctermfg=252 ctermbg=0
highlight PmenuSel ctermfg=3 ctermbg=0

"FZF
map <F3> :FZF <CR>
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~30%' }

"Nerdtree
nnoremap <F5> :NERDTreeTabsToggle<CR>
