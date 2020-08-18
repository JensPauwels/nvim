" Plugin containing settings related to the editing capabilities.
" Author: Jens Pauwels <github.com/jpauwels>
"
autocmd FileType html,css,javascript,jsx EmmetInstall


let g:user_emmet_install_global = 0
"Note that the trailing , still needs to be entered, so the new keymap would be <C-e>,.
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'javascript.js' : {
\      'extends' : 'jsx',
\  },
\}


