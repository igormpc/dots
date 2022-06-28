require('packer').startup(function()
  
-- pkg manager
  use 'wbthomason/packer.nvim'

-- colorschemes
  use 'morhetz/gruvbox'
  use 'folke/tokyonight.nvim'
  
-- SuperCollider
  use 'davidgranstrom/scnvim'

-- Tidal
  use 'tidalcycles/vim-tidal'

-- NVimTree
  use 'kyazdani42/nvim-tree.lua'
  
-- i3 Syntax 
  use 'PotatoesMaster/i3-vim-syntax'

end
)
