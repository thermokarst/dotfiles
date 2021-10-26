local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
end

return require('packer').startup(function()
  -----------------------------------------------------------------------------
  use 'wbthomason/packer.nvim'

  -----------------------------------------------------------------------------
  use 'wakatime/vim-wakatime'

  -----------------------------------------------------------------------------
  use {
    'neovim/nvim-lspconfig',
    config = function()
      lspconfig = require('lspconfig')

      lspconfig.pyright.setup({
        settings = {
          python = {
            venvPath = "~/.conda/envs",
            analysis = {
              useLibraryCodeForTypes = true,
            }
          }
        }
      })

      lspconfig.rust_analyzer.setup({})
      end,
  }

  -----------------------------------------------------------------------------
  use {
    'chriskempson/base16-vim',
    config = function()
      vim.cmd('source ~/.vimrc_background')
      vim.g.base16colorspace = 256
    end,
  }

  -----------------------------------------------------------------------------
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
    },
    config = function()
      vim.api.nvim_set_keymap('n', '-', '<cmd>Telescope find_files<CR>', { noremap = true })
    end,
  }

  -----------------------------------------------------------------------------
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -----------------------------------------------------------------------------
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-vsnip', after = "nvim-cmp" },
      { 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" },
      { 'hrsh7th/cmp-buffer', after = "nvim-cmp" },
      { 'hrsh7th/vim-vsnip', after = "nvim-cmp" },
    },
    config = function()
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
    end,
  }

  -----------------------------------------------------------------------------
  use {
    'lewis6991/gitsigns.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('gitsigns').setup({})
    end,
  }

  -----------------------------------------------------------------------------
  use {
    'simrat39/rust-tools.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      require('rust-tools').setup({})
    end,
  }

  -----------------------------------------------------------------------------
  use {
    'GustavoKatel/sidebar.nvim',
    requires = { { 'GustavoKatel/todo-comments.nvim' } },
    config = function()
      require('sidebar-nvim').setup({
        side = 'right',
        sections = { 'datetime', 'git-status', 'lsp-diagnostics', 'todos' }
      })
    end,
  }

  -----------------------------------------------------------------------------
  use {
    'famiu/feline.nvim',
    config = function()
      require('feline').setup({ preset = 'noicon' })
    end,
  }

  -----------------------------------------------------------------------------
  if packer_bootstrap then
    require('packer').sync()
  end
end)
