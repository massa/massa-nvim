return function(use)
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd 'colorscheme rose-pine'
    end
  }

  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- LSP Configuration & Plugin
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim' },

      -- Additional lua configuration, makes nvim stuff amazing
      { 'folke/neodev.nvim' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      -- SQL
      { 'nanotee/sqls.nvim' },
    }
  }

  -- use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use {
    'SmiteshP/nvim-navic',
    requires = 'nvim-lualine/lualine.nvim'
  }
  use {
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  use 'nvim-treesitter/playground'
  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'

  use 'folke/zen-mode.nvim'
  use 'github/copilot.vim'

  use 'rmehri01/onenord.nvim'
  use 'wakatime/vim-wakatime'
  use {
    'renerocksai/telekasten.nvim',
    requires = {
      'renerocksai/calendar-vim',
      'nvim-telescope/telescope-media-files.nvim',
    }
  }

  use {
    'kristijanhusak/vim-dadbod-ui',
    cmd = {
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUI',
      'DBUIFindBuffer',
      'DBUIRenameBuffer',
    },
    setup = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
    end,
    requires = {
      {
        'tpope/vim-dadbod',
        opt = true,
      },
      'kristijanhusak/vim-dadbod-completion',
      'pbogut/vim-dadbod-ssh',
    },
    opt = true,
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use {
    'rcarriga/nvim-dap-ui',
    requires = {
      'mfussenegger/nvim-dap',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-telescope/telescope-dap.nvim',
    }
  }

  use 'Shatur/neovim-tasks'
end
