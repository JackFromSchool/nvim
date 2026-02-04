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
       'tribela/transparent.nvim',
       event = 'VimEnter',
       config = true,
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
      'sainnhe/everforest',
      lazy = false,
      priority = 1000,
      config = function()
         vim.g.everforest_transparent_background = 2
      end
   },

   {
      'rebelot/kanagawa.nvim',
      lazy = true,
   },

   {
      'sainnhe/gruvbox-material',
      lazy=true,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
      --   vim.g.gruvbox_material_enable_italic = true
      --   vim.g.gruvbox_material_background = 'hard'
      --   vim.g.gruvbox_material_visual = 'green background'
      -- vim.g.gruvbox_material_transparent_background = 1
        -- vim.cmd([[set background=dark]])
        -- vim.cmd([[colorscheme gruvbox-material]])
      end,
   },
}
