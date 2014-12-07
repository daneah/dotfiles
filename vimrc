set mouse=a
set nocompatible
execute pathogen#infect()

set t_Co=256
colorscheme solarized
set background=dark

syntax on

set autoindent
set smartindent

filetype plugin on
filetype plugin indent on

set number

set nowrap

nmap <Leader>p :set paste!<CR>
nmap <Leader>l :setlocal number!<CR>

set incsearch
set hlsearch
set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set expandtab

nmap ; :

nmap <Up> <nop>
nmap <Down> <nop>
nmap <Left> <nop>
nmap <Right> <nop>

set sidescroll=1
set sidescrolloff=30
set scrolloff=3

set backspace=indent,eol,start
set listchars=tab:\|·,nbsp:~,trail:·,precedes:<,extends:>

set ruler

set nobackup
set noswapfile

nmap <space> /

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

set laststatus=2
