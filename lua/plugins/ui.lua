--
-- UI Plugins
--

local lualine_theme = "gruvbox-material"

return {
   -- Status Line
   {
      "nvim-lualine/lualine.nvim",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      opts = {
         theme = lualine_theme,
      },
   },

   -- Bottom Left LSP info
   {
      "j-hui/fidget.nvim",
      config = function()
         require("fidget").setup({})
      end,
   },

   -- Better Notifications
   {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
         "MunifTanjim/nui.nvim",
         "rcarriga/nvim-notify",
      },
      config = function()
         require("noice").setup({
            -- you can enable a preset for easier configuration
            presets = {
               bottom_search = true,         -- use a classic bottom cmdline for search
               command_palette = true,       -- position the cmdline and popupmenu together
               long_message_to_split = true, -- long messages will be sent to a split
               inc_rename = false,           -- enables an input dialog for inc-rename.nvim
               lsp_doc_border = false,       -- add a border to hover docs and signature help
            },
         })
      end,
   },

   -- Floating window-line names
   {
      "b0o/incline.nvim",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      config = function()
         local helpers = require("incline.helpers")
         local devicons = require("nvim-web-devicons")

         require("incline").setup({
            window = {
               padding = 0,
               margin = { horizontal = 0 },
            },
            render = function(props)
               local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
               if filename == "" then
                  filename = "[No Name]"
               end
               local ft_icon, ft_color = devicons.get_icon_color(filename)
               local modified = vim.bo[props.buf].modified
               return {
                  ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
                  or "",
                  " ",
                  { filename, gui = modified and "bold,italic" or "bold" },
                  " ",
               }
            end,
         })
      end,
      event = "VeryLazy",
   },

   -- Go to selected line
   {
      "nacro90/numb.nvim",
      config = function()
         require("numb").setup()
      end,
   },

   -- Various quality of life
   {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = {
         bigfile = { enabled = true },
         scroll = { enabled = true },
         indent = { enabled = true },
         lazygit = { enabled = true },
      },
      init = function()
         vim.api.nvim_create_user_command("Lazygit", function()
            require('snacks').lazygit.open()
         end, {})
      end
   },

   {
      "stevearc/oil.nvim",
      opts = {},
      dependencies = { "nvim-tree/nvim-web-devicons" },
      lazy = false,
      keys = {
         { "-", "<CMD>Oil<CR>", desc = "Open parent directory." },
      },
   },
}
