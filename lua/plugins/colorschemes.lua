-- 
-- Colorschemes
-- Some colorschemes I've used before
-- 

return {
   {
      'sainnhe/sonokai',
      lazy = false,
      priority = 1000,
      config = function()
         vim.g.sonokai_transparent_background = 1
         vim.cmd.colorscheme('sonokai')
      end
   },

   {
      'sainnhe/everforest',
      lazy = true,
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
