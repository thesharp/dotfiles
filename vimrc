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

au FileType html setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

" gvim settings
if has("gui_running")
    colorscheme desert
    set guifont=Terminus
"    autocmd VimEnter * NERDTree
endif

" NERDtree
let g:NERDTreeWinPos = "right"
