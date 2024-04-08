local cmp = require'cmp'
local luasnip = require'luasnip'

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
     'hrsh7th/nvim-cmp',
     config = function()
         cmp.setup({
             snippet = {
                 expand = function(args)
                     require('luasnip').lsp_expand(args.body)
                 end,
             },
             window = {
             },
             mapping = cmp.mapping.preset.insert({
                 ['<C-Space>'] = cmp.mapping.complete(),
                 ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
             }, {
                 { name = 'buffer' },
             })
         })


         -- Set configuration for specific filetype.
         cmp.setup.filetype('gitcommit', {
             sources = cmp.config.sources({
                 { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
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
     end
 }

