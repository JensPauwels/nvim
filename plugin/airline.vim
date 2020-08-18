" let g:airline#extensions#tmuxline#enabled = 1
" let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

" let g:airline#extensions#tabline#tab_nr_type = 1
" let g:airline#extensions#tabline#fnamemod = ':t'

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
