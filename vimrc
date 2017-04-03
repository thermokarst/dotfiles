call plug#begin()
  " Color/theme integration
  Plug 'chriskempson/base16-vim'
  " Time-tracking
  Plug 'wakatime/vim-wakatime'
  " Python Flake8 support
  Plug 'nvie/vim-flake8'
  " Status bar
  Plug 'vim-airline/vim-airline'
  " Color/theme integration
  Plug 'vim-airline/vim-airline-themes'
  " Git integration
  Plug 'airblade/vim-gitgutter'
  " Whitespace handling
  Plug 'ntpeters/vim-better-whitespace'
  " Mustache/handlebars support
  Plug 'mustache/vim-mustache-handlebars'
call plug#end()

set t_Co=256

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
set background=dark

let g:airline_theme='base16'

" default encoding
set encoding=utf-8

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" turn on syntax highlighting
syntax enable
syntax on

" turn on line numbering
set number

" make backspace behave as expected
set backspace=indent,eol,start

" set up whitespace substitutions
set list
set listchars=tab:▸\ ,extends:>,precedes:<,trail:~

" highlight current line
set cursorline

" show matching ({[]})
set showmatch

" show a vertical bar on right side of editor
set colorcolumn=80

highlight LineNr ctermfg=DarkGrey

" number of visual spaces per tab
set tabstop=4

" number of spaces in tab when editing
set softtabstop=4

" tabs are spaces
set expandtab

" self-explanatory
set autoindent
"
" show airline all the time
set laststatus=2

" set up central backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" change the mapleader from \ to ,
let mapleader=" "

" netrw config
let g:netrw_liststyle=0         " thin (change to 3 for tree)
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically
let g:netrw_list_hide='\.git,\.idea,.*\.swp$,.*\.pyc$,__pycache__,\.DS_Store'

" http://ivanbrennan.nyc/blog/2014/01/16/rigging-vims-netrw/
fun! VexOpen(dir)
    let g:netrw_browse_split=4
    let vex_width=25
    execute "Vexplore " . a:dir
    let t:vex_buf_nr = bufnr("%")
    wincmd H
    call VexSize(vex_width)
endf

fun! VexClose()
    let cur_win_nr = winnr()
    let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )
    1wincmd w
    close
    unlet t:vex_buf_nr
    execute (target_nr - 1) . "wincmd w"
    call NormalizeWidths()
endf

fun! VexSize(vex_width)
    execute "vertical resize" . a:vex_width
    set winfixwidth
    call NormalizeWidths()
endf

fun! NormalizeWidths()
    let eadir_pref = &eadirection
    set eadirection=hor
    set equalalways! equalalways!
    let &eadirection = eadir_pref
endf

fun! VexToggle(dir)
    if exists("t:vex_buf_nr")
        call VexClose()
    else
        call VexOpen(a:dir)
    endif
endf

noremap <Leader><Tab> :call VexToggle(getcwd())<CR>
noremap <Leader>` :call VexToggle("")<CR>

augroup NetrwGroup
    autocmd! BufEnter * call NormalizeWidths()
augroup END

" PEP8 formatting
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Everybody else
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Stop the YAML madness
autocmd FileType yaml setl indentkeys-=<:>

" show open buffers in airline
let g:airline#extensions#tabline#enabled = 1

" show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" cycle to next buffer
nmap <leader>l :bnext<CR>

" cycle to previous buffer
nmap <leader>h :bprevious<CR>
