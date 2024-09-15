return {
  'junegunn/vim-easy-align',
  config = function()
    vim.api.nvim_set_keymap("v", "<Leader><Bslash>", ":EasyAlign*<Bar><Enter>", {silent = true})
  end
}
