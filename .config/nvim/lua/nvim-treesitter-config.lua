require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "supercollider" },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
   additional_vim_regex_highlighting = false,
  },
	indent = {
		enable = true,
		disable = { "supercollider" },
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			"#ebdbb2",
			"#ff881a",
			"#e2e52f",
			"#70dbdf",
			"#d3869b",
			"#ff4935",
			"#ace896",
			-- "#beaceb"
			-- "#94c6b7"
		}, -- table of hex strings
		-- termcolors = {"Laranja", "Palido", "Verde", "Azul", "Rosa", "Vermelho", "Verdola", "Roxo", "Verdul"} -- table of colour name strings
	},
}
