return {
  'mhartington/formatter.nvim',
  config = function()
    local util = require "formatter.util"
    require('formatter').setup {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        go = {
          require("formatter.filetypes.go").gofmt,
          function()
            return {
              exe = "gofmt",
              args = {
                "-e",
                "-w",
                util.escape_path(util.get_current_buffer_file_path()),
              },
              stdin = true,
            }
          end
        },
      }
    }

    vim.g.terraform_fmt_on_save = 1
  end
}
