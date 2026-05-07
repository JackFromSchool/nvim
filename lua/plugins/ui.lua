--
-- UI Plugins
--


return {
   -- Status Line
   {
      "nvim-lualine/lualine.nvim",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      opts = {
         options = {
            theme = "auto",
            component_separators = '|',
            section_separators = { left = '', right = '' },
         },
         sections = {
            lualine_a = {
               { 'mode', separator = { left = '' }, right_padding = 2 }
            },
            lualine_b = { 'branch' },
            lualine_c = {
               'diff'
            },


            lualine_x = {
               'diagnostics'
            },
            lualine_y = { 'filetype', 'progress' },
            lualine_z = {
               { 'location', separator = { right = '' }, left_padding = 2 }
            }
         }
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
               lsp_doc_border = true,        -- add a border to hover docs and signature help
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
            highlight = {
               groups = {
                  InclineNormal = { guibg = "none" },
                  InclineNormalNC = { guibg = "none" },
               },
            },
            render = function(props)
               local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
               if filename == "" then
                  filename = "[No Name]"
               end
               local ft_icon, ft_color = devicons.get_icon_color(filename)
               local modified = vim.bo[props.buf].modified

               local bghl = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false })
               local bgColor = string.format("#%06x", bghl.bg)

               return {
                  ft_icon and { "", guifg = ft_color }
                  or { "", guifg = bgColor },
                  ft_icon and { "", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
                  or "",
                  { " ", guibg = bgColor },
                  { filename, gui = modified and "bold,italic" or "bold", guibg = bgColor },
                  { "", guifg = bgColor, guibg = 'NONE' },
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
         image = {
            enabled = true,
            resolve = function(path, src)
               local api = require "obsidian.api"
               if api.path_is_note(path) then
                  return api.resolve_attachment_path(src)
               end
            end,
         },
      },
      init = function()
         vim.api.nvim_create_user_command("Lazygit", function()
            require("snacks").lazygit.open()
         end, {})
      end,
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

   -- Zen Mode
   { "shortcuts/no-neck-pain.nvim", version = "*" },

   -- Dimming
   {
      "folke/twilight.nvim",
   },
}
