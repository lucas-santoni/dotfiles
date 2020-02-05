"Plugins
call plug#begin('~/.vim/plugged')

"Some colorschemes
Plug 'connorholyday/vim-snazzy'
Plug 'jiangmiao/auto-pairs' "Matching characters completions
Plug '/usr/local/opt/fzf' "FZF Brew installation path
Plug 'junegunn/fzf.vim' "Actual FZF Vim plugin
Plug 'tpope/vim-commentary' "Motions to comments
Plug 'sheerun/vim-polyglot' "Just in case
Plug 'blockloop/vim-swigjs' "Not in Polyglot?
Plug 'itchyny/lightline.vim' "Statusline
Plug 'edkolev/tmuxline.vim' "Generate TMUX lines

call plug#end()

"Remap leader
let mapleader=" "

"netrw
let g:netrw_banner=0
nnoremap <Leader>e :Explore<CR>

"terminal
nnoremap <Leader>t :terminal<CR>
tnoremap <Esc> <C-\><C-n>

"Misspelled words
set spellfile=~/.vim/spell/en.utf-8.add
nnoremap )s ]s
nnoremap (s [s

"Filetype
filetype plugin indent on

"Sneak
let g:sneak#s_next=1
let g:sneak#use_ic_scs=1
hi link Sneak None

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

"Remap escape
inoremap jj <Esc>

"Buffers integration
set hidden
set history=500
nnoremap <silent> <C-H> :bprev<CR>
nnoremap <silent> <C-L> :bnext<CR>

"Identation
syntax enable
set nosmartindent
set cindent
set shiftwidth=2
set list
set expandtab
let &listchars="tab:\u2192 ,extends:>,precedes:<,trail:\u00b7"

"Colorscheme
set termguicolors
colorscheme snazzy

"Color fixes
" hi Normal guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE guifg=#444444

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
let g:vim_markdown_frontmatter=1

"FZF
nnoremap <silent> <Leader>f :FZF <CR>
nnoremap <silent> <Leader><Leader> :Buffers<CR>
let g:fzf_layout={ 'window': '10new' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Normal', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Hiding fzf statusline is nicer for light theme
autocmd! FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"FZF as a grepper also
nnoremap <silent> <Leader>h :Ag<CR>

"Cleaner UI
set shortmess+=WI
set noshowmode

"Enable project specific stuff
set exrc
set secure

"Statusline
let g:lightline={
      \ 'colorscheme'  : 'snazzy',
      \ 'component'    : {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator'    : { 'left': "\uE0B8", 'right': "\uE0BA" },
      \ 'subseparator' : { 'left': "\uE0B9", 'right': "\uE0BB" }
      \ }

"Tmuxline is generated from here
let g:tmuxline_preset={
    \'a'       : '#S',
    \'win'     : '#W',
    \'cwin'    : '#W',
    \'x'       : '%d-%m-%y',
    \'y'       : '%H:%M',
    \'z'       : "#H",
    \'options' : { 'status-justify' : 'left' }}

let g:tmuxline_separators={
    \ 'left'      : '\uE0B8',
    \ 'left_alt'  : '\uE0B9',
    \ 'right'     : '\uE0BA',
    \ 'right_alt' : '\eE0BB',
    \ 'space'     : ' '}
