" Python filetype plugin
" see http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc 

if exists("b:did_ftplugin")
  finish
endif

setlocal fileformat=unix
setlocal foldmethod=indent
setlocal formatoptions=croql
setlocal shiftwidth=4
setlocal smarttab
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=79

let python_highlight_all=1
