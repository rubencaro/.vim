execute pathogen#infect()
syntax on
filetype plugin indent on

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

" usual bindings
imap <C-d> <Esc>ddi
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui

" windows & tabs
map <C-UP> :bp<CR>
map <C-DOWN> :bn<CR>
map <C-q> :bc<CR>
map <C-LEFT> :tabp<CR>
map <C-RIGHT> :tabn<CR>

" toggle paste mode
nmap <F3> :set paste! paste?<CR>

" NERDTree, a must
noremap <F9> :NERDTreeToggle<CR>
inoremap <F9> <Esc>:NERDTreeToggle<CR>

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

