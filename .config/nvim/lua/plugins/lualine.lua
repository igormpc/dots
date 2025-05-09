return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()

      local function scstatus()
	if vim.bo.filetype == "supercollider" then
	  local stat = vim.fn["scnvim#statusline#server_status"]()
	  stat = stat:gsub("%%", " ")
	  return stat
	else
	  return ""
	end
      end

      require('lualine').setup {
	options = {
	  icons_enabled = true,
	  theme = 'kanagawa',
	  component_separators = '|',
	  section_separators = '',
	  disabled_filetypes = {},
	  always_divide_middle = true,
	  globalstatus = false,
	},
	sections = {
	  lualine_a = {'mode'},
	  lualine_b = {'branch', 'diff', 'diagnostics'},
	  lualine_c = {'filename', scstatus},
	  lualine_x = {'filetype'},
	  lualine_y = {'progress'},
	  lualine_z = {'location'}
	},
	inactive_sections = {
	  lualine_a = {},
	  lualine_b = {},
	  lualine_c = {'filename'},
	  lualine_x = {'location'},
	  lualine_y = {},
	  lualine_z = {}
	},
	tabline = {},
	extensions = {}
      }

    end
  }
}
