return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      go = {'golangcilint'},
      tex = {'chktex'},
      ansible = {'ansible_lint'},
      sh = {'shellcheck'},
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
        vim.api.nvim_command('FormatWrite')
      end,
    })
  end
}
