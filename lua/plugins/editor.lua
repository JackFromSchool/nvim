return {
   -- Autopairs
   {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
   },

   -- Better Movement
   {
      "ggandor/leap.nvim",
      init = function()
         vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
         vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
      end,
   },

   -- f Search Style
   {
      "jinh0/eyeliner.nvim",
      config = function()
         require("eyeliner").setup({
            highlight_on_key = true,
            dim = true,
         })
      end,
   },

   -- Comment Tools
   {
      "numToStr/Comment.nvim",
      opts = {},
   },

   -- NOTE: Nice TODO's
   {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      event = "VeryLazy",
      opts = {},
      keys = {
         { "<leader>ft", ":TodoTelescope<CR>", desc = "Open TODO Telescop" },
      },
   },

   -- Git Blame
   {
      "lewis6991/gitsigns.nvim",
      config = function()
         require("gitsigns").setup()
      end,
   },

   -- Better Quickfix
   {
      "stevearc/quicker.nvim",
      event = "FileType qf",
      opts = {},
   },

   -- Easier Marks
   {
      "chentoast/marks.nvim",
      event = "VeryLazy",
      opts = {},
   },

   {
      'akinsho/toggleterm.nvim',
      version = "*",
      event = "VeryLazy",
      opts = {
         insert_mappings = false,
         terminal_mappings = false,
         size = function(term)
            if term.direction == "horizontal" then
               return 15
            elseif term.direction == "vertical" then
               return vim.o.columns * 0.4
            end
         end
      },
      config = function(_, opts)
         require("toggleterm").setup(opts)

         vim.keymap.set("n", "<leader>tt", function()
            require('toggleterm').toggle(nil, nil, nil, "horizontal", nil)
         end, { noremap = true });

         vim.keymap.set("n", "<leader>tf", function()
            require('toggleterm').toggle(nil, nil, nil, "float", nil)
         end, { noremap = true });
      end,
   },
}
