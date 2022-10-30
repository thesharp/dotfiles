""" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if !has("nvim")
    call plug#begin('~/.vim/bundle')
else
    call plug#begin('~/.config/nvim/bundle')
endif

Plug 'junegunn/vim-plug'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'w0rp/ale'
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
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'mileszs/ack.vim'
Plug 'bracki/vim-prometheus'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'tpope/vim-eunuch'
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'rhysd/git-messenger.vim'
Plug 'mtth/scratch.vim'
" Plug 'godlygeek/tabular'

""" Disabled plugins

" Plug 'tpope/vim-markdown'
" Plug 'JamshedVesuna/vim-markdown-preview'
" Plug 'rust-lang/rust.vim'
" Plug 'fmoralesc/vim-pad'

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

"" Signify
nmap ]h <plug>(signify-next-hunk)
nmap [h <plug>(signify-prev-hunk)
nmap ]H 9999]h
nmap [H 9999[h

"" Fugitive
nmap <silent> <leader>gs :Git<cr>
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

"" ack / ag / rg
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
if !has("nvim")
    if tmux != ""
        set term=screen-256color
    else
        set term=xterm-256color
    endif
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
set incsearch
set inccommand=nosplit
set nobackup
set title
set showcmd
set ttyfast
set splitbelow
set splitright

" clear highlighted search
noremap <silent> <Leader>s :let @/=""<cr>

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

""" Line numbers settings
map <F5> :set nonumber!<CR>:set foldcolumn=0<CR>
set number
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

""" Spelling
set spelllang=en_us,ru_ru
set spellfile=$HOME/.vim/spell/ru.utf-8.add

""" Airline
set laststatus=2
let g:airline_powerline_fonts = 1

""" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 0

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
" au FileType json map <Leader>F :%!python -m json.tool<CR>

""" Puppet settings
au FileType puppet setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

""" Ansible settings
au FileType ansible setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
au FileType yaml.ansible setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
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
au FileType gohtmltmpl setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

""" Jenkinsfile settings
au FileType Jenkinsfile setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType groovy setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

""" LaTeX settings
au FileType tex setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
" let g:vimtex_fold_enabled = 1

""" GVIM settings
if has("gui_running")
    set guifont=set guifont=Monaco\ for\ Powerline:h12
"    autocmd VimEnter * NERDTree
endif

""" NERDtree
" let g:NERDTreeWinPos = "right"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '^\.git$', '^\.gitmodules$']
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 0

" ALE
let g:ale_linters = {'tex': ['chktex'], 'python': ['flake8'], 'puppet': ['puppetlint'], 'ansible': ['ansible_lint'], 'yaml': ['pyyaml'], 'go': ['golangci-lint']}
let g:ale_linters_explicit = 1
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

let g:ale_go_golangci_lint_options = '--fast'
let g:ale_puppet_puppetlint_options = "--no-documentation-check --no-80chars-check --no-autoloader_layout-check --no-variable_scope-check --fail-on-warnings --no-140chars-check"
let g:ale_python_flake8_options = '--ignore="E501"'

let g:airline#extensions#ale#enabled = 1

"" Gist
let g:gist_post_private = 1

"" JSON
let g:vim_json_syntax_conceal = 0

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

let g:go_list_type = "quickfix"

""" coc.nvim settings
let g:python3_host_prog = "/Users/sharp/.pyenv/versions/py3nvim/bin/python"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <tab> and <S-tab> to navigate completion list: >
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion: >
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <CR> to confirm completion, use: >
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Map <tab> for trigger completion, completion confirm, snippet expand and jump
" like VSCode: >
  inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ?
    \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  let g:coc_snippet_next = '<tab>'

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

set completeopt-=preview

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""" fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

""" ack / ag / rg
if executable('rg')
      let g:ackprg = 'rg --vimgrep'
endif

""" scratch.vim
let g:scratch_persistence_file = '/Users/sharp/Yandex.Disk.localized/DB/vim/scratch'
