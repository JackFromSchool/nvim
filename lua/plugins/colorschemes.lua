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
      'sainnhe/everforest',
      lazy = true,
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
      lazy=false,
      priority = 1000,
      config = function()
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_visual = 'green background'
        vim.g.gruvbox_material_transparent_background = 2
      end,
   },
}
