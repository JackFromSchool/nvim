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

}
