" /etc/vimrc

set nocompatible

" Colorscheme that looks good across languages
colorscheme delek
syntax on

" Text editing
set smartindent
set autoindent
filetype plugin indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4

set nowrap
set number

" Scrolling options
set sidescroll=1
set sidescrolloff=30
set scrolloff=3

" Highlight search matches in blue, matched brackets/parentheses in white
set hlsearch
set incsearch
highlight Search cterm=none ctermfg=black ctermbg=gray
highlight MatchParen cterm=none ctermfg=magenta ctermbg=none

" Pretty visible and navigable characters for :set list
set listchars=tab:\|·,nbsp:~,trail:·,precedes:<,extends:>

" Change title of window to indicate current file
autocmd BufEnter * let &titlestring = "[" . hostname() . "] " . "vim: " . expand("%:p")
if &term == "screen"
    set t_ts=^[k
    set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
    set title
endif

" Jump to last known cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Misc
set nobackup
set backspace=indent,eol,start
set history=50
