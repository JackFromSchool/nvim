require('options')
require('plugins')
require('keymaps')

-- Initialize fancy colors
vim.cmd([[silent! colorscheme sonokai]])

-- Lualine
require('lualine').setup {
  options = { theme = 'sonokai' }
}

-- Buffer Line
require('bufferline').setup{
  options = {
  seperator_style = 'padded_slant',
  numbers = 'none',
  offsets = {
   {
     filetype = "NvimTree",
     text = "File Explorer",
     text_align = "center",
     separator = true
   }
   },
  }
}


-- Shade
require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    toggle = "<leader>s",
  }
})

-- Outline
require("symbols-outline").setup({
   auto_close = true,
   auto_preview = true,
})

-- Auto Pairs
require('mini.pairs').setup()

-- Leap
require('leap').add_default_mappings()

-- lsp
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
