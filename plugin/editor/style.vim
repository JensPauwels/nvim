set termguicolors

" Display relative line numbers, but also display the actual number on the
" current line.
set number
set relativenumber

" Highlight the current line number.
set cursorline

" Display hidden characters.
set list
" set listchars=tab:→\ ,nbsp:·,trail:·,eol:¬,extends:…,precedes:…

" Set the color scheme to Solarized.
set background=dark

let ayucolor="mirage" " for mirage version of theme
colorscheme challenger_deep
" Show the title in the terminal.
set title

" Hide command information at the bottom of the prompt.
set noshowcmd

" Set the scrolling offset.
set scrolloff=3

" Disable some of the prose the editor outputs for basic tasks.
set shortmess+=AIOTWaot


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  set termguicolors
endif
