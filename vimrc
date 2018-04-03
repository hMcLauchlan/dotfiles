inoremap jk <Esc>

filetype plugin on

set autoindent
set number
set relativenumber
set nowrap
set tw=80
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set clipboard+=unnamedplus
set splitbelow
set splitright
set showtabline=2

set notimeout

syntax enable 
colorscheme solarized
set background=dark

"escape delays
set notimeout
set timeoutlen=10
set ttimeoutlen=0
"searching

set ignorecase
set smartcase
set hlsearch
set incsearch

" Splits

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"navigation from insert mode

imap <C-w>h <Esc><C-w>h
imap <C-w>j <Esc><C-w>j
imap <C-w>k <Esc><C-w>k
imap <C-w>l <Esc><C-w>l

map <C-n> :NERDTreeToggle<CR>
