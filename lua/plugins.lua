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
   -- {
   --    "sainnhe/sonokai",
   --    lazy = false,
   --    priority = 1000,
   --    config = function()
   --       vim.cmd([[let g:sonokai_style = 'shusia']])
   --       vim.cmd([[let g:sonokai_better_performance = 1]])
   --       vim.cmd([[colorscheme sonokai]])
   --    end,
   -- },
   
   -- {
   --    "sainnhe/everforest",
   --    lazy = false,
   --    priority = 1000,
   --    config = function()
   --       vim.cmd([[set background=dark]])
   --       vim.cmd([[set termguicolors]])
   --       vim.cmd([[let g:everforest_better_performance = 1]])
   --       vim.cmd([[colorscheme everforest]])
   --    end,
   -- },
   
   {
       "rebelot/kanagawa.nvim",
       lazy = false,
       priority = 999,
       config = function()
          vim.cmd([[set background=dark]])
          vim.cmd([[set termguicolors]])
          vim.cmd([[colorscheme kanagawa]])
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
               theme = 'everforest',
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
         require("plugin_configs/lspconfig")
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
      "j-hui/fidget.nvim",
      config = function()
         require("fidget").setup{}
      end,
   },

   {
      "folke/trouble.nvim",
      version = "3.6.0",
      opts = {},
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      cmd = "Trouble",
      keys = {
         { "<leader>ti", "<cmd>Trouble diagnostics toggle<CR>", desc = "Toggle Trouble Diagnostics" },
         { "<leader>to", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "Toggle Trouble LSP Tools"}
      },
   },

   {
      "nvim-treesitter/nvim-treesitter",
      config = function()
         require("nvim-treesitter.install").compilers = { "clang" }
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
   },

   {
      "iamcco/markdown-preview.nvim",
      build = function()
         vim.fn["mkdp#util#install"]()
      end,
      init = function()
         vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = "markdown",
   },

   {
      "cljoly/telescope-repo.nvim",
      dependencies = {
         "nvim-telescope/telescope.nvim",
      },
      config = function()
         require("telescope").load_extension"repo"
      end,
      keys = {
         { "<leader>fr", "<cmd>lua require('telescope').extensions.repo.list{}<CR>", desc = "TelescopeRepo" },
      },
   },

   {
      "winston0410/range-highlight.nvim",
      dependencies = {
         "winston0410/cmd-parser.nvim",
      },
      config = function()
         require("range-highlight").setup {}
      end,
   },

   {
      "max397574/colortils.nvim",
      config = function()
         require("colortils").setup()
      end,
   },

   {
      "akinsho/bufferline.nvim",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      config = function()
         require("bufferline").setup{}
      end
   },

   {
      "RRethy/vim-illuminate",
      config = function()
         require("illuminate")
      end
   },

   {
      "jbyuki/nabla.nvim",
      keys = {
         { "<leader>p", "<cmd>lua require('nabla').popup()<CR>", desc = "EnableNabla" }
      }
   },

   {
      "AckslD/nvim-FeMaco.lua",
      config = function()
         require("femaco").setup({})
      end,
      ft = "markdown",
   },

   {
      "lewis6991/gitsigns.nvim",
      config = function()
         require("gitsigns").setup()
      end
   },

   "lukas-reineke/indent-blankline.nvim",

   "Eandrju/cellular-automaton.nvim",

   "shortcuts/no-neck-pain.nvim",

   "andweeb/presence.nvim",

   {
      "ggandor/leap.nvim",
      dependencies = {
         "tpope/vim-repeat",
      },
      config = function()
         require("leap").add_default_mappings()
      end,
   },

   {
      "stevearc/dressing.nvim",
      opts = {},
   },

   {
      "mfussenegger/nvim-jdtls",
      ft = "java",
      config = function()
         require('jdtls').start_or_attach({
            cmd = {'C:\\Users\\jackp\\AppData\\Local\\nvim-data\\mason\\bin\\jdtls.cmd'},
            root_dir = vim.fn.getcwd(),
         })
      end
   },

   {
      "jinh0/eyeliner.nvim",
      config = function()
         require("eyeliner").setup({
            highlight_on_key = true,
            dim = true,
         })
      end
   },

   "seandewar/nvimesweeper",
   
   {
      "max397574/better-escape.nvim",
      config = function()
         require("better_escape").setup {
            vim.o.timeoutlen,
            default_mappings = true,
            mappings = {
               i = {
                  j = {
                     k = "<Esc>",
                  },
               },
            },
         }
      end
   },

   {
      "numToStr/Comment.nvim",
      config = function()
         require("Comment").setup()
      end,
      lazy = false
   },

   {
      "kevinhwang91/nvim-ufo",
      dependencies = {
         "kevinhwang91/promise-async",
      },
      config = function()
         vim.o.foldcolumn = '1'
         vim.o.foldlevel = 99
         vim.o.foldlevelstart = 99
         vim.o.foldenable = true
         require("ufo").setup()
      end,
   },

   {
      "stevearc/oil.nvim",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      config = function()
         require("oil").setup()
      end,
      keys = {
         { "-", "<CMD>Oil<CR>", desc = "Open parent directory"},
      }
   },

   {
      "nacro90/numb.nvim",
      config = function()
         require("numb").setup()
      end,
   },

   {
      "lervag/vimtex",
      lazy = false,
   },

   {
      "stevearc/conform.nvim",
      event = { "BufWritePre" },
      cmd = { "ConformInfo" },
      keys = {
         {
            "<leader>fm",
            function()
               require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format Buffer",
         },
      },
      opts = {
         formatters_by_ft = {
            c = { "clang-format" },
            h = { "clang-format" },
            cpp = { "clang-format" },
            hpp = { "clang-format" },
         }
      }
   }

}

require("lazy").setup(plugins)
