
" Sanity
"
set nocompatible
set nomodeline
filetype plugin indent on
syntax on
"
" General Settings
"
" Basics
"
set number          " Show line numbers
set showcmd         " Show things like partially-entered key sequences
set showmode        " Show status of insert/visual mode in command line
set showmatch       " Highlight brace/paren/etc. which matches one under cursor
set laststatus=2    " Always show statusline
" Indentation
"
set expandtab       " Use spaces for indentation
set autoindent      " Indent new lines, etc. automagically
set tabstop=4       " Display tabs as four spaces wide
set softtabstop=4   " Treat tabs as four spaces for editing (backspace whole expanded tabs, etc.)
set shiftwidth=4    " I don't really know what this one does, to be honest.
" Searching
"
set ignorecase      " Make searches case-insensitive...
set smartcase       " ...except when they explicitly contain capitals
set incsearch       " Show matches while typing search patterns
set hlsearch        " Highlight all matches for a search
" Layout
"
set nowrap          " Let long lines go off screen rather than wrapping to the next line
set colorcolumn=100 " Highlight column 100 (to indicate appropriate line length)
set signcolumn=yes  " Show the sign column even when it is empty
set list            " Mark some special non-printing characters
set listchars=tab:>-,extends:>,precedes:<,trail:X

