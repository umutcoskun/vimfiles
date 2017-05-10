set nocompatible                        " Use Vim settings, rather than Vi settings

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet', {'for': 'python'}
Plug 'Shougo/neosnippet-snippets', {'for': 'python'}

" % matching for HTML.
Plug 'tmhedberg/matchit', {'for': 'html'}
" Highlight matching HTML tag.
Plug 'gregsexton/MatchTag', {'for': 'jinja.html,html'}

Plug 'editorconfig/editorconfig-vim'

" Colorize HEX codes
Plug 'ap/vim-css-color', {'for': 'scss'}

Plug 'mattn/emmet-vim', {'for': 'jinja.html,html,xhtml'}

" Reopen files at last position.
Plug 'farmergreg/vim-lastplace'

" Auto close brackets.
Plug 'jiangmiao/auto-pairs'

Plug 'google/vim-searchindex'

" Syntax checking.
Plug 'scrooloose/syntastic'

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

" Git wrapper.
Plug 'tpope/vim-fugitive'

" Show git added/changed/deleted marks on the edited line.
Plug 'airblade/vim-gitgutter'

" Color schemes.
Plug 'kristijanhusak/vim-hybrid-material'

" Productivity functions for Django.
Plug 'umutcoskun/vim-mule', {'for': 'python'}

" Syntax highlighting plugins.
Plug 'mitsuhiko/vim-python-combined'
Plug 'JulesWang/css.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'StanAngeloff/php.vim'

call plug#end()


" --------------------
" FUNCTIONS
" --------------------

function! g:OpenOrSplit(file)
    " The buffer is already open?
    if bufwinnr(a:file) > 0
        return
    endif

    " Current buffer is empty?
    if line('$') == 1 && getline(1) == ''
        execute ':e' . a:file
    else
        execute ':vsp' .  a:file
    endif
endfunction


function! s:TabTab()
    if neosnippet#expandable_or_jumpable()
        echo 'NEO'
        return '\<Plug>(neosnippet_expand_or_jump)'
    elseif emmet#isExpandable()
        echo 'EMMET'
        return '\<Plug>(emmet-expand-abbr)'
    elseif pumvisible()
        echo 'PUM'
        return '\<C-n>'
    else
        echo 'TAB'
        return '\<Tab>'
    endif
endfunction


" --------------------
" GENERAL
" --------------------
set autoread                            " Read when a file is changed from the outside
au CursorHold * checktime
filetype indent on                      " Load filetype-spesific indent files
filetype plugin on                      " And the plugins
set clipboard=unnamedplus               " Use system clipboard
set encoding=utf8                       " Set utf8 as standard encoding
set shortmess=I                         " Remove start screen message.
set report=0                            " Show text actions in the messages.
set backspace=indent,eol,start          " Backspace stuck problem.

" --------------------
" COLORS AND FONTS
" --------------------

if has('patch-7.4.1778')
  set guicolors
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

syntax on                       " Enable syntax highlighting
set t_Co=256                    " Enable 256-bit coloring
set background=dark
colorscheme hybrid_reverse

if has("gui_running")
    " GUI Options
    set linespace=3             " Line padding
    set guioptions -=T          " Hide toolbar.
    set guioptions-=r           " Hide right scroll bar
    set guioptions-=L           " Hide left scrboll bar
    set guifont=Source\ Code\ Pro\ 10
else
    " Terminal-spesific Options
    if(has("termguicolors"))
        set termguicolors
    endif
endif

set ffs=unix,dos,mac            " Set Unix as the standard file type
set acd                         " Change the current working directory whenever open a file.

" --------------------
" SPACES, TABS AND LINES
" --------------------
set tabstop=4                   " Number of visual spaces per TAB
set shiftwidth=4                " Indents will have a width of 4
set softtabstop=4               " Sets the number of columns for a TAB
set smarttab                    " Insert a indent instead of TAB at the new line
set expandtab                   " Expand TABs to spaces
set ai                          " Auto indent
set si                          " Smart indent
set wrap                        " Wrap lines

" Display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" --------------------
" UI CONFIG
" --------------------
set title                       " Change terminal title to filename.
set number                      " Show line numbers
set ruler                       " Always show current position
set cmdheight=2                 " Set height of the command bar to 2 lines
set showcmd                     " Show command in bottom bar
set cursorline                  " Highlight current line
set wildmenu                    " Visual autocomplete for command menu and hide compiled files
set wildmode=list:longest       " Bash-like command completion
set wildignore=*.o,*~/*.pyc     " Ignore compiled files
set wildignore+=*/env/*,*/__pycache__/*,*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*
set lazyredraw                  " Redraw only when we need to
set showmatch                   " Highlight matching of brackets
set mat=1                       " How many tenths of a second to blink when matching
set autoindent                  " Keep the same indent as the line currently on
set laststatus=2                " Always display the status line
set guitablabel=%t              " Show only filename in tab line
set confirm                     " Raise a dialogue asking if you wish to save changed files
set visualbell                  " Use visual bell instead of beeping
set noerrorbells                " No annoying sound on errors
set t_vb=                       " Reset terminal code for the visual bell
set mouse=a                     " Enable use of the mouse for all modes
set splitbelow                  " Open new tabs to bottom
set splitright                  " Open new tabs to right

" --------------------
" SEARCHING
" --------------------
set incsearch                   " Search as characters as entered
set hlsearch                    " Highlight matches
set ignorecase                  " Use case insentive search
set smartcase                   " Except when using capital letters
set magic                       " Turn on regex-searching

" --------------------
" FOLDING
" --------------------
set foldenable                  " Enable folding
set foldlevelstart=10           " Open most folds by default
set foldnestmax=5               " 5 nested fold max
set foldmethod=indent           " Fold based on indent level


" --------------------
" COMMANDS
" --------------------

autocmd Filetype scss setlocal tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2
autocmd Filetype php setlocal tabstop=4 shiftwidth=4

" --------------------
" MAPPINGS
" --------------------

let mapleader=","               " Set comma as leader key

" Jump over TAGs
nmap <S-Up> [[
nmap <S-Down> ]]

" Hard wrap paragraph of text.
nnoremap <leader>w gqip

" Sort CSS properties.
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Re-selected just pasted text.
nnoremap <leader>v V`]

" Clear current buffer.
nnoremap <silent> <leader>q :bd!<CR>

" Close all buffers without save.
nnoremap <silent> <leader>x :qa!<CR>

" Indent the entire file then go last edited line.
nnoremap <silent> <leader>fef ggVG='.<CR>

" Open sourced vimrc in split.
nnoremap <silent> <leader>v  :call g:OpenOrSplit($MYVIMRC)<CR>

" Fold and unfold with space.
nnoremap <space> za

" Turn off search highlight by leader-space
nnoremap <silent> <leader><space> :nohlsearch<CR>

" Resize splits in normal mode with <leader> + arrows.
nnoremap <silent> <leader><right> :vertical resize +5<CR>
nnoremap <silent> <leader><left> :vertical resize -5<CR>
nnoremap <silent> <leader><up> :res +5<CR>
nnoremap <silent> <leader><down> :res -5<CR>

" Use CTRL + arrow keys to navigate in splits
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Use SHIFT + arrow keys for tab navigation
nnoremap <S-Left> :tabp<CR>
nnoremap <S-Right> :tabn<CR>

" Use > and < for recursive shifting in visual mode
vnoremap > >gv
vnoremap < <gv

" Enable w!! for saving file with root privileges
cnoremap w!! w !sudo tee % >/dev/null

nmap <F5> :NERDTreeToggle<CR>
set pastetoggle=<F7>            " Shortcut for toggle paste mode

" --------------------
" BACKUPS
" --------------------
set nobackup                " Turn backup off
set noswapfile              " Do not create swap files.

if has('persistent_undo')
    set undodir=~/.undotree/
    set undofile
endif

" --------------------
" PLUGINS
" --------------------

" NERDTree Settings
let NERDTreeIgnore=['\.o$','\~$','\.pyc$']
let NERDTreeMinimalUI=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Requires tidy
let g:syntastic_html_checkers = ['w3']
let g:syntastic_css_checkers = ['csslint']
" Requires jshint
let g:syntastic_javascript_checkers = ['jshint']
" Requires flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_python_exec = '/usr/bin/python3'

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" Airline Settings
let g:airline_theme = 'hybrid'

" Use Deoplete
let g:deoplete#enable_at_startup = 1

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|target|dist)|(\.(swp|ico|git|svn))$'

" Neosnippet
autocmd filetype python imap <TAB>     <Plug>(neosnippet_expand_or_jump)
autocmd filetype python smap <TAB>     <Plug>(neosnippet_expand_or_jump)
autocmd filetype python xmap <TAB>     <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" /Neosnippet

" Emmet
let g:user_emmet_expandabbr_key='<tab>'
autocmd filetype html,xhtml,jinja.html imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

