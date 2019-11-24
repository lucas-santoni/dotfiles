"Plugins
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim' "Colors
Plug 'raimondi/delimitmate' "Matching characters completions
Plug 'scrooloose/nerdtree' "File explorer (built in Vim?)
Plug 'danro/rename.vim' "The :Rename command
Plug '/usr/local/opt/fzf' "Brew path
Plug 'junegunn/fzf.vim' "Actual Vim plugin
Plug 'tpope/vim-commentary' "Motions to comments
Plug 'sheerun/vim-polyglot' "Just in case
Plug 'blockloop/vim-swigjs' "Not in Polyglot?
Plug 'junegunn/goyo.vim' "The :Goyo command
Plug 'justinmk/vim-sneak'

call plug#end()

"Colors
" set termguicolors
let base16colorspace=256
set background=dark

"Sneak
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
hi link Sneak None

"Colorscheme
colorscheme base16-default-dark

"Remap leader
let mapleader=" "

"Splits
set splitright
set splitbelow

"Quick splits
nnoremap <silent> <Leader>s :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>

"Search
set incsearch
set hlsearch
set ignorecase
nnoremap <silent> qq :nohl<CR>

"Avoid useless redraw
set lazyredraw

"Time waited for key press(es) to complete
set ttimeout
set ttimeoutlen=50

"Remap escape
inoremap jj <Esc>

"Syntax processing
syntax on

"Buffers integration
set hidden
set history=500
nnoremap <silent> <C-H> :bprev<CR>
nnoremap <silent> <C-L> :bnext<CR>

"Identation
filetype plugin indent on
syntax enable
set nosmartindent
set cindent
set shiftwidth=2
set list
set expandtab
set listchars=tab:..,trail:~

"But still insert tab
inoremap hh <C-V><Tab>

"Just in case
inoremap ww <
inoremap WW >

"Show matching chars
"Like () or {}
set showmatch

"80 chars ruller
nnoremap <silent> <Leader>r :let &cc = &cc == '' ? '79' : ''<CR>

"Markdown syntax
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

"FZF
noremap <silent> <Leader>f :FZF <CR>

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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
  \ 'header':  ['fg', 'Comment'] }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=2 noshowmode noruler

"As a grepper also
nnoremap <silent> <Leader>h :Ag<CR>

"Nerdtree
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeIgnore=['\.o$', '\.pyc$', '__pycache__']
let NERDTreeStatusline=" "

"Goyo configuration
let g:goyo_width=81
nnoremap <silent> <Leader>g :Goyo<CR>
autocmd! User GoyoLeave nested 

"More goyo shit
function! s:goyo_enter()
  "Prepare the goyo_leave
  let b:quitting=0
  let b:quitting_bang=0
  autocmd QuitPre <buffer> let b:quitting=1
  cabbrev <buffer> q! let b:quitting_bang=1 <bar> q!
endfunction

function! s:goyo_leave()
  "Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif

  "This must be repeated
  hi VertSplit ctermbg=None ctermfg=233
  hi clear signcolumn

  hi StatusLine ctermfg=gray ctermbg=none
  hi StatusLineNC ctermbg=none
endfunction

"Place Goyo hooks
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

"Cleaner vertical split
hi VertSplit ctermbg=None ctermfg=233

"Cleaner UI
set shortmess+=WI
set noshowmode

"Use the signcolumn as a little indent
set signcolumn=yes
hi clear signcolumn

"Enable project specific stuff
set exrc
set secure

"Statusline
hi StatusLine ctermfg=245 ctermbg=233
hi StatusLineNC ctermfg=233 ctermbg=233
set statusline=%=%m\ %f\ %4l/%L
