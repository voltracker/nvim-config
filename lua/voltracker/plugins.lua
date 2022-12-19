vim.cmd.packadd('packer.nvim')

--- startup and add configure plugins
return require('packer').startup(function(use)
  -- add plugins below
  use 'wbthomason/packer.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use 'goolord/alpha-nvim'
  use 'neovim/nvim-lspconfig'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'catppuccin/nvim', as = 'catppuccin'}
end)
