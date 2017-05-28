""" NeoBundle
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
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle "squarefrog/tomorrow-night.vim"
NeoBundle "tomtom/tcomment_vim"
NeoBundle "garbas/vim-snipmate", {"depends": ["MarcWeber/vim-addon-mw-utils", "tomtom/tlib_vim"]}
NeoBundle "hdima/python-syntax"
NeoBundle "rodjek/vim-puppet"
NeoBundle "kien/ctrlp.vim"
NeoBundle "ntpeters/vim-better-whitespace"
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
" NeoBundle 'tpope/vim-markdown'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'JamshedVesuna/vim-markdown-preview'
NeoBundle 'benmills/vimux'
NeoBundle 'elzr/vim-json'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'pearofducks/ansible-vim'
" NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'cespare/vim-toml'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-rhubarb'
NeoBundle 'fmoralesc/vim-pad'
NeoBundle 'fatih/vim-go'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/echodoc.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'bracki/vim-prometheus'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""" General stuff
" set nocompatible
set autoread
set backspace=indent,eol,start
set modeline
syntax on
set ruler rulerformat=%40(%<%f\ %m%=%r\ %l\ %c\ %p%%%)
set background=light
set cursorline
set regexpengine=1
set lazyredraw
colorscheme tomorrow-night
highlight clear SpellBad
highlight SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00
let mapleader="\<Space>"

""" Leader bindings
nmap <Leader>o :only<CR>
nmap <Leader>q :bd<CR>
nmap <Leader>h <C-w>h
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <Leader>l <C-w>l
nmap <Leader>f :NERDTreeFind<CR>
nmap <Leader>c :copen<CR>

"" Fugitive
nmap <silent> <leader>gs :Gstatus<cr>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gl :Glog -- %<CR><CR>:copen<CR>

"" BufExplorer
nmap <silent> <leader>; :BufExplorer<cr>

" Textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

""" Remap arrows to quickfix-navigation
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

""" Jump between splits with C-hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tmux/non-tmux home/end hack
let tmux=$TMUX
if tmux != ""
    set term=screen-256color
else
    set term=xterm-256color
endif

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
set showcmd
set ttyfast
set splitbelow
set splitright

" clear highlighted search
noremap <Leader>s :set hlsearch! hlsearch?<cr>

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

""" Line numbers settings
map <F5> :set nonumber!<CR>:set foldcolumn=0<CR>
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

""" Spelling
set spelllang=en_us,ru_ru
set spellfile=$HOME/.vim/spell/ru.utf-8.add

""" Airline
set laststatus=2
let g:airline_powerline_fonts = 1

""" Python settings
" au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 tw=80
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType python set colorcolumn=80,110
au FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setlocal completeopt-=preview

" au FileType python map <Leader>b :w<CR>:!clear && /usr/bin/env python % <CR>
au FileType python map <Leader>b :w<CR>:call VimuxRunCommandInDir("clear && /usr/bin/env python", 1)<CR>
au FileType python map <Leader>p iimport pdb; pdb.set_trace()<ESC>

let python_highlight_all = 1
let python_highlight_space_errors = 0
" let python_slow_sync = 1

""" HTML settings
au FileType html setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

""" Markdown settings
au FileType markdown setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType markdown setlocal spell
let g:vim_markdown_folding_disabled = 1

""" gitcommit
autocmd FileType gitcommit setlocal spell

""" mail
autocmd FileType mail setlocal spell

""" RST settings
au FileType rst setlocal tabstop=6 expandtab shiftwidth=3 softtabstop=3

""" JSON settings
au FileType json setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType json map <Leader>f :%!python -m json.tool<CR>

""" Puppet settings
au FileType puppet setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

""" Ansible settings
au FileType ansible setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
let g:ansible_extra_keywords_highlight = 1
" let g:ansible_options = {'ignore_blank_lines': 0}

""" YAML settings
au FileType yaml setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

""" Ruby settings
au FileType ruby setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

""" XML settings
au FileType xml setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

""" VimL settings
au FileType vim setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

""" Prometheus settings
au FileType prometheus setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

""" GVIM settings
if has("gui_running")
    set guifont=set guifont=Monaco\ for\ Powerline:h12
"    autocmd VimEnter * NERDTree
endif

""" NERDtree
" let g:NERDTreeWinPos = "right"
" map <C-n> :NERDTreeToggle<CR>
map <F6> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '^\.git$', '^\.gitmodules$']
let NERDTreeShowHidden = 1

""" Snippets
let g:snips_author = 'Ilya Otyutskiy'
let g:snips_email = 'ilya.otyutskiy@icloud.com'

""" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"" Python
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501"'

"" Puppet
let g:syntastic_puppet_puppetlint_args = "--no-documentation-check --no-80chars-check --no-autoloader_layout-check --no-variable_scope-check --fail-on-warnings"

"" Gist
let g:gist_post_private = 1

"" JSON
let g:vim_json_syntax_conceal = 0

"" Ansible
let g:syntastic_ansible_checkers = ['ansible_lint']

"" YAML
let g:syntastic_yaml_checkers = ['pyyaml']

""" vim-pad
let g:pad#default_format = "markdown"
let g:pad#dir = "~/Dropbox/Notes"

""" golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_go_checkers = ['gometalinter']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_list_type = "quickfix"

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=go#complete#Complete

" " Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
