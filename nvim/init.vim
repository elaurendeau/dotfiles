call plug#begin('~/AppData/Local/nvim-data/plugged')

Plug 'fatih/vim-go'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'scrooloose/nerdcommenter'

call plug#end()

let mapleader=" "

set number
set relativenumber

set scrolloff=5
set hlsearch
set ignorecase
set autoindent
set smartcase
set imdisable
set incsearch
set nowrap

set expandtab
set tabstop=2
set shiftwidth=2

set cursorline
set cursorcolumn

"set color scheme"
colorscheme molokai

"file enconding"
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
set fileformat=dos
set fileformats=unix,dos,mac
filetype on
filetype plugin on
filetype plugin indent on
syntax on

"easy motion key to navigate to specific character"
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map <Leader><Leader> <Plug>(easymotion-s)
vmap <Leader><Leader> <Plug>(easymotion-s)

"nerd tree configuration"
"Auto start"
autocmd vimenter * NERDTree
"Auto close when there is no buffer"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Nerd commenter configuration"
"disable config
let g:NERDCreateDefaultMappings = 0
nmap <leader>; <plug>NERDCommenterToggle
vmap <leader>; <plug>NERDCommenterToggle gv

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

"next and previous buffers"
nnoremap <C-TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

nnoremap <leader>1 :NERDTreeToggle<CR>


"Nerdtree close vim if only nerdtree is left"

