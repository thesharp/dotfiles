return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local open_with_trouble = require("trouble.sources.telescope").open
    local telescope = require("telescope")

    telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-k>"] = "move_selection_previous",
          ["<C-j>"] = "move_selection_next",
          ["<C-u>"] = false,
          ["<C-t>"] = open_with_trouble,
        }
      },
    },
    pickers = {
      find_files = {
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--glob=!**/.git/*",
          "--glob=!**/.idea/*",
          "--glob=!**/.vscode/*",
        }
      }
    }
  })
  end
}
