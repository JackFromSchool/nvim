return {
   {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release ; cmake --build build --config Release",
         },
      },
      config = function()
         require('telescope').setup {
            pickers = {
               find_files = {
                  theme = "ivy"
               },
               buffers = {
                  theme = "ivy"
               }
            },
         }
      end,

      keys = {
         { "<leader>ff", require("telescope.builtin").find_files,    desc = "Telescope: Find Files" },
         { "<leader>fg", require("config.telescope").live_multigrep, desc = "Telescope: Live Grep" },
         { "<leader>fb", require("telescope.builtin").buffers,       desc = "Telescope: Find Buffers" },
      },
   },
}
