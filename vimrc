" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set nocompatible
set backspace=indent,eol,start
set modeline
syntax on
set ruler rulerformat=%40(%<%f\ %m%=%r\ %l\ %c\ %p%%%)
set background=light

set autoindent
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
map <F8> :emenu Encoding.<TAB>
set hlsearch
set nobackup
set title

map <F1> :tabnew<CR>
map <F2> :tabprev<CR>
map <F3> :tabnext<CR>
map <F4> :tabclose<CR>

au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 tw=80
au FileType python match Error /\%>80v/ 
au FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

map <F5> :set nonumber!<CR>:set foldcolumn=0<CR>

let g:pydoc_open_cmd = 'tabnew'

menu Python.Run :w<CR>:!clear && /usr/bin/env python % <CR>
menu Python.PEP-8 :w<CR>:!clear && pep8 -r --show-source --show-pep8 % <CR>
menu Python.pdb iimport pdb; pdb.set_trace()<ESC>
map <F9> :emenu Python.<TAB>

let python_highlight_all = 1
let python_highlight_space_errors = 0
" let python_slow_sync = 1

" html settings
au FileType html setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

" markdown settings
autocmd BufRead *.md       set ft=markdown
au FileType markdown setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" puppet settings
au FileType puppet setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" gvim settings
if has("gui_running")
    colorscheme desert
    set guifont=Terminus
"    autocmd VimEnter * NERDTree
endif

" NERDtree
" let g:NERDTreeWinPos = "right"
" map <F6> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" snippets
let g:snips_author = 'Ilya Otyutskiy'
let g:snips_email = 'ilya.otyutskiy@icloud.com'
