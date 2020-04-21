let mapleader = ","

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir ~/.vim/undodir > /dev/null 2>&1
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" appearance
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'

" fuzzy
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'

" editing
Plug 'ap/vim-css-color'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'

" git
Plug 'iberianpig/tig-explorer.vim'
Plug 'airblade/vim-gitgutter'

" file explorer
Plug 'francoiscabrol/ranger.vim'

" code
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets', { 'for': 'javascript' }

" cursor motion
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'

" markdown(notes)
Plug 'vimwiki/vimwiki'

" specific
Plug 'fatih/vim-go'            , { 'for': 'go'     , 'do': ':GoUpdateBinaries' }
Plug 'python-mode/python-mode' , { 'for': 'python' }
Plug 'davidhalter/jedi-vim'    , { 'for': 'python' }
call plug#end()

" setup general
set lazyredraw          " redraw only when we need to.

" undo-persistence
set undodir=~/.vim/undodir
set undofile

" vim commands
set showcmd
set showmode
set showmatch
set autoread

set encoding=utf-8
set fileencoding=utf-8

set number                     " Show current line number
set relativenumber             " Show relative line numbers

" turn backup off
set nobackup
set noswapfile
set nowritebackup

" tabs
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" lower the delay of escaping out of other modes
set timeout timeoutlen=1000 ttimeoutlen=0

" text display settings
set wrap
set showbreak=...
set linebreak
set linespace=4
set whichwrap+=h,l,<,>,[,]

" don't show invisible characters
set nolist
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" indenting
set autoindent
set copyindent
set shiftround

" scrolling
set scrolloff=10
set scrolljump=3
set sidescrolloff=10
set sidescroll=1

" folding
set foldmethod=indent
set foldnestmax=5
set foldlevel=5
set foldcolumn=0
set foldlevelstart=99
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo " which commands trigger auto-unfold

" characters to tabs and trail
set list listchars=tab:››,trail:·

" turn bells off
set novisualbell
set noerrorbells
set belloff=all
set noerrorbells
set vb t_vb=


" auto complete
set completeopt=longest,menuone
set wildmode=list:longest,full
set wildmenu
set wildignore=*~,*.o,*.a,*.so,*.bak,*.pyc,*.class,*.db,*.sqlite
set wildignore+=*.gem,*.jar,*.zip,*.gz
set wildignore+=.git,.hg,.svn
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.png,*.jpg,*.gif,*.ico,*.bmp,*.pdf

" gruvbox
syntax enable
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark='hard'

" airline
set laststatus=2
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = '☲'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2

let g:airline#extensions#tabline#buffer_idx_mode = 1

let c = 1
while c <= 9
  execute "nmap <leader>".c." <Plug>AirlineSelectTab".c
  let c += 1
endwhile

" fzf.vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

" - down / up / left / right
let g:fzf_layout = { 'down': '~50%' }
" let g:fzf_layout = { 'window': {
"             \ 'width': 1,
"             \ 'height': 1,
"             \ 'highlight': 'Comment',
"             \ 'rounded': v:false} }

" customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
"let g:fzf_tags_command = 'ctags -R' "TODO

"[Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter'

" mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" insert mode completion
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '50%' }))

" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'down': '100%'}), <bang>0)

command! -bang Commits
  \ call fzf#vim#commits({'down': '100%'}, <bang>0)
  " \ call fzf#vim#commits({'window': { 'width': 1, 'height': 1, 'highlight': 'Comment', 'rounded': v:false}}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --no-heading --line-number --color=always '.shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview(),
  \ <bang>0)

" maps fzf.vim
nmap <Leader>fh :History<CR>
nmap <C-h> :History<CR>
nmap <Leader>fH :History/<CR>
nmap <Leader>fc :Commits<CR>
nmap <Leader>fC :Commands<CR>
nmap <Leader>fo :Files<CR>
nmap <C-p> :Files<CR>
nmap <Leader>fl :BLines<CR>
nmap <C-g> :BLines<CR>
nmap <Leader>fL :Lines<CR>
nmap <Leader>fb :Buffers<CR>
nmap <C-b> :Buffers<CR>
nmap <Leader>fs :Rg<CR>
nmap <Leader>fg :GFiles?<CR>
nmap <Leader>fG :GFiles<CR>
nmap <Leader>fm :Maps<CR>
nmap <Leader>fy :Filetypes<CR>
nmap <Leader>fw :Windows<CR>
nmap <Leader>fk :Marks<CR>
nmap <Leader>ft :BTags<CR>
nmap <Leader>fT :Tags<CR>

" coc
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" ale
set completeopt+=noinsert
set omnifunc+=ale#completion#OmniFunc

let g:ale_sign_error = '×'
let g:ale_sign_warning = '»'

" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_enabled = 0
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {'python': ['flake8'], 'ruby': ['rubocop'], 'js': ['eslint'], 'dart': ['dartanalyzer'], 'lua': ['luacheck'], 'go': ['golangci-lint']}
let g:ale_fixers = {} " need to initiate variable first
let g:ale_fixers.go= ['gofmt']
let g:ale_fixers.ruby = ['rubocop'] " TODO
let g:ale_fixers.python= ['autopep8']
let g:ale_fixers.markdown= ['prettier']
let g:ale_fixers.javascript= ['prettier', 'eslint']
let g:ale_fixers.json= ['jq']
let g:ale_fixers.dart= ['dartfmt'] " TODO TEST
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 1

" let g:ale_python_flake8_executable = 'python3'
" let g:ale_ruby_rubocop_options = '--config /home/werlley/code/ruby/credishop-on-rails/.rubocop.yml'

nmap <silent> <leader>at :ALEToggle<cr>
nmap <silent> <leader>an :ALENext<cr>
nmap <silent> <leader>ap :ALEPrevious<cr>
nmap <silent> <leader>af :ALEFix<cr>

" tabularize
map  <Leader><tab> :Tabularize /

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" tig
nnoremap <Leader>gg :Tig<CR>

" ranger
let g:ranger_map_keys = 0
map <leader>e :Ranger<CR>
map <leader>E :RangerWorkingDirectory<CR>

" easymotion
map <Leader> <Plug>(easymotion-prefix)
map <Leader>\ <Plug>(easymotion-s2)
map <Leader>ls <Plug>(easymotion-bd-wl)

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" netrw
" % new file
" d new directory
" D delete file/directory
" R rename
" -- C-f quickfix modal
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_list_hide= '.*\.png$,.*\.pdf,.*\.mp4,.*\.tga,.*\.mp3,.*\.jpg,.*\.svg,/*\.stl,.*\.mtl,.*\.ply'
" autocmd VimEnter * :Lexplore

" map netrw
nnoremap - :Explore<CR>
noremap <Leader><space> :Lexplore<CR>

" clipboard
set clipboard=unnamed
set mouse=a

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

vmap <C-c> "+y
imap <C-v> <esc>"+gpi

" maps
nnoremap H ^
nnoremap L $
nnoremap <Space> :
nnoremap <M-Space> :

" quit buffer witout save
nnoremap <Leader>q :bd!<CR>

" terminal
noremap <Leader>> :botright vert term ++close <CR>
noremap <Leader>, :below term ++close <CR>

" save sudo file
cmap w!! w !sudo tee > /dev/null %

" reload vim config
nnoremap <Leader>r :so $MYVIMRC <CR>

" indent lines
nmap <Left>  <<
nmap <Right> >>
vmap <Left>  <gv
vmap <Right> >gv

" move line
nnoremap <silent> <Down> @='"zdd"zp'<CR>
nnoremap <silent> <Up>   @='k"zdd"zpk'<CR>
vnoremap <silent> <Down> @='"zx"zp`[V`]'<CR>
vnoremap <silent> <Up>   @='"zxk"zP`[V`]'<CR>

" commit all changes
nnoremap <Leader>ha :!git commit -a -m

" duplicate line
nnoremap <C-k>     <ESC>yyP
nnoremap <C-j>     <ESC>yypk<CR>

" select all
nnoremap <Leader>a :normal ggVG<CR>

" thanks @xolox
function! VisualSelection()
  if mode()=="v"
    let [line_start, column_start] = getpos("v")[1:2]
    let [line_end, column_end] = getpos(".")[1:2]
  else
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
  end

  if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
    let [line_start, column_start, line_end, column_end] =
          \   [line_end, column_end, line_start, column_start]
  end

  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif

  let lines[-1] = lines[-1][: column_end - 1]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines)
endfunction

function! RunTerm()
  execute ':below :term ++rows=10 '.VisualSelection()
endfunction

map <Leader>! :call RunTerm()<CR>

augroup surround
  let quote_close = { "'":"'", "`":"`", "\"":"\"", "(":")", "{":"}", "[":"]"}

  for quote_in in ["'", "`", "\"", "(", "{", "["]
    execute "nmap ds" . quote_in . " di" . quote_in . "hPli<Delete><Delete><Esc>"

    for quote_out in ["'", "`", "\"", "(", "{", "["]
      execute "nmap cs" . quote_in . quote_out . " di". quote_in . "hi" . quote_out . get(quote_close, quote_out) . "<Esc>plli<Delete><Delete><Esc>h"
    endfor
  endfor
augroup END

augroup autopair
  au!
  inoremap () ()<Left>
  inoremap [] []<Left>
  inoremap {} {}<Left>
  inoremap '' ''<Left>
  inoremap "" ""<Left>
  inoremap `` ``<Left>

  inoremap (<CR> ()<Left><CR><CR><Up><Tab>
  inoremap [<CR> []<Left><CR><CR><Up><Tab>
  inoremap {<CR> {}<Left><CR><CR><Up><Tab>
  inoremap '<CR> ''<Left><CR><CR><Up><Tab>
  inoremap "<CR> ""<Left><CR><CR><Up><Tab>
  inoremap `<CR> ``<Left><CR><CR><Up><Tab>
augroup END

augroup CallInterpreter
  let b:cmd = ''

  autocmd!
  autocmd FileType dart       let b:cmd = 'dart %'
  autocmd FileType go         let b:cmd = 'go %'
  autocmd FileType javascript let b:cmd = 'nodemon %'
  autocmd FileType lua        let b:cmd = 'lua %'
  autocmd FileType python     let b:cmd = 'python %'
  autocmd FileType ruby       let b:cmd = 'ruby %'
  autocmd FileType sh         let b:cmd = 'bash %'

  nnoremap <F9>  :execute ':below terminal ++rows=10 '.b:cmd<CR>
  nnoremap <F10> :make<CR>
  nnoremap <F11> :make test<CR>
augroup END

augroup MakeQuickFix
  autocmd!
  autocmd QuickFixCmdPost * :copen
augroup END

augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave                      * setlocal nocursorline
augroup END

augroup RemovingTrailingWhitespace
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END

augroup RenameWindowTmux
 autocmd!
  if exists('$TMUX')
    autocmd BufEnter * call system("tmux rename-window " . expand("%:t:r"))
    autocmd VimLeave * call system("tmux set-window-option automatic-rename")
  endif
augroup END

" set updatetime=200
" augroup AutoSave
"   autocmd!
"   autocmd CursorHold * silent! update
" augroup END

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
augroup NumberToggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

augroup ShowColumn
  autocmd!
  autocmd FileType python,slim set cursorcolumn
augroup END

