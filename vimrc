


" ===================================================================
" Pathogen.vim
" ===================================================================
" https://github.com/tpope/vim-pathogen
" Must be called before filetype stuff
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
let mapleader=","
set autoindent " copy indent from current line when starting a new line
set background=dark
set backspace=2 " allow for backspacing over autoindents, line breaks, and the start of inserts
set backupdir=~/temp/ " save ~ files here
set cinwords= " no funny indents after words useful when writing C
set clipboard+=unnamed " add the unnamed register to the clipboard
    colorscheme solarized
set cpoptions=c " see :h cpoptions
set debug=msg " error messages don't disappear immediately after startup
set directory=~/temp/ " save swap files here
set expandtab " use the appropriate number of spaces to insert a tab in Insert mode; use spaces in indents with > and < with autoindent on
set gdefault " search and replace globally "/g/" by default
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
set shiftwidth=2 " number of spaces that an (auto)indent uses (>>, <<, etc)
set smartcase " override ignorecase if search patter contains uppercases
set smartindent " insert indent after a line ending in { or before a line starting with }
set softtabstop=2 " number of spaces that a <Tab> counts for in insert mode
set spell " spell-check on
set spellsuggest=best,20 " give 20 of the best spelling suggestions
set statusline=[%{getcwd()}]\ [%f%m%r%h%w]\ %y\ [col\ %03v]\ [line\ %04l/%04L]\ %{fugitive#statusline()}
set t_Co=256 " colors
set tabstop=2 " number of spaces that a <Tab> counts for
set textwidth=0 " by default, no max width
set whichwrap+=<,>,[,],h,l " left, right, h, and l move to previous and next line
set wildmenu " enhanced command-line completion



" ===================================================================
" System-specific options
" ===================================================================
if MySys() == "mac"
    if has("gui_running")
        set lines=80
        set columns=170
        set relativenumber " count lines relative to current line
        set autochdir " change to the directory of the buffer opened or switched into; not in CLI vim
        " set guifont=Anonymous\ Pro:h12
        set guifont=Droid\ Sans\ Mono:h10
    endif
    let g:LustyJugglerSuppressRubyWarning = 1 " terminal vim lacks ruby support
elseif MySys() == "linux"
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
    set autochdir " change to the directory of the buffer opened or switched into
    if has("gui_running")
        set lines=48
        set columns=170
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


" vimrc
" -------------------------------------------------------------------
" when vimrc is written, reload it
autocmd! bufwritepost vimrc source ~/Dropbox/vim/vimrc



" ===================================================================
" Global key mappings
" ===================================================================

" Leader-based shortcuts separated by modes
" -------------------------------------------------------------------
" Quick save
map <leader>w :w<cr>
" Quick close window
map <leader>c :close<cr>
" Quick delete buffer
map <leader>b :bd<cr>
" Quick quit
map <leader>q :q<cr>
" Quick save and quit
map <leader>x :x<cr>
" Quick open vimrc
map <leader>ev :e ~/Dropbox/vim/vimrc<cr>
" Assuming I'll never purposely write ',w' or ',x' allow me to type them in insert mode
imap <leader>w <C-o>:w<cr>
imap <leader>x <C-o>:x<cr>
" Go back to normal mode
imap <leader><leader> <Esc>
" Open webpage
nmap <silent> <leader>f :! open %<cr><cr>
" ~~ Common commands mapped to numbers ~~
" Turn spellcheck off
nmap <leader>1 :set nospell<cr>
" Sort alphabetically
nmap <silent> <leader>2 :sort<cr>
" Quick call DumbQuotes
nmap <leader>3 :call DumbQuotes()<cr><cr>
" Global search and replace
nmap <leader>5 :%s/
" Wipe out all buffers (presumably)
nmap <leader>0 :1,100bd<cr>:echo "Deleted all buffers (probably)"<cr>



" Window and buffer management
" -------------------------------------------------------------------
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Other
" -------------------------------------------------------------------
" Remap : to ;
map ; :
" Quickly reformat paragraph
nmap Q gqap
" Move up and down by screen line, not file line
nmap j gj
nmap k gk



" ===================================================================
" Plugin-specific preferences and key mappings
" ===================================================================

" Lusty Juggler
" -------------------------------------------------------------------
let g:LustyJugglerShowKeys = 'a' " display key with buffer name
" open the buffer juggler, recommended by the author
map <leader>j <leader>lj


" Solarized
" -------------------------------------------------------------------
call togglebg#map("<F5>") " switch light/dark backgrounds


" Gundo
" -------------------------------------------------------------------
nnoremap <F6> :GundoToggle<cr>


" ===================================================================
" Functions
" ===================================================================
function! DumbQuotes()
    :%s/’/'/g
    :%s/‘/'/g
    :%s/“/"/g
    :%s/”/"/g
    :%s/—/---/g
    :%s/–/--/g
    :%s/…/.../g
endfunction
