
-- Lazy Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--Lazy Plugins
local plugins = {
   {
      "sainnhe/sonokai",
      lazy = false,
      priority = 1000,
      config = function()
         vim.cmd([[let g:sonokai_style = 'shusia']])
         vim.cmd([[let g:sonokai_better_performance = 1]])
         vim.cmd([[colorscheme sonokai]])
      end,
   },

   {
      "nvim-lualine/lualine.nvim",
      lazy = false,
      priority = 999,
      dependencies = {
         'nvim-tree/nvim-web-devicons',
      },
      config = function()
         require('lualine').setup({
            options = {
               theme = 'sonokai',
            },
         })
      end
   },

   {
      "nvim-tree/nvim-tree.lua",
      keys = {
         {"<leader>e", ":NvimTreeToggle<CR>", desc = "NvimTree"}
      },
      config = function()
         require("nvim-tree").setup()
      end,
   },

   {
      "neovim/nvim-lspconfig",
      config = function()
         require("lspconfig")
      end
   },

   {
      "williamboman/mason.nvim",
      lazy = false,
      priority = 998,
      build = ":MasonUpdate",
      config = function()
         require("mason").setup()
      end
   },

   {
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
      priority = 996,
      config = function()
         require('plugin_configs/masonconfig')
      end,
   },

   {
      "hrsh7th/nvim-cmp",
      lazy = false,
      priority = 997,
      dependencies = {
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-cmdline",
         "L3MON4D3/LuaSnip",
         "saadparwaiz1/cmp_luasnip",
         "onsails/lspkind.nvim",
      },
      config = function()
         require("plugin_configs/nvim-cmp")
      end
   },

   {
      "simrat39/symbols-outline.nvim",
      config = function()
         require("symbols-outline").setup({
            auto_close = true,
         })
      end,
      keys = {
         { "<leader>o", ":SymbolsOutline<CR>", desc = "Outline" },
      },
   },

   "j-hui/fidget.nvim",

   {
      "folke/trouble.nvim",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      keys = {
         { "<leader>ti", ":TroubleToggle document_diagnostics<cr>", desc = "TroubleDiagnostics" },
      },
   },

   {
      "nvim-treesitter/nvim-treesitter",
      config = function()
         require("nvim-treesitter.configs").setup {
            auto_install = true,
         }
         vim.cmd([[:TSEnable highlight]])
      end,
   },

   {
      "nvim-telescope/telescope.nvim",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "BurntSushi/ripgrep",
      },
      keys = {
         { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>", desc = "FindFiles" },
         { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<cr>", desc = "FindBuffers" },
         { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({}))<cr>", desc = "Grep" },
      },
   },

   {
      "windwp/nvim-autopairs",
      config = function()
         require("nvim-autopairs").setup({
            disable_filetype = { "TelescopePrompt", "spectre_panel" }
         })
      end,
   },

   "Pocco81/auto-save.nvim",

   "kylechui/nvim-surround",

   {
      "ThePrimeagen/harpoon",
      keys = {
         { "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "ToggleHarpoon" },
         { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "AddHarpoon" },
         { "<leader>ht", "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", desc = "HarpoonTerminal" },
      }
   }
}

require("lazy").setup(plugins)
