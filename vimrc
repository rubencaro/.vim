execute pathogen#infect()
syntax on
filetype plugin indent on

set encoding=utf-8
set ttimeoutlen=51 " avoid pause leaving insert mode
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

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
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui

" save buffer
map <C-A>s :w<CR>
imap <C-A>s <C-O>:w<CR>

" windows & tabs
map <C-UP> :bp<CR>
map <C-DOWN> :bn<CR>
map <C-LEFT> <C-W>w<CR>
map <C-RIGHT> <C-W>w<CR>
map <S-LEFT> :tabp<CR>
map <S-RIGHT> :tabn<CR>
map <C-A>q :qa<CR>
imap <C-A>q <Esc>:qa<CR>
map <C-A>3 :vsplit<CR>
imap <C-A>3 <Esc>:vsplit<CR>
map <C-A>2 :split<CR>
imap <C-A>2 <Esc>:split<CR>
map <C-A>1 :on<CR>
imap <C-A>1 <Esc>:on<CR>

" toggle paste mode
nmap <F3> :set paste! paste?<CR>

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

