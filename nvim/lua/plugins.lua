vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'

  use 'bradcush/base16-nvim'
  -- use 'RRethy/nvim-base16'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use 'tpope/vim-fugitive'
  use 'tpope/vim-obsession'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-eunuch'
  use 'mileszs/ack.vim'
  use 'folke/trouble.nvim'
  use 'mhartington/formatter.nvim'

  use 'nvim-lualine/lualine.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release'
  }

  use 'tomtom/tcomment_vim'
  use 'ntpeters/vim-better-whitespace'
  use 'windwp/nvim-autopairs'
  use 'lervag/vimtex'

  use 'pearofducks/ansible-vim'
  use 'rodjek/vim-puppet'
  use 'bracki/vim-prometheus'
  use 'martinda/Jenkinsfile-vim-syntax'
  use 'Joorem/vim-haproxy'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'andersevenrud/cmp-tmux'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'mfussenegger/nvim-lint'

  use 'nvim-treesitter/nvim-treesitter'
end)