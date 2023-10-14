return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'folke/neodev.nvim',
  },
  config = function()
    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end
    local feedkeys = require('cmp.utils.feedkeys')
    local keymap = require('cmp.utils.keymap')

    local cmp = require'cmp'

    ---@diagnostic disable-next-line: missing-fields
    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
    ---@diagnostic disable-next-line: missing-fields
      window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          -- elseif has_words_before() then
          --   cmp.complete()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
      }, {
        { name = 'buffer' },
      })
    })

    -- Set configuration for specific filetype.
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup.cmdline(':', {
      -- https://github.com/hrsh7th/nvim-cmp/pull/1445#issuecomment-1442071031
      mapping = cmp.mapping.preset.cmdline({
        ['<Tab>'] = {
          c = function(_)
            if cmp.visible() then
              cmp.select_next_item()
            else
              feedkeys.call(keymap.t('<C-z>'), 'n')
            end
          end
        },
        ['<S-Tab>'] = {
          c = function()
            if cmp.visible() then
              cmp.select_prev_item()
            else
              feedkeys.call(keymap.t('<C-z>'), 'n')
            end
          end,
        },
      }),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = {'!', 'Man'}
          }
        }
      })
    })

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('lspconfig')['gopls'].setup {
      capabilities = capabilities
    }

    require('lspconfig')['pylsp'].setup{
      settings = {
        pylsp = {
          configurationSources = {"flake8"},
          plugins = {
            flake8 = {
              enabled = true,
              maxLineLength = 110,
            },
            pycodestyle = {
              maxLineLength = 110,
            }
          }
        }
      }
    }

    require('lspconfig')['pyright'].setup{}

    require('lspconfig')['lua_ls'].setup {
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
          client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
              }
            }
          })

          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
      end
    }

    require('lspconfig')['bashls'].setup{}

    require('lspconfig')['terraformls'].setup{}
    require('lspconfig')['tflint'].setup{}

    require('lspconfig')['dockerls'].setup{}
      end
}
