set nocompatible
set hidden
set wildmenu
set showcmd
set hlsearch
set laststatus=2
set confirm
set number
set pastetoggle=<F11>
set smartindent
set showmatch
set comments=s1:/*,mb:\ *,elx:\ */
set filetype=on

nnoremap <C-L> :nohl<CR><C-L>
nnoremap <F3> :set hlsearch!<CR>

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

nore ; :
nore , ;

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'klen/python-mode'
Plugin 'jimenezrick/vimerl'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-markdown'
Plugin 'vim-scripts/a.vim'
Plugin 'elzr/vim-json'
call vundle#end()
filetype plugin indent on

"End Vundle

syntax enable
set t_ut=
"let g:solarized_termcolors=16
se t_Co=16
set background=dark
colorscheme solarized
set term=screen-256color

highlight LineNr ctermfg=238 ctermbg=0
highlight CursorLineNr ctermfg=gray ctermbg=0

set relativenumber
au BufNewFile,BufRead *.ums set filetype=ums
au BufRead,BufNewFile *.ic set filetype=scheme
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1
