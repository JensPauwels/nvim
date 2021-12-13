lua require 'init'

" set fdm=marker fdl=0

" Toggle NERDTree.
map <leader>n :NERDTreeToggle<CR>

vmap r "_dP


" Make split navigation easier.
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

inoremap jk <ESC>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <expr> <C-p> ':Telescope find_files'."\<cr>"
nnoremap tnew :tabnew<CR>

nnoremap <Leader>k ddkP
nnoremap <Leader>j ddp

" call operator#sandwich#set('all', 'all', 'highlight', 1)

autocmd FileType html,css,javascript,jsx,tsx,ts EmmetInstall

"Note that the trailing , still needs to be entered, so the new keymap would be <C-e>,.
let g:user_emmet_leader_key=','

let g:user_emmet_settings = {
\  'javascript.js' : {
\      'extends' : 'jsx',
\  },
\ 'typescript' : {
\     'extends' : 'jsx',
\ },
\}

let g:SuperTabDefaultCompletionType = "<c-n>"
" let g:UltiSnipsExpandTrigger = "<TAB>"
" let g:UltiSnipsJumpForwardTrigger="<c-l>"
" let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/ultisnips"
