require('packer').startup(function()
  
  -- Plugins
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'morhetz/gruvbox'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Popup/Plenary
  use 'nvim-lua/popup.nvim'
  use "nvim-lua/plenary.nvim"

  -- Cellular Automata
 use 'eandrju/cellular-automaton.nvim' 
  
  -- NVimTree    
  use 'kyazdani42/nvim-tree.lua'

  -- Lualine
  use 'nvim-lualine/lualine.nvim'

  -- SuperCollider
  use 'davidgranstrom/scnvim'
  use 'davidgranstrom/scnvim-tmux'
  use 'madskjeldgaard/nvim-supercollider-piano'
  use	'madskjeldgaard/fzf-sc'
  
  -- Fuzzy Finders
  use 'ibhagwan/fzf-lua'
--use 'junegunn/fzf'
	use	'vijaymarupudi/nvim-fzf'

  -- TidalCycles
  use 'tidalcycles/vim-tidal'
  
  -- Collab
  use 'jbyuki/instant.nvim'
  
  -- Lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Treesitter Rainbow
  use 'p00f/nvim-ts-rainbow'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'ray-x/cmp-treesitter'
  use 'saadparwaiz1/cmp_luasnip'
  use 'quangnguyen30192/cmp-nvim-tags'
  use 'onsails/lspkind-nvim'
  
  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Autopairs
  use 'windwp/nvim-autopairs'

end
)
