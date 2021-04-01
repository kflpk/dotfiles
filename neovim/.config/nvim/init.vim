call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'cespare/vim-toml'
call plug#end()

syntax on

set noshowmode
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set noexpandtab
"set smartindent
set noswapfile
set nobackup
set number
set relativenumber
set clipboard=unnamedplus
set incsearch
set autoread
au CursorHold,CursorHoldI * checktime

let mapleader = " "
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>
map <C-s> :w<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'medium'
let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ }
colorscheme gruvbox
