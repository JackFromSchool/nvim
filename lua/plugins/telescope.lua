return {
   {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -S. -Bbuild -DCMAKE_BUILD_TYPE=Release ; cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 --build build --config Release",
         },
      },
      config = function()
         require('telescope').setup {
            defaults = {
               winblend = 0,
            },
            pickers = {
               find_files = {
                  theme = "dropdown"
               },
               buffers = {
                  theme = "dropdown"
               }
            },
         }

          vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='none'})
          vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='none'})
          vim.api.nvim_set_hl(0, 'TelescopePromptTitle', {bg='none'})
          vim.api.nvim_set_hl(0, 'TelescopePromptBorder', {bg='none'})
          vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', {bg='none'})
          vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', {bg='none'})
      end,

      keys = {
         { "<leader>ff", require("telescope.builtin").find_files,    desc = "Telescope: Find Files" },
         { "<leader>fg", require("config.telescope").live_multigrep, desc = "Telescope: Live Grep" },
         { "<leader>fb", require("telescope.builtin").buffers,       desc = "Telescope: Find Buffers" },
      },
   },
}
