" TODO:
"   undo tree
"   diff
"   replace
"   abandon vim for a really nice editor

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync "| source $MYVIMRC
endif

" Start plugins definition
call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'dkprice/vim-easygrep'
Plug 'elixir-lang/vim-elixir'
Plug 'ervandew/supertab'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'Chiel92/vim-autoformat'
call plug#end()
" End plugins definition

filetype plugin indent on " load filetype plugins/indent settings
syntax on
filetype plugin on

" Nice colors
colorscheme torte
highlight LineNr ctermfg=darkgrey

" set insertmode   " ha!
" imap <F1> <C-O>:set invinsertmode<CR>
" map <F1> :set invinsertmode<CR>

" GUI tweaks
set guifont=Ubuntu\ Mono\ 15
set guioptions=aegiLt
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
set guioptions-=m  "remove menu bar

" General opts
set encoding=utf-8
set ttimeoutlen=52 " avoid pause leaving insert mode
set nowrap
set sidescroll=5
set whichwrap+=<,>,[,]

" tabs & spaces
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
let c_no_tab_space_error = 1 " avoid marking indentation spaces as error

function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

set list listchars=tab:»-,trail:·,precedes:◂,extends:▸
map <F4> :call TrimWhiteSpace()<CR>
imap <F4> <C-O>:call TrimWhiteSpace()<CR>

" line numbers
set number
map <F5> :set invnumber<CR>
imap <F5> <C-o>:set number!<CR>
vmap <F5> <Esc>:set number!<CR>gv

" mouse
set mouse=a
function s:mouse_toggle()
  if &mouse == ""
    let &mouse = "a"
    echo "mouse enabled (=" . &mouse . ")"
  else
    let &mouse = ""
    echo "mouse disabled"
  endif
endfunction
nnoremap <unique> <silent> <plug>mouse_toggle :call <sid>mouse_toggle()<cr>
map <unique> <F2> <plug>mouse_toggle
imap <unique> <F2> <Esc><plug>mouse_togglei

" usual bindings
" duplicate line
imap <C-A>d <Esc>yypi
map <C-A>d yyp
" remove line
map <C-d> dd
imap <C-d> <Esc>ddi
" copy/cut/paste
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
" undo/redo
imap <C-z> <Esc>ui
map <C-z> u
imap <C-y> <C-O>:redo<CR>
map <C-y> :redo<CR>
" find/replace
imap <C-f> <C-O>g*
map <C-f> g*
imap <C-A>f <C-O>/
map <C-A>f /
imap <C-h> <C-O>:%s///g

"toggle search highlighting
imap <C-A>l <C-O>:set hls!<CR>
map <C-A>l :set hls!<CR>

" save buffer
map <C-A>s :w<CR>
imap <C-A>s <C-O>:w<CR>

" windows & tabs
" show prev/next buffer
imap <C-UP> <C-O>:bp!<CR>
imap <C-DOWN> <C-O>:bn!<CR>
map <C-UP> :bp!<CR>
map <C-DOWN> :bn!<CR>
" focus prev/next window
imap <C-LEFT> <C-O><C-W>w
imap <C-RIGHT> <C-O><C-W>w
map <C-LEFT> <C-W>w
map <C-RIGHT> <C-W>w
" quit
map <C-A>q :confirm :qa<CR>
imap <C-A>q <C-O>:confirm :qa<CR>
" split window
map <C-A>3 :vsplit<CR>
imap <C-A>3 <C-O>:vsplit<CR>
map <C-A>2 :split<CR>
imap <C-A>2 <C-O>:split<CR>
" keep only focused window
map <C-A>1 :on!<CR>
imap <C-A>1 <C-O>:on!<CR>
" close focused window
map <C-A>0 <C-W>c
imap <C-A>0 <C-O><C-W>c
" close current buffer
map <C-A>w :silent! bp<bar>sp<bar>silent! bn<bar>bd<CR>
imap <C-A>w <C-O>:silent! bp<bar>sp<bar>silent! bn<bar>bd<CR>

" shift+arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

" move lines
nnoremap <M-Down> :m .+1<CR>==
nnoremap <M-Up> :m .-2<CR>==
inoremap <M-Down> <Esc>:m .+1<CR>==gi
inoremap <M-Up> <Esc>:m .-2<CR>==gi
vnoremap <M-Down> :m '>+1<CR>gv=gv
vnoremap <M-Up> :m '<-2<CR>gv=gv

" toggle paste mode
nmap <F3> :set paste! paste?<CR>

" regular grep
imap <C-G> <C-O>:Grep 
map <C-G> :Grep 
let EasyGrepCommand = 1
let EasyGrepFilesToExclude = '*.bak,*~,*.log,*.swp,*.orig,*.beam,*.pyc,.git,.svn,log,tmp,_build,rel,deps'
let EasyGrepRecursive = 1
let EasyGrepAllOptionsInExplorer = 1
" close result window
imap <F10> <C-O>:cclose<CR>
map <F10> :cclose<CR>
imap <M-F10> <C-O>:copen<CR>
map <M-F10> :copen<CR>

" NERDTree, a must
noremap <F9> :NERDTreeToggle<CR>
inoremap <F9> <C-O>:NERDTreeToggle<CR>
au BufCreate NERD stopinsert

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_theme='understated'

" vim-gitgutter
map <F8> :GitGutterNextHunk<CR>
map <S-F8> :GitGutterPrevHunk<CR>
imap <F8> <C-O>:GitGutterNextHunk<CR>
imap <S-F8> <C-O>:GitGutterPrevHunk<CR>
map <C-A><F8> :GitGutterPreviewHunk<CR>
imap <C-A><F8> <C-O>:GitGutterPreviewHunk<CR>
highlight clear SignColumn

" CtrlP
imap <C-P> <C-O><C-P>
imap <C-A>p <C-L>:CtrlP
map <C-A>p :CtrlP
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|tmp|log|_build|rel|deps)$',
    \ 'file': '\v\.(exe|so|dll|beam)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" NERDcommenter
map <C-A>z <plug>NERDCommenterToggle<CR>
imap <C-A>z <C-O><plug>NERDCommenterToggle<CR>

" sessions
imap <S-F12> <C-O>:SaveSession!
imap <F12> <C-O>:OpenSession!
map <S-F12> :SaveSession!
map <F12> :OpenSession!
let g:session_autosave = 'yes'
let g:session_default_to_last = 1
