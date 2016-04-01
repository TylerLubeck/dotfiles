set nocompatible
set hidden
set wildmenu
set showcmd
set hlsearch
set laststatus=2
set confirm
set pastetoggle=<F11>
set smartindent
set showmatch
set comments=s1:/*,mb:\ *,elx:\ */
set filetype=on
set nu
set relativenumber
set backspace=2

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
Plugin 'scrooloose/nerdtree'
Plugin 'JarrodCTaylor/vim-python-test-runner'
Plugin 'vim-scripts/a.vim'
Plugin 'elzr/vim-json'
Plugin 'willpragnell/vim-reprocessed'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'walm/jshint.vim'
Plugin 'mattn/emmet-vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'alfredodeza/pytest.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax.git'
Plugin 'fatih/vim-go'
Plugin 'pearofducks/ansible-vim'

"Requires npm instant-markdown-d. See the repo.
Plugin 'suan/vim-instant-markdown' 
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
set cursorline
set scrolloff=5

au BufRead,BufNewFile *.ic set filetype=scheme
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1
nmap ; :

"For dealing with splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

set splitbelow
set splitright

"For vim airline
let g:airline#extensions#tabline#enabled = 1

"For python folds
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:pymode_lint_config = '$HOME/pylint.rc'

"File types
autocmd BufNewFile,BufRead *.md set makeprg=grip
autocmd FileType processing setlocal shiftwidth=4 tabstop=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby set makeprg=ruby\ %
autocmd FileType * set colorcolumn=80
au BufNewFile,BufRead *.jinja2 set filetype=htmljinja
autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
au FileType javascript call JavaScriptFold()
