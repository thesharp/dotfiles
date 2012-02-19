set nocompatible
set backspace=indent,eol,start
set nomodeline
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
