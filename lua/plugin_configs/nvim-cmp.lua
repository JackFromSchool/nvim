local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end,
   },

   mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({ select = true }),

      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
           cmp.select_next_item()
         -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
         -- they way you will only jump inside the snippet region
         elseif luasnip.expand_or_jumpable() then
           luasnip.expand_or_jump()
         elseif has_words_before() then
           cmp.complete()
         else
           fallback()
         end
       end, { "i", "s" }),

       ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
           cmp.select_prev_item()
         elseif luasnip.jumpable(-1) then
           luasnip.jump(-1)
         else
           fallback()
         end
       end, { "i", "s" }),
   }),

   sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
   },
   {
      { name = 'buffer' },
   }),

   formatting = {
      format = lspkind.cmp_format({
         mode = 'symbol',
         maxwidth = 50,
         ellipsis_char = '...',
         before = function(entry, vim_item)
            return vim_item
         end
      })
   },
})

cmp.setup.filetype('gitcommit', {
   sources = cmp.config.sources({
      { name = 'cmp_git' },
   }, {
      { name = 'buffer' },
   })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
 mapping = cmp.mapping.preset.cmdline(),
 sources = {
   { name = 'buffer' }
 }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
 mapping = cmp.mapping.preset.cmdline(),
 sources = cmp.config.sources({
   { name = 'path' }
 }, {
   { name = 'cmdline' }
 })
})
