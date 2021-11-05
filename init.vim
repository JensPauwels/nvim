lua require 'init'

set fdm=marker fdl=0

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

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

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
let g:UltiSnipsExpandTrigger = "<TAB>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/ultisnips"

let g:tmuxline_preset = {
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : ['#(~/bin/battery)','%R',  '#(whoami)']}

let g:tmuxline_theme = {
    \   'a'    : [ 236, 103 ],
    \   'b'    : [ 253, 239 ],
    \   'c'    : [ 244, 236 ],
    \   'x'    : [ 244, 236 ],
    \   'y'    : [ 253, 239 ],
    \   'z'    : [ 236, 103 ],
    \   'win'  : [ 103, 236 ],
    \   'cwin' : [ 236, 103 ],
    \   'bg'   : [ 244, 236 ],
    \ }

