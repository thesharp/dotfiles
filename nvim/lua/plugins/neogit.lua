return {
  'NeogitOrg/neogit',
  dependencies = { 'nvim-lua/plenary.nvim',
                   'nvim-telescope/telescope.nvim',
                   'sindrets/diffview.nvim',
  },
  opts = {
    commit_editor = {
      kind = "tab"
    }
  }
}
