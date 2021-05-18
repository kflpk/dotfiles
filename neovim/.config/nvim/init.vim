call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdtree'
"Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'cespare/vim-toml'
Plug 'csexton/trailertrash.vim'
call plug#end()

syntax on

set noshowmode
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set noexpandtab
"set smartindent
set noswapfile
set nobackup
set number
set relativenumber
set clipboard=unnamedplus
set incsearch
set autoread
" set listchars=eol:¬,tab:\>-\ ,trail:~,extends:>,precedes:<,space:␣
	" set list
	" set backupcopy=yes
set undofile
set undodir=~/.cache/nvim/undo
"au CursorHold,CursorHoldI * checktime "doesn't seem to work

"highlight trailing spaces
"highlight ExtraWhitespace ctermbg=red 
"match ExtraWhitespace /\s\+$/

let mapleader = " "
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>
map <C-s> :w<CR>
"ctrl+slash
map <C-_> :noh<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'medium'
"let g:lightline = {
"            \ 'colorscheme': 'jellybeans',
"            \ }
colorscheme gruvbox
let g:airline_theme='gruvbox'
