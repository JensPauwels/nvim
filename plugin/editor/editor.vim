
" Plugin containing settings related to the editing capabilities.
" Author: Jens Pauwels <github.com/jpauwels>

" Main configuration file for the Neovim editor.
set winwidth=100
set ignorecase
set autowriteall
set smartcase
" set autochdir
set showmatch
set autoread
set guitablabel=\[%N\]\ %t\ %M 

" Loading vim configuration files for specific filetypes.
""filetype plugin indent on

" Even if loading plugins goes wrong, I still want my syntax highlighting.
syntax enable


" Default indent spacing on pressing <Tab> is 4.
set tabstop=4
set shiftwidth=4

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Enable line breaking.
set linebreak

" Enable automatic indentation based on the context.
set autoindent
" set smartindent
"set smarttab

" Replace a tab with the equivalent number of spaces.
set expandtab

" Indentation by a multiple of shiftwidth when using > or < keys.
set shiftround

" Enable backspacing in insert mode.
set backspace=indent,eol,start

" Enable incremental searching.
set incsearch

" Buffers can exist without being attached to a window.
set hidden

" Set folding settings.
set foldmethod=indent
set foldlevelstart=99

" Open splits in a more convenient position.
set splitright
set splitbelow

" Filetypes to ignore in the wildmenu.
set wildignore+=*.o,*.obj,.git,*.class,*.jar,*.war,*.log,*.min.js
set wildignore+=daemons,*.sw?,tags,*.min.js,*tmp/cache/*,node_modules
set wildignore+=bower_components,*-webpack-generated*,*/dist/*
set wildignore+=*/build/*,dist,build

" Don't redraw during macro execution.
set lazyredraw

" Disable swap files.
set noswapfile

" Disable undo files.
set noundofile

" Disable backups.
set nowritebackup

" Set spelling settings.
set spelllang=en_us
