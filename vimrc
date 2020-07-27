" filetype support provides filetype-specific indenting, syntax highlighting,
" omni-completion and other useful settings.
filetype plugin indent on

syntax on

" built-in plugin, `%` to jump to condition branch
runtime macros/matchit.vim

set autoindent
set backspace=indent,eol,start
set hidden  " have more than one unsaved buffer
set incsearch
set ruler  " show position in bottom-right
set wildmenu

call plug#begin('~/.vim/plugged')
  Plug 'sheerun/vim-polyglot'
  Plug 'ludovicchabant/vim-gutentags'
call plug#end()

let g:gutentags_cache_dir = '~/.gutentags_cache'
