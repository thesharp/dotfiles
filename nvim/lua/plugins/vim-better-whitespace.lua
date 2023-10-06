return {
  'ntpeters/vim-better-whitespace',
  config = function()
    vim.api.nvim_del_keymap("n", "<Leader>s<Space>")
  end
}
