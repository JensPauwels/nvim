"Let the input go up and the search list go down
if has('nvim')
    let $FZF_DEFAULT_OPTS = '--layout=reverse'
    let $FZF_DEFAULT_COMMAND = 'rg -l --files --hidden'

    "Open FZF and choose floating window
    let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
    " let g:fzf_preview_layout = 'split new'

    function! OpenFloatingWin()
        let height = &lines - 3
        let window_width = &columns
        let width = float2nr(&columns - (&columns * 2 / 10))
        let col = float2nr((&columns - width) / 2)

        "Set the position, size, etc. of the floating window.
        "The size configuration here may not be so flexible, and there's room for further improvement.
        let opts = {
                    \ 'relative': 'editor',
                    \ 'row': height / 8,
                    \ 'col': window_width / 2 - ((width * 2 / 3) / 2),
                    \ 'width': width * 2 / 3,
                    \ 'height': height / 2
                    \ }

        let buf = nvim_create_buf(v:false, v:true)
        let win = nvim_open_win(buf, v:true, opts)

        "Set Floating Window Highlighting
        call setwinvar(win, '&winhl', 'Normal:Pmenu')

        setlocal
                    \ buftype=nofile
                    \ nobuflisted
                    \ bufhidden=hide
                    \ nonumber
                    \ norelativenumber
                    \ signcolumn=no
    endfunction
endif

" nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles . --exclude-standard --others --cached')."\<cr>"
" nnoremap <expr> <C-p> ':Files '."\<cr>"

nnoremap <expr> <C-p> ':Files'."\<cr>"

" function! s:find_git_root()
"   return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
" endfunction

" command! ProjectFiles execute 'Files' s:find_git_root()

" map <C-p> :ProjectFiles<CR>

