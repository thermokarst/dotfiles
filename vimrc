" filetype support provides filetype-specific indenting, syntax highlighting,
" omni-completion and other useful settings.
filetype plugin indent on

syntax on

" built-in plugin, `%` to jump to condition branch
runtime macros/matchit.vim

let mapleader=" "

set autoindent
set backspace=indent,eol,start
set hidden
set incsearch
set ruler
set wildmenu
set number
set list
set listchars=tab:▸\ ,extends:>,precedes:<,trail:~
set cursorline
set colorcolumn=80
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set expandtab

nmap <leader>j :bnext<CR>
nmap <leader>k :bprevious<CR>

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'chriskempson/base16-vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'wakatime/vim-wakatime'
call plug#end()

" for Plug 'chriskempson/base16-vim'
let base16colorspace=256
source ~/.vimrc_background

" for Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '~/.gutentags_cache'

" for Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" for Plug 'vim-airline/vim-airline'
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" for Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16'
