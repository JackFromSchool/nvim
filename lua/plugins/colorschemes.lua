--
-- Colorschemes
-- Some colorschemes I've used before
--

return {
   {
      "RRethy/base16-nvim",
      lazy = false,
      priority = 1000,
   },

   {
      'sainnhe/sonokai',
      lazy = true,
      config = function()
         vim.g.sonokai_transparent_background = 1
      end
   },

   {
      "xero/miasma.nvim",
      lazy = true,
   },

   {
      'neanias/everforest-nvim',
      version = false,
      lazy = false,
      priority = 1000,
      opts = {
         background = "medium",
         transparent_background_level = 2,
      },
      config = function(_, opts)
         require("everforest").setup(opts)
      end
   },

   {
      'rebelot/kanagawa.nvim',
      lazy = false,
      priority = 1000,
      opts = {
         transparent = true,
         statementStyle = { bold = true },
         commentStyle = { italic = true },
         undercurl = true,
         overrides = function(colors)
            local theme = colors.theme
            return {
               NormalFloat = { bg = "none" },
               FloatBorder = { bg = "none" },
               FloatTitle = { bg = "none" },
               StatusLine = { fg = "none", bg = "none" },
               StatusLineNC = { fg = "none", bg = "none" },

               -- Save an hlgroup with dark background and dimmed foreground
               -- so that you can use it where your still want darker windows.
               -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
               NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

               -- Popular plugins that open floats will link to NormalFloat by default;
               -- set their background accordingly if you wish to keep them dark and borderless
               LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
               MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

               TelescopeTitle = { fg = theme.ui.special, bold = true },
               TelescopePromptNormal = { bg = theme.ui.bg_p1 },
               TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
               TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
               TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
               TelescopePreviewNormal = { bg = theme.ui.bg_dim },
               TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            }
         end,
         colors = {
            theme = {
               all = {
                  ui = {
                     bg_gutter = "none"
                  }
               }
            }
         },
         theme = "lotus",
      }
   },

   {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
         vim.g.gruvbox_material_enable_italic = true
         vim.g.gruvbox_material_background = 'hard'
         vim.g.gruvbox_material_visual = 'green background'
         vim.g.gruvbox_material_transparent_background = 2
      end,
   },
}
