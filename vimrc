inoremap jk <Esc>


filetype plugin on

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'raimondi/delimitMate'
Plug 'mileszs/ack.vim'            
Plug 'editorconfig/editorconfig-vim'



"colors

Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'lilydjwg/colorizer', {'for':['css','sass','scss','less','html','javascript','javascript.jsx']}


call plug#end()

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

syntax on
set background=dark
colorscheme solarized

"escape delays
set notimeout
set timeoutlen=10
set ttimeoutlen=0
"searching

set ignorecase
set smartcase
set hlsearch
set incsearch

"disable auto commenting when pressing enter in a comment block  do i need this/


"cuz i fuck up a lot
map :W :w
map :Q :q

"navigation from insert mode

imap <C-w>h <Esc><C-w>h
imap <C-w>j <Esc><C-w>j
imap <C-w>k <Esc><C-w>k
imap <C-w>l <Esc><C-w>l

map <C-n> :NERDTreeToggle<CR>

