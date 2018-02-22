""" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'junegunn/vim-plug'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'squarefrog/tomorrow-night.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-python/python-syntax'
Plug 'rodjek/vim-puppet'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'plasticboy/vim-markdown'
Plug 'benmills/vimux'
Plug 'elzr/vim-json'
Plug 'tpope/vim-obsession'
Plug 'pearofducks/ansible-vim'
Plug 'Raimondi/delimitMate'
Plug 'jlanzarotta/bufexplorer'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'mileszs/ack.vim'
Plug 'bracki/vim-prometheus'

""" Disabled plugins

" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tpope/vim-markdown'
" Plug 'JamshedVesuna/vim-markdown-preview'
" Plug 'davidhalter/jedi-vim'
" Plug 'chase/vim-ansible-yaml'
" Plug 'rust-lang/rust.vim'
" Plug 'fmoralesc/vim-pad'
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/echodoc.vim'
" Plug 'garbas/vim-snipmate', {'depends': ['MarcWeber/vim-addon-mw-utils', 'tomtom/tlib_vim']}

call plug#end()

""" General stuff
set nocompatible
filetype plugin indent on
set autoread
set backspace=indent,eol,start
set modeline
syntax on
set ruler rulerformat=%40(%<%f\ %m%=%r\ %l\ %c\ %p%%%)
set background=light
set cursorline
set regexpengine=1
set lazyredraw
set updatetime=100
set noshowmode
set clipboard=unnamed
colorscheme tomorrow-night
highlight clear SpellBad
highlight SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00
let mapleader="\<Space>"

""" Leader bindings
nmap <silent> <Leader>o :only<CR>
nmap <silent> <Leader>q :bd<CR>
nmap <silent> <Leader>h <C-w>h
nmap <silent> <Leader>j <C-w>j
nmap <silent> <Leader>k <C-w>k
nmap <silent> <Leader>l <C-w>l
nmap <Leader>c :copen<CR>

"" Fugitive
nmap <silent> <leader>gs :Gstatus<cr>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gl :Glog -- %<CR><CR>:copen<CR>

"" BufExplorer
nmap <silent> <leader>; :BufExplorer<cr>

"" Textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

"" fzf
nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>b :Buffers<CR>

"" NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>F :NERDTreeFind<CR>

"" ack / ag
nmap <leader>a :Ack!<Space>

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
au FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
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
au FileType json map <Leader>F :%!python -m json.tool<CR>

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

""" TOML settings
au FileType toml setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

""" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

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

" let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1

let g:go_fmt_command = "goimports"

let g:syntastic_go_checkers = ['gometalinter']
let g:go_metalinter_command = "gometalinter --fast"
let g:syntastic_go_gometalinter_args = "--fast"
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_list_type = "quickfix"

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


""" deoplete
" neocomplete like
" set completeopt+=noinsert
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/local/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
