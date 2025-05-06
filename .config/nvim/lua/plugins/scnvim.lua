return {
  {
    'davidgranstrom/scnvim',
    config = function()

      local scnvim = require 'scnvim'
      local map = scnvim.map
      local map_expr = scnvim.map_expr

      scnvim.setup {
	ensure_installed = true,
	keymaps = {
	  ['<M-e>'] = map('editor.send_line', {'i', 'n'}),
	  ['<C-e>'] = {
	    map('editor.send_block', {'i', 'n'}),
	    map('editor.send_selection', 'x'),
	  },
	  ['<leader>st'] = map('sclang.start'),
	  ['<leader>sl'] = map('sclang.recompile'),
	  ['<F5>'] = map('postwin.toggle', {'n', 'i'}),
	  ['<leader><F5>'] = map('postwin.clear', {'n', 'i'}),
	  ['<leader>sb'] = map_expr('Server.local.boot'),
	  ['<leader>sg'] = map_expr('Server.local.makeGui'),
	  ['<leader>sm'] = map_expr('Server.local.meter'),
	  ['<leader>ss'] = map_expr('Server.local.scope'),
	  ['<leader>sk'] = map_expr('Server.killAll'),
	  ['<C-.>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
	  ['<C-k>'] = map('signature.show', {'n', 'i'}),
	},
	documentation = {
	  cmd = nil,
	  horizontal = true,
	  direction = 'top',
	  keymaps = true,
	},
	postwin = {
	  highlight = false,
	  auto_toggle_error = true,
	  horizontal = true,
	  direction = 'right',
	  size = 35,
	  fixed_size = nil,
	  float = {
	    direction = "top",
	    enabled = false,
	    height = 24,
	    width = function()
	      return math.max(math.floor(vim.fn.winwidth(0) / 2), 60)
	    end,
	    -- config = {
	      --   border = 'single',
	      -- },
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
		--  snippet = {
		--    engine = {
		--      name = 'luasnip',
		--      options = {
		-- descriptions = true,
		--      },
		--    },
		--  },
	  statusline = {
	    poll_interval = 1,
	  },
	}

	require('scnvim.postwin').on_open:append(function()
	  vim.opt_local.wrap = true
	end)

	-- require"luasnip".add_snippets("supercollider", require"scnvim/utils".get_snippets())

      end
    }
  }
