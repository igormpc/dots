local cmp = require'cmp'
local luasnip = require("luasnip")
local lspkind = require'lspkind'

 -- for SuperTab Luasnip Mapping
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

--vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Don't show the dumb matching stuff.
--vim.opt.shortmess:append "c"

cmp.setup {
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  completion = {
    keyword_length = 3,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
  -- native_menu = false,
    ghost_text = true,
  },
  formatting = {
    format = lspkind.cmp_format({preset = 'default', mode = 'symbol_text', maxwidth = 50})
 	},
  mapping = cmp.mapping.preset.insert({
      -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      -- ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
          -- elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-l>"] = cmp.mapping(function(fallback)
          -- if luasnip.jumpable() then
          if luasnip.expand_or_locally_jumpable() then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-h>"] = cmp.mapping(function(fallback)
          -- if luasnip.jumpable() then
          if luasnip.expand_or_locally_jumpable() then
            luasnip.jump(-1)
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
	sources = {
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'tags' },
		{ name = 'treesitter' },
		{ name = 'buffer' , keyword_length=5}, -- dont complete until at 5 chars
		-- { name = 'nvim_lua' },
	},
}
