set nocompatible

"vundle
"
"
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin()
  " Required
  Plugin 'gmarik/vundle'
  " Install plugins that come from github.  Once Vundle is installed, these can be
  " installed with :PluginInstall
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'Valloric/MatchTagAlways'
  Plugin 'vim-scripts/netrw.vim'
  Plugin 'tpope/vim-sensible'
  Plugin 'SirVer/ultisnips'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'prabirshrestha/async.vim'
  Plugin 'prabirshrestha/vim-lsp'
  Plugin 'prabirshrestha/asyncomplete.vim'
  Plugin 'prabirshrestha/asyncomplete-lsp.vim'
  Plugin 'zxqfl/tabnine-vim'
  " Provide many default snippets for a variety of snippets.
  " Uncomment and :PluginInstall to enable
  " Plugin 'honza/vim-snippets'

  call vundle#end()
else
  echomsg 'Vundle is not installed. You can install Vundle from'
      \ 'https://github.com/VundleVim/Vundle.vim'
endif

source /usr/share/vim/google/google.vim

filetype plugin indent on

" control p

" Let CtrlP not go all the way up to the root of the client. Instead, consider a
" METADATA file to delimit a project.
let g:ctrlp_root_markers = ['METADATA']

" Use AG for CtrlP
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = '/usr/bin/ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ --ignore .git5_specs
    \ --ignore review
    \ -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ciderlsp

"au User lsp_setup call lsp#register_server({
"    \ 'name': 'CiderLSP',
"    \ 'cmd': {server_info->[
"    \   '/google/bin/releases/editor-devtools/ciderlsp',
"    \   '--tooltag=vim-lsp',
"    \   '--noforward_sync_responses',
"    \ ]},
"    \ 'whitelist': ['c', 'cpp', 'proto', 'textproto', 'go'],
"    \})
"
"let g:lsp_async_completion = 1
"
"let g:asyncomplete_smart_completion = 1
"let g:asyncomplete_auto_popup = 1
"
"let g:lsp_signs_enabled = 1
"let g:lsp_diagnostics_echo_cursor = 1

" simple setup
syntax on

" change workign path to curr file
autocmd BufNewFile,BufEnter * silent! lcd %:p:h

set relativenumber

" mark tabs and whitespaces
set list listchars=tab:»\ ,trail:°

inoremap jk <Esc>

set hlsearch

" By default, it looks up man pages for the word under the cursor, which isn't
" very useful, so we map it to something else.
nnoremap <s-k> <CR>

" Explicitly set the Leader to comma. You can use '\' (the default),
" or anything else (some people like ';').
" emulate spacemacs
let mapleader=" "
nnoremap <SPACE> <Nop>

" google plugins
" consistency with emacs plugin;
Glug blaze plugin[mappings]='<leader>G'
let g:blazevim_blaze_executable = "rabbit"

"Glug youcompleteme-google
let g:ycm_max_num_identifier_candidates = 10

Glug add_usings plugin[mappings]

" Load the code formatting plugin. We first load the open-source version. Then,
" we load the internal google settings. Then, we automatically enable formatting
" when we write the file for Go, BUILD, proto, and c/cpp files.
" Use :h codefmt-google or :h codefmt for more details.
"Glug codefmt
"Glug codefmt-google
"
"
autocmd BufWritePost * silent !hg fixwdir <afile>
autocmd BufWritePost * e | redraw!

" Wrap autocmds inside an augroup to protect against reloading this script.
" For more details, see:
" http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
augroup autoformat
  autocmd!
  " Autoformat BUILD files on write.
  autocmd FileType bzl AutoFormatBuffer buildifier
  " Autoformat go files on write.
  autocmd FileType go AutoFormatBuffer gofmt
  " Autoformat proto files on write.
  autocmd FileType proto AutoFormatBuffer clang-format
  " Autoformat c and c++ files on write.
  autocmd FileType c,cpp AutoFormatBuffer clang-format
augroup END

set clipboard+=unnamedplus

colorscheme solarized
set background=light

"escape delays
set notimeout
set timeoutlen=10
set ttimeoutlen=0
"searching

set ignorecase
set smartcase
set incsearch

" Splits

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C

"navigation from insert mode

imap <C-w>h <Esc><C-w>h
imap <C-w>j <Esc><C-w>j
imap <C-w>k <Esc><C-w>k
imap <C-w>l <Esc><C-w>l

map <C-b> :CtrlPBuffer<CR>
" spacemacs behaviour for last used tab
map <leader><Tab> <C-^>
map <leader>bb :CtrlPBuffer<CR>

map <C-]> :YcmCompleter GoTo<CR>
map <C-f> :YcmCompleter FixIt<CR>
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

set cursorline

"map <C-\> :LspReferences<CR>

"map <C-n> :NERDTreeToggle<CR>

"autocmd BufRead,BufNewFile /home/hmclauchlan/linux/linux/* source /home/hmclauchlan/dotfiles/vim/c.vim
