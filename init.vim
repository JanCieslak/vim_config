set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undofile
set incsearch
set undodir=~/AppData/Local/nvim/undodir
set encoding=utf-8

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgray

call plug#begin("~/AppData/Local/nvim/plugged")

Plug 'rust-lang/rust.vim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe'

call plug#end()

" Config Section

if (has("termguicolors"))
    set termguicolors
endif

syntax enable
colorscheme gruvbox 
" colorscheme gruvbox 
set background=dark

" Python 3
let g:python3_host_prog = 'C:\Users\JSON\AppData\Local\Programs\Python\Python37\python.exe'

" Nerd Tree config
let g:DTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>


" Console config

 " open new split panes to right and below
 set splitright
 set splitbelow
 " turn terminal to normal mode with escape
 tnoremap <Esc> <C-\><C-n>
 " start terminal in insert mode
 au BufEnter * if &buftype == 'terminal' | :startinsert | endif
 " open terminal on ctrl+n
 function! OpenTerminal()
   split term://bash
     resize 10
     endfunction
     nnoremap <c-n> :call OpenTerminal()<CR>


" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" File finding

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
