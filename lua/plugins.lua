return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'sainnhe/sonokai'
  use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpate'
      }
  use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
      }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
      }
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
  }
  use {
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v2.x',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
      }
      }
  use 'sunjon/shade.nvim'
  use { 'akinsho/bufferline.nvim', tag = 'v3.*',
      requires = 'nvim-tree/nvim-web-devicons',
      }
  use 'andweeb/presence.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
     "folke/twilight.nvim",
     config = function ()
      require("twilight").setup {} 
     end
  }
  use({
     "folke/zen-mode.nvim",
     config = function()
      require("zen-mode").setup {}
     end,
  })
  use({
     "Pocco81/auto-save.nvim",
     config = function()
        require("auto-save").setup {}
     end,
  })
  use 'tpope/vim-endwise'
  use 'simrat39/symbols-outline.nvim'
  use { 'echasnovski/mini.pairs', branch = 'stable' }
end)


