" Stick with vimscript at the moment, but prefer lua for config

lua << EOF
local set = vim.opt

set.number = true
set.autoindent = true
set.colorcolumn = {80, 100, 120}
set.cursorline = true
set.expandtab = true
set.backup = true
set.backupdir = { '~/.vim-tmp', '~/.tmp', '~/tmp', '/var/tmp', '/tmp' }
set.backupskip = { '/tmp/*', '/private/tmp/*' }
set.directory = { '~/.vim-tmp', '~/.tmp', '~/tmp', '/var/tmp', '/tmp' }
set.writebackup = true
set.list = true
set.listchars = { trail = '~', tab = '>=' }
set.mouse = 'a'
set.completeopt = { 'menu', 'menuone', 'noselect' }
set.termguicolors = true

require('packer').startup(function()
  -----------------------------------------------------------------------------
  use 'wbthomason/packer.nvim'

  -----------------------------------------------------------------------------
  use 'wakatime/vim-wakatime'

  -----------------------------------------------------------------------------
  use 'neovim/nvim-lspconfig'
  require('lspconfig').pyright.setup({
    settings = {
      python = {
        venvPath = "~/.conda/envs",
        analysis = {
          useLibraryCodeForTypes = true,
        }
      }
    }
  })
  require('lspconfig').rust_analyzer.setup({})

  -----------------------------------------------------------------------------
  use 'chriskempson/base16-vim'
  vim.cmd('source ~/.vimrc_background')
  vim.g.base16colorspace = 256

  -----------------------------------------------------------------------------
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' }
    }
  }
  vim.api.nvim_set_keymap('n', '-', '<cmd>Telescope find_files<CR>', { noremap = true })

  -----------------------------------------------------------------------------
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -----------------------------------------------------------------------------
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  local cmp = require('cmp')
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
    }
  })

  -----------------------------------------------------------------------------
  use {
    'lewis6991/gitsigns.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  require('gitsigns').setup({})

  -----------------------------------------------------------------------------
  use {
    'simrat39/rust-tools.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' }
    }
  }
  require('rust-tools').setup({})

  -----------------------------------------------------------------------------
  use {
    'GustavoKatel/sidebar.nvim',
     requires = { { 'GustavoKatel/todo-comments.nvim' } }
  }
  require('sidebar-nvim').setup({
    side = 'right',
    sections = { 'datetime', 'git-status', 'lsp-diagnostics', 'todos' }
  })

  -----------------------------------------------------------------------------
  use 'famiu/feline.nvim'
  require('feline').setup({ preset = 'noicon' })

end)
EOF
