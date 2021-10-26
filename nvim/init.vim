" Stick with vimscript file at the moment, but prefer lua for config

" TODO: fix this vimscript fallback
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

lua << EOF
local set = vim.opt

set.number = true
set.autoindent = true
set.colorcolumn = {80, 100, 120}
set.cursorline = true
set.expandtab = true
set.backup = true

set.writebackup = true
set.list = true
set.listchars = { trail = '~', tab = '>=' }
set.mouse = 'a'
set.completeopt = { 'menu', 'menuone', 'noselect' }
set.termguicolors = true

require('plugins')
EOF
