
" ===================================================================
" Filetypes
" ===================================================================
set filetype " try to recognize the type of file and set the 'filetype' option
filetype plugin on " load plugin files for specific file types; loads ftplugin.vim in the runtimepath
filetype indent on " load indent files for specific file types; loads indent.vim in the runtimepath



" ===================================================================
" Syntax highlighting
" ===================================================================
syntax on " enable highlighting; sources $VIMRUNTIME/syntax/syntax.vim



" ===================================================================
" Options
" ===================================================================
set autoindent " copy indent from current line when starting a new line
set expandtab " use the appropriate number of spaces to insert a tab in Insert mode; use spaces in indents with > and < with autoindent on
set shiftwidth=4 " number of spaces that an (auto)indent uses (>>, <<, etc)
set softtabstop=4 " number of spaces that a <Tab> counts for in insert mode
set tabstop=4 " number of spaces that a <Tab> counts for
set wildmenu " enhanced command-line completion
