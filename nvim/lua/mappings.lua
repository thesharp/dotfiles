local map = vim.api.nvim_set_keymap

map("n", "<Space>", "", {silent = true})
vim.g.mapleader = " "

map("n", "<Leader>o", ":only<CR>", {silent = true})
map("n", "<Leader>q", ":bd<CR>", {silent = true})
map("n", "<Leader>h", "<C-W>h", {silent = true})
map("n", "<Leader>j", "<C-W>j", {silent = true})
map("n", "<Leader>k", "<C-W>k", {silent = true})
map("n", "<Leader>l", "<C-W>l", {silent = true})
map("n", "<Leader>c", ":copen<CR>", {silent = true})
map("n", "<Leader>t", ":TroubleToggle<CR>", {silent = true})

-- Fugitive
map("n", "<Leader>gs", ":Git<CR>", {silent = true})
map("n", "<Leader>gd", ":Gdiff<CR>", {silent = true})
map("n", "<Leader>gl", ":Glog -- %<CR><CR>:copen<CR>", {silent = true})

-- Textmate style indentation
map("v", "<Leader>[", "<gv", {silent = true})
map("v", "<Leader>]", ">gv", {silent = true})
map("n", "<Leader>[", "<<", {silent = true})
map("n", "<Leader>]", ">>", {silent = true})

-- Telescope
map("n", "<Leader>f", ":Telescope find_files<CR>", {silent = true})
map("n", "<Leader>b", ":Telescope buffers<CR>", {silent = true})
map("n", "<Leader>r", ":Telescope live_grep<CR>", {silent = true})

-- nvim-tree
map("n", "<Leader>n", ":NvimTreeToggle<CR>", {silent = true})
map("n", "<Leader>F", ":NvimTreeFindFile<CR>", {silent = true})

-- ack / ag / rg
map("n", "<Leader>a", ":Ack! ", {})

-- git-signs
map("n", "]h", ":Gitsigns next_hunk<CR>", {silent = true})
map("n", "[h", ":Gitsigns prev_hunk<CR>", {silent = true})
-- map("n", "]H", "9999]h", {silent = true})
-- map("n", "[H", "9999[h", {silent = true})

-- Remap arrows to quickfix-navigation
map("n", "<Up>", ":cprevious<CR>", {silent = true, noremap = true})
map("n", "<Down>", ":cnext<CR>", {silent = true, noremap = true})
map("n", "<Left>", ":cpfile<CR>", {silent = true, noremap = true})
map("n", "<Right>", ":cnfile<CR>", {silent = true, noremap = true})

-- Jump between splits with C-hjkl
map("n", "<C-h>", "<C-w>h", {noremap = true})
map("n", "<C-j>", "<C-w>j", {noremap  = true})
map("n", "<C-k>", "<C-w>k", {noremap = true})
map("n", "<C-l>", "<C-w>l", {noremap = true})

-- Clear highlighted search
map("n", "<Leader>s", ":let @/=\"\"<CR>", {silent = true, noremap = true})

-- LSP mappings
local bufopts = {noremap=true, silent=true}
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)