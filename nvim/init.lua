vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.ackprg = "rg --vimgrep"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require('lazy').setup('plugins')
require("mappings")
require("filetypes")

-- General stuff
vim.opt.autoread = true
vim.opt.modeline = true
-- vim.cmd("set ruler rulerformat=%40(%<%f\ %m%=%r\ %l\ %c\ %p%%%)")
vim.opt.cursorline = true
vim.opt.regexpengine = 1
vim.opt.lazyredraw = true
vim.opt.updatetime = 100
vim.opt.showmode = false
vim.opt.clipboard = "unnamed"
vim.opt.mouse = "c"
vim.cmd("highlight clear SpellBad")
vim.cmd("highlight SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00")

vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "nosplit"
vim.opt.backup = false
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.ttyfast = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.backupdir = "~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp"
vim.opt.directory = "~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp"
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.cmd("highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE")
vim.opt.spelllang = "en_us,ru_ru"
vim.opt.spellfile = "$HOME/.config/nvim/spell/ru.utf-8.add"
