call plug#begin('~/AppData/Local/nvim-data/plugged')

Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'lokaltog/vim-powerline'

call plug#end()

let mapleader=" "

:set number
:set relativenumber

:set scrolloff=5
:set hlsearch
:set ignorecase
:set autoindent
:set smartcase
:set imdisable
:set incsearch

"system clipboard copy/paste"
noremap <SPACE>y "*y
noremap <SPACE>Y "*Y
noremap <SPACE>p "*p
noremap <SPACE>P "*P

"tab to move between ()"
noremap <TAB> %

nnoremap H ^
nnoremap L $

"Remap U to redo (easier than C-r)"
nnoremap U <C-r>

nnoremap <leader>1 :NERDTreeToggle<CR>


"Nerdtree close vim if only nerdtree is left"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
