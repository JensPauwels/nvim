" Specif a directory for plugins
call plug#begin("~/.local/share/nvim/plugged")

Plug 'challenger-deep-theme/vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }


" Tab
" Allows you to complete with tab
Plug 'ervandew/supertab'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'

Plug 'mkitt/tabline.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-abolish'
Plug 'ap/vim-css-color'
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\}
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-commentary'               " Comments stuff
Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'javascript.tsx', 'javascript', 'html', 'css'] }
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" Initialize plugin system
call plug#end()


let mapleader="\<Space>"
let g:javascript_plugin_jsdoc = 1
let g:vim_jsx_pretty_colorful_config = 1

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx


" Better replacing
vmap r "_dP


" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nnoremap <Leader>k ddkP
nnoremap <Leader>j ddp

" -- Smart indent when entering insert mode with i on empty lines --------------
nnoremap <expr> i IndentWithI()


nnoremap tk :tabfirst<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tj :tablast<CR>
nnoremap tnew :tabnew<CR>
nnoremap tc :CtrlSpaceTabLabel<CR>
nnoremap td :tabclose<CR>

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

nnoremap <S-m> :call Model()<cr>
nnoremap <S-l> :call Input()<cr>

nnoremap <C-w> :'<,'>Commentary<cr>
nnoremap <S-s> :Snippets<cr>

nnoremap <S-h> :call ToggleHiddenAll()<CR>

nnoremap <Leader>format :call FormatJSON()<cr>
nnoremap <Leader>so :source $MYVIMRC<CR>
nnoremap <Leader>file :call AskQuestionsToGenerateFile(function('FileGenerator'))<cr>

" Disable search highlights.
nnoremap <Leader>h :nohlsearch<CR>

" Toggle NERDTree.
map <leader>n :NERDTreeToggle<CR>

" nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
" let cwd = system('pwd') 
" let cwd = '/Users/jenspauwels/Documents/dev/bluecherry-platform/ui/bluecherry-ui-user/' 
" nnoremap <C-p> ':Files <c-r>=cwd<cr> --exclude-standard<cr>


" Make split navigation easier.
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Toggle folds.
nnoremap <Tab> za

map <Leader>gr :FzfPreviewProjectGrep 


augroup AutoWrite
    autocmd! BufLeave * :update
augroup END


let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:loaded_python_provider = 0
let g:python3_host_prog = '/opt/homebrew/bin/python3.9'
