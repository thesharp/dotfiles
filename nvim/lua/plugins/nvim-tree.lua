return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {},
  config = function ()
    require("nvim-tree").setup()
    vim.cmd("hi NvimTreeCursorLine guifg=#c678dd guibg=#2b3039")
  end
}
