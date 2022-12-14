local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr

scnvim.setup {
  keymaps = {
    ['<M-e>'] = map('editor.send_line', {'i', 'n'}),
    ['<C-e>'] = {
      map('editor.send_block', {'i', 'n'}),
      map('editor.send_selection', 'x'),
    },
    ['<CR>'] = map('postwin.toggle'),
    ['<M-CR>'] = map('postwin.toggle', 'i'),
    ['<C-k>'] = map('signature.show', {'n', 'i'}),
    ['<F2>'] = map('sclang.start'),
    ['<leader>sb'] = map_expr('Server.local.boot'),
    ['<leader>sm'] = map_expr('Server.local.meter'),
    ['<leader>ss'] = map_expr('Server.local.scope'),
    ['<leader>sg'] = map_expr('Server.local.makeGui'),
    ['<F5>'] = map('postwin.clear', {'n', 'i'}),
    ['<leader>sl'] = map('sclang.recompile'),
    ['<F12>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
    	-- FzfSC
	  ['<leader>sh'] = scnvim.map(function()
		  vim.cmd("FzfSC help")
	  end, {'n', 'x', 'i'}
	  ),
	  ['<F1>'] = scnvim.map(function()
		  vim.cmd("FzfSC")
	  end, {'n', 'x', 'i'}
	  ),
  },
  documentation = {
    cmd = '/usr/bin/pandoc',
    horizontal = false,
    direction = 'right',
    keymaps = true,
  },
  postwin = {
    highlight = true,
    auto_toggle_error = true,
    horizontal = false,
    direction = 'right',
    size = 35,
    fixed_size = nil,
		float = {
      enabled = false,
      row = 0,
      col = function()
        return vim.o.columns
      end,
      width = 64,
      height = 14,
      config = {
        border = 'single',
      },
      callback = function(id)
        vim.api.nvim_win_set_option(id, 'winblend', 10)
      end,
		},
	},
  editor = {
    force_ft_supercollider = true,
    highlight = {
      color = 'TermCursor',
      type = 'flash',
      flash = {
        duration = 100,
        repeats = 2,
      },
      fade = {
        duration = 375,
      },
    },
  },
  signature = {
      float = true,
      auto = true,
      },
  snippet = {
    engine = {
      name = 'luasnip',
      options = {
        descriptions = true,
      },
    },
  },
  statusline = {
    poll_interval = 1,
  },
  tmux = {
    --path = vim.fn.tempname(),
    cmd = 'scnvim-tmux.sh',
    args = { '$1' },
  },
  extensions = {
    ['fzf-sc'] = {
      search_plugin = 'nvim-fzf',
    },
  },
}

scnvim.load_extension('piano')
scnvim.load_extension('fzf-sc')
--scnvim.load_extension ('tmux')

require('scnvim.postwin').on_open:append(function()
  vim.opt_local.wrap = true
end)

require"luasnip".add_snippets("supercollider", require"scnvim/utils".get_snippets())
