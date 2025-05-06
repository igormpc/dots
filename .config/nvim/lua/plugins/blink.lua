return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      keymap = { preset = 'default' },

      appearance = {
	nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },
    },
    sources = {
      -- `lsp`, `buffer`, `snippets`, `path` and `omni` are built-in
      -- so you don't need to define them in `sources.providers`
      default = { 'snippets' },
      -- opts_extend = { "sources.default" }
    },
  }
}
