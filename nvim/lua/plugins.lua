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

  use 'navarasu/onedark.nvim'
  use 'olimorris/onedarkpro.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'NeogitOrg/neogit',
    requires = { 'nvim-lua/plenary.nvim',
                 'nvim-telescope/telescope.nvim',
                  'sindrets/diffview.nvim',
    },
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
  use 'hashivim/vim-terraform'
  use 'yasuhiroki/github-actions-yaml.vim'
  use {
    'someone-stole-my-name/yaml-companion.nvim',
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  }

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
