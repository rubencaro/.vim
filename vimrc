" TODO:
"   sessions
"   undo tree
"   packages

execute pathogen#infect()
syntax on
filetype plugin on
filetype plugin indent on

set encoding=utf-8
set ttimeoutlen=51 " avoid pause leaving insert mode
set nowrap
set sidescroll=5

" tabs & spaces
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
let c_no_tab_space_error = 1 " avoid marking indentation spaces as error

function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

set list listchars=tab:»-,trail:·,precedes:◂,extends:▸
"autocmd FileWritePre * :call TrimWhiteSpace()
"autocmd FileAppendPre * :call TrimWhiteSpace()
"autocmd FilterWritePre * :call TrimWhiteSpace()
"autocmd BufWritePre * :call TrimWhiteSpace()

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
imap <C-d> <Esc>ddi
map <C-d> dd
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui
imap <C-y> <C-O>:redo<CR>

" save buffer
map <C-A>s :w<CR>
imap <C-A>s <C-O>:w<CR>

" windows & tabs
imap <C-UP> <C-O>:bp!<CR>
imap <C-DOWN> <C-O>:bn!<CR>
map <C-UP> :bp!<CR>
map <C-DOWN> :bn!<CR>
imap <C-LEFT> <C-O><C-W>w<CR>
imap <C-RIGHT> <C-O><C-W>w<CR>
map <C-LEFT> <C-W>w<CR>
map <C-RIGHT> <C-W>w<CR>
map <C-A>q :confirm :qa<CR>
imap <C-A>q <Esc>:confirm :qa<CR>
map <C-A>3 :vsplit<CR>
imap <C-A>3 <C-O>:vsplit<CR>
map <C-A>2 :split<CR>
imap <C-A>2 <C-O>:split<CR>
map <C-A>1 :on<CR>
imap <C-A>1 <C-O>:on<CR>
map <C-A>0 <C-W>c<CR>
imap <C-A>0 <C-O><C-W>c<CR>
map <C-A>w :bd<CR>
imap <C-A>w <C-O>:bd<CR>

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

" toggle paste mode
nmap <F3> :set paste! paste?<CR>

" easygrep
map <C-g> :Grep <C-r><C-w>
imap <C-g> <Esc>:Grep <C-r><C-w>
map <C-h> :Replace <C-r><C-w>
imap <C-h> <Esc>:Replace <C-r><C-w>
map <C-A>g :GrepOptions<CR>
imap <C-A>g <Esc>:GrepOptions<CR>

" NERDTree, a must
noremap <F9> :NERDTreeToggle<CR>
inoremap <F9> <Esc>:NERDTreeToggle<CR>

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" vim-gitgutter
map <F8> :GitGutterToggle<CR>
imap <F8> <C-O>:GitGutterToggle<CR>
map <C-A><F8> :GitGutterPreviewHunk<CR>
imap <C-A><F8> <C-O>:GitGutterPreviewHunk<CR>
highlight clear SignColumn

" CtrlP
imap <C-P> <C-O><C-P>

" NERDcommenter
map <F6> <plug>NERDCommenterToggle<CR>
imap <F6> <C-O><plug>NERDCommenterToggle<CR>
