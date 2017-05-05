" Avoid the first "Press enter to continue" screen
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
"set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Set utf8 encoding
set encoding=utf-8

" See a minimum of 5 lines over and under the position
set scrolloff=5

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Show the current mode on the bottom of the screen
set showmode

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Display line numbers on the left
set number
 
" Make the number relative to the current position
set relativenumber
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
" set shiftwidth=4
" set softtabstop=4
" set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set shiftwidth=2
set tabstop=2
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
 
" Enable syntax highlighting
syntax on
 
" Use space as leader 
let mapleader = " "

" Clear search with Leader + s
nnoremap <leader>s :noh<cr>

" Use regular regex instead of vim's
nnoremap / /\v
vnoremap / /\v

" Use tab to move between brackets
nnoremap <tab> %
vnoremap <tab> %

" Leader + v will select the previously pasted text
nnoremap <leader>v V`]

" Typing jj in insert mode will return to normal mode
inoremap jj <ESC>

" Open a new window with Leader + w
nnoremap <Leader>w <C-w>v<C-w>l

" shift+arrow selection
nnoremap <S-Up> v<Up>
nnoremap <S-Down> v<Down>
nnoremap <S-Left> v<Left>
nnoremap <S-Right> v<Right>
vnoremap <S-Up> <Up>
vnoremap <S-Down> <Down>
vnoremap <S-Left> <Left>
vnoremap <S-Right> <Right>
inoremap <S-Up> <Esc>v<Up>
inoremap <S-Down> <Esc>v<Down>
inoremap <S-Left> <Esc>v<Left>
inoremap <S-Right> <Esc>v<Right>

"Copy, cut and paste
vnoremap <C-c> y<Esc>i
vnoremap <C-x> d<Esc>i
nnoremap <C-v> pi
inoremap <C-v> <Esc>pi
inoremap <C-z> <Esc>ui

"Vundle content
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#rc("~/vimfiles/bundle/")
call vundle#begin()

Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'Raimondi/delimitMate'  "OR auto-pairs
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/vim-easyoperator-line'
Plugin 'tommcdo/vim-exchange'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'bdauria/angular-cli.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/denite.nvim'
Plugin 'Shougo/unite.vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'othree/html5.vim'

call vundle#end()
"Pathogen start
filetype off                                                                
"call pathogen#infect()
"call pathogen#helptags()

" Allow detection of filetype
filetype plugin indent on

" Airline customization
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Json beautify
nnoremap <leader>m :set syntax=json<cr>:execute '%! python -m json.tool'<cr>

" Splits keybinds
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
inoremap <A-h> <ESC><C-w>hi
inoremap <A-j> <ESC><C-w>ji
inoremap <A-k> <ESC><C-w>ki
inoremap <A-l> <ESC><C-w>li

" Buffers keybinds
nnoremap <leader>T :enew<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>

" Replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" CtrlP
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}


" Typescript stuff
let g:tsuquyomi_use_local_typescript=1
let g:syntastic_typescript_checkers=['tslint','tsc']

" Java complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"Nerdtree mapping
"F2 to toggle NERDTree
"F3 to preview
nmap <F2> :NERDTreeToggle<CR>
let g:NERDTreeMapPreview="<F3>"

"Syntastic (Syntax problems highlighting)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"Disable java checking
let g:loaded_syntastic_java_javac_checker = 1

"EasyMotion mapping
let g:EasyMotion_do_mapping = 1 " Disable default mappings

" use s + two characters to highlight and search them.
nmap s <Plug>(easymotion-s2)

" Or same mapping using 1 character only
 nmap s <Plug>(easymotion-s)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" More relative up/down
nnoremap j gj
nnoremap k gk

nnoremap <silent> <C-S> :<C-u>Update<CR>

"Tabs navigating using Alt! 
" I do not use Ctrl as it is already mapped by cmder's tabs. 
nnoremap <A-t>     :tabnew<CR>
inoremap <A-t>     <Esc>:tabnew<CR>
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt

"Tagbar mapping
nmap <F3> :TagbarToggle<CR>

" Switch windows with F4
:map <F4> <C-W>w

"ColorScheme
colorscheme koehler

"VDebug
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9001

let g:statline_syntastic = 0

" auto start nerdtree when no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif