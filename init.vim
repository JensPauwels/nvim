" Specif a directory for plugins
call plug#begin("~/.local/share/nvim/plugged")

Plug 'challenger-deep-theme/vim'
Plug 'rafi/awesome-vim-colorschemes'


" Tab
" Allows you to complete with tab
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'

Plug 'mkitt/tabline.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-abolish'

Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

" Plug 'kien/ctrlp.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'

Plug 'tpope/vim-commentary'               " Comments stuff

Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'javascript', 'html', 'css'] }

" Plug 'chemzqm/vim-jsx-improve'
" Plug 'othree/yajs.vim'
"
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

"
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
" Plug 'airblade/vim-rooter'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" Initialize plugin system
call plug#end()


let mapleader="\<Space>"
let g:vim_jsx_pretty_colorful_config = 1


" vim-prettier
" let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)


" Better replacing
vmap r "_dP


" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

inoremap jk <ESC>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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
nnoremap <Leader>rulti :call UltiSnips#RefreshSnippets()<cr>
nnoremap <Leader>insert :call ShowCheckBoxes(function('MyVimPlugin'))<cr>
nnoremap <Leader>generate :call AskQuestionsForDocGenerator(function('DocGenerator'))<cr>
nnoremap <Leader>file :call AskQuestionsToGenerateFile(function('FileGenerator'))<cr>

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


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


augroup AutoWrite
    autocmd! BufLeave * :update
augroup END

autocmd VimEnter * call ToggleHiddenAll()
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')


 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_highlight_close_tag = 1

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
