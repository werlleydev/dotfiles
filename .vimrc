set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'
Bundle 'slim-template/vim-slim'


filetype plugin indent on " required!

set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set wrapmargin=8

set background=dark
set wildmenu
set wildmode=longest,list

syntax on
set ruler

set nobackup
set noswapfile

set t_Co=16
let g:solarized_termtrans = 1
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

nnoremap <F9> :NERDTreeToggle<CR>

" NerdTree commenter
map <leader>' <leader>c<space><CR>

nnoremap <c-b> :CtrlPBuffer<CR>

let g:syntastic_enable_signs=1
let g:syntastic_stl_format = ' Syntax: line:%F (%t) '


