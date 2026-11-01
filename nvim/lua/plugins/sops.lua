return {
  'lemarsu/sops.nvim',
  opts = function()
    local config = require 'sops.config'
    config.follow = { 'SOPS_AGE_KEY_FILE' }
  end,
  config = function()
  end
}
