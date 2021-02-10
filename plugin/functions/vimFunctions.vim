function! s:SetCurrentDirectory() abort
    let g:pwd = system('pwd')
endfunction

autocmd VimEnter * call s:SetCurrentDirectory()

function! s:HandleCheckboxOutput(...) dict abort
    let l:data = json_decode(readfile(self.outputFile))
    call delete(self.outputFile)
    call self.callback[0](l:data)
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! ShowCheckBoxes(callback) abort
    botright new
    let l:outputFile = tempname()
    let l:callback = [a:callback]
    let l:config = {
                \ 'on_exit': function('s:HandleCheckboxOutput'),
                \ 'outputFile': l:outputFile,
                \ 'callback': l:callback,
                \ }

    let l:term = termopen(['python', '/Users/jenspauwels/.config/nvim/lib/entityGenerator/generateEntity.py', l:outputFile], l:config)
    startinsert
endfunction

function! AskQuestionsForDocGenerator(callback) abort
    botright new
    let l:outputFile = tempname()
    let l:callback = [a:callback]
    let l:config = {
                \ 'on_exit': function('s:HandleCheckboxOutput'),
                \ 'outputFile': l:outputFile,
                \ 'callback': l:callback,
                \ }

    let l:term = termopen(['python', '/Users/jenspauwels/.config/nvim/lib/docGenerator/generateDoc.py', l:outputFile], l:config)
    startinsert
endfunction

function! AskQuestionsToGenerateFile(callback) abort
    botright new
    let l:outputFile = tempname()
    let l:callback = [a:callback]
    let l:config = {
                \ 'on_exit': function('s:HandleCheckboxOutput'),
                \ 'outputFile': l:outputFile,
                \ 'callback': l:callback,
                \ }

    let l:term = termopen(['python', '/Users/jenspauwels/.config/nvim/lib/fileGenerator/generateFile.py', l:outputFile], l:config)
    startinsert
endfunction

function! AskQuestionsToTranslate(callback) abort
    botright new
    let l:outputFile = tempname()
    let l:callback = [a:callback]
    let l:config = {
                \ 'on_exit': function('s:HandleCheckboxOutput'),
                \ 'outputFile': l:outputFile,
                \ 'callback': l:callback,
                \ }

    let l:term = termopen(['python', '/Users/jenspauwels/.config/nvim/lib/translater/translate.py', l:outputFile], l:config)
    startinsert
endfunction


let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_ddO"
  else
    return "i"
  endif
endfunction

" ./plugin/my-vim-plugin.vim
let g:plugin_path = expand('<sfile>:p:h')

function! MyVimPlugin(data) abort
python << endpython

import os
import sys
import vim
import json

plugin_path = vim.eval("g:plugin_path")
python_module_path = os.path.abspath('%s/../../lib/entityGenerator' % (plugin_path))
sys.path.append(python_module_path)

from main import startGenerator 
startGenerator(vim.eval('a:data'));

vim.command('NERDTreeRefreshRoot')

endpython
endfunction


function! FileGenerator(data) abort
py3 << endpython

import os
import sys
import vim
import json

plugin_path = vim.eval("g:plugin_path")
python_module_path = os.path.abspath('%s/../../lib/FileGenerator' % (plugin_path))
sys.path.append(python_module_path)

from main import startGenerator 
startGenerator(vim.eval('a:data'));

vim.command('NERDTreeRefreshRoot')

endpython
endfunction

function! Translate(data) abort
python3 << endpython

import os
import sys
import vim
import json

plugin_path = vim.eval("g:plugin_path")
python_module_path = os.path.abspath('%s/../../lib/translater' % (plugin_path))
sys.path.append(python_module_path)

print(python_module_path)
from main import executeTranslation 
executeTranslation(vim.eval('a:data'));

vim.command('NERDTreeRefreshRoot')

endpython
endfunction

function! DocGenerator(data) abort
python << endpython

import os
import sys
import vim
import json

plugin_path = vim.eval("g:plugin_path")
python_module_path = os.path.abspath('%s/../../lib/docGenerator' % (plugin_path))
sys.path.append(python_module_path)

print(python_module_path)
from main import startGenerator 
startGenerator(vim.eval('a:data'));

vim.command('NERDTreeRefreshRoot')

endpython
endfunction
