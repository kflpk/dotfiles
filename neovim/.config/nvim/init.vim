call plug#begin('~/.vim/plugged')
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdtree'
"Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'cespare/vim-toml'
Plug 'csexton/trailertrash.vim'
Plug 'habamax/vim-godot'
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
 set listchars=eol:¬,tab:\>-\ ,trail:~,extends:>,precedes:<,space:␣
	 set list
	 set backupcopy=yes
set undofile
set undodir=~/.cache/nvim/undo
set signcolumn=yes
"au CursorHold,CursorHoldI * checktime "doesn't seem to work

"highlight trailing spaces
"highlight ExtraWhitespace ctermbg=red 
"match ExtraWhitespace /\s\+$/

" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'

" actually highlight the region we defined as "math"
hi link math Statement


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
let g:neovide_cursor_vfx_mode = "railgun"
"let g:lightline = {
"            \ 'colorscheme': 'jellybeans',
"            \ }
colorscheme gruvbox
let g:airline_theme='gruvbox'


" Godot specific stuff

func! GodotSettings() abort
    "setlocal foldmethod=expr
    "setlocal tabstop=4
    nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end


let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}


" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
