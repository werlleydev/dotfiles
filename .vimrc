" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible    " be iMproved
filetype off              " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#color_template = 'visual'
let g:airline#extensions#ctrlp#color_template = 'replace'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1


Bundle 'amdt/vim-niji'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
Bundle 'file:///Users/gmarik/path/to/plugin'
" ...


" colorscheme
Bundle 'altercation/vim-colors-solarized'
" Comments
Bundle 'scrooloose/nerdcommenter'
" File browsing
Bundle 'scrooloose/nerdtree'
" Syntax checker
Bundle 'scrooloose/syntastic'
" Git
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'airblade/vim-gitgutter'
" Shell
Bundle 'tpope/vim-dispatch'
" Editing
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'kana/vim-smartinput'
Bundle 'godlygeek/tabular'

" Snippets
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
" Programming languages
Bundle 'fatih/vim-go'
Bundle 'vim-ruby/vim-ruby'
" File types
Bundle 'tpope/vim-markdown'
Bundle 'ajf/puppet-vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'

filetype plugin indent on   " required!
"
" Brief help
" :BundleList           - list configured bundles
" :BundleInstall(!)   - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)    - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


set number
set showcmd
set showmode
set showmatch
set hidden
set autoread
set autowriteall
set splitbelow splitright
set lazyredraw
set mouse=a
set pastetoggle=<F2>
set nrformats-=octal
set backspace=indent,eol,start
set fileformats="unix,dos,mac"
set switchbuf=useopen
set history=10000
set viminfo='20,\"80
"set colorcolumn=81
"set cursorline

" Indenting
set autoindent
set copyindent
set shiftround

" Tab settings
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Scrolling
set scrolloff=10
set scrolljump=3
set sidescrolloff=10
set sidescroll=1

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Folding
set foldmethod=indent
set foldnestmax=5
set foldlevel=5
set foldcolumn=0
set foldlevelstart=99
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo " which commands trigger auto-unfold

" Turn backup off
set nobackup
set noswapfile
set nowritebackup

" Turn bells off
set novisualbell
set noerrorbells

" Highlighting
syntax on
set background=dark

set cursorline 
set cursorcolumn


" NerdTree
let g:NERDTreeDirArrows=0
let g:NERDTreeShowHidden=0
let g:NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
nnoremap <F9> :NERDTreeToggle<CR>

syntax on
set background=dark
set t_Co=16
let g:solarized_termtrans = 1
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" Switch to alternate file
map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>

"map <C-J> :bnext<CR>
"map <C-K> :bprev<CR>
"map <C-L> :tabn<CR>
"map <C-H> :tabp<CR>


set colorcolumn=80

nnoremap <F12> :w <C-U>! clear && clisp %:r<CR>
nnoremap <F11> :w <C-U>! clear && gcc -o somename % && ./somename<CR>

" highlight EOL whitespace with a red background except on the line you're editing
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" whitespace stripper
function! <SID>StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>"

" Restore cursor position
" ======================================================
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif
endif
