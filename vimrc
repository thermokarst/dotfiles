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
set wildmode=full
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
set updatetime=200
set history=250
set hlsearch

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

xnoremap . :normal .<CR>

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'chriskempson/base16-vim'
  Plug 'mattn/calendar-vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-vinegar'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vimwiki/vimwiki'
  Plug 'wakatime/vim-wakatime'
call plug#end()

" for Plug 'chriskempson/base16-vim'
let base16colorspace=256
source ~/.vimrc_background

" for Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" for Plug 'vim-airline/vim-airline'
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" for Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16'

" vimwiki
let notes_wiki = {}
let notes_wiki.path = '/Users/matthew/projects/personal/notes'
let notes_wiki.syntax = 'markdown'
let notes_wiki.ext = '.md'

let weeklies_wiki = {}
let weeklies_wiki.path = '/Users/matthew/projects/personal/notes/weeklies'
let weeklies_wiki.syntax = 'markdown'
let weeklies_wiki.ext = '.md'

let pitches_wiki = {}
let pitches_wiki.path = '/Users/matthew/projects/personal/notes/pitches'
let pitches_wiki.syntax = 'markdown'
let pitches_wiki.ext = '.md'

let g:vimwiki_list = [notes_wiki, weeklies_wiki, pitches_wiki]
