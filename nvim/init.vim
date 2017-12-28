call plug#begin('~/AppData/Local/nvim-data/plugged')

Plug 'fatih/vim-go'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'

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
set hidden

set expandtab
set tabstop=2
set shiftwidth=2

set cursorline
set cursorcolumn

"set color scheme"
try
	colorscheme molokai
catch
endtry

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

"Ctrlp search
"Search within the files, buffers and MRU
let g:ctrlp_cmd = 'CtrlPCurWD'
"show hidden files"
let g:ctrlp_show_hidden = 1
let g:ctrlp_map = '<leader>ff'
"open recent files
noremap <C-e> :CtrlPMRU<CR>

"system clipboard copy/paste"
noremap <SPACE>y "*y
noremap <SPACE>Y "*Y
noremap <SPACE>p "*p
noremap <SPACE>P "*P
"tab to move between ()"
noremap <TAB> %

"move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l   

"search for selected words
vnoremap <silent> / :call VisualSelection('f', '')<CR>
vnoremap <silent> ? :call VisualSelection('b', '')<CR>
vnoremap <silent> <Leader>fg :call VisualSelection('gv', '')<CR>

noremap H ^
noremap L $

noremap <leader>q :q<CR>
noremap <leader>w :w<CR>

"Remap U to redo (easier than C-r)"
noremap U <C-r>

"next and previous buffers"
noremap <C-TAB> :bnext<CR>
noremap <S-TAB> :bprevious<CR>

noremap <leader>1 :NERDTreeToggle<CR>

"search function to allow to do a / or ? from a selection
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction
