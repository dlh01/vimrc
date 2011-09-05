
" ===================================================================
" Pathogen.vim
" https://github.com/tpope/vim-pathogen
" Must be called before filetype stuff
" ===================================================================
call pathogen#infect()
call pathogen#helptags()



" ===================================================================
" Filetypes
" ===================================================================
filetype plugin indent on " load plugin and indent files for specific file types; loads ftplugin.vim and indent.vim in the runtimepath



" ===================================================================
" Syntax highlighting
" ===================================================================
syntax enable " enable highlighting; sources $VIMRUNTIME/syntax/syntax.vim



" ===================================================================
" Global options
" ===================================================================
set autochdir " change to the directory of the buffer opened or switched into
set autoindent " copy indent from current line when starting a new line
set background=dark
set backspace=2 " allow for backspacing over autoindents, line breaks, and the start of inserts
set backupdir=~/temp/ " save ~ files here
set cinwords= " no funny indents after words useful when writing C
set clipboard+=unnamed " add the unnamed register to the clipboard
    colorscheme liquidcarbon
set cpoptions=c " see :h cpoptions
set debug=msg " error messages don't disappear immediately after startup
set directory=~/temp/ " save swap files here
set expandtab " use the appropriate number of spaces to insert a tab in Insert mode; use spaces in indents with > and < with autoindent on
set guioptions+=mg " see :h guioptions
set guioptions-=T " no toolbar in gui
set hidden " allow hiding unmodified buffers
set history=100
set ignorecase " ignore case in searches
set incsearch " search incrementally
set laststatus=2 " always display a status line
set linebreak " display linebreaks by word, not character
set mousehide " hide mouse when typing
set novisualbell " my eyes!
set number " show line numbers
set scrolloff=8 " keep N lines at the top or bottom while scrolling
set shiftwidth=4 " number of spaces that an (auto)indent uses (>>, <<, etc)
set smartcase " override ignorecase if search patter contains uppercases
set smartindent " insert indent after a line ending in { or before a line starting with }
set softtabstop=4 " number of spaces that a <Tab> counts for in insert mode
set spell " spell-check on
set spellsuggest=best,20 " give 20 of the best spelling suggestions
set statusline=%f%m%r%h%w\ %y\ [%{getcwd()}]\ [buf\ %n]\ [col\ %03v]\ [line\ %04l/%04L]
set t_Co=256 " colors
set tabstop=4 " number of spaces that a <Tab> counts for
set textwidth=0 " by default, no max width
set whichwrap+=<,>,h,l " left, right, h, and l move to previous and next line
set wildmenu " enhanced command-line completion



" ===================================================================
" System-specific options
" ===================================================================
if MySys() == "mac"
    if has("gui_running")
        set lines=80
        set columns=150
    endif
elseif MySys() == "linux"
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
    if has("gui_running")
        set lines=48
        set columns=150
    endif
endif



" ===================================================================
" File-specific options
" ===================================================================

" Plain text
" -------------------------------------------------------------------
autocmd FileType txt setlocal textwidth=70


" Markdown
" -------------------------------------------------------------------
autocmd FileType mkd setlocal textwidth=70



" ===================================================================
" Key mappings
" ===================================================================

" Leader-driven shortcuts
" -------------------------------------------------------------------
map <leader>w :w<cr>
map <leader>c :close<cr>
nmap <leader>dq :call DumbQuotes()<cr><cr>



" ===================================================================
" Functions
" ===================================================================
function! DumbQuotes()
    :%s/’/'/g
    :%s/‘/'/g
    :%s/“/"/g
    :%s/”/"/g
    :%s/—/--/g
    :%s/–/--/g
    :%s/…/.../g
endfunction
