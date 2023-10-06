return {
  'olimorris/onedarkpro.nvim',
  lazy = false,
  priority = 1000,
  dependencies = {
    'navarasu/onedark.nvim',
  },
  config = function ()
    require('onedark').setup{
      style = "dark"
    }
    require('onedark').load()
  end
}
