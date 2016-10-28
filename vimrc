call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

Plug 'mattn/emmet-vim', {'for': 'html'}

Plug 'henrik/vim-indexed-search'

" PEP8 and linting plugin for Python.
Plug 'scrooloose/syntastic', {'for': 'python'}

" Fuzzy file finder.
Plug 'ctrlpvim/ctrlp.vim', {'on': 'CtrlPMixed'}

" Async command runner.
Plug 'skywind3000/asyncrun.vim', {'on': 'AsyncRun'}

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

" Git wrapper for vim.
Plug 'tpope/vim-fugitive'

" Show git added/changed/deleted marks on the edited line.
Plug 'airblade/vim-gitgutter'

Plug 'kristijanhusak/vim-hybrid-material'

" Use TAB for auto completions.
Plug 'ervandew/supertab'

" Auto completion library for Python.
Plug 'davidhalter/jedi-vim', {'for': 'python'}

" Enhanced syntax and highlighting for Python.
Plug 'mitsuhiko/vim-python-combined', {'for': 'python'}

" Productivity functions for Django.
Plug 'umutcoskun/vim-mule', {'for': 'python'}

Plug 'lepture/vim-jinja'

call plug#end()


" --------------------
" GENERAL
" --------------------
set nocompatible                " Use Vim settings, rather than Vi settings
set autoread                    " Read when a file is changed from the outside
filetype indent on              " Load filetype-spesific indent files
filetype plugin on              " And the plugins
set clipboard=unnamedplus       " Use system clipboard
set encoding=utf8               " Set utf8 as standard encoding
set shortmess=I                 " Remove start screen message.

" --------------------
" COLORS AND FONTS
" --------------------
syntax on                       " Enable syntax highlighting
set t_Co=256                    " Enable 256-bit coloring
set background=dark
colorscheme hybrid_reverse  " Theme

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
" set acd                         " Change the current working directory whenever open a file.

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

" Set tabs to 2 spaces in html, css
autocmd Filetype jinja,html,css setlocal ts=2 sw=2 expandtab

" Display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" --------------------
" UI CONFIG
" --------------------
set title                   " Change terminal title to filename.
set number                  " Show line numbers
set ruler                   " Always show current position
set cmdheight=2             " Set height of the command bar to 2 lines
set showcmd                 " Show command in bottom bar
set cursorline              " Highlight current line
set wildmenu                " Visual autocomplete for command menu and hide compiled files
set wildmode=list:longest   " Bash-like command completion
set wildignore=*.o,*~/*.pyc " Ignore compiled files
set wildignore+=*/env/*,*/__pycache__/*,*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*
set lazyredraw              " Redraw only when we need to
set showmatch               " Highlight matching of brackets
set mat=1                   " How many tenths of a second to blink when matching
set autoindent              " Keep the same indent as the line currently on
set laststatus=2            " Always display the status line
set guitablabel=%t          " Show only filename in tab line
set confirm                 " Raise a dialogue asking if you wish to save changed files
set visualbell              " Use visual bell instead of beeping
set noerrorbells            " No annoying sound on errors
set t_vb=                   " Reset terminal code for the visual bell
set mouse=a                 " Enable use of the mouse for all modes
set splitbelow              " Open new tabs to bottom
set splitright              " Open new tabs to right

" --------------------
" SEARCHING
" --------------------
set incsearch               " Search as characters as entered
set hlsearch                " Highlight matches
set ignorecase              " Use case insentive search
set smartcase               " Except when using capital letters
set magic                   " Turn on regex-searching

" --------------------
" FOLDING
" --------------------
set foldenable              " Enable folding
set foldlevelstart=10       " Open most folds by default
set foldnestmax=5           " 5 nested fold max
set foldmethod=indent       " Fold based on indent level


" --------------------
" AUTO COMMANDS
" --------------------

" Try to load skeleton templates.
" autocmd BufNewFile *.* silent! execute '0r ~/vim/templates/skeleton.'.expand('<afile>:e')

" Remove trailing whitespaces when saved.
autocmd BufWritePre *.py :%s/\s\+$//e

" File type spesific run commands
autocmd FileType python command! Run :!python3 %<CR>

" --------------------
" SHORTCUTS
" --------------------
let mapleader=","           " Set comma as leader key
set pastetoggle=<F7>        " Shortcut for toggle paste mode

nnoremap <leader>q :q!<CR>
nnoremap <leader>h :%s/

" Open sourced vimrc in split.
nnoremap <leader>v  :vsp $MYVIMRC<CR>

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

" Ignore capitalize.
command! Wqa :wqa<CR>

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
nnoremap <F5> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$','\~$','\.pyc$']
let NERDTreeMinimalUI=1

" Airline Settings
let g:airline_theme = 'hybrid'

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_expandabbr_key='<S-Tab>'
autocmd FileType jinja,html imap <s-tab> <plug>(emmet-expand-abbr)
autocmd FileType jinja,html EmmetInstall

" syntastic
let g:syntastic_python_checkers=['pep8', 'pylint', 'python']
let g:syntastic_python_python_exec = '/usr/bin/python3'

" jedi-vim
let g:jedi#popup_on_dot = 1

" asyncrun.vim
augroup vimrc
    autocmd QuickFixCmdPost * botright copen 8
augroup END

" CtrlP
let g:ctrlp_map = '<F3>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.idea', '.git']

" UndoTree
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout = 3
let g:undotree_DiffpanelHeight = 20
let g:undotree_SetFocusWhenToggle = 1